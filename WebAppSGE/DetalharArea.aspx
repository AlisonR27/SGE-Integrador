<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="DetalharArea.aspx.cs" Inherits="WebAppSGE.DetalharArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="ErrorPanel"  CssClass="position-absolute transparent-gray w-100 h-100" Visible="false" ViewStateMode="Disabled"> 
        <asp:Panel CssClass="d-block minw px-4 py-2 col-7 mb-5 bg-light m-auto align-middle" runat="server">
            <img class="w-25 d-block mx-auto my-5" src="src/imgs/sad.png"/>
            <h2 class="h2 text-center text-danger">Erro</h2>
            <h3 class="h3 text-center">Essa página não pode ser acessada sem redirecionamento!</h3>
            <a class="d-block mx-auto text-center py-2" href="InitialPage.aspx">Clique aqui para voltar para a página inicial.</a>
        </asp:Panel>
    </asp:Panel>
    <div class="col-8 m-auto"> 
        <asp:Image CssClass="d-block m-auto" runat="server" ID="AreaImage"/>
            <asp:DetailsView CssClass="table-dark w-100" runat="server" ID="dv1" DataSourceID="ObjectDataSource1" AutoGenerateRows="False">
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    <asp:BoundField DataField="desc" HeaderText="desc" SortExpression="desc" />
                    <asp:BoundField  DataField="imgUrl" HeaderText="imgUrl" SortExpression="imgUrl" InsertVisible="False" />
                   
                </Fields>
                <PagerStyle />
                <HeaderStyle  CssClass="w-25"/>
                <FieldHeaderStyle CssClass="w-25"/>
            </asp:DetailsView>
        </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectUnic" TypeName="WebAppSGE.DAL.DALArea">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="AreaId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
