<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Explorer.aspx.cs" Inherits="Explorer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data Explorer</title>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <style>
        * {
            font-family: Calibri;
            font-size: 16px;
        }
        .title {
            padding: 5px;
            padding-left: 12px;
            margin: 5px;
            background-color: #444444;
            cursor: pointer;
            color:white;
        }
        td {
            padding: 5px;
            padding-left: 12px;
            padding-right: 12px;
            font-weight: bold;
        }
    </style>
    <script>
        function info(title) {
            $("#board").load("Data/" + title + "/index.html");
               
            $("#charts").html("<img src='Data/" + title + "/chart1.png' /> <br />")
            $("#charts").append("<img src='Data/" + title + "/chart2.png' /> <br />")
            $("#charts").append("<img src='Data/" + title + "/chart3.png' /> <br />")
            $("#charts").append("<img src='Data/" + title + "/chart4.png' /> <br />")
            $("#charts img").css("width", "100%");
        }
        function showCharts() {
            $.ajax({
                url: "Data/" + title + "/charts.html",
                success: function (res) {
                    $("#board").html(res);
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row-fluid">
            <div class="span2" runat="server" id="titles" style="border-right:thin solid black;">
                
            </div>
            <div id="board" class="span5">

            </div>
            <div id="charts" class="span5">

            </div>
        </div>
    </form>
</body>
</html>
