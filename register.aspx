<%@ Page Title="" Language="C#" MasterPageFile="~/ContentHome.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
    .style1
    {
        width: 229px;
    }
        .bttn
        {}
    </style>
<script type="text/javascript" src="js/scw.js">
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
      
    <center>
<table id="Table2" align="center" 
        style="padding: 011; color: #ffffff; height: 476px;">
         <tr>
         <td>
             <asp:Label ID="Label18" runat="server" Text="Select Image To Upload :" ForeColor="Black"></asp:Label>
         </td>
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
            <asp:Label ID="Label17" runat="server" Text="User ID :" ForeColor="Black"></asp:Label></td>
        <td class="style1">
            <asp:TextBox ID="txtID" runat="server" Width="145" ReadOnly="true"></asp:TextBox></td>
            <td align="center" colspan="3" height="25">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label></td>  
        </tr>
        
        <tr style="color: #000000">
        <td align="right" height="25">
            <asp:Label ID="Label19" runat="server" Text="Email ID :"></asp:Label>
                </td>
               <td class="style1" >
                    <asp:TextBox ID="txtEmail" 
                        runat="server" Width="145px" ></asp:TextBox>
                        <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Enter a valid emailid" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                    </td>
                    <td align="right" style="width: 147px">
                        <asp:Label ID="Label20" runat="server" Text="Confirm Email ID :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtcEmail" runat="server" Width="145px"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ErrorMessage="Check Email ID" ControlToCompare="txtEmail" 
                            ControlToValidate="txtcEmail"></asp:CompareValidator>
                    </td>   
        

            
        </tr>
        <tr style="color: #000000">
        <td align="right" height="25">
                <asp:Label ID="Label1" runat="server" Text="First Name :"></asp:Label></td>
            <td class="style1">
                <span style="font-size: 7pt; color: #ff0000">&nbsp;</span><asp:TextBox ID="txtFname"
                    runat="server" ReadOnly="false" Width="145px"></asp:TextBox> 
                    </td>
                    <td align="right" style="width: 147px">
                    <asp:Label ID="Label15" runat="server" Text="Last Name :" ></asp:Label>
                    </td>
                    <td>
                    <asp:TextBox ID="txtLName"
                    runat="server" ReadOnly="false" Width="145px" maxlength="25"></asp:TextBox>
                    </td>
        </tr>
        <tr style="color: #000000">

         <td align="right">
            <asp:Label ID="Label16" runat="server" Text="Gender :" ForeColor="Black"></asp:Label></td>
        <td class="style1">
            <asp:RadioButtonList ID="radGen" runat="server" ForeColor="Black">
            <asp:ListItem Text="Male" Value="male"></asp:ListItem>
             <asp:ListItem Text="Female" Value="female"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
               
                            
                <td align="right" height="25">
                 <asp:Label ID="Label6" runat="server" ForeColor="Black" Text="Father's Name :"></asp:Label>
                    </td>
            <td>
                <asp:TextBox ID="txtFather" runat="server" CausesValidation="True" MaxLength="30"
                    TabIndex="3" Width="145px"></asp:TextBox>
                </td>
            
                    
        </tr>
        <tr style="color: #000000">
        <td align="right" height="25">
                <asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label></td>
            <td class="style1" >
                <asp:TextBox 
                    ID="txtPass" runat="server" MaxLength="15" TabIndex="1" TextMode="Password"
                    Width="145px"></asp:TextBox>
                    </td>
                    <td align="right" style="width: 147px">
                    <asp:Label ID="Label14" runat="server" Text="Confirm Password :"></asp:Label>
                    </td>
                    <td>
                    <asp:TextBox ID="txtcPass" runat="server" MaxLength="15" TabIndex="1" TextMode="Password"
                    Width="145px"></asp:TextBox>
                   
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ErrorMessage="Check Password" ControlToCompare="txtPass" 
                            ControlToValidate="txtcPass"></asp:CompareValidator>
                   
                    </td>
        </tr>
        
         <tr>
            <td align="right" height="25">
                <asp:Label ID="Label13" runat="server" ForeColor="Black" Text="Date Of Birth :"></asp:Label>
            </td>
            <td class="style1">
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="false" Width="145" onclick="showCal(this, event)"></asp:TextBox>
             
               <td align="right"  >
                    &nbsp;</td>
                    <td>
                        &nbsp;</td>
        
               
        </tr>
       
        <tr>
            <td align="right" height="25">
                <asp:Label ID="Label4" runat="server" ForeColor="Black" Text="Address :"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="txtAdd" runat="server" CausesValidation="True" Height="58px"
                    MaxLength="250" TabIndex="7" TextMode="MultiLine" Width="150px"></asp:TextBox>
                </td>
                     <td align="right" height="25">
                <asp:Label ID="Label5" runat="server" ForeColor="Black" Text="City :"></asp:Label>
            </td>
            <td>
                
                <asp:TextBox ID="txtCity" runat="server" Width="145"></asp:TextBox>
            </td>
        </tr>
        <tr>
             <td align="right" height="25">
                <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="State :"></asp:Label>
            </td>
            <td class="style1" >
                <asp:DropDownList ID="txtState" runat="server" TabIndex="9" Width="145px">
                    <asp:ListItem Text="----Select----" Value="n"></asp:ListItem>
                    <asp:ListItem Text="Andhra Pradesh"></asp:ListItem>
                    <asp:ListItem Text="Assam"></asp:ListItem>
                    <asp:ListItem Text="Bihar"></asp:ListItem>
                    <asp:ListItem Text="Chhattisgarh"></asp:ListItem>
                    <asp:ListItem Text="Goa"></asp:ListItem>
                    <asp:ListItem Text="Gujarat"></asp:ListItem>
                    <asp:ListItem Text="Haryana"></asp:ListItem>
                    <asp:ListItem Text="Jammu and Kasmir"></asp:ListItem>
                    <asp:ListItem Text="Jharkhand"></asp:ListItem>
                    <asp:ListItem Text="Karnataka"></asp:ListItem>
                    <asp:ListItem Text="Maharashtra"></asp:ListItem>
                    <asp:ListItem Text="Madhya Pradesh"></asp:ListItem>
                     <asp:ListItem Text="Manipur"></asp:ListItem>
                      <asp:ListItem Text="Meghalaya"></asp:ListItem>
                       <asp:ListItem Text="Mizoram"></asp:ListItem>
                        <asp:ListItem Text="Nagaland"></asp:ListItem>
                         <asp:ListItem Text="New Delhi"></asp:ListItem>
                          <asp:ListItem Text="Orissa"></asp:ListItem>
                            <asp:ListItem Text="Punjab"></asp:ListItem>
                             <asp:ListItem Text="Rajasthan"></asp:ListItem>
                            <asp:ListItem Text="Sikkim"></asp:ListItem>
                              <asp:ListItem Text="Tamil Nadu"></asp:ListItem>
             <asp:ListItem Text="Tripura"></asp:ListItem>
              <asp:ListItem Text="Uttar Pradesh"></asp:ListItem>
             <asp:ListItem Text="Uttarakhand"></asp:ListItem>
                               <asp:ListItem Text="West Bengal"></asp:ListItem>
                                                          
                                                           
      
                </asp:DropDownList>
                
            </td>
            <td align="right" height="25">
                <asp:Label ID="Label21" runat="server" ForeColor="Black" Text="Postal Code :"></asp:Label>
            </td>
            <td colspan="2">
                &nbsp;<asp:TextBox ID="txtPostal" runat="server" CausesValidation="True" MaxLength="6"
                    TabIndex="10" Width="145px"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td align="right" height="25">
                <asp:Label ID="Label7" runat="server" ForeColor="Black" Text="Country :"></asp:Label></td>
            <td class="style1">
                <asp:DropDownList ID="txtCountry" runat="server" TabIndex="9" 
                    Width="145px">
                    <asp:ListItem Text="----Select----" Value="n"></asp:ListItem>
                    <asp:ListItem Text="India"></asp:ListItem>
                   
                </asp:DropDownList>
            </td>
             <td align="right" height="25">
                <asp:Label ID="Label8" runat="server" ForeColor="Black" Text="Phone No :"></asp:Label>
            </td>
            <td colspan="2">
                &nbsp;<asp:TextBox ID="txtPone" runat="server" CausesValidation="True" MaxLength="10"
                    TabIndex="10" Width="145px"></asp:TextBox >
                
                
            </td>
        </tr>
        <tr>
 <td td align="right" height="25"><asp:Label ID="Label11" runat="server" ForeColor="Black" Text="User Type :"></asp:Label>
    </td>
    <td>
            <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Text="Recycler" Value="Recycler"></asp:ListItem>
          
            </asp:DropDownList>
            </td>

  <td td align="right" height="25">
    <asp:Label ID="Label10" runat="server" Text="Enter Aadhar No:" ForeColor="Black"></asp:Label>
</td>
<td>
    &nbsp;
    <asp:TextBox ID="txtAdhar" runat="server" MaxLength="12" Width="145"></asp:TextBox>

</td>
   
</tr>
<tr>
<td>
    <asp:Label ID="Label12" runat="server" Visible="false" Text="Finger Print Value :" ForeColor="Black"></asp:Label></td>
    <td colspan="3">
    
    <asp:TextBox ID="txtIsoTemplate" runat="server" Visible="false" class="form-control" 
            TextMode="MultiLine" Width="548px"></asp:TextBox>
    </td>

</tr>

        <tr>
            <td align="center" colspan="4" style="height: 24px">
                <asp:Button ID="Button1" runat="server" CssClass="bttn" 
                    Text="Register" onclick="Button1_Click1" Width="260px" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
        </tr>
    </table>
</center>
</asp:Content>

