<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MngArea.aspx.cs" Inherits="WebAppSGE.MngArea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Script/default.js"></script>
    <script src="Script/jquery341.js"></script>
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap-grid.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap.min.css" />


</head>
<body style="width:100vw;height:100vh;background:linear-gradient(45deg,#999,#d0d0d0);background-size:cover;background-repeat:no-repeat;">
    <nav class="navbar">
        <div class="navbar-brand"></div>
    </nav>
    <form id="form1" runat="server">
        <div class="container-fuid mr-4">
        <div>
            <h2  >Gerenciamento de áreas poliesportivas </h2>       
            <h6 class="inputTitle">Dados da Área</h6>
            <div class="row ml-1">                
                <div class="col-sm-6">
                    <h6 class="inputTitle  ">Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="pillborder" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName" runat="server"></asp:RequiredFieldValidator> 
                    <h6 class="inputTitle">Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" TextMode="MultiLine" CssClass="pillborder" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
                </div>
                <div class="col-sm-6">
                    <div>
                        <h6 class="inputTitle">Imagens </h6>            
                        <asp:FileUpload ID="FileUpload1" runat="server" /> 
                    </div>
                    <div class="mt-2">
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:Image ID="Image1" CssClass="col-12 pillborder" runat="server"/>
                            <asp:Button ID="btnSave" runat="server" CssClass="btn-outline-dark pillborder" Text="Fazer Upload" OnClick = "Save" />
                        </asp:Panel>
                    </div>
                </div>
            </div>            
            <h6 class="inputTitle mt-1">Lista de Esportes: </h6>
            <div class="row ml-1">
                <div class="col-sm-6">
                    <div class="selectedSports">
                        <h5 class="TAlignCenter">Esportes selecionados</h5>
                        <asp:BulletedList runat="server" id="selectedSportsL" class="selectedSportsList">
                        </asp:BulletedList>
                    </div>
                </div>
                    <div class="col-sm-6">
                        <div>
                        <asp:DropDownList ID="SportsList" runat="server" DataSourceID="SportsOBJDS" DataTextField="nome" CssClass="pillborder" DataValueField="id"></asp:DropDownList>
                        <asp:ObjectDataSource ID="SportsOBJDS" runat="server" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport"></asp:ObjectDataSource>
                        </div>
                        <div class="mt-4">
                    <asp:Button ID="Button1" CssClass="btn-primary" runat="server" Text="Adicionar" onclick="Button1_Click"/>
                            
                        </div>
                    </div>
                </div>
            </div>
             
            <h6 class="inputTitle">Lista de dias: </h6>
            <div class="row">
                <div class="slideDcontainer col-md-auto">
                    <div class="slideDTitle">   
                        <h5>Domingo</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTDomInit"></asp:TextBox>
                         
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTDomEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDcontainer col-md-auto">
                    <div class="slideDTitle">   
                        <h5>Segunda</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTSegInit"></asp:TextBox>
                         
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTSegEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDcontainer col-md-auto">
                    <div class="slideDTitle">   
                        <h5>Terça</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTTerInit"></asp:TextBox>
                         
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTTerEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDcontainer col-md-auto">
                    <div class="slideDTitle">   
                        <h5>Quarta</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTQuaInit"></asp:TextBox>
                         
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTQuaEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDcontainer col-md-auto">
                    <div class="slideDTitle">   
                        <h5>Quinta</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTQuiInit"></asp:TextBox>
                         
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTQuiEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDcontainer col-md-auto">
                    <div class="slideDTitle">   
                        <h5>Sexta</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTSexInit"></asp:TextBox>
                         
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTSexEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDcontainer col-md-auto">
                    <div class="slideDTitle">   
                        <h5>Sábado</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay" checked="checked"/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTSabInit"></asp:TextBox>
                         
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTSabEnd"></asp:TextBox>
                    </div>
                </div>
            </div>     
        <asp:Button CssClass="btn-success rounded-pill" runat="server" OnClick="Submit" id="FormSubmit" Text="Submeter dias"/>
        </div>
    </form>
   <script>
         //PageLoad

        //Ativar/Desativar Caixas de texto
        $('input[class="checkDay"]').click(function () {
            if ($(this).prop("checked") == true) { $(this).parents().children('input[type="text"]').prop("disabled", false); }
            else { $(this).parents().children('input[type="text"]').prop("disabled", true); }
        });
        //SlideDown Dias
        $('div[class="slideDTitle"]').click(function () {
            if ($(this).parents().children('div[class="slideDOcult"]').css("display") == "none") $(this).parents().children('div[class="slideDOcult"]').slideDown();
            else { $(this).parents().children('div[class="slideDOcult"]').slideUp();  }
        });
    </script>
</body>
</html>
