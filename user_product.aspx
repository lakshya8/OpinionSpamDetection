<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="user_product.aspx.cs" Inherits="user_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <asp:GridView ID="gvData" runat="server">
        </asp:GridView>
   <table>
   <tr>
   <td>Select Product Type :</td>
   <td>
       <asp:DropDownList ID="DropDownList1" runat="server" 
           DataSourceID="SqlDataSource1" DataTextField="cat_name" 
           DataValueField="cat_name">
   
  
    </asp:DropDownList>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:counselling %>" 
           SelectCommand="SELECT [cat_name] FROM [category_details]"></asp:SqlDataSource>
   </td>
   <td>
       &nbsp;</td>
   </tr>
   
   </table>
    
    <div>
<asp:DataList ID="DataList1" runat="server"
        HorizontalAlign="Center" RepeatDirection="Horizontal" CellSpacing="40" RepeatColumns="4"  
           onitemcommand="DataList1_ItemCommand">
           <ItemStyle />
            <ItemTemplate>
           <table>
           <tr>
           <td align="center"><asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("pid") %>' runat="server"><asp:Image ID="Image1"   runat="server"  ImageAlign="Left" ImageUrl='<%# Eval("pimage") %>' Height="150px" Width="150px" /></asp:LinkButton><br /><br /><asp:Label ID="fruitnameLabel" CssClass="alignleft"  runat="server" Text='<%# Eval("pspl") %>' /><br />Rs:<asp:Label ID="Label1" CssClass="alignleft"  runat="server" Text='<%# Eval("price") %>' /></td>
           
           </tr>
           
           </table>
           </ItemTemplate>
        </asp:DataList>
</div></center>
  
</asp:Content>

