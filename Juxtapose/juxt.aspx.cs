using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;



public partial class juxt : System.Web.UI.Page
{
    public string json = "1";

    public string[] SubArray(string[] data, int index, int length)
    {
        string[] result = new string[length];
        Array.Copy(data, index, result, 0, length);
        return result;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string title1 = Request["s1"];
        string title2 = Request["s2"];

        double threshold = double.Parse(Request["th"]);

        string file1 = File.ReadAllText(Server.MapPath("..\\Data\\" + title1 + "\\main.csv"));
        string file2 = File.ReadAllText(Server.MapPath("..\\Data\\" + title2 + "\\main.csv"));

        string[] rec1 = file1.Split(new char[] { '\n' });
        string[] rec2 = file2.Split(new char[] { '\n' });

        string[] rect1_temp = SubArray(rec1, 1, rec1.Length - 2);
        List<double> dat1 = new List<double>();
        foreach (var x in rect1_temp)
        {
            dat1.Add(double.Parse(x.Split(new char[] { ',' })[1]));
        }


        string[] rect2_temp = SubArray(rec2, 1, rec1.Length - 2);
        List<double> dat2 = new List<double>();
        foreach (var x in rect2_temp)
        {
            dat2.Add(double.Parse(x.Split(new char[] { ',' })[1]));
        }

        Juxtapose jux = new Juxtapose(dat1.ToArray(), dat2.ToArray(), threshold);
        json = jux.GetJSON();
    }
}