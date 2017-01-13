﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AJAXTextEditor._Default" %>

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
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        
        <div>
            <asp:Label ID="titleLabel" runat="server" Text="AJAX Text Editor" />

        </div>
        
        <div>
    
            <asp:Button ID="saveBtn" runat="server" Height="26px" Text="Save" Width="71px" OnClick="saveBtn_Click" />
            <asp:Button ID="saveAsBtn" runat="server" Height="26px" Text="Save As" Width="71px" OnClick="saveAsBtn_Click" />
    
        </div>
        <div>
            <asp:Label ID="fileNameLabel" runat="server" Text="File name (e.g. test.txt)"></asp:Label>
            <asp:TextBox ID="saveAsBox" runat="server"></asp:TextBox>
            <asp:Button ID="okBtn" runat="server" Height="26px" Text="OK" Width="71px" OnClick="okBtn_Click" />
            <asp:Button ID="cancelBtn" runat="server" Height="26px" Text="Cancel" Width="71px" />
            <asp:Label ID="fileNameEmptyError" runat="server" Text="Error: no file name entered"></asp:Label>
            <asp:Label ID="fileFormatErrorLabel" runat="server" Text="Error: file name format invalid"></asp:Label>
        </div>
        

        <asp:UpdatePanel ID ="updatePanel" runat="server">

            <ContentTemplate>
                <div>
                    <asp:ListBox ID="fileList" runat="server" Height="70px" Width="850px"></asp:ListBox>
                    <asp:Button ID="updateBtn" runat="server" Height="26px" OnClick="updateBtn_Click" Text="Update" Width="71px" />
                    <asp:Button ID="openBtn" runat="server" Height="26px" Text="Open" Width="71px" OnClick="openBtn_Click" />

                </div>
                <asp:TextBox ID="textEditArea" runat="server" Height="400px" TextMode="MultiLine" Width="1000px"></asp:TextBox>
            </ContentTemplate>
        </asp:UpdatePanel>
        
            
    
    </form>
    </body>
</html>
