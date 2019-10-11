<%@ Page Title="Gerenciar Usuários" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="MngUser.aspx.cs" Inherits="WebAppSGE.MngUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="col-sm-12">
            <h2 style="padding-top: 1%">Gerenciamento de usuários</h2>
        </div>
        <hr />
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-8">
                    <h6>Pesquise por nome ou ID:</h6>
                    <%-- ?????? --%>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h6>ID</h6>
                    <asp:TextBox ID="TXTId" CssClass="w-25" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <h6>Nome:</h6>
                    <asp:TextBox ID="TextBox1" CssClass="w-75 col-auto border-0" runat="server"></asp:TextBox>
                    <h6>Email:</h6>                   
                    <asp:TextBox ID="TextBox2" CssClass="w-75 col-auto border-0" runat="server"></asp:TextBox><br />
                    <h6>Tipo de conta:</h6>
                    <asp:DropDownList runat="server" CssClass="w-75 border-0 col-auto" ID="dropdown1"></asp:DropDownList>
                </div>
                <div class="col-sm-6">
                    <h6>Telefones:</h6> 
                    <asp:TextBox ID="TXTPhones" CssClass="col-auto border-0" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" CssClass="btn-outline-dark rounded-0 ml-2" runat="server" Text="Adicionar Telefone" /><br />
                    <h6>Telefones cadastrados</h6>
                    <asp:BulletedList ID="selectedPhones" CssClass="w-75 d-block list-group-item-primary" runat="server" EnableViewState="False">
                        <asp:ListItem></asp:ListItem>
                    </asp:BulletedList>
                </div>
            </div>
            <br />
            <asp:Button CssClass="btn-success rounded-pill" runat="server" id="FormSubmit" Text="Salvar"/>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonContent" runat="server">
    <asp:Button runat="server" ID="Button2" Text="Sair" CssClass="text-danger border-danger bg-transparent rounded-pill w-50 d-block mt-2 mx-auto" />
</asp:Content>