using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class uploadProject : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        FileUpload1.Attributes["onchange"] = "UploadFile(this)";
        fillid();
    }
    protected void Upload(object sender, EventArgs e)
    {
        FileUpload1.SaveAs(Server.MapPath("~/uploadImage/" + Path.GetFileName(FileUpload1.FileName)));
        Image1.ImageUrl = "~/uploadImage/" + Path.GetFileName(FileUpload1.FileName);
        //lblMessage.Visible = true;

    }
    public void fillid()
    {
        con.open_connection();
        int pid = 0;
        int count = 1;
        con.open_connection();
        string query = "select * from project order BY pid ASC ";
        SqlCommand cmd2 = new SqlCommand(query, con.con_pass());
        SqlDataReader dr2 = cmd2.ExecuteReader();


        while (dr2.Read())

            count = count + 1;

        dr2.Close();
        pid = count;
        con.close_connection();
            TextBox1.Text = pid.ToString();
        con.close_connection();
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
                //Button2.Visible = false;
            }
            catch (Exception ex)
            {
                //StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int rat = 0;
            con.open_connection();
            string str = "insert into project values('" + TextBox1.Text + "','" + DropDownList1.SelectedValue + "','" + txtName.Text + "','" + TextBox3.Text + "','" + Image1.ImageUrl + "','" + System.DateTime.Now.ToString() + "','" + TextBox2.Text + "','" + rat + "')";
            SqlCommand cmd = new SqlCommand(str, con.con_pass());
            cmd.ExecuteNonQuery();
            con.close_connection();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
}