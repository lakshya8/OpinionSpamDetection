using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class add_chat_bot : System.Web.UI.Page
{

    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Write("<script>alert('Try adding!!')</script>");
            con.open_connection();
            string st = "insert into bot_replay values ('" + TextBox1.Text + "','" + TextBox2.Text + "')";
            SqlCommand cmd = new SqlCommand(st, con.con_pass());
            cmd.ExecuteNonQuery();

            con.close_connection();
            Response.Write("<script>alert('Question Added Successfully!!!!') </script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error')</script>");
        }

    }
}