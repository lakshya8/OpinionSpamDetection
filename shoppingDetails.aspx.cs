using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class shoppingDetails : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("user_product.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        dataupdated();
        copyData();
        con.open_connection();
        string st2 = "delete from tbl_temp where username='" + Session["emailID"] + "'";
        SqlCommand cmd1 = new SqlCommand(st2, con.con_pass());
        cmd1.ExecuteNonQuery();
        con.close_connection();
        Response.Write("<script>alert('Thank you for Purchasing the Product')</script>");
        Response.Write("<script>window.open('https://p-y.tm/q-qiOWO','_blank');</script>");
        //Response.Write("<script>window.open('https://p-y.tm/q-qiOWO','_blank');</script>");
       // Response.Redirect(https://p-y.tm/q-qiOWO);
    }
    public void copyData()
    {
        string st = "insert into cnf_order select * from tbl_temp";
        SqlCommand cmd = new SqlCommand(st, con.con_pass());
        con.open_connection();
        cmd.ExecuteNonQuery();
        con.close_connection();


    }
    private void dataupdated()
    {
        string st1 = "Confirm";
        try
        {
            con.open_connection();
            string st = "update tbl_temp set status='" + st1 + "' where username='" + Session["emailID"] + "'";
            SqlCommand cmd = new SqlCommand(st, con.con_pass());
            cmd.ExecuteNonQuery();
            con.close_connection();



        }
        catch (Exception e1)
        {
            e1.Message.ToString();

        }

    }
}