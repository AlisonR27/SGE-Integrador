<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaSearch.aspx.cs" Inherits="WebAppSGE.PaginaSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet"  type="text/css" href="css/solid.css"/>
            <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap-grid.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .thumb img{
             object-fit: none; /* Do not scale the image */
              object-position: center; /* Center the image within the element */
              width: 100%;
              height:100%;
              max-height: 250px;
              margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Search">
            <h3>Pesquisar área por nome:</h3>
            <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="rounded border-primary px-2" placeholder="Insira texto para pesquisa..." Width="30%" Height="30px"></asp:TextBox><asp:Button runat="server" Text="Buscar" ID="Pesq" CssClass="btn-info rounded-pill border-0 px-3 py-1 ml-4" Height="30px" OnClick="Pesq_Click"/>
            <asp:DropDownList ID="Filtros" CssClass="ml-5" runat="server" Height="30px">
                <asp:ListItem Value="0">Filtros</asp:ListItem> 
            </asp:DropDownList>
        </div>
        <div>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <div class="row">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="row">
                            <div class="w-75 d-block m-auto" style="height:30vh;">
                                <div  class="thumb w-100 h-100">
                                    <asp:Image runat="server" src='<%# DataBinder.Eval(Container.DataItem, "imgUrl")%>'/>
                                </div>
                            </div>
                        </div>
                        <div class="row align-content-center w-75 d-block m-auto">
                            <asp:Label CssClass="align-middle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "desc") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
            
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="WebAppSGE.Modelo.Areas" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAllFields" TypeName="WebAppSGE.DAL.DALArea"></asp:ObjectDataSource>
            
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
