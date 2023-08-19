<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicProductDetails.aspx.cs" EnableEventValidation="false" Inherits="StarsProject.BasicProductDetails" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/myModuleAttachment.ascx" TagPrefix="uc1" TagName="myModuleAttachment" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Compaint Details</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
    <style>
        body {
            padding: 15px;
        }
        h3 {
            color: darkblue;
        }

        button {
            color: white;
            font-size: 1em;
            height: 3em;
            width: 10%;
            border-radius: 10px;
            border: none;
            cursor: pointer;
        }

        .resetBtn {
            width: 150px;
            height:50px;
            background-color: red;
            font-size:25px;
            font-family:Calibri;
        }

        .nextBtn {
            height:50px;
            background-color: green;
            width: 100px;
            font-size:25px;
            font-family:Calibri;
        }

        .saveBtn {
            height:50px;
            background-color: green;
            width: 100px;
            display: none;
            font-size:25px;
            font-family:Calibri;
        }

        .sendBtn {
            height:50px;
            background-color: green;
            width: 250px;
            display: none;
            font-size:25px;
            font-family:Calibri;
        }

        .backBtn {
            height:50px;
            display: none;
            background-color: gray;
            width: 100px;
            font-size:25px;
            font-family:Calibri;
        }

        .addressInputForm {
            display: none;
            font-family:Calibri;
            font-size:25px;
        }

        .basicInputForm {
            display: inline;
            font-family:Calibri;
            font-size:25px;
            margin-top:50px;
        }

        .attachmentInputForm {
            display: none;
            font-family:Calibri;
            font-size:25px;

        }

        input {
            /*height: 1.5rem;*/
            width: 800px;
            border: 1px solid darkblue;
            border-radius: 10px;
            margin: 15px;
            background-color: rgb(224, 224, 224);
            font-size:25px;
        }

        select {
            height: 2rem;
            width: 800px;
            border: 1px solid darkblue;
            border-radius: 10px;
            margin: 15px;
            background-color: rgb(224, 224, 224);
            font-size:25px;
            font-family:Calibri;
        }
        
        textarea {
            height: 80px;
            width: 800px;
            border: 1px solid darkblue;
            border-radius: 10px;
            margin: 15px;
            background-color: rgb(224, 224, 224);
            font-size:25px;
            font-family:Calibri;
        }

        .input-btn {
            display: flex;
            justify-content: space-between;
        }

        .register-complaint {
            text-align: left;
            width: 25%;
            border-radius: 20px;
            box-shadow: 0px 6px 12px 0px rgba(136,136,136,1);
            position: absolute;
            left: 74%;
            font-family:Calibri;
            font-size:25px;
            margin-top:35px;
        }
        .divImage {
            width: 25%;
            position: absolute;
            left: 78%;
            top:50%;
            
        }
        .registerCom-header {
            background-color: deepskyblue;
            border-radius: 20px 20px 0px 0px;
            font-size: 1.25em;
            color: white;
            padding: 5px;
            cursor: grab;
            padding-top:10px;
            padding-bottom:10px;
        }

        .registerCom-item1 {
            background-color: white;
            border-bottom: 1px solid black;
            color: blue;
            padding: 5px;
            cursor: pointer;
            padding-top:10px;
            padding-bottom:10px;
        }

        .registerCom-item2 {
            background-color: white;
            border-bottom: 1px solid black;
            color: dimgrey;
            cursor: pointer;
            padding: 5px;
            padding-top:10px;
            padding-bottom:10px;
        }

        .registerCom-item3 {
            color: dimgrey;
            background-color: white;
            cursor: pointer;
            padding: 5px;
            border-radius: 0px 0px 20px 20px;
            padding-top:10px;
            padding-bottom:10px;
        }

        hr {
            height: 1.5px;
            background-color: darkblue;
        }

        .txtError {
            color: red;
            font-size:25px;
            font-family:Calibri;
        }

        .cardItem1 {
            display: flex;
            font-size: small;
        }

        .cardHeader {
            width: 65%;
            height: 45px;
            text-align: center;
            background-color: deepskyblue;
            border-radius: 20px;
        }

        .cardHeader h3 {
            color: white;
            padding: 1px;
            margin-right:20px;
            margin-top:20px;
        }

        .UploadDetail {
            width: 53%;
        }

        .uploadDetailHeader {
            display: flex;
            margin: 5px;
            width: 122%;
            height: 20%;
            background-color: rgb(224, 224, 224);
            justify-content: space-between;
            border-radius: 50px;
        }

        .uploadDetailHeader p {
            margin: 5px 15px;
            color: darkblue;
            font-size:25px;
            font-family:Calibri;
        }

        .uploadDetailHeader1 {
            width: 50%;
            display: flex;
            justify-content: space-between;
        }

        .imgDiv {
            height: 100px;
            width: 100px;
        }
        h3 {
            margin:5px;
            text-align:right;
        }

        h5 {
            font-family:Calibri;
            font-size:25px;
            color:deepskyblue;
        }

        th {
            font-family:Calibri;
            font-size:25px;
            background-color:deepskyblue;
            color:white;
            border-radius:15px;
        }

       td {
           font-family:Calibri;
            font-size:25px;
        }
        #tblRCBook{
            height:unset;
        }

        .arrow {
          border: solid black;
          border-width: 0 3px 3px 0;
          display: inline-block;
          padding: 6px;
          margin-right:13px;
          margin-left:13px;
        }

        .left {
          transform: rotate(135deg);
          -webkit-transform: rotate(135deg);
        }

        .hide {
            visibility:hidden;
        }
        .card {
            
        }
        @media only screen and (max-width: 1150px) {
            .cardItem1 {
                display: inline;
            }

            .cardHeader {
                width: 600px;
            }

            input {
                width: 200px;
            }

            select {
                width: 200px;
            }

            textarea {
                width: 200px;
            }

            .imgDiv {
                display: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <%--Header--%>
        <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnCurrTab" runat="server" ClientIDMode="Static" Value="divBasicInputForm" />
        <asp:HiddenField ID="hdnNo" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnCustomerID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnCountryCode" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnStateCode" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnCityCode" runat="server" ClientIDMode="Static" />
    <div class="header" >
        <div class="input-btn" >
            <div class="divImg" style="width:500px">
                <img id="imageLogo" src="images/CompanyLogo/CompanyLogo.png" height="150" width="500"  />
            </div>
            <div class="btnDiv" >
                <button id="btnReset" runat="server" clientidmode="Static" onserverclick="btnReset_ServerClick" class="resetBtn" type="button" >Reset</button>
                <button class="backBtn" type="button" onclick="SendBackTab();">Previous</button>
                <button id="btnSave"  type="button" runat="server" clientidmode="Static" class="saveBtn" onserverclick="btnSave_ServerClick">Save</button>
                <button class="nextBtn" runat="server" clientidmode="Static" type="button" onclick="SendNextTab();">Next</button>
            </div>
        </div>
    </div>
    <hr />
    <div class="register-complaint">
        <div class="registerCom-header"><i class="arrow left hide"></i>Register complaint</div>
        <div class="registerCom-item1"><a id="lnkBasic" class="left" href="#divBasicInputForm" >Basic & Product Details</a></div>
        <div class="registerCom-item2"><a id="lnkAddress" class="left" href="#divAddress" >Address & Complaint</a></div>
        <div class="registerCom-item3"><a id="lnkAttachment" class="left" href="#divAttachment" >Attachment</a></div>
    </div>
    <div class="divImage">
        <img id="image" src="images/ImageComplaint.png" height="500" width="400"  />
    </div>
    <h4 id="Error" runat="server" class="txtError"></h4>
    <%--BasicProductDetails--%>
    <div id="divBasicInputForm" runat="server" clientidmode="Static" enableviewstate="true">
        <table class="basicInputForm">
        <tr >
            <td><h3>Complaint#</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtComplaint"  ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td><h3>Customer Name</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtCustomerName" onBlur="CheckValid();"></asp:TextBox></td>
        </tr>
        <tr >
            <td><h3>Mobile No.</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtMobileNo"></asp:TextBox></td>
        </tr>
        <tr >
            <td><h3>Email ID</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtEmailID"></asp:TextBox></td>
        </tr>
        <tr>
            <td><h3>Name</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtName"></asp:TextBox></td>
        </tr>
        <tr >
            <td><h3>Date Of Purchase</h3></td>
            <td><asp:TextBox type="date" ClientIDMode="Static" runat="server" id="txtDate"/></td>
        </tr>
        <tr >
            <td><h3>Work Order No.</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtWorkOrderNo"></asp:TextBox></td>
        </tr>
        <tr >
            <td><h3>Panel Serial No.</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtPanelSerialNo"></asp:TextBox></td>
        </tr>
        <tr >
            <td><h3>Product Serial No.</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtProductSerialNo"></asp:TextBox></td>
        </tr>
    </table>
    </div>
    <%--Address And Product Details--%>
    <div id="divAddress" runat="server" clientidmode="Static" enableviewstate="true">
        <table class="addressInputForm">
        <tr >
            <td><h3>Country</h3></td>
            <td><asp:DropDownList runat="server" ClientIDMode="Static" ID="drpCountry" onchange="GetStates();"></asp:DropDownList></td>
        </tr>
        <tr >
            <td><h3>State</h3></td>
            <td><asp:DropDownList runat="server" ClientIDMode="Static" ID="drpState" onchange="GetCity();"></asp:DropDownList></td>
        </tr>
        <tr >
            <td><h3>City</h3></td>
            <td><asp:DropDownList runat="server" ClientIDMode="Static" ID="drpCity" onchange="GetData();" ></asp:DropDownList></td>
        </tr>
        <tr >
            <td><h3>Pincode</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtPincode" ></asp:TextBox></td>
        </tr>
        <tr >
            <td><h3>Site Address</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtSiteAddress" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr >
            <td><h3>Designation</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtDesignation"></asp:TextBox></td>
        </tr>
        <tr >
            <td><h3>Site Coordinator Name</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtSiteCoordinatorName" ></asp:TextBox></td>
        </tr>
        <tr >
            <td><h3>Contact No.</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtContactNo"></asp:TextBox></td>
        </tr>
        <tr >
            <td><h3>Convinient Date</h3></td>
            <td><asp:TextBox type="date" ClientIDMode="Static" runat="server" id="txtConvinientDate"/></td>
        </tr>
        <tr >
            <td><h3>Convinient Time Slot</h3></td>
            <td><asp:TextBox runat="server" type="time" ClientIDMode="Static" ID="txtConvinientTimeSlot"></asp:TextBox></td>
        </tr>
        <tr>
            <td><h3>Status</h3></td>
            <td><asp:DropDownList runat="server" ClientIDMode="Static"  ID="drpStatus" >
                    <asp:ListItem Text="Open" Value="Open" Selected="True" />
                    <asp:ListItem Text="Close" Value="Close" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr >
            <td><h3>Complaint Description</h3></td>
            <td><asp:TextBox runat="server" ClientIDMode="Static" ID="txtComplaintDescription" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
    </table>
    </div>
    <%--Attachment--%>
    <div id="divAttachment" runat="server" clientidmode="Static" enableviewstate="true">
        <div class="attachmentInputForm">
        <div class="card" style="width:70%;height:auto">
            <uc1:myModuleAttachment runat="server" ClientIDMode="Static" id="myAttachPanel" />
        </div>
        <div class="card" style="width:70%">
            <uc1:myModuleAttachment runat="server" ClientIDMode="Static" id="myAttachDefect" />
        </div>
    </div>
    </div>
    </form>

    <script type="text/javascript">

        function retainTabPosition() {
            var currTab = $("#hdnCurrTab").val();
            //alert(currTab);
            $("#lnkBasic").removeClass("active");
            $("#lnkAddress").removeClass("active");
            $("#lnkAttachment").removeClass("active");

            $("#divBasicInputForm").css("display", "none");
            $("#divAddress").css("display", "none");
            $("#divAttachment").css("display", "none");

            if (currTab == 'divBasicInputForm') {
                $("#lnkBasic").addClass("active");
                $("#divBasicInputForm").css("display", "block");
                basicInputForm.style.display = 'inline';
                basicRegisterCom.style.color = 'blue';
                addressInputForm.style.display = 'none';
                addressRegisterCom.style.color = 'gray';
                attachmentInputForm.style.display = 'none';
                attachmentRegisterCom.style.color = 'gray';
                nextBtn.style.display = 'inline';
                backBtn.style.display = 'none';
                saveBtn.style.display = 'none';
            }
            else if (currTab == 'divAddress') {
                $("#lnkAddress").addClass("active");
                $("#divAddress").css("display", "block");
                basicInputForm.style.display = 'none';
                basicRegisterCom.style.color = 'gray';
                addressInputForm.style.display = 'inline';
                addressRegisterCom.style.color = 'blue';
                attachmentInputForm.style.display = 'none';
                attachmentRegisterCom.style.color = 'gray';
                nextBtn.style.display = 'inline';
                saveBtn.style.display = 'none';
                backBtn.style.display = 'inline';
            }
            else if (currTab == 'divAttachment') {
                $("#lnkAttachment").addClass("active");
                $("#divAttachment").css("display", "block");
                attachmentInputForm.style.display = 'inline';
                attachmentRegisterCom.style.color = 'blue';
                basicInputForm.style.display = 'none';
                basicRegisterCom.style.color = 'gray';
                addressInputForm.style.display = 'none';
                addressRegisterCom.style.color = 'gray';
                nextBtn.style.display = 'none';
                backBtn.style.display = 'inline';
                saveBtn.style.display = 'inline';
            }
        }

        function pageLoad(sender, args) {
            // --------------------------------------------------------
            $(".register-complaint a").click(function () {
                $("#hdnCurrTab").val($(this).attr("href").replace("#", ""));
                retainTabPosition();
                GetCountry();
            });
        }

        function GetCountry(){
            jQuery.ajax({
                type: "POST",
                url: "BasicProductDetails.aspx/GetCountriesName",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlCustomers = $("[id*=drpCountry]");
                    ddlCustomers.empty().append('<option selected="selected" value="">--- select ---</option>');
                    $.each(r.d, function () {
                        ddlCustomers.append($("<option></option>").val(this['CountryCode']).html(this['CountryName']));
                    });
                }
            });
        }

        
        function GetStates()
        {
            var code = jQuery("#drpCountry").val();
            if (code != "") {
                jQuery.ajax({
                    type: "POST",
                    url: "BasicProductDetails.aspx/GetStateName",
                    data: '{}',
                    data: '{CountryCode:\'' + code + '\'}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var ddlCustomers = $("[id*=drpState]");
                        ddlCustomers.empty().append('<option selected="selected" value="0">--- select ---</option>');
                        $.each(r.d, function () {
                            ddlCustomers.append($("<option></option>").val(this['StateCode']).html(this['StateName']));
                        });
                    }
                });
            }
        }

        function GetCity() {
            var code = jQuery("#drpState").val();
            if (code != "") {
                jQuery.ajax({
                    type: "POST",
                    url: "BasicProductDetails.aspx/GetCityName",
                    data: '{}',
                    data: '{StateCode:\'' + code + '\'}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var ddlCustomers = $("[id*=drpCity]");
                        ddlCustomers.empty().append('<option selected="selected" value="0">--- select ---</option>');
                        $.each(r.d, function () {
                            ddlCustomers.append($("<option></option>").val(this['CityCode']).html(this['CityName']));
                        });
                    }
                });
            }
        }

        function GetData() {
            document.getElementById("hdnCountryCode").value = jQuery("#drpCountry").val();
            document.getElementById("hdnStateCode").value = jQuery("#drpState").val();
            document.getElementById("hdnCityCode").value = jQuery("#drpCity").val();
        }

        

        function showcaseError(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:circle;">' + xMsg + '</ul>', displayLength: 4000 });
        }

        function showcaseError(xMsg, xClass) {
            M.toast({ html: '<ul id="ulToast">' + xMsg + '</ul>', classes: xClass, displayLength: 4000 });
        }

        const basicInputForm = document.querySelector(".basicInputForm");
        const addressInputForm = document.querySelector(".addressInputForm");
        const attachmentInputForm = document.querySelector(".attachmentInputForm");
        const basicRegisterCom = document.querySelector(".registerCom-item1");
        const addressRegisterCom = document.querySelector(".registerCom-item2");
        const attachmentRegisterCom = document.querySelector(".registerCom-item3");
        const backBtn = document.querySelector(".backBtn");
        const saveBtn = document.querySelector(".saveBtn");
        const nextBtn = document.querySelector(".nextBtn");
        const resetBtn = document.querySelector(".resetBtn");
        const txtError = document.querySelector(".txtError");

        

        

        function SendBackTab() {
            var currTab = $("#hdnCurrTab").val();
            if (currTab == 'divAddress') {
                document.getElementById("hdnCurrTab").value = 'divBasicInputForm';
                backBtn.style.display = 'block';
                retainTabPosition();
            }
            else if (currTab == 'divAttachment') {
                document.getElementById("hdnCurrTab").value = 'divAddress';
                backBtn.style.display = 'none';
                retainTabPosition();
            }
        }

        function SendNextTab() {
            var currTab = $("#hdnCurrTab").val();
            if (currTab == 'divBasicInputForm') {
                document.getElementById("hdnCurrTab").value = 'divAddress';
                nextBtn.style.display = 'block';
                retainTabPosition();
                GetCountry();
            }
            else if (currTab == 'divAddress') {
                document.getElementById("hdnCurrTab").value = 'divAttachment';
                nextBtn.style.display = 'none';
                retainTabPosition();
            }
        }
        
        //basicRegisterCom.addEventListener('click', () => {
        //    clearAddressErrorForm();
        //    showBasicInputForm();
        //});
        //addressRegisterCom.addEventListener('click', () => {
        //    clearBasicErrorForm();
        //    showAddressInputForm();
        //});
        //attachmentRegisterCom.addEventListener('click', () => {
        //    clearBasicErrorForm();
        //    clearAddressErrorForm();
        //    showAttachmentInputForm()
        //});

        

        let showBasicInputForm = () => {
            basicInputForm.style.display = 'inline';
            basicRegisterCom.style.color = 'blue';
            addressInputForm.style.display = 'none';
            addressRegisterCom.style.color = 'gray';
            attachmentInputForm.style.display = 'none';
            attachmentRegisterCom.style.color = 'gray';
        };

        let showAddressInputForm = () => {
            basicInputForm.style.display = 'none';
            basicRegisterCom.style.color = 'gray';
            addressInputForm.style.display = 'inline';
            addressRegisterCom.style.color = 'blue';
            attachmentInputForm.style.display = 'none';
            attachmentRegisterCom.style.color = 'gray';
        };

        let showAttachmentInputForm = () => {
            attachmentInputForm.style.display = 'inline';
            attachmentRegisterCom.style.color = 'blue';
            basicInputForm.style.display = 'none';
            basicRegisterCom.style.color = 'gray';
            addressInputForm.style.display = 'none';
            addressRegisterCom.style.color = 'gray';
        };


        let clearBasicErrorForm = () => {
            const txtCustomerName = document.querySelector('#txtCustomerName');
            const txtMobileNo = document.querySelector('#txtMobileNo');
            const txtEmailID = document.querySelector('#txtEmailID');
            const txtName = document.querySelector('#txtName');
            const txtComplaint = document.querySelector('#txtComplaint');
            const txtDesignation = document.querySelector('#txtDesignation');
            const txtDate = document.querySelector('#txtDate');
            const txtWorkOrderNo = document.querySelector('#txtWorkOrderNo');
            const txtPanelSerialNo = document.querySelector('#txtPanelSerialNo');
            const txtProductSerialNo = document.querySelector('#txtProductSerialNo');

            txtCustomerName.style.borderColor = 'darkblue';
            txtMobileNo.style.borderColor = 'darkblue';
            txtEmailID.style.borderColor = 'darkblue';
            txtName.style.borderColor = 'darkblue';
            txtComplaint.style.borderColor = 'darkblue';
            txtDesignation.style.borderColor = 'darkblue';
            txtDate.style.borderColor = 'darkblue';
            txtWorkOrderNo.style.borderColor = 'darkblue';
            txtPanelSerialNo.style.borderColor = 'darkblue';
            txtProductSerialNo.style.borderColor = 'darkblue';
            txtError.innerHTML = '';
        };

        let clearAddressErrorForm = () => {
            const drpCountry = document.querySelector('#drpCountry');
            const drpState = document.querySelector('#drpState');
            const drpCity = document.querySelector('#drpCity');
            const txtPincode = document.querySelector('#txtPincode');
            const txtSiteAddress = document.querySelector('#txtSiteAddress');
            const txtAddressDesignation = document.querySelector('#txtAddressDesignation');
            const txtSiteCoordinatorName = document.querySelector('#txtSiteCoordinatorName');
            const txtContactNo = document.querySelector('#txtContactNo');
            const txtConvinientDate = document.querySelector('#txtConvinientDate');
            const txtConvinientTimeSlot = document.querySelector('#txtConvinientTimeSlot');
            const drpStatus = document.querySelector('#drpStatus');
            const txtConvinientDescription = document.querySelector('#txtConvinientDescription');

            drpCountry.style.borderColor = 'darkblue';
            drpState.style.borderColor = 'darkblue';
            drpCity.style.borderColor = 'darkblue';
            txtPincode.style.borderColor = 'darkblue';
            txtSiteAddress.style.borderColor = 'darkblue';
            txtAddressDesignation.style.borderColor = 'darkblue';
            txtSiteCoordinatorName.style.borderColor = 'darkblue';
            txtContactNo.style.borderColor = 'darkblue';
            txtConvinientDate.style.borderColor = 'darkblue';
            txtConvinientTimeSlot.style.borderColor = 'darkblue';
            drpStatus.style.borderColor = 'darkblue';
            txtConvinientDescription.style.borderColor = 'darkblue';
            txtError.innerHTML = '';
        };


        let validateBasicInputFields = () => {
            const txtCustomerName = document.querySelector('#txtCustomerName');
            const txtMobileNo = document.querySelector('#txtMobileNo');
            const txtEmailID = document.querySelector('#txtEmailID');
            const txtName = document.querySelector('#txtName');
            const txtComplaint = document.querySelector('#txtComplaint');
            const txtDesignation = document.querySelector('#txtDesignation');
            const txtDate = document.querySelector('#txtDate');
            const txtWorkOrderNo = document.querySelector('#txtWorkOrderNo');
            const txtPanelSerialNo = document.querySelector('#txtPanelSerialNo');
            const txtProductSerialNo = document.querySelector('#txtProductSerialNo');
            
            if (txtCustomerName.value == '' && txtMobileNo.value == '' && txtEmailID.value == '' && txtName.value == '' && txtComplaint.value == '' && txtDesignation.value == '' && txtDate.value == '' && txtWorkOrderNo.value == '' && txtPanelSerialNo.value == '' && txtProductSerialNo.value == '') {
                txtCustomerName.style.borderColor = 'red';
                txtMobileNo.style.borderColor = 'red';
                txtEmailID.style.borderColor = 'red';
                txtName.style.borderColor = 'red';
                txtComplaint.style.borderColor = 'red';
                txtDesignation.style.borderColor = 'red';
                txtDate.style.borderColor = 'red';
                txtWorkOrderNo.style.borderColor = 'red';
                txtPanelSerialNo.style.borderColor = 'red';
                txtProductSerialNo.style.borderColor = 'red';
                txtError.innerHTML = "All Fields Are Empty!";
                return true;
            }
            if (txtCustomerName.value == '') {
                txtCustomerName.style.borderColor = 'red';
                txtError.innerHTML = "Customer Name Is Empty!";
                return true;
            }
            if (txtMobileNo.value == '') {
                txtMobileNo.style.borderColor = 'red';
                txtError.innerHTML = "Mobile No. Is Empty!";
                return true;
            }
            if (txtEmailID.value == '') {
                txtEmailID.style.borderColor = 'red';
                txtError.innerHTML = "EmailID Is Empty!";
                return true;
            }
            if (txtName.value == '') {
                txtName.style.borderColor = 'red';
                txtError.innerHTML = "Name Is Empty!";
                return true;
            }
            if (txtComplaint.value == '') {
                txtComplaint.style.borderColor = 'red';
                txtError.innerHTML = "Complaint Is Empty!";
                return true;
            }
            if (txtDesignation.value == '') {
                txtDesignation.style.borderColor = 'red';
                txtError.innerHTML = "Designation Is Empty!";
                return true;
            }
            if (txtDate.value == '') {
                txtDate.style.borderColor = 'red';
                txtError.innerHTML = "Data Is Empty!";
                return true;
            }
            if (txtWorkOrderNo.value == '') {
                txtWorkOrderNo.style.borderColor = 'red';
                txtError.innerHTML = "Work Order Is Empty!";
                return true;
            }
            if (txtPanelSerialNo.value == '') {
                txtPanelSerialNo.style.borderColor = 'red';
                txtError.innerHTML = "Panel Serial No. Is Empty!";
                return true;
            }
            if (txtProductSerialNo.value == '') {
                txtProductSerialNo.style.borderColor = 'red';
                txtError.innerHTML = "Product Serial No. Is Empty!";
                return true;
            }
            return false;
        };

        let validateAddressInputFields = () => {
            const drpCountry = document.querySelector('#drpCountry');
            const drpState = document.querySelector('#drpState');
            const drpCity = document.querySelector('#drpCity');
            const txtPincode = document.querySelector('#txtPincode');
            const txtSiteAddress = document.querySelector('#txtSiteAddress');
            const txtAddressDesignation = document.querySelector('#txtAddressDesignation');
            const txtSiteCoordinatorName = document.querySelector('#txtSiteCoordinatorName');
            const txtContactNo = document.querySelector('#txtContactNo');
            const txtConvinientDate = document.querySelector('#txtConvinientDate');
            const txtConvinientTimeSlot = document.querySelector('#txtConvinientTimeSlot');
            const drpStatus = document.querySelector('#drpStatus');
            const txtConvinientDescription = document.querySelector('#txtConvinientDescription');
            
            if (drpCountry.value == '' && drpState.value == '' && drpCity.value == '' && txtPincode.value == '' && txtSiteAddress.value == '' && txtAddressDesignation.value == '' && txtSiteCoordinatorName.value == '' && txtContactNo.value == '' && txtConvinientDate.value == '' && txtConvinientTimeSlot.value == '' && drpStatus.value == '' && txtConvinientDescription.value == '') {
                drpCountry.style.borderColor = 'red';
                drpState.style.borderColor = 'red';
                drpCity.style.borderColor = 'red';
                txtPincode.style.borderColor = 'red';
                txtSiteAddress.style.borderColor = 'red';
                txtAddressDesignation.style.borderColor = 'red';
                txtSiteCoordinatorName.style.borderColor = 'red';
                txtContactNo.style.borderColor = 'red';
                txtConvinientDate.style.borderColor = 'red';
                txtConvinientTimeSlot.style.borderColor = 'red';
                drpStatus.style.borderColor = 'red';
                txtConvinientDescription.style.borderColor = 'red';
                txtError.innerHTML = "All Fields Are Empty!";
                return true;
            }
            if (drpCountry.value == '') {
                drpCountry.style.borderColor = 'red';
                txtError.innerHTML = "Country is Empty!";
                return true;
            }
            if (drpState.value == '') {
                drpState.style.borderColor = 'red';
                txtError.innerHTML = "State is Empty!";
                return true;
            }
            if (drpCity.value == '') {
                drpCity.style.borderColor = 'red';
                txtError.innerHTML = "City is Empty!";
                return true;
            }
            if (txtPincode.value == '') {
                txtPincode.style.borderColor = 'red';
                txtError.innerHTML = "Pincode is Empty!";
                return true;
            }
            if (txtSiteAddress.value == '') {
                txtSiteAddress.style.borderColor = 'red';
                txtError.innerHTML = "Site Address is Empty!";
                return true;
            }
            if (txtAddressDesignation.value == '') {
                txtAddressDesignation.style.borderColor = 'red';
                txtError.innerHTML = "Address Designation is Empty!";
                return true;
            }
            if (txtSiteCoordinatorName.value == '') {
                txtSiteCoordinatorName.style.borderColor = 'red';
                txtError.innerHTML = "Site Coordinator Name is Empty!";
                return true;
            }
            if (txtContactNo.value == '') {
                txtContactNo.style.borderColor = 'red';
                txtError.innerHTML = "Contact No is Empty!";
                return true;
            }
            if (txtConvinientDate.value == '') {
                txtConvinientDate.style.borderColor = 'red';
                txtError.innerHTML = "Convinient Date is Empty!";
                return true;
            }
            if (txtConvinientTimeSlot.value == '') {
                txtConvinientTimeSlot.style.borderColor = 'red';
                txtError.innerHTML = "Convinient Time Slot is Empty!";
                return true;
            }
            if (drpStatus.value == '') {
                drpStatus.style.borderColor = 'red';
                txtError.innerHTML = "Status is Empty!";
                return true;
            }
            if (txtConvinientDescription.value == '') {
                txtConvinientDescription.style.borderColor = 'red';
                txtError.innerHTML = "Convinient Description is Empty!";
                return true;
            }
            return false;
        };
    </script>
</body>
</html>
