<%@ Page Title="Tal" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="~/SlctAgendamento.aspx.cs" Inherits="WebAppSGE.SlctAgendamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="container-fluid">
            <div class="row pl-3">
                <div class="col-sm-6"><h2>Solicitar Áreas Poliesportivas</h2></div>
                <div class="col-sm-6"></div>
            </div>            
            <div class="container-fluid">
                <div class="row pl-3"><h5>Motivo:</h5></div>
                <div class="row">
                    <div class="col-sm-8">
                        <asp:TextBox runat="server" CssClass=" w-100 h-100" ID="TextBoxMotivo"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <div><h5>De:</h5></div>
                        <asp:TextBox runat="server" CssClass=" col-auto" ID="TextBoxDe"></asp:TextBox>
                   </div>
                    <div class="col-sm-2">
                        <div><h5>Até:</h5></div>
                        <asp:TextBox runat="server" CssClass=" col-auto " ID="TextBoxAte"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-1">
                    <div class="col-md-4">
                        <h5 class="row pl-3">Data:</h5>
                        <asp:Calendar runat="server" ID="calendar1" DayNameFormat="FirstTwoLetters" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="220px" Width="240px" BorderStyle="None" BackColor="White">
                            <DayHeaderStyle  Font-Bold="True" ForeColor="#990000" Height="1pc" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="White" BorderStyle="None" />
                            <OtherMonthDayStyle ForeColor="#c4c4c4"  BorderStyle="None" />
                            <SelectedDayStyle BackColor="#C4C4C4" Font-Bold="True" BorderStyle="None" />
                            <SelectorStyle BackColor="#FFCC66 " BorderStyle="None" />
                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="White" BorderStyle="None" />
                            <TodayDayStyle BackColor="#990000" ForeColor="White" BorderStyle="None" />
                        </asp:Calendar>
                    </div>
                    
                    <div class="col-md-4">
                            <h5 class="row pl-3">Repetição</h5>
                            <asp:DropDownList runat="server" CssClass="col-auto" ID="dropdown1"></asp:DropDownList>
                        <div class="row mt-1">
                        <div class="col-md-5">
                            <h5 class="row pl-3">Lista de dias:</h5>
                            <%-- Não sei o que Colocar agora se puder adiantar ajudaria mt --%>
                        </div>
                    </div>
                    </div>
                    <div class="col-md-2">
                        <h5 class="row pl-3">Data Limite:</h5>
                        <asp:TextBox CssClass=" col-auto" runat="server" ID="txtdatalmite" ToolTip="dd/mm/yyyy"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <h5 class="row pl-3">ID da área:</h5>
                        <asp:TextBox CssClass=" col-auto" runat="server" ID="txtidarea" Enabled="False"></asp:TextBox>
                    </div>
                    
                </div>
                <div class="row mt-2 pl-3">
                    <asp:Button CssClass="col-auto btn-success rounded-pill b-none" Text="Solicitar" runat="server" ID="btnsolicitar" OnClick="btnsolicitar_Click" />
                </div>                    
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonContent" runat="server">
    <asp:Button  runat="server" ID="Button1" Text="Sair" CssClass="text-danger border-danger bg-transparent rounded-pill w-50  d-block  mt-2 mx-auto" />
</asp:Content>



