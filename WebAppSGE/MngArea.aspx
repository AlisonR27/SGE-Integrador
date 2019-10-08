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
                        <asp:Button CssClass="btn-success rounded-pill" runat="server" OnClick="Submit" id="FormSubmit" Text="Submeter dias"/>
                    </div>
                </div>
            </div>
            </div>
</asp:Content>