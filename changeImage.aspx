<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="changeImage.aspx.cs" Inherits="changeImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<asp:Image ID="Image1" runat="server" Height="280px" Width="180px" /><br />
    <asp:FileUpload ID="FileUpload1" runat="server" /><br />
    <asp:Button ID="Button2" runat="server" Text="Upload Image" 
        onclick="Button2_Click" />


</center>
</asp:Content>

