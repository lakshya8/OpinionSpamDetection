using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class chat : System.Web.UI.Page
{
    connection con = new connection();
    string email, msg;
    protected void Page_Load(object sender, EventArgs e)
    {
        //con.open_connection();
        //string str1 = "select * from Message where fuser='" + Session["emailid"] + "'";
        //SqlCommand cmd1 = new SqlCommand(str1, con.con_pass());
        //SqlDataReader dr = cmd1.ExecuteReader();
        //ListBox1.Items.Clear();
        ////con.open_connection();
        //while (dr.Read())
        //{
        //    email = dr["fuser"].ToString();
        //    msg = dr["msg"].ToString();
        //    Console.Write(email + " ->::" + msg);
        //    ListBox1.Items.Add(email + " ->::" + msg);
        //}
        //con.close_connection();
       

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.open_connection(); 
        try
        {           
              string str = "insert into Message values('" + "Chat Bot" + "','" + Session["emailID"] + "','" + TextBox1.Text + "','" + System.DateTime.Now.ToShortDateString() + "')";
               // SqlCommand cmd = new SqlCommand(str, con.con_pass());
                //cmd.ExecuteNonQuery();
                //con.close_connection();
                ListBox1.Items.Add("User" + " ->::" + TextBox1.Text);
                //con.open_connection();
              
                string st1 = "SELECT * FROM  bot_replay WHERE (msg LIKE '%"+TextBox1.Text+"%')";
            
                SqlCommand rcmd = new SqlCommand(st1, con.con_pass());
                SqlDataReader dr = rcmd.ExecuteReader();
                if (dr.Read())
                {
                    string s = dr["rbot"].ToString();
                    ListBox1.Items.Add("BOT" + " ->::" + dr["rbot"]);
                }
                else
                {
                    String s="Not able to understand,would you like to try again?";
                    ListBox1.Items.Add("BOT" + " ->::" + s);
                }

                con.close_connection();
                TextBox1.Text = "";
           
            

        }
        catch (Exception ex)
        {
            ex.Message.ToString();

        }
    }
}