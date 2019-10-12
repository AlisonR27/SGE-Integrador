<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="DetalharArea.aspx.cs" Inherits="WebAppSGE.DetalharArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="carousel">
                        <asp:Image ID="mainImg" runat="server" src=""/> 
            </div>
        </div>
    </div>
    <div class="col-8 m-auto"> 
        <asp:Image CssClass="d-block m-auto" runat="server" ID="AreaImage" ImageUrl=""/>
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
