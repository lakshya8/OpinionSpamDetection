<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="shoppingDetails.aspx.cs" Inherits="shoppingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>E-Cart  Details</u></h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" 
        DataKeyNames="pid">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="pid" HeaderText="Product ID" SortExpression="pid" />
            <asp:BoundField DataField="pname" HeaderText="Product Name" SortExpression="pname" />
            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
            <asp:BoundField DataField="pdesc" HeaderText="Price Description" SortExpression="pdesc" />
            <asp:BoundField DataField="pdate" HeaderText="Purchase date" SortExpression="pdate" />
            <asp:BoundField DataField="username" HeaderText="User Name" 
                SortExpression="username" />
            <asp:CommandField ButtonType="Button" HeaderText="Delete Items" 
                ShowDeleteButton="True" ShowHeader="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:counselling %>" 
        SelectCommand="SELECT * FROM [tbl_temp] WHERE ([username] = @username)"
        
         DeleteCommand="DELETE FROM [tbl_temp] WHERE [pid] = @pid">
        <DeleteParameters>
            <asp:Parameter Name="pid" Type="Int32" />
        </DeleteParameters>
        
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="emailID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource><br />
    <asp:Button ID="Button1" runat="server" Text="Continue Shopping" Height="31px" 
        Width="168px" onclick="Button1_Click" /><br /><br /> 
    <asp:Button ID="Button2" runat="server" 
        Text="Check Out" Height="26px" Width="161px" onclick="Button2_Click" />
</center>
</asp:Content>

