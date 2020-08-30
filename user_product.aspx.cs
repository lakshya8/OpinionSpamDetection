using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
public partial class user_product : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGvData();
        gvData.Visible = false;
       // SendMail();
        SqlDataAdapter da = new SqlDataAdapter("select * from project order by userrat desc", con.con_pass());

        DataTable dt = new DataTable();
        da.Fill(dt);
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
    protected void SendMail()
    {
        //Random rnd = new Random();
        //int otp = rnd.Next(123456789);
        //Session["otp"] = rnd.Next(123456789);
        // Gmail Address from where you send the mail
        //var fromAddress = "simmisaluja2013@gmail.com";
        var fromAddress = "trymeapdtc2013@gmail.com";
        // any address where the email will be sending
        var toAddress = Session["emailID"].ToString();
        //Password of your gmail address  Session["pwd"]
        const string fromPassword = "apdtc@123";
        // const string fromPassword = Session["pwd"];
        // Passing the values and make a email formate to display
        string subject = "Please Purchase Product You get 10 % discount";
        string body = "10 % Discount of Mascara " + "\n";
        //body += txtDes.Text + "\n";
        //  body += "Password: " + txtPass.Text + "\n";
        // body += "Description:Thanks for Registerning with us" + "\n";
        // smtp settings
        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
            smtp.Timeout = 20000;
        }
        // Passing values to smtp object
        smtp.Send(fromAddress, toAddress, subject, body);
        //Response.Write("<script>alert('Please Purchase Product You get 10 % discount') </script>");
    }
    private DataTable BindGvData()
    {
        string q = "select pdate, pname,count(*) AS Expr1 from cnf_order where username='" + Session["emailID"].ToString() + "' GROUP BY pname,pdate";

        //Console.WriteLine(q);
        DataTable dt = new DataTable();
        SqlDataAdapter dp = new SqlDataAdapter(q, con.con_pass());
        dp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            gvData.DataSource = dt;
            gvData.DataBind();
        }
        return dt;
        // gvData.DataSource = GetChartData();
        //gvData.DataBind();
    }
    
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            con.open_connection();

            int a = Convert.ToInt32(e.CommandArgument);
            string query = "select * from project where pid=" + a + "";
            SqlCommand cmd = new SqlCommand(query, con.con_pass());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

            }
            con.close_connection();
        }
        else
        {

            int i = Convert.ToInt32(e.CommandArgument);
            

            Response.Redirect("project_Details.aspx?pid=" + i);



        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from project where pspl='" + DropDownList1.SelectedItem + "' order by userrat desc", con.con_pass());

        DataTable dt = new DataTable();
        da.Fill(dt);
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
}