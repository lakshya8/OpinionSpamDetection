<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login_ajaxtest.aspx.cs" Inherits="ajaxtest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

        function JqueryAjaxCall() {
            var pageUrl = '<%= ResolveUrl("~/ajaxtest.aspx/jqueryAjaxCall") %>';
            var firstName = $("#<%= txtFirstName.ClientID %>").val();
            var lastName = $("#<%= txtLastName.ClientID %>").val();
            var parameter = { "firstName": firstName, "lastName": lastName }

            $.ajax({
                type: 'POST',
                url: pageUrl,
                data: JSON.stringify(parameter),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    onSuccess(data);
                },
                error: function (data, success, error) {
                    alert("Error : " + error);
                }
            });

            return false;
        }

        function onSuccess(data) {
            alert(data.d);
        }
        function saveInDB() {
            try {
                document.getElementById('txtStatus').value = "";
                document.getElementById('imgFinger').src = "data:image/bmp;base64,";
                document.getElementById('txtImageInfo').value = "";
                document.getElementById('txtIsoTemplate').value = "";
                document.getElementById('txtAnsiTemplate').value = "";
                document.getElementById('txtIsoImage').value = "";
                document.getElementById('txtRawData').value = "";
                document.getElementById('txtWsqData').value = "";

                var res = CaptureFinger(quality, timeout);
                if (res.httpStaus) {

                    document.getElementById('txtStatus').value = "ErrorCode: " + res.data.ErrorCode + " ErrorDescription: " + res.data.ErrorDescription;

                    if (res.data.ErrorCode == "0") {
                        document.getElementById('imgFinger').src = "data:image/bmp;base64," + res.data.BitmapData;
                        var imageinfo = "Quality: " + res.data.Quality + " Nfiq: " + res.data.Nfiq + " W(in): " + res.data.InWidth + " H(in): " + res.data.InHeight + " area(in): " + res.data.InArea + " Resolution: " + res.data.Resolution + " GrayScale: " + res.data.GrayScale + " Bpp: " + res.data.Bpp + " WSQCompressRatio: " + res.data.WSQCompressRatio + " WSQInfo: " + res.data.WSQInfo;
                        document.getElementById('txtImageInfo').value = imageinfo;
                        document.getElementById('txtIsoTemplate').value = res.data.IsoTemplate;
                        document.getElementById('txtAnsiTemplate').value = res.data.AnsiTemplate;
                        document.getElementById('txtIsoImage').value = res.data.IsoImage;
                        document.getElementById('txtRawData').value = res.data.RawData;
                        document.getElementById('txtWsqData').value = res.data.WsqImage;
                    }
                }
                else {
                    alert(res.err);
                }
            }
            catch (e) {
                alert(e);
            }
          
            var pageUrl = '<%= ResolveUrl("~/ajaxtest.aspx/saveInDB") %>';
            var value = $("#<%= txtIsoTemplate.ClientID %>").val();

            var parameter = { "value": value}

            $.ajax({
                type: 'POST',
                url: pageUrl,
                data: JSON.stringify(parameter),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    onSuccess(data);
                },
                error: function (data, success, error) {
                    alert("Error : " + error);
                }
            });

            return false;
        }

        function onSuccess(data) {
            alert(data.d);
        }

        function captureMatch() {
            try {
                document.getElementById('txtStatus').value = "";
                document.getElementById('imgFinger').src = "data:image/bmp;base64,";
                document.getElementById('txtImageInfo').value = "";
                document.getElementById('txtIsoTemplate').value = "";
                document.getElementById('txtAnsiTemplate').value = "";
                document.getElementById('txtIsoImage').value = "";
                document.getElementById('txtRawData').value = "";
                document.getElementById('txtWsqData').value = "";

                var res = CaptureFinger(quality, timeout);
                if (res.httpStaus) {

                    document.getElementById('txtStatus').value = "ErrorCode: " + res.data.ErrorCode + " ErrorDescription: " + res.data.ErrorDescription;

                    if (res.data.ErrorCode == "0") {
                        document.getElementById('imgFinger').src = "data:image/bmp;base64," + res.data.BitmapData;
                        var imageinfo = "Quality: " + res.data.Quality + " Nfiq: " + res.data.Nfiq + " W(in): " + res.data.InWidth + " H(in): " + res.data.InHeight + " area(in): " + res.data.InArea + " Resolution: " + res.data.Resolution + " GrayScale: " + res.data.GrayScale + " Bpp: " + res.data.Bpp + " WSQCompressRatio: " + res.data.WSQCompressRatio + " WSQInfo: " + res.data.WSQInfo;
                        document.getElementById('txtImageInfo').value = imageinfo;
                        document.getElementById('txtIsoTemplate').value = res.data.IsoTemplate;
                        document.getElementById('txtAnsiTemplate').value = res.data.AnsiTemplate;
                        document.getElementById('txtIsoImage').value = res.data.IsoImage;
                        document.getElementById('txtRawData').value = res.data.RawData;
                        document.getElementById('txtWsqData').value = res.data.WsqImage;
                    }
                }
                else {
                    alert(res.err);
                }
            }
            catch (e) {
                alert(e);
            }

            var pageUrl = '<%= ResolveUrl("~/ajaxtest.aspx/getFingerPrint") %>';
          

            var parameter = { "value": "userid" }

            $.ajax({
                type: 'POST',
                url: pageUrl,
                data: JSON.stringify(parameter),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    onSuccess(data);
                },
                error: function (data, success, error) {
                    alert("Data : " + data);
                    
                }
            });

            return false;
        }

        function onSuccess(data) {
            alert(data.d);
            try {
                var isotemplate = document.getElementById('txtIsoTemplate').value;
                var res = VerifyFinger(data.d, isotemplate);

                if (res.httpStaus) {
                    if (res.data.Status) {
                        alert("Finger matched");
                    }
                    else {
                        if (res.data.ErrorCode != "0") {
                            alert(res.data.ErrorDescription);
                        }
                        else {
                            alert("Finger not matched");
                        }
                    }
                }
                else {
                    alert(res.err);
                }
            }
            catch (e) {
                alert(e);
            }
        }
    </script>
     <script src="jquery-1.8.2.js"></script>
    <script src="mfs100-9.0.2.6.js"></script>
    <script language="javascript" type="text/javascript">


        var quality = 60; //(1 to 100) (recommanded minimum 55)
        var timeout = 10; // seconds (minimum=10(recommanded), maximum=60, unlimited=0 )

        function GetInfo() {
            document.getElementById('tdSerial').innerHTML = "";
            document.getElementById('tdCertification').innerHTML = "";
            document.getElementById('tdMake').innerHTML = "";
            document.getElementById('tdModel').innerHTML = "";
            document.getElementById('tdWidth').innerHTML = "";
            document.getElementById('tdHeight').innerHTML = "";
            document.getElementById('tdLocalMac').innerHTML = "";
            document.getElementById('tdLocalIP').innerHTML = "";
            document.getElementById('tdSystemID').innerHTML = "";
            document.getElementById('tdPublicIP').innerHTML = "";


            var key = document.getElementById('txtKey').value;

            var res;
            if (key.length == 0) {
                res = GetMFS100Info();
            }
            else {
                res = GetMFS100KeyInfo(key);
            }

            if (res.httpStaus) {

                document.getElementById('txtStatus').value = "ErrorCode: " + res.data.ErrorCode + " ErrorDescription: " + res.data.ErrorDescription;

                if (res.data.ErrorCode == "0") {
                    document.getElementById('tdSerial').innerHTML = res.data.DeviceInfo.SerialNo;
                    document.getElementById('tdCertification').innerHTML = res.data.DeviceInfo.Certificate;
                    document.getElementById('tdMake').innerHTML = res.data.DeviceInfo.Make;
                    document.getElementById('tdModel').innerHTML = res.data.DeviceInfo.Model;
                    document.getElementById('tdWidth').innerHTML = res.data.DeviceInfo.Width;
                    document.getElementById('tdHeight').innerHTML = res.data.DeviceInfo.Height;
                    document.getElementById('tdLocalMac').innerHTML = res.data.DeviceInfo.LocalMac;
                    document.getElementById('tdLocalIP').innerHTML = res.data.DeviceInfo.LocalIP;
                    document.getElementById('tdSystemID').innerHTML = res.data.DeviceInfo.SystemID;
                    document.getElementById('tdPublicIP').innerHTML = res.data.DeviceInfo.PublicIP;
                }
            }
            else {
                alert(res.err);
            }
            return false;
        }

        function Capture() {
            try {
                document.getElementById('txtStatus').value = "";
                document.getElementById('imgFinger').src = "data:image/bmp;base64,";
                document.getElementById('txtImageInfo').value = "";
                document.getElementById('txtIsoTemplate').value = "";
                document.getElementById('txtAnsiTemplate').value = "";
                document.getElementById('txtIsoImage').value = "";
                document.getElementById('txtRawData').value = "";
                document.getElementById('txtWsqData').value = "";

                var res = CaptureFinger(quality, timeout);
                if (res.httpStaus) {

                    document.getElementById('txtStatus').value = "ErrorCode: " + res.data.ErrorCode + " ErrorDescription: " + res.data.ErrorDescription;

                    if (res.data.ErrorCode == "0") {
                        document.getElementById('imgFinger').src = "data:image/bmp;base64," + res.data.BitmapData;
                        var imageinfo = "Quality: " + res.data.Quality + " Nfiq: " + res.data.Nfiq + " W(in): " + res.data.InWidth + " H(in): " + res.data.InHeight + " area(in): " + res.data.InArea + " Resolution: " + res.data.Resolution + " GrayScale: " + res.data.GrayScale + " Bpp: " + res.data.Bpp + " WSQCompressRatio: " + res.data.WSQCompressRatio + " WSQInfo: " + res.data.WSQInfo;
                        document.getElementById('txtImageInfo').value = imageinfo;
                        document.getElementById('txtIsoTemplate').value = res.data.IsoTemplate;
                        document.getElementById('txtAnsiTemplate').value = res.data.AnsiTemplate;
                        document.getElementById('txtIsoImage').value = res.data.IsoImage;
                        document.getElementById('txtRawData').value = res.data.RawData;
                        document.getElementById('txtWsqData').value = res.data.WsqImage;
                    }
                }
                else {
                    alert(res.err);
                }
            }
            catch (e) {
                alert(e);
            }
            return false;
        }

        function Verify() {
            try {
                var isotemplate = document.getElementById('txtIsoTemplate').value;
                var res = VerifyFinger(isotemplate, isotemplate);

                if (res.httpStaus) {
                    if (res.data.Status) {
                        alert("Finger matched");
                    }
                    else {
                        if (res.data.ErrorCode != "0") {
                            alert(res.data.ErrorDescription);
                        }
                        else {
                            alert("Finger not matched");
                        }
                    }
                }
                else {
                    alert(res.err);
                }
            }
            catch (e) {
                alert(e);
            }
            return false;

        }

        function Match() {
            try {
                var isotemplate = document.getElementById('txtIsoTemplate').value;
                var res = MatchFinger(quality, timeout, isotemplate);

                if (res.httpStaus) {
                    if (res.data.Status) {
                        alert("Finger matched");
                    }
                    else {
                        if (res.data.ErrorCode != "0") {
                            alert(res.data.ErrorDescription);
                        }
                        else {
                            alert("Finger not matched");
                        }
                    }
                }
                else {
                    alert(res.err);
                }
            }
            catch (e) {
                alert(e);
            }
            return false;

        }

        function GetPid() {
            try {
                var isoTemplateFMR = document.getElementById('txtIsoTemplate').value;
                var isoImageFIR = document.getElementById('txtIsoImage').value;

                var Biometrics = Array(); // You can add here multiple FMR value
                Biometrics["0"] = new Biometric("FMR", isoTemplateFMR, "UNKNOWN", "", "");

                var res = GetPidData(Biometrics);
                if (res.httpStaus) {
                    if (res.data.ErrorCode != "0") {
                        alert(res.data.ErrorDescription);
                    }
                    else {
                        document.getElementById('txtPid').value = res.data.PidData.Pid
                        document.getElementById('txtSessionKey').value = res.data.PidData.Sessionkey
                        document.getElementById('txtHmac').value = res.data.PidData.Hmac
                        document.getElementById('txtCi').value = res.data.PidData.Ci
                        document.getElementById('txtPidTs').value = res.data.PidData.PidTs
                    }
                }
                else {
                    alert(res.err);
                }

            }
            catch (e) {
                alert(e);
            }
            return false;
        }
        function GetProtoPid() {
            try {
                var isoTemplateFMR = document.getElementById('txtIsoTemplate').value;
                var isoImageFIR = document.getElementById('txtIsoImage').value;

                var Biometrics = Array(); // You can add here multiple FMR value
                Biometrics["0"] = new Biometric("FMR", isoTemplateFMR, "UNKNOWN", "", "");

                var res = GetProtoPidData(Biometrics);
                if (res.httpStaus) {
                    if (res.data.ErrorCode != "0") {
                        alert(res.data.ErrorDescription);
                    }
                    else {
                        document.getElementById('txtPid').value = res.data.PidData.Pid
                        document.getElementById('txtSessionKey').value = res.data.PidData.Sessionkey
                        document.getElementById('txtHmac').value = res.data.PidData.Hmac
                        document.getElementById('txtCi').value = res.data.PidData.Ci
                        document.getElementById('txtPidTs').value = res.data.PidData.PidTs
                    }
                }
                else {
                    alert(res.err);
                }

            }
            catch (e) {
                alert(e);
            }
            return false;
        }
        function GetRbd() {
            try {
                var isoTemplateFMR = document.getElementById('txtIsoTemplate').value;
                var isoImageFIR = document.getElementById('txtIsoImage').value;

                var Biometrics = Array();
                Biometrics["0"] = new Biometric("FMR", isoTemplateFMR, "LEFT_INDEX", 2, 1);
                Biometrics["1"] = new Biometric("FMR", isoTemplateFMR, "LEFT_MIDDLE", 2, 1);
                // Here you can pass upto 10 different-different biometric object.


                var res = GetRbdData(Biometrics);
                if (res.httpStaus) {
                    if (res.data.ErrorCode != "0") {
                        alert(res.data.ErrorDescription);
                    }
                    else {
                        document.getElementById('txtPid').value = res.data.RbdData.Rbd
                        document.getElementById('txtSessionKey').value = res.data.RbdData.Sessionkey
                        document.getElementById('txtHmac').value = res.data.RbdData.Hmac
                        document.getElementById('txtCi').value = res.data.RbdData.Ci
                        document.getElementById('txtPidTs').value = res.data.RbdData.RbdTs
                    }
                }
                else {
                    alert(res.err);
                }

            }
            catch (e) {
                alert(e);
            }
            return false;
        }

        function GetProtoRbd() {
            try {
                var isoTemplateFMR = document.getElementById('txtIsoTemplate').value;
                var isoImageFIR = document.getElementById('txtIsoImage').value;

                var Biometrics = Array();
                Biometrics["0"] = new Biometric("FMR", isoTemplateFMR, "LEFT_INDEX", 2, 1);
                Biometrics["1"] = new Biometric("FMR", isoTemplateFMR, "LEFT_MIDDLE", 2, 1);
                // Here you can pass upto 10 different-different biometric object.


                var res = GetProtoRbdData(Biometrics);
                if (res.httpStaus) {
                    if (res.data.ErrorCode != "0") {
                        alert(res.data.ErrorDescription);
                    }
                    else {
                        document.getElementById('txtPid').value = res.data.RbdData.Rbd
                        document.getElementById('txtSessionKey').value = res.data.RbdData.Sessionkey
                        document.getElementById('txtHmac').value = res.data.RbdData.Hmac
                        document.getElementById('txtCi').value = res.data.RbdData.Ci
                        document.getElementById('txtPidTs').value = res.data.RbdData.RbdTs
                    }
                }
                else {
                    alert(res.err);
                }

            }
            catch (e) {
                alert(e);
            }
            return false;
        }
    </script>
