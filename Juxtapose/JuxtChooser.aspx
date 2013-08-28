<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JuxtChooser.aspx.cs" Inherits="Juxtapose_JuxtChooser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Juxtapose</title>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <style>
        input {
            margin: 5px;
            height: 30px;
            font-size: 14px;
            font-family: Calibri;
            padding-left: 10px;
        }
        .title {
            font-family: Calibri;
            font-size: 24px;
            padding: 10px;
        }
        #left, #right {
            padding:20px;
        }
        #board {
            font-size: 20px;
            font-family: Calibri;            
        }
        label {
            display: inline-block;
        }
    </style>
    <script>
        $(function () { update();})
        function calc() {
            var ser1 = $('input[name=left]:checked').val();
            var ser2 = $('input[name=right]:checked').val();
            var th = $("#th").val();

            window.location = "juxt.aspx?s1=" + ser1 + "&s2=" + ser2 + "&th=" + th;
        }
        function update() {
            var ser1 = $('input[name=left]:checked').val()
            var ser2 = $('input[name=right]:checked').val()

            $("#left_val").html(ser1);
            $("#right_val").html(ser2);
        }
    </script>
</head>
<body>
    <div class="row-fluid">
        <div runat="server" class="span3" id="left">

        </div>
        <div runat="server" class="span3" id="right">

        </div>
        <div class="span2"></div>
        <div class="span4" id="board" style="margin-top:30px; border:medium solid #444444; border-radius: 10px; padding:10px;margin:10px;">
            <table width="100%">
                <tr>
                    <td class="span6" style="padding:10px; font-weight:bold; width:30%;">Left Series</td>
                    <td class="span6" id="left_val" style="padding:10px;">Not Selected</td>
                </tr>
                <tr>
                    <td class="span6" style="padding:10px; font-weight:bold; width:30%;">Right Series</td>
                    <td class="span6" id="right_val" style="padding:10px;">Not Selected</td>
                </tr>
                <tr>
                    <td class="span6" style="padding:10px; font-weight:bold; width:30%;">Threshold</td>
                    <td class="span6" id="Td1" style="padding:10px;">
                        <input type="text" class="span8" style="width:250px;" id="th" value="70"/>
                    </td>
                </tr>
                <tr>
                    <td class="span6" style="padding:10px; font-weight:bold; width:30%;"></td>
                    <td class="span6" id="Td2" style="padding:10px;">
                        <button class="btn btn-info" style="padding:10px; width: 120px;" onclick="calc()">Calculate</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
