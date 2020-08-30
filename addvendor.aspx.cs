using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class addCanteen : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            con.open_connection();
            string st = "insert into vendor values('" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox1.Text + "')";
            SqlCommand cmd = new SqlCommand(st,con.con_pass());
            cmd.ExecuteNonQuery();

            con.close_connection();
            con.open_connection();
            String utype = "Seller";
            string login = "insert into login values('" + TextBox1.Text + "','" + TextBox7.Text + "','"+utype+"')";
            SqlCommand cmd1 = new SqlCommand(login,con.con_pass());
            cmd1.ExecuteNonQuery();

            con.close_connection();
            Response.Write("<script>alert('Seller Details Added Successfully!!!!!!!!')</script>");
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
}