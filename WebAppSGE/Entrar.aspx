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
    <link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet"/>

    <style>
        @media (min-width:600px){
            ::-webkit-scrollbar {
                width:5px;
                box-shadow: rgba(0,0,0,0.15) -2px 0px 10px;
            }
            ::-webkit-scrollbar-track {
                  background: #f1f1f1;
             }
            ::-webkit-scrollbar-thumb {
                background: linear-gradient(0deg,#f98003,#f96503);
            }
        }

        .login-input{
            background: url('user.svg');
            background-repeat:no-repeat;
            background-size:contain;
            background-position-x:right;            
            }
        #PassTXT{
            background: url('key.svg');
            background-repeat:no-repeat;
            background-size:contain;
            background-position-x:right;   
            margin-top:2em;
            }
        .sec-img{
            width:80%;
            box-shadow: rgba(0,0,0,0.35) 5px 10px 20px;
            display:block;
            lighting-color:white;
            scrollbar-3dlight-color:white;
            margin-bottom:0;
            transform-style:preserve-3d;

        }
        .hovering{
            width:42.5%;
            padding:5px;
            height:25%;
        }
        @media (min-width: 576px) {
        }
        @media (min-width: 768px) {
            .hovering{
                margin: 2em 2em 2em 2.5em;
            }
        }
        @media (min-width: 992px) {
        }
        @media (min-width: 1200px) {
        }

        .hovering:hover .persp-img-1{
            transform:translate3d(70px,25px,20px);  
            transition: transform 1s;
            transition-timing-function: ease-in-out;   
        }
        .hovering:hover .persp-img-2{
            transform:translate3d(40px,5px,25px);
            transition: transform 1s;
            transition-timing-function: ease-in-out;   
        }
        .hovering:hover .persp-img-3{
            transform:translate3d(10px,-15px,20px);  
            transition: transform 1s;
            transition-timing-function: ease-in-out;   
        }
        .persp-img-3{
            transform:translate3d(-5px,-10px,10px);
            transition: transform 1s;
            transform: rotateX(0deg);
        }
        .persp-img-1{
            transform:translate3d(45px,30px,0);
            transition: transform 1s;
            transform: rotateX(0deg);

        }
        .persp-img-2{
            transform:translate3d(20px,10px,5px);
            transition: transform 1s;
            transform: rotateX(0deg);

        }
        .text-secondary{
            color: #d8d8d8 !important;
        }
        .border-light{
            border: 2px solid #d8d8d8 !important;
        }
        .bg-transparent{
            transition: background 0.5s;
            transition-timing-function:ease-out;
        }
        .btn-light:hover{
            background-color: rgba(210,210,210,0.2) !important;
            transition:0.5s;
            transition-timing-function:ease-out;
        }
        input:focus{
            outline:none;
        }
        .login-input:focus {
             border:0;
        }
        .login-input:focus {
            border-bottom: solid #dddddd;
            transition: 1s;
        }
        .login-input:focus #xxv{
            filter:blur(10px);
        }
        .bg-img img{
            width:100%;
            height:100%;
            position:absolute;
            filter:blur(1px);
        }
        .z3{
            z-index:3;
        }
        #xxv{
            z-index:3;
        }
    </style>
</head>
<body style="margin:0 !important;overflow:hidden;" class="w-100vw">
    <form id="form1" runat="server" style="margin:0 !important;" class="row">
          <div class="w-100 bg-secondary" style="height:100vh;overflow-y: scroll;">
               <!-- <Span>Todos os seus esportes em um clique, sem complicação!</Span> -->
                <div class="w-100 bg-img">
                    <img id="xxv" src="src/sys/gymblur.jpg"/>
                    <img src="src/sys/gym.jpeg"/>
                </div>
                    
            </div>
        <div class="position-absolute w-100 ">
        <div class="righth float-right z3 left-0 m-0 col-md-3 bg-dark h-100 d-block offset-8">
            <div style="height:100vh;">
                <div class="h-30 pt-3 text-left text-white">
                    <img class="h-20 d-block" src="src/macaiba2.png"/>
                    <span class="w-100" style="font-size:4em; font-family: 'Big Shoulders Display', cursive;">
                        Bem-vindo!
                    </span>
                    <br />
                    <span style="font-size:1em;text-rendering:optimizeLegibility;font-family:'Big Shoulders Display', cursive;"> Entre para utilizar todas as funcionalidades. </span>
                </div>
                <div class="h-40 pt-md-2 mt-lg-0 mt-sm-5">
                    <asp:TextBox class="p-0" runat="server" ID="UsuarioTXT" placeholder="Usuario" CssClass="login-input">
                    </asp:TextBox>
                    <asp:TextBox class="p-0 pt-md-3" runat="server" ID="PassTXT" TextMode="Password" placeholder="Senha" CssClass="login-input">
                    </asp:TextBox>
                    <asp:Button runat="server" Text="Entrar" CssClass="bg-transparent border-light btn-light rounded-pill mt-5 text-secondary px-md-5 py-md-1 col-md-12 col-sm-3 col-5" OnClick="Unnamed1_Click"/>
                </div>
                <div class="h-20">
                    <div class="row pr-md-3">
                        <div class="col pr-md-0"><hr class=" border-white "/></div>
                        <div class="col-md-4 text-center text-secondary"><h4 class="h5">OU</h4></div>
                        <div class="col pl-md-0"><hr class=" border-white" /></div>
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
