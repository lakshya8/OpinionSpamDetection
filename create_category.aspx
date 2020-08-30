<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor.master" AutoEventWireup="true" CodeFile="create_category.aspx.cs" Inherits="create_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>Create Category</u></h1>
<table>
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Enter Category Name :"></asp:Label></td>

    <td>
        <asp:TextBox ID="txtcat" runat="server"></asp:TextBox></td>


</tr>
<tr>
<td colspan="2" style="text-align:center;">
    <asp:Button ID="Button1" runat="server" Text="Create Category" 
        onclick="Button1_Click" />

</td>



</tr>



</table>




</center>



</asp:Content>

