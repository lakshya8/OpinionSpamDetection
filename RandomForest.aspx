<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="RandomForest.aspx.cs" Inherits="GaussianClassifier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/scw.js">
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>View Prediction of Product Using Random Forest</u></h1>
<table>
<tr>
<td align="right"><asp:Label ID="Label7" runat="server" Text="Product Name :"></asp:Label></td>
<td>
<asp:TextBox ID="TextBox1" runat="server" Width="336px"></asp:TextBox>
</td>

</tr>
<tr>
<td align="right"><asp:Label ID="Label1" runat="server" Text="Product Description :"></asp:Label></td>
<td>
<asp:TextBox ID="TextBox2" runat="server" Width="336px"></asp:TextBox>
</td>

</tr>
<tr>
<td colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" 
        Text="Predict Using Random Forest" onclick="Button1_Click" />

</td>


</tr>
<tr>
<td colspan="2">
    <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>

</td>

</tr>

</table>




</center>




</asp:Content>

