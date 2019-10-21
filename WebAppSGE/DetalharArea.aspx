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
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                <asp:BoundField DataField="desc" HeaderText="desc" SortExpression="desc" />
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
                    <td runat="server" class="px-2">Domingo</td>
                    <td runat="server" class="px-2">Segunda</td>
                    <td runat="server" class="px-2">Terça</td>
                    <td runat="server" class="px-2">Quarta</td>
                    <td runat="server" class="px-2">Quinta</td>
                    <td runat="server" class="px-2">Sexta</td>
                    <td runat="server" class="px-2">Sábado</td>
                </tr>
        </table>
        <asp:Button ID="solicit" OnClick="Unnamed_Click" ClientIDMode="Static" runat="server" CssClass="btn-primary rounded-pill" Text="Solicitar horário"/>
    </div>
    <script>
        $('#ContentPlaceHolder1_semrow').children().click(function () {
            $('#ContentPlaceHolder1_semrow').children().not(this).removeClass("active");
            $(this).toggleClass("active");
            $(this).attr("
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
