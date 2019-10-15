<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="EditarPerfil.aspx.cs" Inherits="WebAppSGE.EditarPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .left-0{
            left:0 !important;
        }
        body{
            min-width:300px     ;
            overflow:hidden;
        }
        .h3s{
            height:1.5rem;
            margin: -0.75em 0.25em 0 0.5em;
        }
        .thumb img{
                 object-fit: none;
                 object-position: center; 
                 width: 100%;
                 height:100%;
                 border-radius:50%;
                 margin-bottom: 1rem;
        }
        @media (max-width:480px){
            .thumb img{
                width:100px;
                height:100px;
            }
        }
        @media (min-width:480px) {
            .thumb img{
                 width:125px;
                 height:125px;  
            }
        }
        @media (min-width:576px) {
            .thumb img{
                 width:170px;
                 height:170px;  
            }
        }
        @media (min-width:768px) {
            .thumb img{
                 width:200px;
                 height:200px;  
            }
        }
        @media (min-width:992x) {

        }
        @media (min-width:1200px) {

        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
       <h2 class="h2" style="padding-top: 10px">Gerenciar Perfil</h2>
       <div class="row bg-light m-0 pt-3">
           <div class="col-5 ml-sm-2 m-auto">
                <div class="thumb mx-auto">
                    <asp:Image runat="server" ID="ProfileImg" />
                </div>
           </div>
           <div class="col-auto mx-auto">
               <div class="col-12 w-100 mt-sm-4">
                       <asp:Label runat="server" ID="SlctNome" CssClass="f-200 font-italic">Teste</asp:Label><img class="h3s" src="src/svgs/solid/pencil-alt.svg"/>
               </div>
               <div class="col-12">
                   <h6 class="h6">ID #<asp:Label runat="server" ID="SlctID">Teste</asp:Label></h6>
               </div>
           </div>
       </div>
       <div class="row mb-5">
           <div class="col-md-7">
               <div class="w-100 mb-2">
                    <div>Nome:</div>
                    <asp:TextBox runat="server" CssClass="w-100" ID="TXTNome"></asp:TextBox>
               </div> 
              <div class="w-100 mb-2">
                    <div>Email:</div>
                    <asp:TextBox runat="server" CssClass="w-100" ID="TXTEmail"></asp:TextBox>
               </div> 
           </div>
           <div class="col-auto">
               <div class="w-100 mb-md-2">Foto:</div>
               <asp:FileUpload runat="server" CssClass="mt-md-4" ID="IMGUPLD" />
           </div>
       </div>
        <div class="row">
            <div class="col-md-7">
                <div class="w-100">
                    <div>Telefone:</div>
                    <asp:TextBox runat="server" CssClass="w-100" ID="TXTTelefone"></asp:TextBox>
                    <div class="w-100">O telefone deve ser escrito da forma (xx) xxxx-xxxx.</div>
               </div> 
            </div>
        </div>
        <asp:Button CssClass="btn-success rounded-pill px-4 py-1 b-none mt-2" runat="server" id="FormSubmit" Text="Salvar" OnClick="FormSubmit_Click"/>        
    </div>
</asp:Content>
