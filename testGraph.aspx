<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="testGraph.aspx.cs" Inherits="productDescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>Test Description</u></h1>
  <div>
    <table>
    <tr>
    <td>User Name :</td>
    <td>
        <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Text="ei" Value="ei"></asp:ListItem>
        <asp:ListItem Text="es" Value="es"></asp:ListItem>
        <asp:ListItem Text="ii" Value="ii"></asp:ListItem>
        <asp:ListItem Text="is" Value="is"></asp:ListItem>
        </asp:DropDownList>
        
    </td>
    <td>
        <asp:Button ID="Button1" runat="server" Text="View Graph" 
            onclick="Button1_Click" /></td>
    </tr>
    
    
    </table>
    
    </div>
<div>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <asp:GridView ID="gvData" runat="server">
        </asp:GridView>
        <br />
        <br />
        <asp:Literal ID="ltScripts" runat="server"></asp:Literal>
        <div id="piechart_3d" style="width: 900px; height: 500px;">
        </div>
    </div>

  



</center>



</asp:Content>

