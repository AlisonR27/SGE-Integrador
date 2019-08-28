<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppSGE.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Script/default.js"></script>
    <script src="Script/jquery341.js"></script>
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="bg"></div>
        <div class="loginMegaBox">
            <div class="logo"></div>
            <div class="loginForm">
                <asp:Login ID="Login1" runat="server" OnLoggingIn="Login1_LoggingIn" ></asp:Login>
            </div>
        </div>
        
    </form>
</body>
</html>
