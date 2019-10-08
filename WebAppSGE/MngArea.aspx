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
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fuid mr-4">            
        <div>
            <h2>Gerenciamento de áreas poliesportivas </h2>       
            <h6 class="inputTitle">Dados da Área</h6>
            <div class="row ml-1">                
                <div class="col-sm-6">
                    <h6 class="inputTitle  ">Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="pillborder w-100" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName" runat="server"></asp:RequiredFieldValidator> 
                    <h6 class="inputTitle">Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" TextMode="MultiLine" CssClass="pillborder w-100" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
                </div>
                <div class="col-md-6">
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
                            <div>
                        <h6 class="inputTitle">Horários </h6>
                        <div class="row">
                            <div class="col-12">
                                <asp:GridView ID="GV1" AutoGenerateColumns="False" runat="server">
                                   <Columns>
                                       <asp:BoundField AccessibleHeaderText="Blabla"  HeaderText="blabla"/>
                                       <asp:BoundField HeaderText="blablabla" />
                                       <asp:BoundField HeaderText="ssssss" />
                                   </Columns>
                                </asp:GridView>
                               <asp:Button runat="server" OnClick="Unnamed_Click1" OnClientClick="Unnamed_Click1"/>

                            </div>
                        </div>     
                     <!--   <asp:Button CssClass="btn-success rounded-pill" runat="server" OnClick="Submit" id="FormSubmit" Text="Submeter dias"/> -->
                    </div>
                </div>
            </div>
                <div>
                    <h2>Áreas poliesportivas já cadastradas</h2>    
                    <div class="row text-light col-12"><p>Pesquisa área por nome:</p></div>
                    <div class="row">
                        <div class="container-fluid ml-3">
                            <asp:TextBox runat="server" CssClass="col-sm-5 mb-1 mt-sm-1" ID="TextBoxSearch"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                            <asp:LinkButton runat="server" CssClass="btn-primary col-sm-2 col-2 mb-1 mt-sm-1 px-2 py-1 pillborder" ID="Searchbtn" OnClick="Searchbtn_Click"><img class="h-1 pb-1" src="src/svgs/solid/search.svg" /> Buscar</asp:LinkButton>
                            <asp:DropDownList runat="server" ID="dropFiltro" CssClass="offset-md-1 col-md-3 col-9 mt-1 mb-sm-1 w-100"></asp:DropDownList>
                            <asp:GridView  runat="server" EnableViewState="false" ID="GVAreasCadastradas" CssClass="col-12" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                                    <asp:BoundField DataField="desc" HeaderText="desc" SortExpression="desc" />
                                </Columns>
                            </asp:GridView>                          
                        </div>                
                    </div>
                </div>
            </div>
</asp:Content>