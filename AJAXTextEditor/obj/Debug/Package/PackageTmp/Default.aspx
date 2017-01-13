<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AJAXTextEditor._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AJAX Text Editor</title>
    <style type="text/css">
        #textEditArea {
            height: 400px;
            width: 1000px;
        }
        #form1 {
            height: 560px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="titleLabel" runat="server" Text="AJAX Text Editor" />

    </div>
        
    <div>
    
        <asp:Button ID="saveBtn" runat="server" Height="26px" Text="Save" Width="71px" />
        <asp:Button ID="saveAsBtn" runat="server" Height="26px" Text="Save As" Width="71px" OnClick="saveAsBtn_Click" />
    
    </div>
        <div>
            <asp:TextBox ID="saveAsBox" runat="server"></asp:TextBox>
            <asp:Button ID="okBtn" runat="server" Height="26px" Text="OK" Width="71px" OnClick="okBtn_Click" />
            <asp:Button ID="cancelBtn" runat="server" Height="26px" Text="Cancel" Width="71px" />
        </div>
        <div>
            <asp:ListBox ID="fileList" runat="server" Height="70px" Width="200px"></asp:ListBox>
        </div>
        <asp:TextBox ID="textEditArea" runat="server" Height="400px" TextMode="MultiLine" Width="1000px"></asp:TextBox>
    </form>
    </body>
</html>
