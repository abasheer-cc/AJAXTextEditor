<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AJAXTextEditor._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>AJAX Text Editor</title>
    <script type="text/javascript">
        /*  Function Name: bodyLoad()
            Parameters: none
            Return: none
            Description: upon loading body this function hides Save As related controls
        */
        function bodyLoad()
        {
            document.getElementById("saveAsBox").style.visibility = "hidden";
            document.getElementById("okBtn").style.visibility = "hidden";
            document.getElementById("cancelBtn").style.visibility = "hidden";
            document.getElementById("fileNameLabel").style.visibility = "hidden";
        }

        /*  Function Name: saveAsBtn_Click()
            Parameters: none
            Return: none
            Description: upon clicking saveAsBtn this function shows Save As related controls
        */
        function saveAsBtn_Click()
        {
            document.getElementById("saveAsBox").style.visibility = "visible";
            document.getElementById("okBtn").style.visibility = "visible";
            document.getElementById("cancelBtn").style.visibility = "visible";
            document.getElementById("fileNameLabel").style.visibility = "visible";
        }

        /*  Function Name: cancelBtn_Click()
            Parameters: none
            Return: none
            Description: upon clicking cancelBtn this function hides Save As related controls and clears saveAsBox
        */
        function cancelBtn_Click()
        {
            document.getElementById("saveAsBox").innerText = "";
            document.getElementById("saveAsBox").style.visibility = "hidden";
            document.getElementById("okBtn").style.visibility = "hidden";
            document.getElementById("cancelBtn").style.visibility = "hidden";
            document.getElementById("fileNameLabel").style.visibility = "hidden";
            
        }


    </script>
    
    <style type="text/css">
        #textEditArea {
            height: 400px;
            width: 1000px;
        }
        #form1 {
            height: 560px;
        }
        #cancelBtn {
            height: 26px;
            width: 71px;
        }
        #saveAsBtn {
            height: 26px;
            width: 71px;
        }
    </style>
</head>
<body onload="bodyLoad()">
    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        
        <div>
            <asp:Label ID="titleLabel" runat="server" Text="AJAX Text Editor" />

        </div>
        
        <div>
    
            <asp:Button ID="saveBtn" runat="server" Height="26px" Text="Save" Width="71px" OnClick="saveBtn_Click" />
            <input id="saveAsBtn" type="button" value="Save As" onclick="saveAsBtn_Click()" /></div>
        <div>
            <asp:Label ID="fileNameLabel" runat="server" Text="File name (e.g. test.txt)"></asp:Label>
            <asp:TextBox ID="saveAsBox" runat="server"></asp:TextBox>
            <asp:Button ID="okBtn" runat="server" Height="26px" Text="OK" Width="71px" OnClick="okBtn_Click" />
            <input id="cancelBtn" type="button" value="Cancel" onclick="cancelBtn_Click()" /><asp:Label ID="fileNameEmptyError" runat="server" Text="Error: no file name entered"></asp:Label>
            <asp:Label ID="fileFormatErrorLabel" runat="server" Text="Error: file name format invalid"></asp:Label>
            <asp:Label ID="saveLabel" runat="server" Text="Save Successful" Visible="False"></asp:Label>
        </div>
        

        <asp:UpdatePanel ID ="updatePanel" runat="server">

            <ContentTemplate>
                <div>
                    <asp:ListBox ID="fileList" runat="server" Height="70px" Width="600px"></asp:ListBox>
                    <asp:Button ID="updateBtn" runat="server" Height="26px" OnClick="updateBtn_Click" Text="Update" Width="71px" />
                    <asp:Button ID="openBtn" runat="server" Height="26px" Text="Open" Width="71px" OnClick="openBtn_Click" />
                </div>
                <div>
                    <asp:Label ID="currentFileName" runat="server" Text="Current File: untitled.txt"></asp:Label>
                </div>
                <asp:TextBox ID="textEditArea" runat="server" Height="400px" TextMode="MultiLine" Width="1200px"></asp:TextBox>
            </ContentTemplate>
        </asp:UpdatePanel>           
    
    </form>
    </body>
</html>
