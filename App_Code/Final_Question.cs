using System;
public class Final_Question
{
    public String question;
    public String ans1, ans2, ans3, ans4, cans,sname;

    public String QuestionText
    {
        get { return question; }
    }

    public String Answer1
    {
        get { return ans1; }
    }

    public String Answer2
    {
        get { return ans2; }
    }

    public String Answer3
    {
        get { return ans3; }
    }

    public String Answer4
    {
        get { return ans4; }
    }

    public String CorrectAnswer
    {
        get { return cans; }
    }
    

    public Final_Question(String question, String ans1, String ans2, String ans3, String ans4, String cans,String sname)
	{
        this.question = question;
        this.ans1 = ans1;
        this.ans2 = ans2;
        this.ans3 = ans3;
        this.ans4 = ans4;
        this.cans = cans;
        this.sname = sname;
        //this.qlabel = qlabel;
       
	}
    //public bool IsCorrect()
    //{
      //  return answer.Equals(cans);
    //}

}
