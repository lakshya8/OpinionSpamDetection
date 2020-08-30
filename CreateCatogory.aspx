<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor.master" AutoEventWireup="true" CodeFile="CreateCatogory.aspx.cs" Inherits="CreateCatogory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>Create Catogory</u></h1>
<table>
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Create Catogory :"></asp:Label></td>

    <td>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </td>

</tr>
<tr>
<td colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" Text="Create Catogory" 
        onclick="Button1_Click" />
</td>

</tr>


</table>



</center>



</asp:Content>

