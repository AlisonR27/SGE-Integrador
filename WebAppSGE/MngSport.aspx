<%@ Page Title="Gerenciar Esportes" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="MngSport.aspx.cs" Inherits="WebAppSGE.MngSport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="col-sm-12">
            <h2 style="padding-top: 1%">Gerenciamento de esportes</h2>
        </div>
        <hr />
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h6>Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="w-75 col-auto border-0" runat="server" class="name_box"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName" runat="server"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <h6>Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" CssClass="w-100 col-auto border-0" TextMode="MultiLine" runat="server" class="desc_box" Style="resize: none"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
                </div>
            </div>
        <asp:Button runat="server" ID="SubmitButton" OnClick="FormSubmit_Click" Text="Submeter" class="btn-success mt-3 rounded-pill"/>
        </div>
        <div class="col-sm-12">
            <h2 style="padding-top: 1%">Atividades esportivas já cadastradas:</h2>
        </div>
        <hr />
        <div class="container-fluid">
            <div class="row">
                <asp:GridView ID="SportsView" runat="server" DataSourceID="SportsOBJDS" class="gridview_sport" BackColor="White" EnableViewState="False"></asp:GridView>        
                <asp:ObjectDataSource ID="SportsOBJDS" runat="server" DataObjectTypeName="WebAppSGE.Modelo.Sports" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport" UpdateMethod="Update"></asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonContent" runat="server">
    <asp:Button runat="server" ID="Button1" Text="Sair" CssClass="text-danger border-danger bg-transparent rounded-pill w-50 d-block mt-2 mx-auto" />
</asp:Content>