<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="NB2.aspx.cs" Inherits="feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<table>
<tr>
<td colspan=2>
    <asp:Label ID="Label9" runat="server" Text="Label" ForeColor="Red"></asp:Label></td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label1" runat="server" Text="Card No :"></asp:Label></td>
<td>
    <asp:TextBox ID="txtDonate" runat="server"></asp:TextBox></td>
</tr>

<tr>
<td colspan="2">
   <center> <asp:Button ID="Button1" runat="server" Text="Check for Credit Card" 
        onclick="Button1_Click" /></center>
        
        </td>
</tr>

</table>

</center>
</asp:Content>

