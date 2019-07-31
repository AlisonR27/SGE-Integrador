<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MngSport.aspx.cs" Inherits="WebAppSGE.MngSport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <h3> TEST </h3>
     <hr />
    <form id="form1" runat="server">
        <div>
            <h4>Gerenciamento de atividades esportivas:</h4>
            <asp:Label runat="server"> Nome:</asp:Label><br />
            <asp:TextBox runat="server"/><br />
            <asp:Label runat="server"> Descrição:</asp:Label><br />
            <asp:TextBox runat="server"></asp:TextBox><br/>
            <asp:Button runat="server" Text="Adicionar"/>&nbsp<asp:Button runat="server" Text="Salvar" Enabled="False"/>&nbsp<asp:Button runat="server" Text="Excluir"/>         
        </div>
    </form>
    <form id="form2" runat="server">
        <h4>Atividades esportivas</h4>
        <h6>Pesquisar atividade por nome:</h6>
        <asp:TextBox runat="server" placeholder="Clique aqui para pesquisar"></asp:TextBox><asp:Button runat="server" Text="Buscar"/> <asp:DropDownList runat="server"></asp:DropDownList>
            <asp:GridView runat="server" Width="90%">

            </asp:GridView>
    </form>
</body>
</html>
