<%@ Page Title="" Language="C#" MasterPageFile="~/ContentHome.master" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="chat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <center><h1><u>Chat Module</u></h1></center>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <center>
    <asp:ListBox ID="ListBox1" runat="server" Height="225px" Width="673px" 
            BackColor="#FFCCCC"></asp:ListBox><br />
    <br />
        
       <%-- <asp:Label ID="Label1" runat="server" Text=" Select Catogory :" ForeColor="Black" />
        <asp:DropDownList ID="DropDownList1" runat="server">
   <asp:ListItem Text="Campuses"></asp:ListItem>
   <asp:ListItem Text="Branch"></asp:ListItem>
   <asp:ListItem Text="Faculty"></asp:ListItem>
        </asp:DropDownList>--%>
  <br />
    <asp:Label ID="Label2" runat="server" Text=" Message:" ForeColor="Black" />
    <asp:TextBox ID="TextBox1" runat="server" Height="30" Width="504px" 
            BackColor="#FFCCCC"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Send" onclick="Button1_Click" 
            Height="30" Width="120" BackColor="#6600CC" />
    </center>
     </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

