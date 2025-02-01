<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="outages.aspx.cs" Inherits="wapp01.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <title>Outage Board</title>
    
    <style>
        .TextBoxes {
 border: 1px solid rgb(132, 132, 132);
 border-radius: 30px;
 outline: 0px;
 padding-left: 10px;
 padding-right: 10px;
}

    </style>
    <style>
        .myButtonConfirm {
	-moz-box-shadow:inset 0px 1px 0px 0px #f7c5c0;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f7c5c0;
	box-shadow:inset 0px 1px 0px 0px #f7c5c0;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fc8d83), color-stop(1, #e4685d));
	background:-moz-linear-gradient(top, #fc8d83 5%, #e4685d 100%);
	background:-webkit-linear-gradient(top, #fc8d83 5%, #e4685d 100%);
	background:-o-linear-gradient(top, #fc8d83 5%, #e4685d 100%);
	background:-ms-linear-gradient(top, #fc8d83 5%, #e4685d 100%);
	background:linear-gradient(to bottom, #fc8d83 5%, #e4685d 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fc8d83', endColorstr='#e4685d',GradientType=0);
	background-color:#fc8d83;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #d83526;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
}
.myButtonConfirm:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e4685d), color-stop(1, #fc8d83));
	background:-moz-linear-gradient(top, #e4685d 5%, #fc8d83 100%);
	background:-webkit-linear-gradient(top, #e4685d 5%, #fc8d83 100%);
	background:-o-linear-gradient(top, #e4685d 5%, #fc8d83 100%);
	background:-ms-linear-gradient(top, #e4685d 5%, #fc8d83 100%);
	background:linear-gradient(to bottom, #e4685d 5%, #fc8d83 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e4685d', endColorstr='#fc8d83',GradientType=0);
	background-color:#e4685d;
}
.myButtonConfirm:active {
	position:relative;
	top:1px;
}

    </style>

    <style>
        .myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #a4e271;
	-webkit-box-shadow:inset 0px 1px 0px 0px #a4e271;
	box-shadow:inset 0px 1px 0px 0px #a4e271;
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#89c403', endColorstr='#77a809',GradientType=0);
	background-color:#89c403;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #74b807;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528009;
            width: 223px;
            height: 38px;
        }
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #77a809), color-stop(1, #89c403));
	background:-moz-linear-gradient(top, #77a809 5%, #89c403 100%);
	background:-webkit-linear-gradient(top, #77a809 5%, #89c403 100%);
	background:-o-linear-gradient(top, #77a809 5%, #89c403 100%);
	background:-ms-linear-gradient(top, #77a809 5%, #89c403 100%);
	background:linear-gradient(to bottom, #77a809 5%, #89c403 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77a809', endColorstr='#89c403',GradientType=0);
	background-color:#77a809;
}
.myButton:active {
	position:relative;
	top:1px;
}

    </style>

    <style>        h1 {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif,serif;
font-size: 80px;
/*letter-spacing: 1px;*/
/*word-spacing: 10px;*/
color: #0e3677;
font-weight: bold;
text-decoration: none;
font-style: normal;
/*font-variant: small-caps;*/
text-transform: none;
        }
    #headerRow {
                     background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;

    border: 1px solid #AAAAAA;
  padding: 3px 2px;

    font-size: 15px;
  font-weight: bold;
  font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;

               }

    body {
        background: rgba(254,254,254,1);
background: -moz-linear-gradient(top, rgba(254,254,254,1) 0%, rgba(209,209,209,1) 23%, rgba(219,219,219,1) 50%, rgba(226,226,226,1) 100%);
background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(254,254,254,1)), color-stop(23%, rgba(209,209,209,1)), color-stop(50%, rgba(219,219,219,1)), color-stop(100%, rgba(226,226,226,1)));
background: -webkit-linear-gradient(top, rgba(254,254,254,1) 0%, rgba(209,209,209,1) 23%, rgba(219,219,219,1) 50%, rgba(226,226,226,1) 100%);
background: -o-linear-gradient(top, rgba(254,254,254,1) 0%, rgba(209,209,209,1) 23%, rgba(219,219,219,1) 50%, rgba(226,226,226,1) 100%);
background: -ms-linear-gradient(top, rgba(254,254,254,1) 0%, rgba(209,209,209,1) 23%, rgba(219,219,219,1) 50%, rgba(226,226,226,1) 100%);
background: linear-gradient(to bottom, rgba(254,254,254,1) 0%, rgba(209,209,209,1) 23%, rgba(219,219,219,1) 50%, rgba(226,226,226,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefefe', endColorstr='#e2e2e2', GradientType=0 );
    }
}   </style>

    <style>table.blueTable {
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  width: 75%;
  text-align: left;
  border-collapse: collapse;
}


table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
  }

table.blueTable tbody td {
  font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  font-size: 16px;
}
table.blueTable tr:nth-child(even) {
  background: #D0E4F5;
}

table.blueTable thead {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;
}
table.blueTable thead th {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;
}
table.blueTable thead th:first-child {
  border-left: none;
}

table.blueTable tfoot {
  font-size: 14px;
  font-weight: bold;
  color: #FFFFFF;
  background: #D0E4F5;
  background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  border-top: 2px solid #444444;
}
table.blueTable tfoot td {
  font-size: 14px;
}
table.blueTable tfoot .links {
  text-align: right;
}
table.blueTable tfoot .links a{
  display: inline-block;
  background: #1C6EA4;
  color: #FFFFFF;
  padding: 2px 8px;
  border-radius: 5px;
}       
        #absolute {
            height: 75px;
        }
    </style>

</head>
<body>

    <script type="text/javascript">
    function showDivFunc() {
    document.getElementById("advisoryFields").hidden=false;
        }
        
        
</script>
     
    <div id="heading" align="center">
    <h1>Outage Board</h1>
    </div>
    <form id="form1" runat="server">
        <div id="absolute" align="center" style="font-size: 30px;font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">
            Current or Scheduled Outages<br />
            <br />
            <br />
            <br /></div>
        <div id="newAdvisory" style="margin-left: 200px">
            
            <button id="showDivButton" type="button" class="myButton">Add New Advisory</button>
            <br />
            <br />

        </div>
        <div id="advisoryFields" hidden=true style="margin-left: 200px">
            <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" CssClass="TextBoxes" ToolTip="Choose the system affected by the outage">
                <asp:ListItem>Sharepoint</asp:ListItem>
                <asp:ListItem>Phones</asp:ListItem>
                <asp:ListItem>Email</asp:ListItem>
                <asp:ListItem>Apply</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" CssClass="TextBoxes" Placeholder="did this work" ToolTip="Enter the date the outage began"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Time" CssClass="TextBoxes" ToolTip="Enter the time the outage began"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" CssClass="TextBoxes" Placeholder="What is the ETR?" ToolTip="Enter the Estimated Time of Restore in this field"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" CssClass="TextBoxes" Placeholder="Outage details" ToolTip="Enter general information about the outage"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirm and Add" CssClass="myButtonConfirm" />
            <br />
            <br />
            <br />
            <br /><br /></div><br /><br />
        <div id="table" align="center">
            <asp:Table ID="Table1" runat="server" GridLines="Both" CssClass="blueTable">
                <asp:TableRow ID="headerRow" runat="server" CssClass="tableHeader" ToolTip="Outage Headings">
                    <asp:TableCell ID="headerRowTitle1" runat="server" CssClass="tableHeader">Outage Ref.</asp:TableCell>
                    <asp:TableCell ID="headerRowTitle2" runat="server" CssClass="tableHeader">Affected Service</asp:TableCell>
                    <asp:TableCell ID="headerRowTitle3" runat="server" CssClass="tableHeader">Outage Start Date</asp:TableCell>
                    <asp:TableCell ID="headerRowTitle4" runat="server" CssClass="tableHeader">Outage Start Time</asp:TableCell>
                    <asp:TableCell ID="headerRowTitle5" runat="server" CssClass="tableHeader">ETR</asp:TableCell>
                    <asp:TableCell ID="headerRowTitle6" runat="server" CssClass="tableHeader">Details</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        
        <div id="deleteAdvisory" style="margin-left: 200px; margin-top:40px;">
            <div id="Label2" style="margin-left: 40px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">
                Outage Ref.:&nbsp;&nbsp;&nbsp;</div>
            <asp:TextBox ID="TextBox6" runat="server" MaxLength="6" ToolTip="Enter the Outage Ref. of the advisory you would like to delete. cheers bro"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="Delete Advisory" CssClass="myButtonConfirm" OnClick="Button3_Click" />
        </div>


    <script type="text/javascript">
        document.getElementById("showDivButton").addEventListener("click", function () {showDivFunc();;});

        //get and set the date field in a one liner
        document.getElementById('TextBox2').valueAsDate = new Date();

        //get the current time and set it in the time field
        
            var d = new Date();
            var curr_hour = d.getHours();
            var curr_min = d.getMinutes();
        var allTogetherDate = curr_hour + ":" + curr_min;
        document.getElementById('TextBox3').value = allTogetherDate;
        //use this javascript to add test data (paste into chrome console): for (var i=0;i < 1;i++){document.getElementById("TextBox4").value = "test"; document.getElementById("TextBox5").value ="test"; document.getElementById("Button2").click();}
        
    </script>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <div id="Label1" style="margin-left: 40px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">

        Support<br /></div><br />
        <div id="wrapup" style="margin-left: 40px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;font-size:small;">
        Contact Admin <a href="mailto:admin@example.com?subject=Regarding the Outage Board">feedback</a>
        
            <br /><br /><br />
        </div>
    </form>
    </body>
</html>