</head>
  
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="3" cellspacing="0" style="width: 25%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="First Name:" Visible="false"></asp:Label>
                </td>
                <td>
                
                    <asp:TextBox ID="txtFirstName" runat="server" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Last Name:" Visible="false"></asp:Label> 
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" OnClientClick="return JqueryAjaxCall();"
                        Text="Submit" Visible="false" />
                    
                </td>
                
            </tr>
        </table>
           <table width="100%" style="padding-top:0px;">
        <tr>
            <td colspan="3" align="center" style="color: #428BCA; font-size: 20px; font-weight:bold;">
                Online Voting System
            </td>
        </tr>

        <tr>
            <td colspan="3" align="center" style="color: red; font-size: 14px;">
               
            </td>
        </tr>

        <tr>
            <td width="200px;">
                <table align="left" border="0" width="100%">
                    <tr>
                        <td>
                        <asp:Button ID="Button2" runat="server" class="btn btn-primary btn-100" OnClientClick="return GetInfo()" Text="Init" />
                            <input type="hidden" id="btnInfo" value="Get Info" class="btn btn-primary btn-100" onclick="return GetInfo()"  />
                        </td>
                        <td>
                            <input type="hidden" id="btnCapture" value="Capture" class="btn btn-primary btn-100" onclick="return Capture()" Visible="false" />
                              <asp:Button ID="Button4" runat="server" OnClientClick="return saveInDB()" Text="Capture1" Visible="false"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="hidden" id="btnCaptureAndMatch" value="Capture and Match" class="btn btn-primary btn-200" onclick="return Match()" Visible="false" />
                              <asp:Button ID="Button5" runat="server" OnClientClick="return captureMatch()" 
                                Text="Capture & Match" Visible="true"  />
                    
                        </td>
                    </tr>
                    <tr>
                    <td colspan="2">
                        <asp:Button ID="Button3" runat="server" Text="Navigate To Profile" 
                            class="btn btn-primary btn-200"  Visible="true" onclick="Button3_Click" />

                    </td>
                    
                    </tr>
                    
                </table>
            </td>
            <td width="150px" height="190px" align="center" class="img">
                <img id="imgFinger" width="145px" height="188px" alt="Finger Image" />
            </td>
            <td>
                <table align="left" border="0" style="width:100%; padding-right:20px;">
                    <tr>
                        <td style="width: 100px;">Key:</td>
                        <td colspan="3">
                            <input type="text" value="" id="txtKey" class="form-control" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 100px;">Serial No:</td>
                        <td align="left" style="width: 150px;" id="tdSerial"></td>
                        <td align="left" style="width: 100px;">Certification:</td>
                        <td align="left" id="tdCertification"></td>
                    </tr>
                    <tr>
                        <td align="left">Make:</td>
                        <td align="left" id="tdMake"></td>
                        <td align="left">Model:</td>
                        <td align="left" id="tdModel"></td>
                    </tr>
                    <tr>
                        <td align="left">Width:</td>
                        <td align="left" id="tdWidth"></td>
                        <td align="left">Height:</td>
                        <td align="left" id="tdHeight"></td>
                    </tr>
                    <tr>
                        <td align="left">Local IP</td>
                        <td align="left" id="tdLocalIP"></td>
                        <td align="left">Local MAC:</td>
                        <td align="left" id="tdLocalMac"></td>
                    </tr>
                    <tr>
                        <td align="left">Public IP</td>
                        <td align="left" id="tdPublicIP"></td>
                        <td align="left">System ID</td>
                        <td align="left" id="tdSystemID"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div class="panel">
        <table width="100%">
            <tr>
                <td width="220px">
                    Status:
                </td>
                <td>
                    <input type="text" value="" id="txtStatus" class="form-control" />
                </td>
            </tr>
            <tr>
                <td>
                    Quality:
                </td>
                <td>
                    <input type="text" value="" id="txtImageInfo" class="form-control" />
                </td>
            </tr>
            <!--<tr>
                <td>
                    NFIQ:
                </td>
                <td>
                    <input type="text" value="" id="txtNFIQ" class="form-control" />
                </td>
            </tr>-->
            <tr>
                <td>
                    Base64Encoded ISO Template
                </td>
                <td>
                    <textarea id="txtIsoTemplate" runat="server" style="width: 100%; height:50px;" class="form-control"> </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Base64Encoded ANSI Template
                </td>
                <td>
                <%--<asp:TextBox ID="txtAnsiTemplate" runat="server" style="width: 100%; height:50px;" class="form-control" TextMode="MultiLine"></asp:TextBox>--%>
                    <textarea id="txtAnsiTemplate" style="width: 100%; height:50px;" class="form-control" > </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Base64Encoded ISO Image
                </td>
                <td>
                    
                    <textarea id="txtIsoImage" style="width: 100%; height:50px;" class="form-control"> </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Base64Encoded Raw Data
                </td>
                <td>
                    <textarea id="txtRawData" style="width: 100%; height:50px;" class="form-control"> </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Base64Encoded Wsq Image Data
                </td>
                <td>
                    <textarea id="txtWsqData" style="width: 100%; height:50px;" class="form-control"> </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Encrypted Base64Encoded Pid/Rbd
                </td>
                <td>
                    <textarea id="txtPid" style="width: 100%; height:50px;" class="form-control"> </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Encrypted Base64Encoded Session Key
                </td>
                <td>
                    <textarea id="txtSessionKey" style="width: 100%; height:50px;" class="form-control"> </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Encrypted Base64Encoded Hmac
                </td>
                <td>
                    <input type="text" value="" id="txtHmac" class="form-control" />

                </td>
            </tr>
            <tr>
                <td>
                    Ci
                </td>
                <td>
                    <input type="text" value="" id="txtCi" class="form-control" />
                </td>
            </tr>
            <tr>
                <td>
                    Pid/Rbd Ts
                </td>
                <td>
                    <input type="text" value="" id="txtPidTs" class="form-control" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
