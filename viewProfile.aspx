<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="viewProfile.aspx.cs" Inherits="viewProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>Registration Details</u></h1>
       <table border="5">
       <tr>
       <td align="right">
       <asp:Image ID="Image1" runat="server" Height="280px" Width="180px" /><br />
      <center> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/changeImage.aspx">Change Image</asp:HyperLink></center>
       
       </td>
       <td>
       
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="340px" 
        AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        DataSourceID="SqlDataSource1" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="userID" HeaderText="userID" 
                SortExpression="userID" />
            
            <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
            <asp:BoundField DataField="gender" HeaderText="gender" 
                SortExpression="gender" />
            <asp:BoundField DataField="father_Name" HeaderText="father_Name" 
                SortExpression="father_Name" />
            <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
            
            <asp:BoundField DataField="address" HeaderText="address" 
                SortExpression="address" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
            <asp:BoundField DataField="postal_Code" HeaderText="postal_Code" 
                SortExpression="postal_Code" />
            <asp:BoundField DataField="country" HeaderText="country" 
                SortExpression="country" />
            <asp:BoundField DataField="phone_no" HeaderText="phone_no" 
                SortExpression="phone_no" />
            <asp:BoundField DataField="rdate" HeaderText="rdate" SortExpression="rdate" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    </asp:DetailsView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:counselling %>" 
        SelectCommand="SELECT [userID], [emailID], [fname], [lname], [gender], [father_Name], [dob], [address], [city], [state], [postal_Code], [country], [phone_no], [rdate] FROM [registration] WHERE ([emailID] = @emailID)">
        <SelectParameters>
            <asp:SessionParameter Name="emailID" SessionField="emailID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
       
       </td>
       
       </tr>
       
       </table>
       
        
   


</center>
</asp:Content>

