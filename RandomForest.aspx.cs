using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
public partial class GaussianClassifier : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Fake_Review;Integrated Security=True");
    connection con2 = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
            if (TextBox1 .Text == "")
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Product Name!!!')", true);
            }
            if (TextBox2.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Feedback!!!')", true);
            }



            else
            {
                string uname = null;
                con2.open_connection();
                string suser = "select * from cnf_order where username='" + Session["emailID"].ToString() + "' ";
                SqlCommand cmduser = new SqlCommand(suser, con2.con_pass());
                SqlDataReader druser = cmduser.ExecuteReader();
                if (druser.Read())
                {
                    uname = druser["username"].ToString();
                }
                con2.close_connection();
                if (uname.Equals(Session["emailID"].ToString()))
                {
                    double s1 = 0, s2 = 0, s3 = 0, s4 = 0, s5 = 10, s6 = 0, s7 = 0, daterel = 0;
                    ArrayList str1 = new ArrayList();
                    string release;
                    SqlDataAdapter da;
                    //string datakey= TextBox2.Text.Contains("good") || TextBox2.Text.Contains("abound") || TextBox2.Text.Contains("accurate") || TextBox2.Text.Contains("accurately") || TextBox2.Text.Contains("achievement") || TextBox2.Text.Contains("adaptable") || TextBox2.Text.Contains("beautify") || TextBox2.Text.Contains("delicate") || TextBox2.Text.Contains("best") || TextBox2.Text.Contains("nice") || TextBox2.Text.Contains("very good")
                    DataSet ds = new DataSet();
                    string a = "select rank from positive_keyword where positivekey like  '" + TextBox2.Text + "'";
                    da = new SqlDataAdapter(a, con);
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        s1 = Convert.ToDouble(ds.Tables[0].Rows[0][0].ToString());
                    }

                    SqlDataAdapter da1;
                    DataSet ds1 = new DataSet();
                    string b = "select rank  from negative_keyword  where negativekey  like '" + TextBox2.Text + "'";
                    da1 = new SqlDataAdapter(b, con);
                    da1.Fill(ds1);
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        s2 = Convert.ToDouble(ds1.Tables[0].Rows[0][0].ToString());
                    }


                    DataTable table = new DataTable();
                    table.Columns.Add("Type");
                    table.Columns.Add("Real", typeof(double));
                    table.Columns.Add("Best", typeof(double));
                    table.Columns.Add("Good", typeof(double));
                    table.Columns.Add("Average", typeof(double));
                    table.Columns.Add("Fake", typeof(double));

                    //training data.
                    table.Rows.Add("Real", 7, 7, 7, 7, 7);
                    table.Rows.Add("Real", 7.5, 7.5, 7.5, 7.5, 7.5);
                    table.Rows.Add("Real", 8, 8, 8, 8, 8);
                    table.Rows.Add("Real", 8.5, 8.5, 8.5, 8.5, 8.5);
                    table.Rows.Add("Real", 9, 9, 9, 9, 9);
                    table.Rows.Add("Real", 9.5, 9.5, 9.5, 9.5, 9.5);
                    table.Rows.Add("Real", 10, 10, 10, 10, 10);



                    table.Rows.Add("Real", 6.8, 6.8, 6.8, 6.8, 6.8);
                    table.Rows.Add("Real", 6.4, 6.4, 6.4, 6.4, 6.4);
                    table.Rows.Add("Real", 6, 6, 6, 6, 6);
                    table.Rows.Add("Real", 5.8, 5.8, 5.8, 5.8, 5.8);
                    table.Rows.Add("Real", 5.5, 5.5, 5.5, 5.5, 5.5);
                    table.Rows.Add("Real", 5.3, 5.3, 5.3, 5.3, 5.3);



                    table.Rows.Add("Fake", 4.8, 4.8, 4.8, 4.8, 4.8);
                    table.Rows.Add("Fake", 4.4, 4.4, 4.4, 4.4, 4.4);
                    table.Rows.Add("Fake", 4, 4, 4, 4, 4);
                    table.Rows.Add("Fake", 3.8, 3.8, 3.8, 3.8, 3.8);
                    table.Rows.Add("Fake", 3.5, 3.5, 3.5, 3.5, 3.5);
                    table.Rows.Add("Fake", 3.3, 3.3, 3.3, 3.3, 3.3);
                    table.Rows.Add("Fake", 2.8, 2.8, 2.8, 2.8, 2.8);
                    table.Rows.Add("Fake", 2.2, 2.2, 2.2, 2.2, 2.2);
                    table.Rows.Add("Fake", 1, 1, 1, 1, 1);


                    Classifier classifier = new Classifier();
                    classifier.TrainClassifier2(table);
                    string ans = "";
                    try
                    {
                        ans = classifier.Classify2(new double[] { s1, s2, s3, s4, s5 });
                    }
                    catch (Exception)
                    {
                    }

                    lblmsg.Text = ans;
                    con2.open_connection();
                    string s_fake_real = "insert into product_review values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + lblmsg.Text + "')";
                    SqlCommand sk = new SqlCommand(s_fake_real, con2.con_pass());
                    sk.ExecuteNonQuery();

                    con2.close_connection();

                }
                else
                {
                    string review = "Fake";
                    con2.open_connection();
                    string s_fake_real = "insert into product_review values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + review + "')";
                    SqlCommand sk = new SqlCommand(s_fake_real, con2.con_pass());
                    sk.ExecuteNonQuery();

                    con2.close_connection();
                }

            }
        
    }
}