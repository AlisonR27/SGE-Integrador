<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Entrar.aspx.cs" Inherits="WebAppSGE.Entrar" %>

<!DOCTYPE html>

<html class="m-0" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Entrar - Sistema de Gerenciamento Esportivo</title>
        <script src="Script/default.js"></script>
    <script src="Script/jquery341.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap-grid.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
    <link href="App_Themes/Base/LogReg.css" rel="stylesheet" />
</head>
<body style="margin:0 !important;overflow:hidden;" class="w-100vw">
    <form id="form1" runat="server" style="margin:0 !important;" class="row">
          <div class="w-100 bg-secondary" style="height:100vh;overflow-y: scroll;">
               <!-- <Span>Todos os seus esportes em um clique, sem complicação!</Span> -->
                <div class="h-100 bg-img">
                    <img id="xxv" src="src/sys/gymblur.jpg"/>
                    <img src="src/sys/gym.jpeg"/>
                </div>
                    
            </div>
        <div class="position-absolute w-100">
        <div class="righth float-right z3 left-0 m-0 col-md-3 bg-dark h-100 d-block offset-8">
            <div style="height:100vh;">
                <div class="h-30 pt-3 text-left text-white">
                    <img class="h-20 d-block" src="src/macaiba2.png"/>
                    <span class="" style="font-size:4em;">
                        Bem-vindo!
                    </span>
                    <p class="" style="font-size:1em;text-rendering:optimizeLegibility;"> Entre para utilizar todas as funcionalidades. </p>
                </div>
                <div class="h-40 mt-lg-0 mt-5 pt-5">
                    <asp:TextBox class="p-0" runat="server" ID="UsuarioTXT" placeholder="Usuario" CssClass="login-input">
                    </asp:TextBox>
                    <asp:Label runat="server" ID="UsuarioErr" CssClass="text-danger"></asp:Label>
                    <asp:TextBox class="p-0 pt-md-3" runat="server" ID="PassTXT" TextMode="Password" placeholder="Senha" CssClass="login-input">
                    </asp:TextBox>
                    <asp:Label runat="server" ID="PassErr" CssClass="text-danger"></asp:Label>
                    <asp:Button runat="server" Text="Entrar" CssClass="bg-transparent border-light btn-light rounded-pill mt-5 col-auto text-secondary px-sm-5 mx-auto" OnClick="Unnamed1_Click"/>
                </div>
                <div class="h-20 pt-md-5">
                    <div class="row pr-md-3 ">
                        <div class="col pr-0 mr-md-0 mr-3"><hr class=" border-white "/></div>
                        <div class="col-md-4 text-center text-secondary pr-md-1"><h4 class="h5">OU</h4></div>
                        <div class="col pr-0 mr-md-0 mr-3"><hr class=" border-white" /></div>
                    </div>
                    <a class="text-warning mt-2 d-block" href="Registrar.aspx">Clique aqui para se registrar.</a>
                </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        $('.righth').mouseenter(function () {
            $('#xxv').animate({
                opacity: 1
              }, 200, function() {
                // Animation complete.
              });
        });
        $('.righth').mouseleave(function () {
            $('#xxv').animate({
                opacity: 0
              }, 200, function() {
                // Animation complete.
              });
        });
    </script>
</body>
</html>
