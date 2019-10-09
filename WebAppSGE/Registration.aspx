<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebAppSGE.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row bg-dark">
        <div class="col-sm-4 text-center"><a href="MngArea.aspx" class="text-light">Áreas</a></div>
        <div class="col-sm-4 text-center"><a href="MngSport.aspx" class="text-light">Esportes</a></div>
        <div class="col-sm-4 text-center"><a href="PaginaSearch.aspx" class="text-light">Buscar</a></div>
    </div>  
    <div class="container-fluid">
        <div class="col-sm-12">
            <h2 style="padding-top: 1%">Cadastrar Usuário</h2>
        </div>
        <hr />
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <h6>ID</h6>
                    <asp:TextBox ID="TXTId" CssClass="w-25" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <h6>Nome:</h6>
                    <asp:TextBox ID="TextBox1" CssClass="w-75 col-auto border-0" runat="server"></asp:TextBox>
                    <br />
                    <h6>Senha:</h6>
                    <asp:TextBox runat="server" CssClass="w-75 col-auto border-0" ID="Pass"></asp:TextBox>
                    <h6>Confirme a senha:</h6>
                    <asp:TextBox runat="server" CssClass="w-75 col-auto border-0" ID="CnfrmPass"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <h6>Email:</h6>                   
                    <asp:TextBox ID="TextBox2" CssClass="w-75 col-auto border-0" runat="server"></asp:TextBox><br />
                    <h6>Telefones:</h6> 
                    <asp:TextBox ID="TXTPhones" CssClass="col-auto border-0" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" CssClass="btn-outline-dark rounded-0 ml-2" runat="server" OnClick="Button1_Click" Text="Adicionar Telefone" /><br />
                    <h6>Telefones cadastrados</h6>
                    <asp:BulletedList ID="selectedPhones" CssClass="w-75 d-block list-group-item-primary" runat="server" EnableViewState="False">
                        <asp:ListItem></asp:ListItem>
                    </asp:BulletedList>
                </div>
            </div>
        </div>
      <!--    <asp:TextBox runat="server" ID="ConfirmPass" TextMode="Password"></asp:TextBox><br />-->
        <br />
        <asp:Button ID="Button2" CssClass="btn-success rounded-pill"  runat="server" OnClick="Button2_Click" Text="Cadastrar usuário" /> 
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonContent" runat="server">
    <asp:Button  runat="server" ID="Button3" Text="Sair" CssClass="text-danger border-danger bg-transparent rounded-pill w-50  d-block  mt-2 mx-auto" />
</asp:Content>

    