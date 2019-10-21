<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="ListSolicitacoes.aspx.cs" Inherits="WebAppSGE.ListSolicitacoes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView CssClass="table-dark" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Código" SortExpression="id" />
            <asp:BoundField DataField="atividades_Realizadas" HeaderText="Atividades" SortExpression="atividades_Realizadas" />
            <asp:BoundField DataField="motivo_Solicitacao" HeaderText="Motivação" SortExpression="motivo_Solicitacao" />
            <asp:BoundField DataField="Data_ini" DataFormatString="{0: dd/MM/yyyy}" HeaderText="Inicio" SortExpression="Data_ini" />
            <asp:BoundField DataField="Data_fim" DataFormatString="{0: dd/MM/yyyy}" HeaderText="Término" SortExpression="Data_fim" />
            <asp:BoundField DataField="id_AreaPoliesportiva" HeaderText="Cód. da Área" SortExpression="id_AreaPoliesportiva" />
            <asp:BoundField DataField="horario_Solicitacao" HeaderText="Solicitado em:" SortExpression="horario_Solicitacao" />
            <asp:BoundField DataField="status" HeaderText="Status:" SortExpression="status" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="WebAppSGE.Modelo.SolicitacaoReserva" DeleteMethod="Delete" SelectMethod="SelectYours" TypeName="WebAppSGE.DAL.DALSolicitacaoReserva" UpdateMethod="UpdateAdmin">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="uid" Type="Int32" />
        </SelectParameters>
</asp:ObjectDataSource>
</asp:Content>
