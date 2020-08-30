using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
public partial class ajaxtest : System.Web.UI.Page
{
   
    string val = null;
    static string email = null;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        email = Session["uemail"].ToString();
    }
    [WebMethod]
    public static string jqueryAjaxCall(string firstName, string lastName)
    {
        //Do coding staff.
        return firstName + "hw " + lastName;
    }
    [WebMethod]
    public static string saveInDB(string value)
    {
        string msg = "Failed to save";
        string st=null;
        //Do coding staff.
        try
        {
            Console.WriteLine("sved" + value);
            string val = value;
            connection2.open_connection();
            st = "insert into finger_db (fig1) values('"+value+"')";

            SqlCommand cmd = new SqlCommand(st, connection2.con_pass2());
            cmd.ExecuteNonQuery();
            connection2.close_connection();
            msg = "Sved in db";
        }
        catch (Exception ex) {
            value = ex.ToString();
        }
        return msg;
    }

    [WebMethod]
    public static string getFingerPrint(string value)
    {
        string fingerprint = "";
        string st = null;
        //Do coding staff.
        try
        {
            Console.WriteLine("sved" + value);
            string val = value;
            connection2.open_connection();
            st = "select * from registration where emailid='"+email+"'";

            SqlCommand cmd = new SqlCommand(st, connection2.con_pass2());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read()) {
                fingerprint = dr["fig1"].ToString();
                
            }
            connection2.close_connection();
          
        }
        catch (Exception ex)
        {
            value = ex.ToString();
        }
        return fingerprint;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
       
        Response.Redirect("viewProfile.aspx");
    }
}