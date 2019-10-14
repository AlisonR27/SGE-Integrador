<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="ListSport.aspx.cs" Inherits="WebAppSGE.ListSport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="ErrorPanel"  CssClass="position-absolute transparent-gray w-100 h-100" Visible="false" ViewStateMode="Disabled"> 
        <asp:Panel CssClass="d-block minw px-4 py-2 col-7 mb-5 bg-light m-auto align-middle" runat="server">
            <img class="w-25 d-block mx-auto my-5" src="src/imgs/sad.png"/>
            <h2 class="h2 text-center text-danger">Erro</h2>
            <h3 class="h3 text-center">Essa página não pode ser acessada sem redirecionamento!</h3>
            <a class="d-block mx-auto text-center py-2" href="InitialPage.aspx">Clique aqui para voltar para a página inicial.</a>
        </asp:Panel>
    </asp:Panel>
    <div class="col-8 mx-auto mt-5">
    <h5 class="row bg-dark m-0 h5 px-2 py-2 text-center d-block text-light">
        Área Esportiva
    </h5>
    <asp:GridView  CssClass="table table-dark" BorderStyle="None" runat="server" ID="ss" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False" OnRowCommand="ss_RowCommand">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" />
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
            <asp:BoundField DataField="descricao" HeaderText="Descricao" SortExpression="descricao" />
            <asp:ButtonField  Text="Editar" CommandName="Editar"/>
        </Columns>
    </asp:GridView>
        </div>
       <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport">
    </asp:ObjectDataSource>
</asp:Content>
