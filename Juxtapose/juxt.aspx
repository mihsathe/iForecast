<%@ Page Language="C#" AutoEventWireup="true" CodeFile="juxt.aspx.cs" Inherits="juxt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Juxtapose</title>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />
    <script type="text/javascript" src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="Juxt.js" charset="utf-8"></script>
    <script type="text/javascript">
        window.onload = function() {
            var data = JSON.parse('<%= json%>');
            juxt.init({
                data: data,
                dom: "vis"
            });

            setTimeout(function () { juxt.visualize(); }, 1);
            setTimeout(function () { juxt.summarize(); }, 1);
        }
    </script>
    <style>
        .table {
            font-family: Calibri;
            padding: 18px;
            font-weight: bold;
            font-size: 14px;
        }
        .error {
            background-color: #fad5d5;
        }
        .success {
            background-color: #c5fbc6;
        }
        .info {
            background-color: #bad0f7;
        }
    </style>
</head>
<body style="background-color: #CCCCCC;">
    <div class="row-fluid">
        <div class="span9">
            <table class="table table-bordered" id="vis">
               
            </table>
        </div>
        <div class="span3">
            <table class="table table-striped" style="border:none;margin:5%;width:85%;">
                <tr>
                    <th colspan="2" style="background-color: #444444;color:white;">Results</th>
                </tr>
                <tr><td>Total</td><td id="total"></td></tr>
                <tr><td>Together</td><td id="togs"></td></tr>
                <tr><td>Opposite</td><td id="opps"></td></tr>
                <tr><td>Irrelevant</td><td id="irrs"></td></tr>
                <tr><td>SPD</td><td id="spd"></td></tr>
            </table>
            <br /><br />
            <table class="table table-striped" style="border:none;margin:5%;width:85%;">
                <tr>
                    <th colspan="2" style="background-color: #444444;color:white;">Params</th>
                </tr>
                <tr><td>Algorithm</td><td id="algo">Sales Pattern Distance (SPD)</td></tr>
                <tr><td>Series 1</td><td id="ser1"></td></tr>
                <tr><td>Series 2</td><td id="ser2"></td></tr>
                <tr><td>Threshold</td><td id="thr"></td></tr>
            </table>
        </div>
    </div>
</body>
</html>