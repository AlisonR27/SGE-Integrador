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
    <div class="container-fluid">
        <div class="col-sm-12">
            <h2 style="padding-top: 1%">Gerenciamento de áreas esportivas</h2>
        </div>
        <hr />
        <div class="container-fluid">
            <h6>Dados da Área</h6>
            <div class="row" >
                <div class="col-sm-6">
                    <h6>Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="w-75 col-auto border-0" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName" runat="server"></asp:RequiredFieldValidator>
                    <h6>Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" TextMode="MultiLine" CssClass="w-100 col-auto border-0" runat="server" Style="resize: none"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
                </div>
                <div class="col-sm-6">
                    <div>
                        <h6>Imagens</h6>            
                        <asp:FileUpload ID="FileUpload1" runat="server" /> 
                    </div>
                    <div class="mt-2">
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:Image ID="Image1" CssClass="col-12 pillborder" runat="server"/>
                        </asp:Panel>
                    </div>
                </div>
            </div>            
            <h6>Lista de Esportes:</h6>
            <div class="row">
                <div class="col-sm-6">
                    <div class="selectedSports">
                        <h6 class="TAlignCenter">Esportes selecionados</h6>
                        <asp:CheckBoxList runat="server" DataSourceID="ObjectDataSource1" DataTextField="nome" DataValueField="id" CssClass="d-inline-block" ID="CBL" RepeatLayout="UnorderedList"></asp:CheckBoxList>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport"></asp:ObjectDataSource>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <h6>Horários</h6>
                        <asp:GridView ID="GV1" AutoGenerateColumns="False" runat="server">
                            <Columns>
                                <asp:BoundField AccessibleHeaderText="Blabla" HeaderText="blabla"/>
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
</asp:Content>