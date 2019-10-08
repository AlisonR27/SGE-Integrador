﻿<%@ Page Title="Tal" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="~/SlctAgendamento.aspx.cs" Inherits="WebAppSGE.SlctAgendamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="col-sm-12">
            <h2 style="padding-top: 1%">Solicitar Áreas Poliesportivas</h2>
        </div>       
        <hr />
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-8">
                    <div>
                        <h6>Motivo:</h6>
                    </div>
                    <asp:TextBox runat="server" CssClass="w-100 border-0" ID="TextBoxMotivo" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <div>
                        <h6>De:</h6>
                    </div>
                    <asp:TextBox runat="server" CssClass="w-100 border-0" ID="TextBoxDe"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <div>
                        <h6>Até:</h6>
                    </div>
                    <asp:TextBox runat="server" CssClass="w-100 border-0" ID="TextBoxAte"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <h6>Data:</h6>
                    <asp:Calendar runat="server" ID="calendar1" DayNameFormat="FirstTwoLetters" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" CssClass="w-100 border-0" BorderStyle="None" BackColor="White" OnSelectionChanged="calendar1_SelectionChanged">
                        <DayHeaderStyle  Font-Bold="True" ForeColor="#990000" Height="1pc" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="White" BorderStyle="None" />
                        <OtherMonthDayStyle ForeColor="#c4c4c4"  BorderStyle="None" />
                        <SelectedDayStyle BackColor="#C4C4C4" Font-Bold="True" BorderStyle="None" />
                        <SelectorStyle BackColor="#FFCC66 " BorderStyle="None" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="White" BorderStyle="None" />
                        <TodayDayStyle BackColor="#990000" ForeColor="White" BorderStyle="None" />
                    </asp:Calendar>
                </div>
                <div class="col-md-2">
                    <h6>Repetição</h6>
                    <asp:DropDownList runat="server" CssClass="w-100 border-0 col-auto" ID="dropdown1"></asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <h6>Lista de dias:</h6>
                    <%-- Não sei o que Colocar agora se puder adiantar ajudaria mt --%>
                </div>
                <div class="col-md-2">
                    <h6>Data Limite:</h6>
                        <asp:TextBox CssClass="w-100 border-0 col-auto" runat="server" ID="txtdatalmite" ToolTip="dd/mm/yyyy"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <h6 class="row pl-3">ID da área:</h6>
                    <asp:TextBox CssClass="w-100 border-0 col-auto" runat="server" ID="txtidarea" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row mt-2 pl-3">
                <asp:Button CssClass="col-auto btn-success rounded-pill" Text="Solicitar" runat="server" ID="btnsolicitar" OnClick="btnsolicitar_Click" />
            </div>                    
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonContent" runat="server">
    <asp:Button runat="server" ID="Button1" Text="Sair" CssClass="text-danger border-danger bg-transparent rounded-pill w-50  d-block  mt-2 mx-auto" />
</asp:Content>