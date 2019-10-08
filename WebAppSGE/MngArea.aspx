<%@ Page  Language="C#" Title="Gerenciar Áreas Esportivas" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="MngArea.aspx.cs" Inherits="WebAppSGE.MngArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        ul{
            list-style:none;
        }
        li{ margin: 2px 3px;
            display:flex;
            padding:2px;    
            float:left;
        }
        li *{
            display:inline-block;
            vertical-align:middle;
            margin:0 !important;
        }
        li input {
            height:1.5rem;
        }.h-1em{
             height:1em !important;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid mr-4">          
        <div>
            <h2>Gerenciamento de áreas poliesportivas </h2>       
            <h6 class="inputTitle">Dados da Área</h6>
            <div class="row ml-1">                
                <div class="col-sm-6">
                    <h6 class="inputTitle  ">Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="pillborder w-75" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName" runat="server"></asp:RequiredFieldValidator> 
                    <h6 class="inputTitle">Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" TextMode="MultiLine" CssClass="pillborder w-100" runat="server"></asp:TextBox>
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
                        </asp:Panel>
                    </div>
                </div>
            </div>            
            <h6 class="inputTitle mt-1">Lista de Esportes: </h6>
                <div class="row ml-1">
                    <div class="col-sm-6">
                        <div class="selectedSports">
                            <h5 class="TAlignCenter">Esportes selecionados</h5>
                            <asp:CheckBoxList runat="server" DataSourceID="ObjectDataSource1" DataTextField="nome" DataValueField="id" CssClass="d-inline-block" ID="CBL" RepeatLayout="UnorderedList"></asp:CheckBoxList>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport"></asp:ObjectDataSource>
                        </div>
                    </div>
                    <div class="col-6"></div>
                <div class="col-12">
                <h6 class="row h6">Horários </h6>
                <div class="w-100">
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Domingo</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>
                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" ID="TXTDomInit"></asp:TextBox>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" ID="TXTDomEnd"></asp:TextBox>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Segunda</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" ID="TXTSegInit"></asp:TextBox>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" ID="TXTSegEnd"></asp:TextBox>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Terça</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>
                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" ID="TXTTerInit"></asp:TextBox>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" ID="TXTTerEnd"></asp:TextBox>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Quarta</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>
                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" ID="TXTQuaInit"></asp:TextBox>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" ID="TXTQuaEnd"></asp:TextBox>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Quinta</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>
                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" ID="TXTQuiInit"></asp:TextBox>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" ID="TXTQuiEnd"></asp:TextBox>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Sexta</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>
                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" ID="TXTSexInit"></asp:TextBox>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" ID="TXTSexEnd"></asp:TextBox>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Sábado</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" ID="TXTSabInit"></asp:TextBox>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" ID="TXTSabEnd"></asp:TextBox>
                        </div>
                </div>
            </div>        
                <asp:Button CssClass="btn-success rounded-pill" runat="server" OnClick="Submit" id="FormSubmit" Text="Submeter dias"/>
                    </div>
                </div>
            </div>
            </div>
    <div class="row">
        <div class="col-12">
            <h2 class="h2">Áreas Esportivas já cadastradas</h2>
        </div>
        <div class="col-12 form-inline">
            <asp:TextBox ID="SearchBox" runat="server" placeholder="Digite o nome da área aqui..."></asp:TextBox>
            <asp:LinkButton CssClass="btn-primary rounded-pill py-1 px-3" ID="searchButton" runat="server">
                <img class="h-1em" src="src/svgs/solid/search.svg"/>
                <span class="text-light"> Buscar</span>
            </asp:LinkButton>
            <asp:DropDownList runat="server">
                <asp:ListItem>Ordernar Por:</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
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
</asp:Content>