<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="WebAppSGE.Registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <script type="text/javascript" src="Script/jquery-3.3.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="Script/default.js"></script>
    <script type="text/javascript" src="Script/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap-grid.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
    <title></title>
</head>
<body>
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
                <asp:TextBox runat="server" TextMode="Password" ID="Pass"></asp:TextBox>
                <h5>Confirme a senha:</h5>
                <asp:TextBox runat="server" TextMode="Password" ID="CnfrmPass"></asp:TextBox>
                
            </div>
            <div class=" col-sm-6">
                 <h5>Email:</h5>                   
                <asp:TextBox ID="TXTEmail"  TextMode="Email" runat="server"></asp:TextBox><br />
                  <h5>Telefones:</h5> 
                <asp:TextBox ID="TXTPhones" TextMode="Number" runat="server"></asp:TextBox>
             </div>
        </div>
        
       
      <!--    <asp:TextBox runat="server" ID="ConfirmPass" TextMode="Password"></asp:TextBox><br />-->
        <br />
      <asp:Button ID="Button2" CssClass="btn-success rounded-pill"  runat="server" OnClick="Button2_Click" Text="Cadastrar usuário" /> 
      </div>
    </form>
</body>
</html>
