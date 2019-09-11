<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaSearch.aspx.cs" Inherits="WebAppSGE.PaginaSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body{
            padding: 1%;
        }
        #Search{
            height: 1%
        }
        #Pesq{
            margin-left: 1%;
        }
        #Filtros{
            margin-left: 1%;
            width:6%;
        }
        body form div h3 {
            margin-bottom: auto;
            font-family: SansSerif;
        }
        #TextBoxSearch{
            border-radius: 20px;
            height: 10%;
        }
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Search">
            <h3>Pesquisar área por nome:</h3>
            <asp:TextBox ID="TextBoxSearch" runat="server" Width="30%" Height="30px"></asp:TextBox><asp:Button runat="server" Text="Buscar" ID="Pesq" CssClass="auto-style1" Height="30px" OnClick="Pesq_Click"/>
            <asp:DropDownList ID="Filtros"  runat="server" Height="30px">
                <asp:ListItem Value="0">Filtros</asp:ListItem> 
            </asp:DropDownList>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
