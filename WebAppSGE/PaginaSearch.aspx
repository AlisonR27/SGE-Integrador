<%@ Page Title="Buscar Áreas Esportivas" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="PaginaSearch.aspx.cs" Inherits="WebAppSGE.PaginaSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
            @media (max-width:575px){
                .thumb{
                    width:;
                }
            }
            @media (min-width:576px){
                .thumb{
                    width: 150px;
                }
            }
            @media (min-width:768px){
                .thumb{
                    width: 200px;
                    height:160px;
                }
            }
            @media (min-width:992px){
                .thumb{
                    width: 250px;
                    height: 200px;
                }
            }
            @media (min-width:1200px){
                .thumb{
                    width: 350px;
                    height:280px;
                }
            }

            .thumb img{
                 object-fit: none;
                  object-position: center; 
                  width: 100%;
                  height:100%;
                  max-height: 200px;
                  min-height:150px;
                  margin-bottom: 1rem;
            }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="row">
                <div class="col-12">
                    <h3>Pesquisar área por nome:</h3>
                </div>
                <div id="Search" class="col-12 form-inline">
                    <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="rounded border-primary px-2" placeholder="Insira texto para pesquisa..." Width="30%" Height="30px"></asp:TextBox><asp:Button runat="server" Text="Buscar" ID="Pesq" CssClass="btn-info rounded-pill border-0 px-3 py-1 ml-4" Height="30px" OnClick="Pesq_Click"/>
                    <asp:DropDownList ID="Filtros" CssClass="ml-5" runat="server" Height="30px">
                    <asp:ListItem Value="0">Filtros</asp:ListItem> 
                    </asp:DropDownList>
                </div>
            </div>
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <div class="row">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton OnCommand="Unnamed_Command" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"id") %>' runat="server" OnClick="Unnamed_Click" class="col-auto">
                            <div class="row justify-content-center">
                                <div class="col-8 d-block m-auto">
                                    <div  class="thumb">
                                        <asp:Image runat="server" src='<%# DataBinder.Eval(Container.DataItem, "imgUrl")%>'/>
                                    </div>
                                </div>  
                            </div>
                            <div class="row justify-content-center">
                                <asp:Label CssClass="align-middle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "desc") %>'></asp:Label>
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="WebAppSGE.Modelo.Areas" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAllFields" TypeName="WebAppSGE.DAL.DALArea"></asp:ObjectDataSource>
            
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonContent" runat="server">
    <asp:Button  runat="server" ID="Button1" Text="Sair" CssClass="text-danger border-danger bg-transparent rounded-pill w-50  d-block  mt-2 mx-auto" />
</asp:Content>
