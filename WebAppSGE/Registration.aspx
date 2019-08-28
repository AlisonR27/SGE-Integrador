<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebAppSGE.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h5>Nome:</h5>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        <h5>email:</h5>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        <h5>telefones:</h5> 
        <asp:TextBox ID="TXTPhones" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Adicionar Telefone" /><br />
        <h5>telefones cadastrados</h5>
        <asp:BulletedList ID="selectedPhones" runat="server">

        </asp:BulletedList>
        <h5>Nome:</h5>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />
    </form>
</body>
</html>
