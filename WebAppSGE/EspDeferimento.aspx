<%@ Page Language="C#" Title="Especificar deferimento" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="~/EspDeferimento.aspx.cs" Inherits="WebAppSGE.EspDeferimentoT2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="col-sm-12">
            <h2 style="padding-top: 10px">Especificar deferimento</h2>
        </div>       
        <hr />
        <div class="container-fluid">
            <div class="row">
            <div class="col-md-4 w-75">                        
            </div>                
            <div class="col-md-8 mt-md-0 mt-3">                
                <div class="row">   
                    <div class="col-sm-8">
                        <h6>Repetição:</h6>
                        <asp:DropDownList runat="server" CssClass="w-100 border-0 col-auto" ID="DropDownList1"> 
                            <asp:ListItem Value="Sim"  ></asp:ListItem>
                            <asp:ListItem Value="Não" ></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-4">
                        <h6 class="w-100">ID da área:</h6>
                        <asp:TextBox CssClass="w-100 border-0 col-auto" runat="server" ID="TextBox1" Enabled="False"></asp:TextBox>
                    </div>                    
                </div>
                <div class="row mt-1">        
                    <div class="col-sm-6">
                        <h6>Data Início:</h6>
                        <input CssClass="w-100 border-0 col-auto" runat="server" type="date" ID="txtdataIni" ToolTip="dd/mm/yyyy" />                                      
                    </div>
                    <div class="col-sm-6">
                        <h6>Data Fim:</h6>
                        <input CssClass="w-100 border-0 col-auto" runat="server" type="date" ID="txtdataFim" ToolTip="dd/mm/yyyy" />
                </div>  
                    
            <br />
                           
        </div>  
                <div class="row mt-1">        
                    <div class="col-sm-6">
                        <h6>Hora Início:</h6>
                        <asp:Textbox CssClass="w-100 border-0 col-auto" runat="server" TextMode="Time" ID="txthoraIni" ToolTip="dd/mm/yyyy" />                                      
                    </div>
                    <div class="col-sm-6">
                        <h6>Hora Fim:</h6>
                        <asp:TextBox CssClass="w-100 border-0 col-auto" runat="server" TextMode="Time" ID="txthoraFim" ToolTip="dd/mm/yyyy" />
                </div>  
        </div>
            <div class="row mt-4 pl-3">
                <asp:Button CssClass="col-auto btn-success rounded-pill" Text="Deferir com alteração" runat="server" ID="btnsolicitar" OnClick="btnsolicitar_Click" />
            </div>     
    </div>
</asp:Content>