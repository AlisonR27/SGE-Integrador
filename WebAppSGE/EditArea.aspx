<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="EditArea.aspx.cs" Inherits="WebAppSGE.EditArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-8 mx-auto mt-5">
    <h5 class="row bg-dark m-0 h5 px-2 py-2 text-center d-block text-light">
        Área Esportiva
    </h5>
    <asp:DetailsView CssClass="table table-dark" BorderStyle="None" runat="server" ID="ss" AutoGenerateRows="False" DataSourceID="ObjectDataSource1">
        <Fields>
            <asp:TemplateField HeaderText="id" SortExpression="id">
                <EditItemTemplate>
                    <asp:TextBox Enabled="false" ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox Enabled="false" ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
            <asp:BoundField DataField="desc" HeaderText="desc" SortExpression="desc" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        
    </asp:DetailsView>
        </div>
       <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectUnic" TypeName="WebAppSGE.DAL.DALArea">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="id" SessionField="AreaId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
