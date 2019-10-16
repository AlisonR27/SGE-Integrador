<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="DetalharArea.aspx.cs" Inherits="WebAppSGE.DetalharArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item">
                        <asp:Image ID="mainImg" runat="server" src=""/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:DetailsView runat="server" DataSourceID="ObjectDataSource1" AutoGenerateRows="False">
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="desc" HeaderText="desc" SortExpression="desc" />
        </Fields>
    </asp:DetailsView>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectUnic" TypeName="WebAppSGE.DAL.DALArea">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="AreaId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
