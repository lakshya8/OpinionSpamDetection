using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
public partial class feedback : System.Web.UI.Page
{
    static TextBox TextBox1;
    string msg = null;
    static List<Document> _trainCorpus = new List<Document>
        {
            new Document("spam", "Bad"), 
            new Document("Positive", "Good"), 
            new Document("Positive", "Nice"),
            new Document("Positive", "Best"),
            new Document("Positive", "Super")
            
        };
   
    connection con = new connection();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
        

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

    class Classifier
    {
        List<ClassInfo> _classes;
        int _countOfDocs;
        int _uniqWordsCount;
        public Classifier(List<Document> train)
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
 
    protected void Button1_Click(object sender, EventArgs e)
    {
        string msg;
       
        int a = 0;
        string test = txtDonate.Text;
        var c = new Classifier(_trainCorpus);
        var res = c.IsInClassProbability("spam", test);
     
       

            Label9.Visible = true;
            Label9.Text = res.ToString();

    }
    protected void txtDate_TextChanged(object sender, EventArgs e)
    {

    }
}