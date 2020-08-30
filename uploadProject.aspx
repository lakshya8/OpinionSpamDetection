<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor.master" AutoEventWireup="true" CodeFile="uploadProject.aspx.cs" Inherits="uploadProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <h1><u>Upload Product</u></h1>
<table>
<tr>
<td align="right">
    <asp:Label ID="Label4" runat="server" Text="Image :"></asp:Label></td>

     <td colspan="2" align="center">
        <asp:Image ID="Image1" runat="server" Height="93px" Width="122px" CssClass="img-responsive" /><br />
    
    <asp:FileUpload ID="FileUpload1" runat="server" /><br />
   
    <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="Upload" Style="display: none"  CssClass="form-control"/>
    
     <script type="text/javascript">
         function UploadFile(fileUpload) {
             if (fileUpload.value != '') {
                 document.getElementById("<%=btnUpload.ClientID %>").click();
             }
         }
    </script>
        
    </td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label1" runat="server" Text="ID :"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox></td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label2" runat="server" Text="Item Category :"></asp:Label></td>
<td>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="cat_name" 
        DataValueField="cat_name">
    
  
    </asp:DropDownList>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:counselling %>" 
        
        SelectCommand="SELECT [cat_name] FROM [category_details] WHERE ([cname] = @cname)">
        <SelectParameters>
            <asp:SessionParameter Name="cname" SessionField="emailID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    </td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label5" runat="server" Text="Name :"></asp:Label></td>
<td>
    <asp:TextBox ID="txtName" runat="server" ReadOnly="false"></asp:TextBox></td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label3" runat="server" Text="Description :"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox></td>
</tr>

<tr>
<td align="right">Price :</td>
<td>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" Text="Upload Project" 
        onclick="Button1_Click" />
   </td>
</tr>

</table>

</center>
</asp:Content>

