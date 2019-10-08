<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebAppSGE.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row bg-dark">
        <div class="col-sm-4 text-center"><a href="MngArea.aspx" class="text-light">Áreas</a></div>
            <div class="col-sm-4 text-center"><a href="MngSport.aspx" class="text-light">Esportes</a></div>
            <div class="col-sm-4 text-center"><a href="PaginaSearch.aspx" class="text-light">Buscar</a></div>
        </div>  
        <div class="container-fluid bg-transparent">
        <h3>Cadastrar Usuário</h3><hr />
        <div class="row">
            <div class=" col-sm-6">
                <div class="row">
                    <div class="col-1">
                        <h5>ID</h5>
                    </div>
                    <div class="col-5">
                        <asp:TextBox ID="TXTId" CssClass="w-25" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <h5>Nome:</h5>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
              
                <h5>Senha:</h5>
                <asp:TextBox runat="server" ID="Pass"></asp:TextBox>
                <h5>Confirme a senha:</h5>
                <asp:TextBox runat="server" ID="CnfrmPass"></asp:TextBox>
                
            </div>
            <div class=" col-sm-6">
                 <h5>Email:</h5>                   
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
                  <h5>Telefones:</h5> 
                <asp:TextBox ID="TXTPhones" runat="server"></asp:TextBox><asp:Button ID="Button1" CssClass="btn-outline-dark rounded-0 ml-2" runat="server" OnClick="Button1_Click" Text="Adicionar Telefone" /><br />
                <h5>Telefones cadastrados</h5>
                <asp:BulletedList ID="selectedPhones" CssClass="d-block list-group-item-primary" runat="server" EnableViewState="False">
                    <asp:ListItem></asp:ListItem>
                </asp:BulletedList>
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

    