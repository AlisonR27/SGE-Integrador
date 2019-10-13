<%@ Page Language="C#" Title="Especificar deferimento" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="~/EspDeferimento.aspx.cs" Inherits="WebAppSGE.EspDeferimentoT2" %>
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
            <div class="col-md-4 w-75">
                        <h6 class="row pl-3">Data:</h6>
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
            <div class="col-md-8 mt-md-0 mt-3">                
                <div class="row">   
                    <div class="col-sm-8">
                        <h6>Repetição:</h6>
                        <asp:DropDownList runat="server" CssClass="w-100 border-0 col-auto" ID="DropDownList1"></asp:DropDownList>
                    </div>
                    <div class="col-sm-4">
                        <h6 class="w-100">ID da área:</h6>
                        <asp:TextBox CssClass="w-100 border-0 col-auto" runat="server" ID="TextBox1" Enabled="False"></asp:TextBox>
                    </div>                    
                </div>
                <div class="row mt-1">                    
                    <div class="col-sm-6">
                        <h6>Data limite:</h6>
                        <asp:TextBox CssClass="w-100 border-0 col-auto" runat="server" ID="txtdatalmite" ToolTip="dd/mm/yyyy"></asp:TextBox>
                    </div>
                     <div class="col-sm-3">
                        <h6>De:</h6>
                        <asp:TextBox runat="server" CssClass="w-100 border-0" ID="TextBoxDe"></asp:TextBox>
                    </div>
                    <div class="col-sm-3">
                        <h6>Até:</h6>
                        <asp:TextBox runat="server" CssClass="w-100 border-0" ID="TextBoxAte"></asp:TextBox>
                    </div>
                </div>               
                <div class="row mt-2">
                    <div class="col-sm-4">
                        <h6>Lista de dias:</h6>
                        <%-- Não sei o que Colocar agora se puder adiantar ajudaria mt --%>
                    </div>
                </div>
            <br />
                           
        </div>  
        </div>
            <div class="row mt-4 pl-3">
                <asp:Button CssClass="col-auto btn-success rounded-pill" Text="Deferir com alteração" runat="server" ID="btnsolicitar" />
            </div>     
    </div>
</asp:Content>