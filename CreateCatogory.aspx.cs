using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class CreateCatogory : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string pname = null;
        con.open_connection();
        String st1 = "select * from pcat where cat_name='"+TextBox1.Text+"'";
        SqlCommand cmd1 = new SqlCommand(st1,con.con_pass());
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.Read())
        {
            pname = dr["cat_name"].ToString();
        }
        con.close_connection();
        if (TextBox1.Text.Equals(pname))
        {
            Response.Write("<script>alert('Already Created try Another !!!!') </script>");
        }
        else
        {
            con.open_connection();
            string st = "insert into pcat values('" + TextBox1.Text + "')";
            SqlCommand cmd = new SqlCommand(st, con.con_pass());
            cmd.ExecuteNonQuery();
            con.close_connection();
            Response.Write("<script>alert('Category Created !!!!') </script>");
        }
    }
}