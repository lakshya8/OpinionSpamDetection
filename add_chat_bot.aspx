<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="add_chat_bot.aspx.cs" Inherits="add_chat_bot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>Admin Add Chat Question</u></h1>
<table>
<tr>
<td align="right">
    <asp:Label ID="Label1" runat="server" Text="Message :" ForeColor="Black"></asp:Label></td>
    <td>
        <asp:TextBox ID="TextBox1" runat="server" Height="30" Width="170"></asp:TextBox></td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label2" runat="server" Text="Bot Reply :" ForeColor="Black"></asp:Label></td>
    <td>
        <asp:TextBox ID="TextBox2" runat="server" Height="30" Width="170"></asp:TextBox></td>
</tr>
<tr>
<td colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" Text="Add Question" Height="30" Width="170"
        onclick="Button1_Click" />

</td>


</tr>


</table>




</center>



</asp:Content>

