using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Juxtapose_JuxtChooser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ser1 = "", ser2 = "";
        string[] series = Directory.GetDirectories(Path.Combine(Directory.GetParent(Server.MapPath("")).FullName, "Data"));
        foreach (string ser in series)
        {
            string name = ser.Substring(ser.LastIndexOf("\\") + 1);
            ser1 += "<input type='radio' class='btn' name='left' onclick='update()' value='" + name + "' id='left_" + name + "' />  <label for='left_" + name + "' style='font-family:Calibri; font-size:22px;'>" + name + "</label><br />";
            ser2 += "<input type='radio' class='btn' name='right' onclick='update()' value='" + name + "' id='right_" + name + "' />  <label for='right" + right + "' style='font-family:Calibri; font-size:22px;'>" + name + "</label><br />";
        }
        ser1 += "";
        ser2 += "";

        left.InnerHtml = ser1;
        right.InnerHtml = ser2;
    }
}