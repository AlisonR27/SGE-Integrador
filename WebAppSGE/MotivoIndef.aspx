<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="MotivoIndef.aspx.cs" Inherits="WebAppSGE.MotivoIndef" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-8 mx-auto mt-5">
    <h5 class="row bg-dark m-0 h5 px-2 py-2 text-center d-block text-light">
        Inderferir Solicitação
    </h5>
    <div class="container-fluid">
        <div>          
            <div class="div_info fScreen row">
                <div class="col-12 ml-3">
                    <h6 class="inputTitle row">Motivo:</h6>
                    <asp:TextBox ID="TextBoxReason" CssClass="row col-12" runat="server" TextMode="MultiLine" class="name_box"></asp:TextBox>                    
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxReason"  runat="server"></asp:RequiredFieldValidator>
                </div>
                </div>
            <div class="div_info fScreen row mt-2">
                <div class="col-12 ml-3">
                    <asp:Button runat="server" ID="btnIndef" CssClass="btn btn-primary b-none" Text="Indeferir" OnClick="btnIndef_Click"/>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
