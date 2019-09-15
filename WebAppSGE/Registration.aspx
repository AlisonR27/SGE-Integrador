<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebAppSGE.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="width:100vw;height:100vh;background:linear-gradient(45deg,#999,#d0d0d0);background-size:cover;background-repeat:no-repeat;">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <script src="Script/default.js"></script>
    <script src="Script/jquery341.js"></script>
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap-grid.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap.min.css" />
</head>
<body  class="bg-transparent">
    <form id="form1" runat="server">
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
    </form>
</body>
</html>
