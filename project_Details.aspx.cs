using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Configuration;
using System.Collections;
public partial class project_Details : System.Web.UI.Page
{
    connection con = new connection();
    SqlConnection con3 = new SqlConnection(@"Data Source=.;Initial Catalog=Fake_Review;Integrated Security=True");
    connection con2 = new connection();
    static List<Document> _trainCorpus = new List<Document>
        {
             new Document("spam", "Bad"), 
             new Document("spam", "Damage"), 
             new Document("spam", "Unfair"), 
             new Document("spam", "unuse"),
             new Document("spam", "cheap"),
             new Document("spam", "improvement"),
             new Document("spam", "worst"),
             new Document("spam", "cheated"),
             new Document("spam", "crap"),
             new Document("spam", "very bad"),
                new Document("Positive", "Good"), 
                new Document("Positive", "Nice"),
                new Document("Positive", "Best"),
                new Document("Positive", "Super"),
                new Document("Positive", "Amazing"),
                new Document("Positive", "Awesome"),
                new Document("Positive", "Great"),
                new Document("Positive", "Wondeful"),
                new Document("Positive", "Beautiful"),
                new Document("Positive", "Elegant")

        };
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["emailID"] != null)
        {
            if (!Page.IsPostBack)
            {
                BindChart();
                gvData.Visible = false;
                bindData();
                BindChart2();
                BindGvData2();
                GridView1.Visible = false;
            }
        }
        else
            Response.Redirect("login.aspx");
        
    }
    private void bindData()
    {

        if ((Request.QueryString["pid"] != null))
        {

            string i = (Request.QueryString["pid"]);
            
            string qquery = "select * from project where pid='" + i + "'";
            SqlCommand cmd = new SqlCommand(qquery, con.con_pass());
            con.open_connection();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                Image1.ImageUrl = dr["pimage"].ToString();
                Label1.Text = dr["pid"].ToString();
                Label2.Text = dr["pname"].ToString();
                Label3.Text = dr["price"].ToString();
                Label4.Text = dr["pdesc"].ToString();
                Label5.Text = dr["pdate"].ToString();
                Label7.Text = dr["pspl"].ToString();
                txtname.Text = dr["pname"].ToString();
            }
            con.close_connection();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string st = "Pending";
        con.open_connection();
        string str = "insert into tbl_temp values('" + Label1.Text + "','" + Label2.Text + "','" + Label3.Text + "','" + Label4.Text + "','" + System.DateTime.Now.ToString() + "','" + Session["emailID"] + "','" + st + "')";
        SqlCommand cmd = new SqlCommand(str, con.con_pass());
        cmd.ExecuteNonQuery();
        con.close_connection();
        Response.Redirect("shoppingDetails.aspx");
    }
    private DataTable BindGvData()
    {
        string q = "SELECT 	hname, count(hrating) As Expr1 FROM rating_db group by hname";


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
    private void BindChart()
    {
        DataTable dsChartData = new DataTable();
        StringBuilder strScript = new StringBuilder();

        try
        {
            dsChartData = BindGvData();

            strScript.Append(@"<script type='text/javascript'>
                    google.load('visualization', '1', {packages: ['corechart']});</script>

                    <script type='text/javascript'>
                    function drawChart() {       
                    var data = google.visualization.arrayToDataTable([
                    ['Product Details', 'Total Product'],");

            foreach (DataRow row in dsChartData.Rows)
            {
                strScript.Append("['" + row["hname"] + "'," + row["Expr1"] + "],");
            }
            strScript.Remove(strScript.Length - 1, 1);
            strScript.Append("]);");

            strScript.Append(@" var options = {   
                                    title: 'Produt Rating',          
                                    is3D: true,        
                                    };   ");

            strScript.Append(@"var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));        
                                chart.draw(data, options);      
                                }  
                            google.setOnLoadCallback(drawChart);
                            ");
            strScript.Append(" </script>");

            ltScripts.Text = strScript.ToString();
        }
        catch
        {
            //piechart_3d corechart
        }
        finally
        {
            dsChartData.Dispose();
            strScript.Clear();
        }
    }
   
    private DataTable BindGvData2()
    {
        //string name = "sadsd";
        string q = "SELECT  status, COUNT(*) AS Expr1 FROM feedback where hname='" + Request.QueryString["pid"] + "' GROUP BY status";


        //Console.WriteLine(q);
        DataTable dt = new DataTable();
        SqlDataAdapter dp = new SqlDataAdapter(q, con.con_pass());
        dp.Fill(dt);
        if (dt.Rows.Count > 0)
        {

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        return dt;
        // gvData.DataSource = GetChartData();
        //gvData.DataBind();
    }
    private void BindChart2()
    {
        DataTable dsChartData2 = new DataTable();
        StringBuilder strScript2 = new StringBuilder();

        try
        {
            dsChartData2 = BindGvData2();

            strScript2.Append(@"<script type='text/javascript'>
                    google.load('visualization', '1', {packages: ['corechart']});</script>

                    <script type='text/javascript'>
                    function drawChart() {       
                    var data = google.visualization.arrayToDataTable([
                    ['Yes', 'No'],");

            foreach (DataRow row in dsChartData2.Rows)
            {
                strScript2.Append("['" + row["status"] + "'," + row["Expr1"] + "],");
            }
            strScript2.Remove(strScript2.Length - 1, 1);
            strScript2.Append("]);");

            strScript2.Append(@" var options = {   
                                    title: 'Product Feedback',          
                                    is3D: true,        
                                    };   ");

            strScript2.Append(@"var chart = new google.visualization.PieChart(document.getElementById('Div1'));        
                                chart.draw(data, options);      
                                }  
                            google.setOnLoadCallback(drawChart);
                            ");
            strScript2.Append(" </script>");

            ltScripts2.Text = strScript2.ToString();
        }
        catch
        {
            //piechart_3d corechart
        }
        finally
        {
            dsChartData2.Dispose();
            strScript2.Clear();
        }
    }
    
    private DataTable GetData(string query)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["counselling"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }
    protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        try
        {
            int rat = 0;
            String q = e.Value.ToString();
            int ratval = Convert.ToInt32(q);
           
            DataTable dt = this.GetData("SELECT ISNULL(AVG(hrating), 0) AverageRating  FROM rating_db where hname='" + Label2.Text + "'");
            rat = Convert.ToInt32(dt.Rows[0]["AverageRating"]);

            if (rat == 0)
            {
                con.open_connection();
                string s1 = "insert into rating_db(hname,hrating,email) values('" + Label2.Text + "','" + Label1.Text + "','" + Session["emailID"].ToString() + "')";
                SqlCommand cm = new SqlCommand(s1, con.con_pass());
                cm.ExecuteNonQuery();

                con.close_connection();
                Response.Write("<script>alert('Product Rating Given Successfully') </script>");
                Response.Redirect("project_Details.aspx?pid=" + Request.QueryString["pid"]);

            }
            else if (ratval == rat + 1 || ratval == rat - 1)
            {
                
                con.open_connection();
                string s1 = "insert into rating_db(hname,hrating,email) values('" + Label2.Text + "','" + Label1.Text + "','" + Session["emailID"].ToString() + "')";
                SqlCommand cm = new SqlCommand(s1, con.con_pass());
                cm.ExecuteNonQuery();

                con.close_connection();
                Response.Write("<script>alert('Product Rating Given Successfully') </script>");
                Response.Redirect("project_Details.aspx?pid=" + Request.QueryString["pid"]);

            }
            else
            {
                lblmsg.Text = "Fake";
                string msg = "Rating Issue";
                con.open_connection();
                con2.open_connection();
                string s_fake_real = "insert into product_review values('" + txtname.Text + "','" + msg + "','" + lblmsg.Text + "')";
                SqlCommand sk = new SqlCommand(s_fake_real, con2.con_pass());
                sk.ExecuteNonQuery();
                con2.close_connection();
                string s1 = "insert into feedback(hname,hdes,rdate,fuser,status) values('" + Label1.Text + "',' Rating Issue ','" + System.DateTime.Now.ToString() + "','" + Session["emailID"] + "','Negative')";
                SqlCommand cmd = new SqlCommand(s1, con.con_pass());
                cmd.ExecuteNonQuery();
                con.close_connection();

            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
       int a = 0;
        string test = txtdes.Text;
        var c = new Classifier2(_trainCorpus);
        var res = c.IsInClassProbability("Positive", test);
        var res2 = c.IsInClassProbability("spam", test);

            //Label9.Visible = true;
            lblmsg.Text ="res="+ res.ToString()+"res2="+res2;
            if (res >= res2)
            {
                lblmsg.Text = "Real";
                con2.open_connection();
                string s_fake_real = "insert into product_review values('" + txtname.Text + "','" + txtdes.Text + "','" + lblmsg.Text + "')";
                SqlCommand sk = new SqlCommand(s_fake_real, con2.con_pass());
                sk.ExecuteNonQuery();
            con2.close_connection();
            con.open_connection();
            string s1 = "insert into feedback(hname,hdes,rdate,fuser,status) values('" + Label1.Text + "','" + txtdes.Text + "','" + System.DateTime.Now.ToString() + "','" + Session["emailID"] + "','Positive')";
            SqlCommand cmd = new SqlCommand(s1, con.con_pass());
            cmd.ExecuteNonQuery();
            con.close_connection();

        }
            else
            {
                lblmsg.Text = "Fake";
                con2.open_connection();
                string s_fake_real = "insert into product_review values('" + txtname.Text + "','" + txtdes.Text + "','" + lblmsg.Text + "')";
                SqlCommand sk = new SqlCommand(s_fake_real, con2.con_pass());
                sk.ExecuteNonQuery();
            con2.close_connection();
            con.open_connection();
            string s1 = "insert into feedback(hname,hdes,rdate,fuser,status) values('" + Label1.Text + "','" + txtdes.Text + "','" + System.DateTime.Now.ToString() + "','" + Session["emailID"] + "','Negative')";
            SqlCommand cmd = new SqlCommand(s1, con.con_pass());
            cmd.ExecuteNonQuery();
            con.close_connection();

        }
        

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
       
        string uname = null, pkey = null, nkey = null;
        ArrayList positivekey1 = new ArrayList(10);
        ArrayList negativekey1 = new ArrayList(10);
        int pcount = 0, ncount = 0;
        con2.open_connection();
        string suser = "select * from cnf_order where username='" + Session["emailID"].ToString() + "' ";
        SqlCommand cmduser = new SqlCommand(suser, con2.con_pass());
        SqlDataReader druser = cmduser.ExecuteReader();
        if (druser.Read())
        {
            uname = druser["username"].ToString();
        }
        con2.close_connection();
        con2.open_connection();
        string skey = "select positivekey from positive_keyword";
        SqlCommand cmd_key = new SqlCommand(skey, con2.con_pass());
        SqlDataReader drkey = cmd_key.ExecuteReader();
        while (drkey.Read())
        {
            pkey = drkey["positivekey"].ToString();
            positivekey1.Add(pkey);
        }

        con2.close_connection();
        con2.open_connection();
        string nskey = "select negativekey from negative_keyword";
        SqlCommand cmd_nkey = new SqlCommand(nskey, con2.con_pass());
        SqlDataReader drnkey = cmd_nkey.ExecuteReader();
        while (drnkey.Read())
        {
            nkey = drnkey["negativekey"].ToString();
            negativekey1.Add(nkey);
        }

        con2.close_connection();
        if (Session["emailID"].ToString().Equals(uname))
        {

            double s1 = 0, s2 = 0, s3 = 0, s4 = 0, s5 = 10, s6 = 0, s7 = 0, daterel = 0;
            int i;
            for (i = 0; i < positivekey1.Count; i++)
            {
                bool bp1 = txtdes.Text.Contains(positivekey1[i].ToString());
                if (bp1 == true)
                {
                    string release;
                    SqlDataAdapter da;
                    //string datakey= TextBox2.Text.Contains("good") || TextBox2.Text.Contains("abound") || TextBox2.Text.Contains("accurate") || TextBox2.Text.Contains("accurately") || TextBox2.Text.Contains("achievement") || TextBox2.Text.Contains("adaptable") || TextBox2.Text.Contains("beautify") || TextBox2.Text.Contains("delicate") || TextBox2.Text.Contains("best") || TextBox2.Text.Contains("nice") || TextBox2.Text.Contains("very good")
                    DataSet ds = new DataSet();
                    string a = "select rank from positive_keyword where positivekey like  '" + positivekey1[i].ToString() + "'";
                    da = new SqlDataAdapter(a, con3);
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        s1 = Convert.ToDouble(ds.Tables[0].Rows[0][0].ToString());
                    }

                    break;
                }
            }
            //ArrayList str1 = new ArrayList();
            for (i = 0; i < negativekey1.Count; i++)
            {
                bool bp1 = txtdes.Text.Contains(negativekey1[i].ToString());
                if (bp1 == true)
                {
                    SqlDataAdapter da1;
                    DataSet ds1 = new DataSet();
                    string b = "select rank  from negative_keyword  where negativekey  like '" + negativekey1[i].ToString() + "'";
                    da1 = new SqlDataAdapter(b, con3);
                    da1.Fill(ds1);
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        s2 = Convert.ToDouble(ds1.Tables[0].Rows[0][0].ToString());
                    }
                    break;
                }
            }



            DataTable table = new DataTable();
            table.Columns.Add("Type");
            table.Columns.Add("Real", typeof(double));
            table.Columns.Add("Best", typeof(double));
            table.Columns.Add("Good", typeof(double));
            table.Columns.Add("Average", typeof(double));
            table.Columns.Add("Fake", typeof(double));

            //training data.
            table.Rows.Add("Real", 7, 7, 7, 7, 7);
            table.Rows.Add("Real", 7.5, 7.5, 7.5, 7.5, 7.5);
            table.Rows.Add("Real", 8, 8, 8, 8, 8);
            table.Rows.Add("Real", 8.5, 8.5, 8.5, 8.5, 8.5);
            table.Rows.Add("Real", 9, 9, 9, 9, 9);
            table.Rows.Add("Real", 9.5, 9.5, 9.5, 9.5, 9.5);
            table.Rows.Add("Real", 10, 10, 10, 10, 10);



            table.Rows.Add("Real", 6.8, 6.8, 6.8, 6.8, 6.8);
            table.Rows.Add("Real", 6.4, 6.4, 6.4, 6.4, 6.4);
            table.Rows.Add("Real", 6, 6, 6, 6, 6);
            table.Rows.Add("Real", 5.8, 5.8, 5.8, 5.8, 5.8);
            table.Rows.Add("Real", 5.5, 5.5, 5.5, 5.5, 5.5);
            table.Rows.Add("Real", 5.3, 5.3, 5.3, 5.3, 5.3);



            table.Rows.Add("Fake", 4.8, 4.8, 4.8, 4.8, 4.8);
            table.Rows.Add("Fake", 4.4, 4.4, 4.4, 4.4, 4.4);
            table.Rows.Add("Fake", 4, 4, 4, 4, 4);
            table.Rows.Add("Fake", 3.8, 3.8, 3.8, 3.8, 3.8);
            table.Rows.Add("Fake", 3.5, 3.5, 3.5, 3.5, 3.5);
            table.Rows.Add("Fake", 3.3, 3.3, 3.3, 3.3, 3.3);
            table.Rows.Add("Fake", 2.8, 2.8, 2.8, 2.8, 2.8);
            table.Rows.Add("Fake", 2.2, 2.2, 2.2, 2.2, 2.2);
            table.Rows.Add("Fake", 1, 1, 1, 1, 1);


            Classifier classifier = new Classifier();
            classifier.TrainClassifier2(table);
            string ans = "";
            try
            {
                ans = classifier.Classify2(new double[] { s1, s2, s3, s4, s5 });
            }
            catch (Exception)
            {
            }

            lblmsg.Text = ans;
            con2.open_connection();
            string s_fake_real = "insert into product_review values('" + txtname.Text + "','" + txtdes.Text + "','" + lblmsg.Text + "')";
            SqlCommand sk = new SqlCommand(s_fake_real, con2.con_pass());
            sk.ExecuteNonQuery();
            con.open_connection();
          
            if(lblmsg.Text.Contains("Real"))
            {
                string r2 = "insert into feedback(hname,hdes,rdate,fuser,status) values('" + Label1.Text + "','" + txtdes.Text + "','" + System.DateTime.Now.ToString() + "','" + Session["emailID"] + "','Positive')";
                SqlCommand cmd = new SqlCommand(r2, con.con_pass());
                cmd.ExecuteNonQuery();
            }
            else
            {
                string r2 = "insert into feedback(hname,hdes,rdate,fuser,status) values('" + Label1.Text + "','" + txtdes.Text + "','" + System.DateTime.Now.ToString() + "','" + Session["emailID"] + "','Negative')";
                SqlCommand cmd = new SqlCommand(r2, con.con_pass());
                cmd.ExecuteNonQuery();
            }
            con.close_connection();
            con2.close_connection();

        }
        else
        {
            string review = "Fake";
            con2.open_connection();
            string s_fake_real = "insert into product_review values('" + txtname.Text + "','" + txtdes.Text + "','" + review + "')";
            SqlCommand sk = new SqlCommand(s_fake_real, con2.con_pass());
            sk.ExecuteNonQuery();
            string s1 = "insert into feedback(hname,hdes,rdate,fuser,status) values('" + Label1.Text + "','" + txtdes.Text + "','" + System.DateTime.Now.ToString() + "','" + Session["emailID"] + "','Negative')";
            SqlCommand cmd = new SqlCommand(s1, con2.con_pass());
            cmd.ExecuteNonQuery();
            con2.close_connection();
        }

    }
class Document
    {
        public Document(string @class, string text)
        {
            Class = @class;
            Text = text;
        }
        public string Class { get; set; }
        public string Text { get; set; }
    }
    

    class ClassInfo
    {
        public ClassInfo(string name, List<String> trainDocs)
        {
            Name = name;
            var features = trainDocs.SelectMany(x => x.ExtractFeatures());
            WordsCount = features.Count();
            WordCount =
                features.GroupBy(x => x)
                .ToDictionary(x => x.Key, x => x.Count());
            NumberOfDocs = trainDocs.Count;
        }
        public string Name { get; set; }
        public int WordsCount { get; set; }
        public Dictionary<string, int> WordCount { get; set; }
        public int NumberOfDocs { get; set; }
        public int NumberOfOccurencesInTrainDocs(String word)
        {
            if (WordCount.Keys.Contains(word)) return WordCount[word];
            return 0;
        }
    }

    class Classifier2
    {
        List<ClassInfo> _classes;
        int _countOfDocs;
        int _uniqWordsCount;
        public Classifier2(List<Document> train)
        {
            _classes = train.GroupBy(x => x.Class).Select(g => new ClassInfo(g.Key, g.Select(x => x.Text).ToList())).ToList();
            _countOfDocs = train.Count;
            _uniqWordsCount = train.SelectMany(x => x.Text.Split(' ')).GroupBy(x => x).Count();
        }

        public double IsInClassProbability(string className, string text)
        {
            var words = text.ExtractFeatures();
            var classResults = _classes
                .Select(x => new
                {
                    Result = Math.Pow(Math.E, Calc(x.NumberOfDocs, _countOfDocs, words, x.WordsCount, x, _uniqWordsCount)),
                    ClassName = x.Name
                });


            return classResults.Single(x => x.ClassName == className).Result / classResults.Sum(x => x.Result);
        }

        private static double Calc(double dc, double d, List<String> q, double lc, ClassInfo @class, double v)
        {
            return Math.Log(dc / d) + q.Sum(x => Math.Log((@class.NumberOfOccurencesInTrainDocs(x) + 1) / (v + lc)));
        }
    }

}