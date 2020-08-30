<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="project_Details.aspx.cs" Inherits="project_Details" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">     
        .ratingStar
        {
            font-size: 0pt;
            width: 13px;
            height: 12px;           
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
        }
        .filledStar
        {
            background-image: url(imageStar/Filled_Star.png);
        }
        .emptyStar
        {
            background-image: url(imageStar/Empty_Star.png);
        }
        .savedStar
        {
            background-image: url(imageStar/Saved_Star.png);
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    <center>
   
    <table>
<tr>
<td align="center">
 <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Image ID="Image1" runat="server" Height="150px" Width="150px" />

</td>

</tr>

</table></center>
<center>
<h1><u>Product Details</u></h1>
<table border="4">
<tr>
<td align="right"> ID :</td>
<td>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr>
<td align="right">Product Name :</td>
<td>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr>
<td align="right">Product Type :</td>
<td>
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr>
<td align="right">Product Price :</td>
<td>
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr>
<td align="right">Product  Description :</td>
<td>
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr>
<td align="right"> Upload Date :</td>
<td>
    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
</tr>

<tr>
<td  colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" Text="Book Product" 
        onclick="Button1_Click" />

</td>

</tr>

</table>
<table>
<tr>
<td>

        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <asp:GridView ID="gvData" runat="server">
        </asp:GridView>
        <br />
        <br />
        <asp:Literal ID="ltScripts" runat="server"></asp:Literal>
        <div id="piechart_3d" style="width: 500px; height: 400px;">
        </div>
   

</td>
<td>

        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <br />
        <asp:Literal ID="ltScripts2" runat="server"></asp:Literal>
        <div id="Div1" style="width: 500px; height: 400px;">
        </div>
    


</td>

</tr>
<tr>
<td>
<div class="row form-group">
								<div class="col-md-12">
									<label for="email">Rate Product</label>
									
                                         <asp:Rating ID="Rating2" runat="server" StarCssClass="ratingStar" WaitingStarCssClass="savedStar"
                        FilledStarCssClass="filledStar" EmptyStarCssClass="emptyStar" AutoPostBack="true" CurrentRating="1" MaxRating="5"
                        OnChanged="Rating1_Changed"></asp:Rating>
								</div>
							</div>
                             <div class="row form-group">
								<div class="col-md-12">
									<label for="email">You Rated: </label>
									 <asp:Label ID="Label6" runat="server"></asp:Label>
                                        
								</div>
							</div>

</td>


</tr>



</table>
<center><div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 animate-box">
						
							<h2><u>User Give Feedback</u></h2>

							
							
                            <div class="row form-group">
								<div class="col-md-12">
									<label for="email">Product Name</label>
									<asp:TextBox ID="txtname" runat="server" TextMode="SingleLine"  CssClass="form-control"
                                        class="form-control" ReadOnly></asp:TextBox>
                                        
								</div>
							</div>
                            <div class="row form-group">
								<div class="col-md-12">
									<label for="email">Description</label>
									
                                    <asp:TextBox ID="txtdes" runat="server" TextMode="MultiLine"  CssClass="form-control"
                                        class="form-control" Height="99px"></asp:TextBox>
								</div>
							</div>
                           
                           
							<div class="form-group text-center">
								
							</div>
                            <div class="form-group text-center">
                                         <asp:Button ID="Button3" runat="server" Text="SVM Classification" 
                                             class="btn btn-primary" onclick="Button3_Click" />
								
							</div>
                              <div class="form-group text-center">
                                         <asp:Button ID="Button4" runat="server" Text="Random Forest" 
                                             class="btn btn-primary" onclick="Button4_Click"  />
								
							</div>

							<div>
                            <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
                            </div>
					</div>
					
				</div>
			</div>
		</div></center>



</center>


</asp:Content>

