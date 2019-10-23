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
        <script>
        function damn() {
             $('#Bigdiv').animate({
                 right: "-=500"
             },{
            duration: 400,
            specialEasing: {
              width: "linear",
              height: "easeOutBounce"
                     }, complete: function () {
                         window.location.href = "http://localhost:57552/Registrar.aspx";
                     }
                     });
         }
         function good() {
              $('#Bigdiv').animate({
                 right: "+=500"
             },{
            duration: 400,
            specialEasing: {
              width: "linear",
              height: "easeInBounce"
                     }, complete: function () {
                     }
                     });
         }
    </script>
    <style>
        .btn{
               font-size:1.3em;
        }
    </style>
</head>
<body onload="good()" style="margin:0 !important;overflow:hidden;" class="w-100vw">
    <form id="form1" runat="server" style="margin:0 !important;" class="row">
          <div class="w-100 bg-secondary" style="height:100vh;overflow-y: scroll;">
               <!-- <Span>Todos os seus esportes em um clique, sem complicação!</Span> -->
                <div class="h-100 bg-img">
                    <img id="xxv" src="src/sys/gymblur.jpg"/>
                    <img src="src/sys/gym.jpeg"/>
                </div>
                    
            </div>
        <div id="Bigdiv" class="position-absolute w-100" style="right:-500px;">
        <div class="righth float-right z3 left-0 m-0 col-md-3 bg-dark h-100 d-block offset-8">
            <div style="height:100vh;">
                <div class="h-30 pt-3 text-left text-white">
                    <img class="h-20 d-block" src="src/macaiba2.png"/>
                    <span class="" style="font-size:4em;">
                        Bem-vindo!
                    </span>
                    <p class="" style="font-size:1em;text-rendering:optimizeLegibility;"> Entre para utilizar todas as funcionalidades. </p>
                </div>
                <div class="h-40 mt-lg-0 mt-md-5 mt-0 pt-md-2">
                    <asp:TextBox class="p-0" runat="server" ID="UsuarioTXT" placeholder="E-mail" CssClass="login-input">
                    </asp:TextBox>
                    <asp:Label runat="server" ID="UsuarioErr" CssClass="text-danger"></asp:Label>
                    <asp:TextBox class="p-0 pt-md-3" runat="server" ID="PassTXT" TextMode="Password" placeholder="Senha" CssClass="login-input">
                    </asp:TextBox>
                    <asp:Label runat="server" ID="PassErr" CssClass="text-danger d-block"></asp:Label>
                    <asp:Button runat="server" Text="Entrar" CssClass="btn bg-transparent py-1 border-light btn-light rounded-pill mt-5 col-auto text-secondary px-sm-5 mx-auto" OnClick="Unnamed1_Click"/>
                </div>
                <div class="h-20 mt-lg-n4">
                    <div class="row pr-md-3  ">
                        <div class="col pr-0 mr-md-0 mr-3"><hr class=" border-white "/></div>
                        <div class="col-md-4 text-center text-secondary pr-md-1"><h4 class="h4">OU</h4></div>
                        <div class="col pr-0 mr-md-0 mr-3"><hr class=" border-white" /></div>
                    </div>
                    <a class="h5 text-warning mt-3 d-block" onclick="damn()" style="cursor:pointer;">Clique aqui para se registrar.</a>
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
