<%@ Page Title="Especificar deferimento" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="EspDeferimento.aspx.cs" Inherits="WebAppSGE.EspDeferimento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="col-sm-12">
            <h2 style="padding-top: 1%">Especificar deferimento</h2>
        </div>       
        <hr />
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2">
                    <h6>ID da área:</h6>
                    <asp:TextBox CssClass="w-100 border-0 col-auto" runat="server" ID="TextBox1" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <h6>Repetição:</h6>
                    <asp:DropDownList runat="server" CssClass="w-100 border-0 col-auto" ID="DropDownList1"></asp:DropDownList>
                </div>
                <div class="col-sm-3">
                    <h6>Data limite:</h6>
                    <asp:TextBox CssClass="w-100 border-0 col-auto" runat="server" ID="txtdatalmite" ToolTip="dd/mm/yyyy"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <h6>De:</h6>
                    <asp:TextBox runat="server" CssClass="w-100 border-0" ID="TextBoxDe"></asp:TextBox>
                </div>
                <div class="col-sm-3">
                    <h6>Até:</h6>
                    <asp:TextBox runat="server" CssClass="w-100 border-0" ID="TextBoxAte"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <h6>Lista de dias:</h6>
                    <%-- Não sei o que Colocar agora se puder adiantar ajudaria mt --%>
                </div>
            </div>
            <br />
            <div class="row mt-2 pl-3">
                <asp:Button CssClass="col-auto btn-success rounded-pill" Text="Deferir com alteração" runat="server" ID="btnsolicitar" />
            </div>                    
        </div>      
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonContent" runat="server">
    <asp:Button runat="server" ID="Button1" Text="Sair" CssClass="text-danger border-danger bg-transparent rounded-pill w-50 d-block mt-2 mx-auto" />
</asp:Content>