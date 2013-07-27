using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Match
/// </summary>
public class Match
{
    public double s1, s2, rise1, rise2, diff;
    public int dir; // 0: tog, 1: opp, 2: irr
    public int t;
    public double th;

    public Match(double s1, double s2, Match prev, double th)
	{
        this.s1 = s1;
        this.s2 = s2;

        if (prev == null) {
            t = 1;
            rise1 = rise2 = diff = 0;
        }
        else {
            rise1 = (prev.s1 - s1) / prev.s1;
            rise2 = (prev.s2 - s2) / prev.s2;

            diff = Math.Abs(rise1 - rise2);
        }

        dir = rise1 * rise2 < 0 ? 1 : rise1 * rise2 >= 0 ? 0 : 2;
	}
}