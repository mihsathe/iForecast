using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class Juxtapose
{
    double[] ser1 = null;
    double[] ser2 = null;
    double thr = 0;

	public Juxtapose(double[] ser1, double[] ser2, double thr)
	{
        this.ser1 = ser1;
        this.ser2 = ser2;
        this.thr = thr;
	}

    public string GetJSON()
    {
        Match[] data = Operate();
        return new JavaScriptSerializer().Serialize(data);
    }

    public Match[] Operate() 
    {
        List<Match> lst = new List<Match>();

        int len = ser1.Length < ser2.Length ? ser1.Length : ser2.Length;
        Match prev = null;

        for (int i = 0; i < len; i++) {
            prev = new Match(ser1[i], ser2[i], prev, thr);
            lst.Add(prev);
        }

        return lst.ToArray();
    }
}