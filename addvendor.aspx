<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="addvendor.aspx.cs" Inherits="addCanteen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>Add Vendor</u></h1>
<table>

<tr>
<td align="right">
    <asp:Label ID="Label2" runat="server" Text="Management Name:"></asp:Label></td>
    <td>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label3" runat="server" Text="Handler:"></asp:Label></td>
    <td>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label4" runat="server" Text="Mobile No:"></asp:Label></td>
    <td>
        <asp:TextBox ID="TextBox4" runat="server" MaxLength="10"></asp:TextBox></td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label5" runat="server" Text="No of Workers:"></asp:Label></td>
    <td>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label6" runat="server" Text="Address:"></asp:Label></td>
    <td>
        <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine"></asp:TextBox></td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label1" runat="server" Text="User ID:"></asp:Label></td>
    <td>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="SingleLine"></asp:TextBox></td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label7" runat="server" Text="Password:"></asp:Label></td>
    <td>
        <asp:TextBox ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox></td>
</tr>
<tr>
<td colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" Text="Add Vendor" 
        onclick="Button1_Click" Height="38px" Width="122px" />
</td>

</tr>
</table>


</center>
</asp:Content>

