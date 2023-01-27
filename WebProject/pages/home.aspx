<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebProject.pages.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <form runat="server">
        <div class="header">Vulnerability Scanning</div>
    
    <asp:HyperLink ID="acclink" runat="server" NavigateUrl="~/pages/profile.aspx">Account</asp:HyperLink>
    
    <div class="container" style="margin-top:1em; margin-bottom:1em;">
        <h3 id="prjdesc" style="color:white; text-align:center;">Discover Your Device's Vulnerabilities Before Attackers.</h3>
    <p style="text-align:center;color:white; ">Discover the vulnerabilities on your device with the vulnerability scan of your choice and take your precautions before it gets damaged.</p>
    </div>
    
    <br />
    <br />
    <br />
    <br />
  

    <table id="atttable">
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Description</th>
                    <th></th> 
                </tr>
            </thead>
                <tbody> 
            <tr>
                <td>T1555</td>
                <td>Credentials from Password Stores</td>
                <td><asp:Button ID="btndownload" runat="server" Text="Download" OnClick="btndownload1_Click" /></td>
                <td><asp:Button ID="btnrun" runat="server" Text="Run" OnClick="btnrun1_Click" /></td>

                
            </tr>
            <tr>
                <td>T1124</td>
                <td>System Time Discovery</td>
                <td><asp:Button ID="btndownload1" runat="server" Text="Download" OnClick="btndownload2_Click" /></td>                
                <td><asp:Button ID="btnrun1" runat="server" Text="Run" OnClick="btnrun2_Click" /></td>                
            </tr>
            </tbody>
           
    </table>
        
        <div id="divdesc">
            <p> 1.Download the Test.
                <br />
                <br />
                2.Copy contents of zip folder to desktop(Exe's path must be "Desktop\T1555\T1555.exe").
                <br />
                <br />
                3.Click Run button next to the test which you downloaded.
                <br />
                <br />
                4.Results will be shown in text file also in your profile.
                <br />
                
            </p>
        </div>
        <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red" BackColor="#182137"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <div id="testdesc1">
            <p> 
                T1555 Credentials from Password Stores:
                Adversaries may search for common password storage locations to obtain user credentials. Passwords are stored in several places on a system, depending on the operating system or application holding the credentials.Once credentials are obtained, they can be used to perform lateral movement and access restricted information.
            </p>
        </div>
        <div id="testdesc2">
            <p> 
                T1124 System Time Discovery:
                An adversary may gather the system time and/or time zone from a local or remote system. The system time is set and stored by the Windows Time Service within a domain to maintain time synchronization between systems and services in an enterprise network.
            </p>
        </div>
    </form>
</body>
</html>
