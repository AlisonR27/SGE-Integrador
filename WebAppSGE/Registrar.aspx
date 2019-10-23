<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="WebAppSGE.Registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <script src="Scripts/jcrop/js/jquery.min.js"></script>
    <link href="Scripts/jcrop/css/jquery.Jcrop.css" rel="stylesheet" />
    <script type="text/javascript" src="Scripts/jcrop/js/jquery.Jcrop.js"></script>
    <link href="App_Themes/Base/LogReg.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="Script/default.js"></script>
    <script type="text/javascript" src="Script/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap-grid.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
    <script>
        $(function () {
            $("#cropimage1").Jcrop({
                aspectRatio: 100/100,
                onSelect: croparea

            });
        });
        function croparea(c) {
            $("#coordinate_x").val(c.x);
            $("#coordinate_y").val(c.y);
            $("#coordinate_w").val(c.w);
            $("#coordinate_h").val(c.h);
        }

        function damn() {
             console.log('go!');
             $('#Bigdiv').animate({
                 left: "-=500"
             },{
            duration: 400,
            specialEasing: {
              width: "linear",
              height: "easeOutBounce"
                     }, complete: function () {
                         window.location.href = "http://localhost:57552/Entrar.aspx";
                     }
                     });
         }
         function good() {
              $('#Bigdiv').animate({
                 left: "+=500"
             },{
            duration: 400,
            specialEasing: {
              width: "linear",
              height: "easeInBounce"
                     }, complete: function () {
                     }
                     });
        }
        function ExitOverlay() {
            $("#overlayCard").css("display","none");
            console.log('hidden');
            return false;
        }
        function ShowOverlay() {
            $("#<%=getcropID()%>").attr('src', '<%=getFile()%>');
            $("#overlayCard").css("display","block");
            console.log('Visible');
            return false;
        }
    </script>
    <title></title>
    <style>
        .invert{
            filter:invert();
        }
        .h1{
            font-size:3.5em;
        }
        
        input{
            padding: 0.3em 0.5em !important;
            font-size:1.4em !important;
        }
        .dImg{
           /* max-width: 90%;
          //  max-height:40%;*/
           width:80%;
        }
        .forcecut{
            width: 18vw;
            height: 14vw;
            overflow:scroll;
        }
        .sz{
            height:2em;
            display:inline-block;
            margin-top:0.75em;
        }
        #goEntrar:hover img{
            -webkit-filter: invert(60%) sepia(100%) hue-rotate(140deg) saturate(600%);
            filter: invert(60%) sepia(100%) hue-rotate(140deg) saturate(600%);
        }
        #goEntrar:hover p{
            color: lightskyblue;
        }
        .w-85{
            width:85% !important;
        }
    </style>
