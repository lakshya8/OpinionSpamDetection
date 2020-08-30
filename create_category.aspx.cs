using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class create_category : System.Web.UI.Page
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
            if (txtcat.Text == string.Empty)
            {
                Response.Write("<script>alert('Please Insert Category Details') </script>");
            }
            else
            {
                string st = "insert into category_details(cat_name,cname) values('" + txtcat.Text + "','"+Session["emailID"].ToString()+"')";
                SqlCommand cmd = new SqlCommand(st, con.con_pass());
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Category Created') </script>");
                txtcat.Text = "";
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Category Already Created') </script>");
            ex.Message.ToString();
            //Response.Write("<script>alert('Category Created') </script>");
        }

    }
}