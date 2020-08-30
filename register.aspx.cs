using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mail;
using System.Net;
using System.IO;
using System.Text;
using System.Security.Cryptography;

public partial class register : System.Web.UI.Page
{
    connection con = new connection();
   
    protected void Page_Load(object sender, EventArgs e)
    {
       // txtIsoTemplate.Text = Session["fimg"].ToString();
        

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
        string str = "select * from registration order by userid";
        SqlCommand cmd = new SqlCommand(str, con.con_pass());
        SqlDataReader dr = cmd.ExecuteReader();
        int i = 0;
        while (dr.Read())
        {
            int a = 0;
            a = Convert.ToInt32(dr["userid"].ToString());
            ViewState["sid"] = a.ToString();
            i = i + 1;
        }
        if (i > 0)
        {
            int a = Convert.ToInt32(ViewState["sid"].ToString());
            a = a + 1;
            txtID.Text = a.ToString();
        }
        else
            txtID.Text = "101";
        con.close_connection();
    }
    
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            if (txtPass.Text == string.Empty || txtcPass.Text == string.Empty)
            {
                Response.Write("<script>alert('Password Must be Filled !!!!!') </script>");
            }
            else
            {
                string emailid = (txtEmail.Text.Trim());
                string pass = (txtPass.Text.Trim());
                string aadhar = (txtAdhar.Text.Trim());
                Session["uemail"] = emailid;
                string dob = TextBox1.Text;
                string status = "Pending";
                con.open_connection();
                string str = "insert into registration values('" + txtID.Text + "','" + emailid + "','" + txtFname.Text + "','" + txtLName.Text + "','" + radGen.Text + "','" + txtFather.Text + "','" + pass + "','" + dob + "','" + txtAdd.Text + "','" + txtCity.Text + "','" + txtState.Text + "','" + txtPostal.Text + "','" + txtCountry.Text + "','" + txtPone.Text + "','" + System.DateTime.Now.ToString() + "','" + Image1.ImageUrl + "','" + DropDownList1.SelectedValue + "','" + status + "','" + aadhar + "','" + txtIsoTemplate.Text+ "')";
                SqlCommand cmd = new SqlCommand(str, con.con_pass());
                cmd.ExecuteNonQuery();
                con.close_connection();
                con.open_connection();
                String utype = "User";
                string login = "insert into login values('" + emailid + "','" + pass + "','" + utype + "')";
                SqlCommand cmd1 = new SqlCommand(login, con.con_pass());
                cmd1.ExecuteNonQuery();

                con.close_connection();
                Label9.Visible = true;
                Label9.Text = "!!..Hi.." + txtFname.Text + " " + txtLName.Text + "', Your Account is successfully created check Your Email ID for further Details..!!";
               
            }

        }
        catch (Exception ex)
        {
            Label9.Visible = true;
            Label9.Text = ex.Message;
        }

    }
    private string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }
    private string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }
    protected void SendMail()
    {
        // Gmail Address from where you send the mail
        var fromAddress = "trymeapdtc2013@gmail.com";
        // any address where the email will be sending
        var toAddress = txtEmail.Text;
        //Password of your gmail address
        const string fromPassword = "apdtc@123";
        // Passing the values and make a email formate to display
        string subject = "Welcome Online Voting System System Please Write Down Your User Name and Password";
        string body ="Online Voting System Admin"+ "\n";
        body += "User Name: " + txtEmail.Text + "\n";
        body += "Password: " + txtPass.Text + "\n";
        body += "Finger Print ISO Value: " + txtIsoTemplate.Text + "\n";
        body += "Description:Thanks for Registerning with us" + "\n";
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
    }
    
   
}