</head>
<body onload="good()" style="margin:0 !important;overflow:hidden;" class="w-100vw">
     <script type="text/javascript">
        function fileinfo() {
            document.getElementById('<%=TXTFile.ClientID%>').innerText = document.getElementById('<%=Fu1.ClientID%>').value;
            var xxv = document.getElementById('<%=Fu1.ClientID%>').value;
            console.log('hmmm  ' + xxv)
            $('<%=cropimage1.ClientID%>').attr('src', xxv);
            $('#aviso').fadeToggle();
         }
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
         $('#goEntrar').click(function () {
             console.log('go!');
             $('#leftBlock').animate({
                 left: "-=100"
             }, 300, function () {
             window.location.href = window.location.hostname + "/Entrar.aspx" ;
             });
         });

    </script>
    <form id="form1" runat="server" style="margin:0 !important;" class="row text-light">
        <asp:ScriptManager runat="server" ></asp:ScriptManager>
        <div id="overlayCard" class="w-100 h-100 position-absolute bg-overlay z-4 py-5" style="display:none;">
            <a id="exitCard" onclick="ExitOverlay()" class=" btn btn-danger position-absolute z-4 col-1 offset-10" style="font-family: 'Agency FB' !important; cursor: pointer">X</a>
            <div class="card h-100 col-8 offset-2 d-block align-self-start mx-auto">
                <div class="w-85 h-90 d-block mt-2 mx-auto overflow-auto">
                            <img runat="server" src="" ID="cropimage1"/>
                            <input type="hidden" id="coordinate_x" runat="server"/>
                            <input type="hidden" id="coordinate_y" runat="server"/>
                            <input type="hidden" id="coordinate_w" runat="server"/>
                            <input type="hidden" id="coordinate_h" runat="server"/>
                </div>
                <asp:Button  ID="Button12" class="btn btn-success  px-3 py-2 " OnClick="submitcrop_Click"  runat="server"  Text="Cadastrar usuário" />
                <p>test</p>
            </div>
        </div>
          <div class="w-100 bg-secondary" style="height:100vh;overflow-y: scroll;">
                <div class="w-100 bg-img">
                    <img id="xxv" src="src/sys/gymblur.jpg"/>
                    <img src="src/sys/gym.jpeg"/>
                </div>
            </div>
        <div id="Bigdiv" class="position-absolute w-100" style="left:-500px">
        <div id="leftBlock" class="z3 left-0 m-0 col-md-4 col-lg-3 bg-dark h-100 d-block">
            <div style="height:100vh;">
                <div class="h-25">
                    <a onclick="damn()" id="goEntrar" style="cursor:pointer;" ><img src="src/imgs/login.png" alt="Voltar a página de login" title="Entrar" class="sz invert d-inline"/><p class="d-inline ml-1" style="vertical-align: -webkit-baseline-middle;">Entrar</p></a><H1 class="display-3 mt-2">CADASTRO</H1>
                </div>
                <div  class="h-75 ml-2">
                        <h5 class="h5">Imagem de perfil</h5>

                    <div class="row w-100 px-2 mb-4">
                        <asp:FileUpload runat="server" ID="Fu1" onchange="fileinfo()" CssClass="d-none"/>
                        <asp:LinkButton CssClass="col-md-4 btn btn-primary" ID="FUButton" runat="server">Fazer upload</asp:LinkButton>
                        <asp:Label runat="server" style="overflow: hidden;max-height: 3em;" CssClass="col-md-8 d-inline-block align-self-center" ID="TXTFile"></asp:Label>
                    </div>
                    <span class="text-primary mt-n3" id="aviso" style="display:none;">Não se preocupe, você poderá cortar a imagem em breve.</span>
                    <asp:Label runat="server" ID="ImgErr" CssClass=" text-danger w-100"></asp:Label>
                    <asp:TextBox ToolTip="Nome" placeholder="Nome" CssClass="w-85 login-input" ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Label runat="server" ID="NomeErr" CssClass=" text-danger w-100"></asp:Label>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1" ></asp:RequiredFieldValidator>
                    <asp:TextBox ToolTip="E-mail" placeholder="E-mail" CssClass="w-85 mt-2 login-input" ID="TXTEmail"  TextMode="Email" runat="server"></asp:TextBox>
                    <asp:Label runat="server" ID="EmailErr" CssClass=" text-danger w-100"></asp:Label>
                    <input type="tel" placeholder="Telefone" title="Telefone" class="w-85 mt-2 login-input" id="TXTPhone" runat="server" name="phone" pattern="[0-9]{2}[0-9]{5}[0-9]{4}" required>                    
                    <asp:TextBox ToolTip="Senha" placeholder="Senha" CssClass="w-85 mt-2 login-input" runat="server" TextMode="Password" ID="Pass"></asp:TextBox>
                    <asp:Label runat="server" ID="PassErr" CssClass=" text-danger w-100"></asp:Label>
                    <asp:TextBox  ToolTip="Repetir a senha" placeholder="Repetir senha" CssClass="w-85 mt-2 login-input" runat="server" TextMode="Password" ID="CnfrmPass"></asp:TextBox>
                    <asp:Label runat="server" ID="ConfirmPassErr" CssClass=" text-danger d-block w-100"></asp:Label>
                    <img src="" class="mw-100" id="cropimg" runat="server" visible="false" />
                    <button class="btn btn-primary mt-2" onclick="ShowOverlay();return false;">Prosseguir</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
