<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true"  CodeBehind="ViewSolicitacao.aspx.cs" Inherits="WebAppSGE.ViewSolicitacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        input{
            border:0 !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="col-sm-12">
            <h2 style="padding-top: 1%">Detalhar solicitação</h2>
        </div>
        <hr />
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <div>
                        <h6>Área esportiva:</h6>
                    </div>
                    <div>
                        <asp:TextBox runat="server" CssClass="w-100 col-auto border-0" ID="TextBoxArea"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div>
                        <h6>Cód. área esportiva:</h6>
                    </div>
                    <div>
                        <asp:TextBox runat="server" CssClass="w-100 col-auto border-0" ID="TextBoxCodArea"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div>
                        <h6>Data da solicitação:</h6>
                    </div>
                    <div>
                        <asp:TextBox runat="server" CssClass="w-100 col-auto border-0" ID="TextBoxDataSlct"></asp:TextBox>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-6">
                    <div>
                        <h6>Motivo:</h6>
                    </div>
                    <div>
                        <asp:TextBox runat="server" CssClass="w-100 border-0" ID="TextBoxMotivo" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div>
                        <h6>Status:</h6>
                    </div>
                    <div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ButtonContent" runat="server">
    <asp:Button  runat="server" ID="Button1" Text="Sair" CssClass="text-danger border-danger bg-transparent rounded-pill w-50 d-block mt-2 mx-auto" />
</asp:Content>

