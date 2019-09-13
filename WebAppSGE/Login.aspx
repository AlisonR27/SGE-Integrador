<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppSGE.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Script/default.js"></script>
    <script src="Script/jquery341.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap-grid.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
    <style>
        label[for="RememberMe"]{
            margin-left:8px;
        }
        div[name="VAlign"]{
            margin-top:25vh !important;
            margin-bottom:25vh !important;
        }
        div[name="mainBox"]{
            background-color: #d8d8d8;
        }
        html{
            background:linear-gradient(45deg,#9946d9,#bb3abd);
            width:100vw;
            height:100vh;
            z-index:-2;
            background-size:cover;
            background-repeat:no-repeat;
        }
        body{
            background:none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <div name="VAlign" class="row bg-transparent">
                <div class="col-3 bg-transparent"></div>
                <div name="mainBox" class="col-6 align-content-center py-5 rounded-">
                        <h3 class="align-content-center TAlignCenter">Fazer Logon</h3>
                            <div name="UserRow" class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6">
                                            <asp:Label ID="UserNameLabel" CssClass="align-content-lg-center  " runat="server" AssociatedControlID="UserName">Nome do Usuário:</asp:Label>
                                        </div>
                                        <div class="col-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6"> 
                                            <asp:TextBox ID="UserName" CssClass="w-100" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-3"></div>                                    
                                    </div>
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6"> 
                                           <asp:RequiredFieldValidator runat="server" ControlToValidate="UserNAme" Text="O campo é obrigatório"></asp:RequiredFieldValidator>       
                                        </div>
                                        <div class="col-3"></div>                                    
                                    </div>
                                </div>  
                           </div>      
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6">
                                            <asp:Label ID="PasswordLabel" CssClass="Width40" runat="server" AssociatedControlID="Password">Senha:</asp:Label>
                                        </div>
                                        <div class="col-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6">
                                            <asp:TextBox ID="Password" CssClass="w-100" runat="server" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="col-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6">
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" Text="O campo é obrigatório"></asp:RequiredFieldValidator>       
                                        </div>
                                        <div class="col-3"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6">
                                    <asp:CheckBox ID="RememberMe" CssClass="" runat="server" Text="Lembrar na próxima vez." />                                 </asp:CheckBox>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6 align-content-lg-center">
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8">
                                             <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Fazer Logon" CssClass="btn-success w-100 border-0 rounded-pill m-auto" ValidationGroup="Login1" />
                                        </div>
                                        <div class="col-2"></div>
                                    </div>
                                </div>
                                <div class="col-3"></div>
                            </div>
                        </div>  
                <div class="col-3 bg-transparent"></div>                
            </div>
    </form>
</body>
</html>
