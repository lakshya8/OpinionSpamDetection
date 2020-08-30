using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

public class Final_Examination
{
    public int SIZE = 10;
    public int mid;
    public int sid;
    public String sname;
    public int ncans;
    public List<Final_Question> questions;
    public DateTime StartTime;
    public int curpos = 0;

    public Final_Examination(int mid)
    {
        this.mid = mid;
       // this.sid = sid;
        //this.sname = sname;
        StartTime = DateTime.Now;
    }

    public void GetQuestions(string dbName)
    {
        try
        {
            // get questions from OE_QUESTIONS table
            //SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            connection con = new connection();
            con.open_connection();
            // Random rnd = new Random();

            // String type = "Random";
            SqlDataAdapter da = new SqlDataAdapter("select question,ans1,ans2,ans3,ans4,cans,sname from " + dbName + "", con.con_pass());
            string db = dbName;
            //where sid = " + sid
            DataSet ds = new DataSet();
            da.Fill(ds, "questions");
            int nquestions = ds.Tables[0].Rows.Count;

            // get N no. of random number
            Random r = new Random();
            int[] positions = new int[SIZE];
            int num;
            for (int pos = 0; pos < SIZE; )
            {
                num = Math.Abs(r.Next(nquestions));
                // check whether the number is already in the array
                bool found = false;
                for (int i = 0; i < pos; i++)
                    if (num == positions[i]) { found = true; break; }

                if (!found)
                {
                    positions[pos] = num;
                    pos++;
                }
            } // end of for

            // load data from DataSet into Question Objects
            questions = new List<Final_Question>();
            DataRow dr;
            Final_Question q;
            foreach (int pos in positions)
            {
                dr = ds.Tables[0].Rows[pos];
                q = new Final_Question(dr["question"].ToString(), dr["ans1"].ToString(), dr["ans2"].ToString(), dr["ans3"].ToString(), dr["ans4"].ToString(), dr["cans"].ToString(), dr["sname"].ToString());
                questions.Add(q);
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }

    } // end of GetQuestions()
} // end of Class
