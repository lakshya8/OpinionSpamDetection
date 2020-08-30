using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class changeImage : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                string filename = System.IO.Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/uploadImage/") + filename);
                // Console.Write(filename);
                Image1.ImageUrl = "~/uploadImage/" + filename;
                Image1.Visible = true;
                // TextBox9.Text = Image1.ImageUrl;
                FileUpload1.Visible = false;
                Button2.Visible = false;
                con.open_connection();
                string str = "update registration set image='" + Image1.ImageUrl + "' where emailID='" + Session["emailID"] + "'";
                SqlCommand cmd = new SqlCommand(str, con.con_pass());
                cmd.ExecuteNonQuery();
                con.close_connection();
            }
            catch (Exception ex)
            {
                //StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }
}