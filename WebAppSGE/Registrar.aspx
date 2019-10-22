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

    <title></title>
    <style>
        .h1{
            font-size:3.5em;
        }
        . input::-webkit-input-placeholder{
            font-family: 'Big Shoulders Display', cursive !important;
            font-size:1.2em !important;
        }
        . input{
            padding: 0.3em 0.5em !important;
            font-size:1.4em !important;
        }
        .dImg{
           /* max-width: 90%;
          //  max-height:40%;*/
           width:80%;
        }
        .forcecut{
            width: 200px;
            height:200px;
            overflow:scroll;
        }
    </style>
    
</head>
<body style="margin:0 !important;overflow:hidden;" class="w-100vw">
     <script type="text/javascript">
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
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=cropimage1.ClientID%>').prop('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
                console.log('atualizado');
                }
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
    </script>
    <form id="form1" runat="server" style="margin:0 !important;" class="row text-light">
        <asp:ScriptManager runat="server" ></asp:ScriptManager>
          <div class="w-100 bg-secondary" style="height:100vh;overflow-y: scroll;">
                <div class="w-100 bg-img">
                    <img id="xxv" src="src/sys/gymblur.jpg"/>
                    <img src="src/sys/gym.jpeg"/>
                </div>
            </div>
        <div class="position-absolute w-100 ">
        <div class=" z3 left-0 m-0 col-md-3 bg-dark h-100 d-block">
            <div style="height:100vh;">
                <div class="h-10">
                    <H1 class="h1">CADASTRO</H1>
                </div>
                <div  class="h-75 ml-2 pt-md-2">
                    <div class="mb-4 text-light">
                        <h5 class="h5">Imagem de perfil atual:</h5>
                        <div class="forcecut">
                            <img class="dImg" src="" id="cropimage1" runat="server"/>
                            <input type="hidden" id="coordinate_x" runat="server"/>
                            <input type="hidden" id="coordinate_y" runat="server"/>
                            <input type="hidden" id="coordinate_w" runat="server"/>
                            <input type="hidden" id="coordinate_h" runat="server"/>
                        </div>

                        <asp:FileUpload ViewStateMode="Disabled" EnableViewState="false" runat="server" onchange="ImagePreview(this);" ID="FU1"/>
                        <asp:Label runat="server" ID="ImgErr" CssClass=" text-danger w-100"></asp:Label>
                    </div>
                    <asp:TextBox ToolTip="Nome" placeholder="Nome" CssClass="w-75 login-input" ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Label runat="server" ID="NomeErr" CssClass=" text-danger w-100"></asp:Label>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1" ></asp:RequiredFieldValidator>
                    <asp:TextBox ToolTip="E-mail" placeholder="E-mail" CssClass="w-75 mt-4 login-input" ID="TXTEmail"  TextMode="Email" runat="server"></asp:TextBox>
                    <asp:Label runat="server" ID="EmailErr" CssClass=" text-danger w-100"></asp:Label>
                    <input type="tel" placeholder="Telefone" title="Telefone" class="w-75 mt-4 login-input" id="TXTPhone" runat="server" name="phone" pattern="[0-9]{2}[0-9]{5}[0-9]{4}" required>                    
                    <asp:TextBox ToolTip="Senha" placeholder="Senha" CssClass="w-75 mt-3 login-input" runat="server" TextMode="Password" ID="Pass"></asp:TextBox>
                    <asp:Label runat="server" ID="PassErr" CssClass=" text-danger w-100"></asp:Label>
                    <asp:TextBox  ToolTip="Repetir a senha" placeholder="Repita a senha" CssClass="w-75 mt-4 login-input" runat="server" TextMode="Password" ID="CnfrmPass"></asp:TextBox>
                    <asp:Label runat="server" ID="ConfirmPassErr" CssClass=" text-danger d-block w-100"></asp:Label>
                        <img src="" class="mw-100" id="cropimg" runat="server" visible="false" />

                    <asp:Button  ID="Button12" class="btn-success px-3 py-2 rounded-pill w-75 border-0 mt-5" OnClick="submitcrop_Click"  runat="server"  Text="Cadastrar usuário" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
