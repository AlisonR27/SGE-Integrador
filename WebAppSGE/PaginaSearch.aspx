<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaSearch.aspx.cs" Inherits="WebAppSGE.PaginaSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet"  type="text/css" href="css/solid.css"/>
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
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
                <HeaderTemplate>
                    <div class="row">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="col-md-3">
                        <asp:Image runat="server" src='<% DataBinder.Eval(Container.DataItem, "imgURL")%>' style="width:15%;"/>
                        <asp:Label runat="server" Text='<% DataBinder.Eval(Container.DataItem, "areaName") %>'></asp:Label>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
            
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="WebAppSGE.Modelo.Areas" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALArea"></asp:ObjectDataSource>
            
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
