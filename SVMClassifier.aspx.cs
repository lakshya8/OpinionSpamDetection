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
    connection con=new connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ArrayList sus_words = new ArrayList();
        string ans=null;
        
                try
                {
                    con.open_connection();
                    string s1="select * from positive_keyword";
                    SqlCommand cmd=new SqlCommand(s1,con.con_pass());
                    SqlDataReader dr=cmd.ExecuteReader();
                    while(dr.Read())
                    {
                        String s = dr["positivekey"].ToString();
                       sus_words.Add(s);
                    }


                    con.close_connection();
                    if (TextBox2.Text.Equals(sus_words))
                    {
                       // string s2 = sus_words;
                    }
                }
                    
                catch (Exception)
                {
                }
                lblmsg.Text = ans;

            }
        
    
}