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
            <h2 style="padding-top: 10px">Gerenciamento de áreas esportivas </h2><hr />    
            <h6 class="inputTitle">Dados da Área</h6>
            <div class="row ml-1">                
                <div class="col-sm-6">
                    <h6 class="inputTitle">Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="w-75 col-auto border-0" runat="server"></asp:TextBox>
                    <asp:Label ID="NameErr" CssClass="text-danger w-100" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName" runat="server"></asp:RequiredFieldValidator> 
                    <h6 class="inputTitle">Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" TextMode="MultiLine" CssClass="w-100 col-auto border-0" Style="resize: none" runat="server"></asp:TextBox>
                    <asp:Label ID="DescErr" CssClass="text-danger w-100" runat="server"></asp:Label>
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
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTDomInit"></asp:TextBox>
                            <asp:Label runat="server" ID="DomInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTDomEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="DomEndErr" CssClass="text-danger w-100"></asp:Label>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Segunda</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSegInit"></asp:TextBox>
                            <asp:Label runat="server" ID="SegInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSegEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="SegEndErr" CssClass="text-danger w-100"></asp:Label>
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
                            <asp:TextBox runat="server"  TextMode="Time" ID="TXTTerInit"></asp:TextBox>
                            <asp:Label runat="server" ID="TerInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTTerEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="TerEndErr" CssClass="text-danger w-100"></asp:Label>
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
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTQuaInit"></asp:TextBox>
                            <asp:Label runat="server" ID="QuaInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTQuaEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="QuaEndErr" CssClass="text-danger w-100"></asp:Label>
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
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTQuiInit"></asp:TextBox>
                            <asp:Label runat="server" ID="QuiInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTQuiEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="QuiEndErr" CssClass="text-danger w-100"></asp:Label>
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
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSexInit"></asp:TextBox>
                            <asp:Label runat="server" ID="SexInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSexEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="SexEndErr" CssClass="text-danger w-100"></asp:Label>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Sábado</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSabInit"></asp:TextBox>
                            <asp:Label runat="server" ID="SabInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSabEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="SabEndErr" CssClass="text-danger w-100"></asp:Label>
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
            <asp:GridView  OnRowCommand="GridView1_RowCommand"  CssClass="table table-dark" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource3">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                    <asp:BoundField DataField="desc" HeaderText="Descrição" SortExpression="desc" />
                    <asp:ButtonField Text="Editar" CommandName="Editar"   />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALArea"></asp:ObjectDataSource>
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