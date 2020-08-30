<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor.master" AutoEventWireup="true" CodeFile="vandor_viewProfile.aspx.cs" Inherits="viewProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>Registration Details</u></h1>
       <table border="5">
       <tr>
      
       <td>
       
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="340px" 
        AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        DataSourceID="SqlDataSource3" GridLines="Vertical" DataKeyNames="cid">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="cid" HeaderText="Canteen ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="cid" />
                <asp:BoundField DataField="mname" HeaderText="Management Name" SortExpression="mname" />
                <asp:BoundField DataField="hname" HeaderText="Handler Name" SortExpression="hname" />
                <asp:BoundField DataField="mobile" HeaderText="Mobile" 
                    SortExpression="mobile" />
                <asp:BoundField DataField="total_worker" HeaderText="Total Worker" 
                    SortExpression="total_worker" />
                <asp:BoundField DataField="address" HeaderText="Address" 
                    SortExpression="address" />
                <asp:BoundField DataField="emailid" HeaderText="Email ID" 
                    SortExpression="emailid" />
            </Fields>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    </asp:DetailsView>


           <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
               ConnectionString="<%$ ConnectionStrings:counselling %>" 
               SelectCommand="SELECT * FROM [Vendor] WHERE ([emailid] = @emailid)">
               <SelectParameters>
                   <asp:SessionParameter Name="emailid" SessionField="emailid" Type="String" />
               </SelectParameters>
           </asp:SqlDataSource>
           <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>


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

