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
    <link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">

    <style>
        @media (min-width:600px){
            ::-webkit-scrollbar {
                width:10px;
                box-shadow: rgba(0,0,0,0.15) -2px 0px 10px;
            }
            ::-webkit-scrollbar-track {
                  background: #f1f1f1;
             }
            ::-webkit-scrollbar-thumb {
                background: linear-gradient(0deg,#f98003,#f96503);
                border-left:1px solid #f1f1f1;
                border-right:1px solid #f1f1f1;
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
    </style>
</head>
<body style="margin:0 !important;overflow:hidden;" class="w-100vw">
    <form id="form1" runat="server" style="margin:0 !important;" class="row w-100vw">
        <div class="left-0 m-0 col-sm-12 col-md-7 col-lg-8 p-0 h-100 d-block position-sticky" >
            <div class="w-100 bg-secondary" style="height:100vh;overflow-y: scroll;">
               <!-- <Span>Todos os seus esportes em um clique, sem complicação!</Span> -->
                <div class="hovering h-50">
                    <img class="sec-img persp-img-1" id="" src="src/soccer.jpg" style="z-index:4;"/>
                    <img class="sec-img persp-img-2" src="src/futsal.jpg" style="margin-top:-50%;"/>
                    <img class="sec-img persp-img-3" src="src/volley.jpg" style="margin-top:-50%;"/>
                </div>   
                <div class="p-3" style="height:1000px;">
                                    <span>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vehicula efficitur diam ut faucibus. Duis molestie odio risus, eget cursus lectus vehicula in. Vivamus sagittis ipsum sit amet gravida posuere. Sed fermentum ac lectus quis pellentesque. Morbi ultrices ornare nibh sed molestie. Cras tortor mi, interdum sit amet semper ac, blandit ut est. Nullam tempor eleifend dapibus. Proin vel odio in erat bibendum auctor ac in metus.

Sed non tortor turpis. Duis blandit felis et orci mattis congue. Nam in tristique enim, nec ultrices lacus. Pellentesque eget sem vitae lacus tempor porta ac quis orci. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec dignissim, lorem efficitur efficitur dapibus, velit turpis condimentum nibh, at vehicula justo erat et sem. Pellentesque placerat sollicitudin velit, id egestas velit ultricies a. Maecenas vitae ultrices sem. Morbi urna ipsum, aliquet eu sapien et, dapibus rutrum mauris. Sed cursus tellus sit amet augue lacinia dignissim.

Nullam fringilla, velit non bibendum fringilla, est ante varius velit, nec varius sapien erat ut tellus. Duis et placerat mauris, quis ultrices arcu. Ut consequat sem velit, id volutpat risus iaculis nec. Quisque ultrices nulla in urna aliquet, vel gravida ligula rutrum. Nullam placerat consequat interdum. Fusce consequat eros eros, molestie convallis justo aliquet in. Duis finibus pretium felis, et dictum purus. Donec volutpat placerat ex eu lacinia.

Nam varius consequat arcu, id faucibus ligula. Quisque elementum cursus dui. Nulla rutrum dolor quis lacus mattis, a sagittis libero finibus. Nullam a orci finibus nunc pellentesque maximus quis ut enim. Cras dictum egestas justo, ac fringilla sem convallis sit amet. Vestibulum tincidunt risus in nisl tincidunt gravida. Nulla in sagittis eros. Suspendisse maximus orci ac dapibus commodo. Praesent a accumsan dui, ac porta arcu. Quisque in tempus arcu. Proin vitae commodo augue, vel vestibulum erat. Ut a mi non odio sodales venenatis.

Mauris varius maximus arcu nec sollicitudin. Vestibulum mauris neque, aliquam sit amet rutrum semper, varius quis est. Maecenas non maximus nisl, nec gravida ipsum. Integer et maximus massa. Nunc id metus felis. Etiam vitae neque sit amet urna vehicula placerat. Nulla fermentum, libero eu hendrerit efficitur, enim turpis pulvinar ligula, vel commodo enim ligula a neque. Ut lacinia sem ac lacus congue auctor. Quisque dictum, risus ut ullamcorper congue, enim turpis consequat libero, eu rutrum magna massa ut neque. Pellentesque dignissim imperdiet nisl vitae venenatis. Aenean mauris lorem, pretium nec bibendum id, sollicitudin ut sem. Nunc eleifend pretium mauris at venenatis. Cras in gravida ex. Etiam mollis sit amet neque id malesuada. Praesent bibendum semper placerat.
                    </span>
                </div>
                    
            </div>
        </div>
        <div class="left-0 m-0 col-sm-12 pl-sm-1 col-md-5 pr-md-0 pl-md-4 col-lg-4 pl-lg-4 bg-dark h-100 position-sticky d-block">
            <div style="height:100vh;">
                <div class="h-30 pt-3 text-left text-white">
                    <img class="h-20 d-block" src="https://angular.io/assets/images/logos/angular/angular_whiteTransparent.png"/>
                    <span class="" style="font-size:4em; font-family: 'Big Shoulders Display', cursive;">
                        Bem-vindo!
                    </span>
                    <br />
                    <span style="font-size:1em;text-rendering:optimizeLegibility;font-family:'Big Shoulders Display', cursive;"> Entre para utilizar todas as funcionalidades. </span>
                </div>
                <div class="h-50 pt-md-2">
                    <asp:TextBox class="spa" runat="server" ID="UsuarioTXT" placeholder="Usuario" CssClass="login-input">
                    </asp:TextBox>
                    <asp:TextBox class="spa pt-md-3" runat="server" ID="PassTXT" placeholder="Senha" CssClass="login-input">
                    </asp:TextBox>
                    <asp:Button runat="server" Text="Entrar" CssClass="bg-transparent border-light btn-light rounded-pill mt-md-5 text-secondary px-md-5 py-md-1"/>
                </div>
                <div class="h-20">
                    <div class="row pr-md-3">
                        <div class="col-md-4 pr-0"><hr class=" border-white "/></div>
                        <div class="col-md-4 text-center text-secondary"><h4>OU</h4></div>
                        <div class="col-md-4 pl-0"><hr class=" border-white" /></div>
                    </div>
                    <a class="text-warning" href="Registration.aspx">Clique aqui para se registrar.</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
