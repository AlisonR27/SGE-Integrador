<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppSGE.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Script/default.js"></script>
    <script src="Script/jquery341.js"></script>
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
    <style>
        body{
            background-image: linear-gradient(to bottom right, #2b0049, #202020);
            background-size: cover;
            width:100vw;
            height:95vh;
        }
        .loginMegaBox{
            width: 60vw;
            height: 80vh;
            margin:auto;
            background:linear-gradient(to bottom right, #d9d9d9, #342734);
            border: 0.75px solid #757575;
            border-radius:50px;
            margin-top: 5vh;
        }
        .loginbox{
            height:40%;
            margin-top:20% !important;
            width: 60%;
            margin:auto;
        }
        .localflexrow{
            width:100%;
            display:block;
        }
        .localflexrow *{
            display:inline-block;
        }
        .localflexrow label{
            width:35%;
            text-align:right;   
        }
        .localflexrow input{
            width:55%;
        }
        .localflexrow span{
            position: absolute;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="bg"></div>
        <div class="loginMegaBox">
            <div class="logo"></div>
            <div class="loginForm">
                <div class="loginbox">
                        <h3>Fazer Logon</h3>
                        <div class="center100 centerChild">
                            <div class="localflexrow">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nome do Usuário:</asp:Label>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserNAme" Text="O campo é obrigatório"></asp:RequiredFieldValidator>       

                            </div>
                            <br />         
                            <div class="localflexrow">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Senha:</asp:Label>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" Text="O campo é obrigatório"></asp:RequiredFieldValidator>       
                            </div>
                            <br />          
                            <asp:CheckBox ID="RememberMe" runat="server" Text="Lembrar na próxima vez." />                             
                            <br />
                            <br />
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Fazer Logon" ValidationGroup="Login1" />
                        </div>   
                    </div>
            </div>
        </div>
        
    </form>
</body>
</html>
