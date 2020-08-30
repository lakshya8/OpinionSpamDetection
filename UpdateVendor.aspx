<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="UpdateVendor.aspx.cs" Inherits="manageBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="background-color: #FFFFCC;" >
<h1  style="color:ActiveCaption; color:#003300; font-family:Arial, Helvetica, sans-serif; font:bolder; font-size: xx-large; font-weight: bolder; font-style: normal; font-variant: normal; text-decoration: underline;">Update Vendor Details</h1>
   <br /><br /><br />
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" GridLines="None" DataKeyNames="cid" 
            onrowcancelingedit="GridView1_RowCancelingEdit" 
            onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
            onrowupdating="GridView1_RowUpdating" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("cid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           
            <asp:TemplateField HeaderText="Management Name">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("mname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Handler Name">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("hname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile No">
                <ItemTemplate>
                    <asp:Label ID="Label51" runat="server"  Text='<%# Eval("mobile") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Worker">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("total_worker") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label91" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
           
            <asp:CommandField HeaderText="Update Profile" 
                ShowEditButton="True" ShowDeleteButton="true" ShowHeader="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
</center>
</asp:Content>

