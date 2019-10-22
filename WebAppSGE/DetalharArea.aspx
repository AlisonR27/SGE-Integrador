<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="DetalharArea.aspx.cs" Inherits="WebAppSGE.DetalharArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="ErrorPanel"  CssClass="position-absolute transparent-gray w-100 h-100" Visible="false" ViewStateMode="Disabled"> 
        <asp:Panel CssClass="d-block minw px-4 py-2 col-7 mb-5 bg-light m-auto align-middle" runat="server">
            <img class="w-25 d-block mx-auto my-5" src="src/imgs/sad.png"/>
            <h2 class="h2 text-center text-danger">Erro</h2>
            <h3 class="h3 text-center">Essa página não pode ser acessada sem redirecionamento!</h3>
            <a class="d-block mx-auto text-center py-2" href="InitialPage.aspx">Clique aqui para voltar para a página inicial.</a>
        </asp:Panel>
    </asp:Panel>
    <div class="col-8 m-auto"> 
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:Image CssClass="d-block m-auto" runat="server" ID="AreaImage"/>
        <asp:DetailsView CssClass="table-dark w-100" runat="server" ID="dv1" DataSourceID="ObjectDataSource1" AutoGenerateRows="False">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="Código" SortExpression="id" />
                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                <asp:BoundField DataField="desc" HeaderText="Descrição" SortExpression="desc" />
                <asp:BoundField  DataField="imgUrl" HeaderText="imgUrl" SortExpression="imgUrl" InsertVisible="False" />          
            </Fields>
            <PagerStyle />
            <HeaderStyle  CssClass="w-25"/>
            <FieldHeaderStyle CssClass="w-25"/>
        </asp:DetailsView>
        <h3 class="h3">Horários Disponíveis</h3>
        <asp:Button CssClass="px-3 py-1 bg-transparent btn-outline-primary rounded-pill" runat="server" ID="return1week" OnClick="return1week_Click" Text="←"/>
        <asp:Button CssClass="px-3 py-1 bg-transparent ml-66 btn-outline-primary rounded-pill" runat="server" ID="go1week" OnClick="go1week_Click" Text="→"/>             
        <table class="table-bordered w-75 table-dark" runat="server" id="weekTable">
                <tr runat="server" id="semrow">
                    <td runat="server"  index="0" class="p-0"><asp:LinkButton active="false" CssClass="w-100 h-100 d-block text-center text-light" OnClick="LinkButton1_Click" ID="lb1" runat="server"></asp:LinkButton></td>
                    <td runat="server" index="1" class="p-0"><asp:LinkButton active="false"  CssClass="w-100 h-100 d-block text-center text-light"  OnClick="LinkButton1_Click" ID="lb2" runat="server"></asp:LinkButton></td>
                    <td runat="server" index="2" class="p-0"><asp:LinkButton active="false"  CssClass="w-100 h-100 d-block text-center text-light"  OnClick="LinkButton1_Click" ID="lb3" runat="server"></asp:LinkButton></td>
                    <td runat="server" index="3" class="p-0"><asp:LinkButton active="false"  CssClass="w-100 h-100 d-block text-center text-light"  OnClick="LinkButton1_Click" ID="lb4" runat="server"></asp:LinkButton></td>
                    <td runat="server" index="4" class="p-0"><asp:LinkButton active="false"  CssClass="w-100 h-100 d-block text-center text-light"  OnClick="LinkButton1_Click" ID="lb5" runat="server"></asp:LinkButton></td>
                    <td runat="server" index="5" class="p-0"><asp:LinkButton active="false"  CssClass="w-100 h-100 d-block text-center text-light"  OnClick="LinkButton1_Click" ID="lb6" runat="server"></asp:LinkButton></td>
                    <td runat="server" index="6" class="p-0"><asp:LinkButton active="false"  CssClass="w-100 h-100 d-block text-center text-light"  OnClick="LinkButton1_Click" ID="lb7" runat="server"></asp:LinkButton></td>
                </tr>
        </table>
        <asp:Button ID="solicit" OnClick="Unnamed_Click" ClientIDMode="Static" runat="server" CssClass="btn-primary rounded-pill" Text="Solicitar horário"/>
    </div>
    <asp:Label runat="server" ID ="damn"></asp:Label>
    <script>
        $('#ContentPlaceHolder1_semrow').children().click(function () {
            //$('#ContentPlaceHolder1_semrow').children().not(this).removeClass("active");
            //$(this).toggleClass("active");
            //sessionStorage.setItem('preSolDate',$(this).text);
        });
        $("#solicit").click(function () {
            var x = $('ContentPlaceHolder1_semrow').children('.active').text();
            var pageId = '<%=  Page.ClientID %>';
            console.log('tentou');
            $.ajax({
                type: "POST",
                url: "/DetalharArea.aspx/setSessionDate",
                data: x,
                 dataType: "json",
                success: function (msg) {
                    console.log('funfou');
                }
                }
            );
        });
    </script>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectUnic" TypeName="WebAppSGE.DAL.DALArea">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="AreaId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
