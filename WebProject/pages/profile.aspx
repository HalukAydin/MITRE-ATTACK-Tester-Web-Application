<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="WebProject.pages.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    
    <form id="form1" runat="server">
    
    <div class="header">Vulnerability Scanning</div>
    <div id="btngroup">
        <asp:HyperLink ID="setlink" runat="server" NavigateUrl="~/pages/settings.aspx">Settings</asp:HyperLink>
        <asp:Button ID="btnlogout" runat="server" Text="Logout" OnClick="btnlogout_Click"></asp:Button>
        
    </div>
    <asp:HyperLink ID="homelink" runat="server" NavigateUrl="~/pages/home.aspx">Home</asp:HyperLink>
       <div class="container" style="width:15em; float:right;">                         
           <asp:Label ID="lbluser" runat="server" Text="" ></asp:Label>
           
           <asp:Label ID="lblusers" runat="server" Text="" ></asp:Label>
           <br />
           


           <asp:Label ID="lblmail" runat="server" Text="" ></asp:Label>
           

           <br />
           
       </div>
    <br />
    <br />
    <br />
    <asp:DataList ID="testdata" runat="server" DataSourceID="SqlTestData" BackColor="#182137" ForeColor="White">
        <ItemTemplate>
            
            <asp:Label  ID="test_idLabel" runat="server" Text='<%# Eval("test_id") %>'></asp:Label>
            <br />
            
            <asp:Label ID="test_descLabel" runat="server" Text='<%# Eval("test_desc") %>'></asp:Label>
            <br />
            <br />
        </ItemTemplate>
        </asp:DataList>
        <div id="btngroup1">
            <asp:Button Visible="false" ID="btnread1" runat="server" Text="Result" OnClick="btnread1_Click" />
            <br />
        <asp:Button Visible="false"  ID="btnread2" runat="server" Text="Result" OnClick="btnread2_Click" />
        </div>

        
    
    
        <asp:SqlDataSource ID="SqlTestData" runat="server" ConnectionString="<%$ ConnectionStrings:mitreConnectionString %>" SelectCommand="SELECT DISTINCT [test_id], [test_desc] FROM [USED_TESTS] WHERE ([user_id] = @user_id) ORDER BY [test_desc]">
            <SelectParameters>
                <asp:SessionParameter Name="user_id" SessionField="userID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
        
    
    
</body>
</html>
