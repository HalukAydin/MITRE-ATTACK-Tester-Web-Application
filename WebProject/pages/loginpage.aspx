<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" Inherits="WebProject.pages.loginpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body style="text-align:center">
    <div class="header">Vulnerability Scanning</div>
    
    
    <form id="formlogin" runat="server">
        <br />
        Email
        <br />
        <asp:TextBox ID="txtmail" runat="server"></asp:TextBox>
        <br />
        Password<br />
        <asp:TextBox ID="txtpass" runat="server" TextMode="Password" >
        </asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnloginpage" runat="server" Text="Login" OnClick="btnloginpage_Click" />
        <br />
        <br />
        
        <asp:HyperLink ID="btnsign"  runat="server" NavigateUrl="~/pages/signuppage.aspx"  >Sign up</asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:Label ID="lblErrorMessage1" runat="server" Text="Incorrect User Credentials" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
