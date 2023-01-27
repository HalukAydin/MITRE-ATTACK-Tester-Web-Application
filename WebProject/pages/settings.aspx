<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="WebProject.pages.settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body style="text-align:center">
    <div class="header">Vulnerability Scanning</div>
    <asp:HyperLink ID="homelink" runat="server" NavigateUrl="~/pages/home.aspx">Home</asp:HyperLink>
    <asp:HyperLink ID="prolink" runat="server" NavigateUrl="~/pages/profile.aspx">Profile</asp:HyperLink>
    <form id="formupdate" runat="server" style="color:white">
        <br />
        Name
        <br />
        <asp:TextBox ID="txtname" runat="server" ></asp:TextBox>
        <br />
        <br />
        Surname
        <br />
        <asp:TextBox ID="txtsurname" runat="server"  >
        </asp:TextBox>
        <br />
        <br />
        Password
        <br />
        <asp:TextBox ID="txtpass" runat="server" >
        </asp:TextBox>
        <br />
         <asp:RegularExpressionValidator ID="validator" runat="server" ControlToValidate="txtpass" ErrorMessage="Between 6-12 characters. Including minimum 1 Upper-case and digit." ForeColor="Red" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,12}$" BackColor="#182137" />
        <br />
        Confirm Password
        <br />
        <asp:TextBox ID="txtpass2" runat="server">
        </asp:TextBox>
        <br />
        <asp:CompareValidator runat="server" ControlToCompare="txtpass" ControlToValidate="txtpass2"
                ErrorMessage="Passwords do not match." ForeColor="Red" Display="Dynamic" BackColor="#182137">
            </asp:CompareValidator>
        <br />
       
        
        <br />
        <asp:Button ID="btnupdate" runat="server" Text="Update" Onclick="btnupdate_Click" />
        <br />   
        <asp:Label ID="lblErrorMessage1" runat="server" Text="Failed" ForeColor="Red" ></asp:Label>
    </form>
</body>
</html>
