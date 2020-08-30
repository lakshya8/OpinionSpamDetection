using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public static class connection2
{
    static SqlConnection conn2;

    public static string  get_connect2 = System.Configuration.ConfigurationManager.ConnectionStrings["HeadBook"].ConnectionString;

   

    public static void open_connection()
    {
        conn2 = new SqlConnection(get_connect2);
        if (conn2.State == ConnectionState.Closed)
        {
            conn2.Open();
        }
    }

    public static void close_connection()
    {
        if (conn2.State == ConnectionState.Open)
        {
            conn2.Close();
        }
    }

    public static SqlConnection con_pass2()
    {
        return conn2;
    }
}