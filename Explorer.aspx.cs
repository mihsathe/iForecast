using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Explorer : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string data = "";
        string[] series = Directory.GetDirectories(Server.MapPath("Data"));
        foreach (string ser in series) {
            data += "<div class='title' onclick=\"info('" + ser.Substring(ser.LastIndexOf("\\") + 1) + "')\">" + ser.Substring(ser.LastIndexOf("\\") + 1) + "</div>";
        }
        titles.InnerHtml = data;
    }
}
