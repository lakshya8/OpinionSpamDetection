using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class manageBook : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showcat();
        }

    }
    private void showcat()
    {
        string q = "select * from category_details";
        DataTable dt = new DataTable();
        SqlDataAdapter dp = new SqlDataAdapter(q, con.con_pass());
        dp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        showcat();
        Response.Redirect("update_category.aspx");

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string name = GridView1.DataKeys[e.RowIndex].Value.ToString();
        deleteData(name);
        showcat();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        showcat();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox email = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2");
     
        // TextBox totalprice = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4");
        string name = GridView1.DataKeys[e.RowIndex].Value.ToString();
        updateData(name, email.Text);
        GridView1.EditIndex = -1;
        showcat();
        Response.Redirect("update_category.aspx");
    }
    private void deleteData(string name)
    {
        string str = "delete from category_details where cat_id='" + name + "'";
        SqlCommand cmd = new SqlCommand(str, con.con_pass());
        con.open_connection();
        cmd.ExecuteNonQuery();
        con.close_connection();
        showcat();



    }
    private void updateData(string id, string email)
    {
        //,requirement='"+desc+"',rdate='"+rdate+"'
        string query = "update category_details set cat_name='" + email + "' where cat_id='" + id + "'";
        SqlCommand cmd = new SqlCommand(query, con.con_pass());
        con.open_connection();
        cmd.ExecuteNonQuery();
        con.close_connection();
        showcat();
    }
}