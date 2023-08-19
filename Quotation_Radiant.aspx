<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quotation_Radiant.aspx.cs" Inherits="StarsProject.Quotation_Radiant" ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/myModuleAttachment.ascx" TagPrefix="uc1" TagName="myModuleAttachment" %>
<%@ Register Src="~/myNotificationPanel.ascx" TagPrefix="uc1" TagName="myNotificationPanel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title> 
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/custom/custom.css" />

    <script type="text/javascript" src='<%=ResolveUrl("js/plugins/jquery-1.7.min.js") %>'></script>
    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>
    <script type="text/javascript" src="app-assets/js/plugins.js"></script>
    <link rel="stylesheet" href="app-assets/vendors/select2/select2.min.css" type="text/css" />
    <link rel="stylesheet" href="app-assets/vendors/select2/select2-materialize.css" type="text/css" />

    <script type="text/javascript" src="app-assets/vendors/select2/select2.full.min.js"></script>
<%--    <script type="text/javascript" src="app-assets/js/scripts/form-select2.js"></script>--%>

    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>
    <script type="text/javascript" src="app-assets/js/scripts/advance-ui-modals.js"></script>

    <style type="text/css">
        table.responsive-table th {  
            background-color: #6868d6 !important; 
            color: white !important;
            font-size: 13px !important;
        }

        table.responsive-table th, table.responsive-table td {
            border-bottom: 1px solid silver !important;
        }

        input[type=text], input[type=password], input[type=email], input[type=url], input[type=number], textarea :focus {
            border-color: #3C90BE;
        }

        rptQuotationDetail th, td {
            font-size: 12px !important;
        }

        #tblCharge table.responsive-table th, table.responsive-table td {
            border-bottom: 0px !important;
            padding: 1px;
        }

        #tblSummary table.responsive-table th, table.responsive-table td {
            border-bottom: 0px !important;
            padding: 1px;
        }

        /* ==================================== */
        /*****         Modal Popup        *****/
        /* ==================================== */
        .Popup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 96%;
            height: 96%;
        }

        .btnTopRightCorner {
            display: block;
            box-sizing: border-box;
            width: 30px;
            height: 30px;
            border-width: 3px;
            border-style: solid;
            border-color: red;
            border-radius: 100%;
            background: -webkit-linear-gradient(-45deg, transparent 0%, transparent 46%, white 46%, white 56%,transparent 56%, transparent 100%), -webkit-linear-gradient(45deg, transparent 0%, transparent 46%, white 46%, white 56%,transparent 56%, transparent 100%);
            background-color: red;
            box-shadow: 0px 0px 5px 2px rgba(0,0,0,0.5);
            transition: all 0.3s ease;
            position: relative;
            top: 12px;
            right: 15px;
        }
        /* ==================================== */
        /***** 19. STANDARD TABLES STYLES *****/
        /* ==================================== */
        .table input:not([type]), input[type=text]:not(.browser-default), input[type=password]:not(.browser-default),
        input[type=email]:not(.browser-default), input[type=url]:not(.browser-default), input[type=time]:not(.browser-default),
        input[type=date]:not(.browser-default), input[type=datetime]:not(.browser-default), input[type=datetime-local]:not(.browser-default),
        input[type=tel]:not(.browser-default), input[type=number]:not(.browser-default), input[type=search]:not(.browser-default), textarea.materialize-textarea {
            margin: 0px !important;
            height: 1.5rem !important;
            border-radius: 3px !important;
            font-size: 13px !important;
        }
        /*th, td { display: inline-block !important; }*/
        .limited {
            white-space: nowrap;
            max-width: 300px;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .ui-autocomplete-input {
            width: 600px;
        }

        .autocomplete-suggestions {
            min-width: 1200px !important;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.btnTopRightCorner').on("click", function () {
                __doPostBack('drpquotationkindattn', '');
            });

            
        });
        


        function setScrollBottom() {
            //window.scrollTo(0, document.body.scrollHeight);
            $("html, body").animate({ scrollTop: $(document).height() }, "slow");
            return false;
        }

        function setControlFocus(id) {
            $("#" + id).focus();
            $("#" + id).select();
        }

        function pageLoad(sender, args) {
            $('tabs').tabs();
            $('.datepicker').datepicker({
                defaultDate: new Date((new Date()).getFullYear(), (new Date()).getMonth(), (new Date()).getDay()),
                format: "dd-mm-yyyy"
            });
            $('.timepicker').timepicker();
            $(".inputOther input:text").focus(function () { $(this).select(); });
            $(".inputOther input:text").click(function () { $(this).select(); });
            $('#menuDiscovery').click(function () { $('.tap-target').tapTarget('open'); });
            $('.select2-size-sm').select2({
                dropdownAutoWidth: true,
                width: '100%',
                containerCssClass: 'select-sm'
            });
            // --------------------------------------------------------
            $(function () {
                $(".tabs a").click(function () {
                    $("#hdnCurrTab").val($(this).attr("href").replace("#", ""));
                    retainTabPosition();
                });
            });
            $(".onlyNumeric").on("input", function (evt) {
                var self = $(this);
                self.val(self.val().replace(/\D/g, ""));
                if ((evt.which < 48 || evt.which > 57)) {
                    evt.preventDefault();
                }
                if (self.val() == '')
                    $(this).val("0");
            });

            $(".onlyDecimal").on("input", function (evt) {
                var self = $(this);
                self.val(self.val().replace(/[^0-9\.]/g, ''));
                if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) {
                    evt.preventDefault();
                }
                if (self.val() == '')
                    $(this).val("0.00");
            });

            $(".onlyNumeric").on("input", function (evt) {
                var self = $(this);
                self.val(self.val().replace(/\D/g, ""));
                if ((evt.which < 48 || evt.which > 57)) {
                    evt.preventDefault();
                }
                if (self.val() == '')
                    $(this).val("0");
            });

            $(".onlyDecimal").on("input", function (evt) {
                var self = $(this);
                self.val(self.val().replace(/[^0-9\.]/g, ''));
                if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) {
                    evt.preventDefault();
                }
                if (self.val() == '')
                    $(this).val("0.00");
            });
            // --------------------------------------------------------
            setHiddenControls();
            // --------------------------------------------------------
            //$('#txtProductName').on("focus", function () {
            //    setScrollBottom();
            //});
        }
        function ShowModulePDF(repFilename) {
            var today = new Date();
            var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date + ' ' + time;
            debugger;
            // ------------------------------------------------------------------
            //document.getElementById('spnModuleHeader').innerText = "PDF Viewer";
            $('#ifrModuleQT').attr('src', 'PDF/' + repFilename + ".pdf" + "?id=" + dateTime);
            $find("mpeQT").show();
        }
        function openTaxSummary() {
            document.getElementById('spnModuleHeader').innerText = "Tax Summary";
            var keyid = $('#txtInvoiceNo').val();
            var pageUrl = "viewTaxSummary.aspx?module=quotation&keyid=" + keyid;
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }
        /*---------------------------------------------------------*/
        function showcaseError(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:circle;">' + xMsg + '</ul>', displayLength: 4000 });
        }
        function showcaseError(xMsg, xClass) {
            M.toast({ html: '<ul id="ulToast">' + xMsg + '</ul>', classes: xClass, displayLength: 4000 });
        }
        function showcaseMessage(xText, xIcon) {
            xText = (xText == '') ? 'Action Performed !' : xText;
            xIcon = (xIcon == '') ? 'Info' : xIcon;
            swal({ title: "Message", text: xText, icon: xIcon });
        }

        function showErrorMessage(strMess) {
            jQuery.confirm({ title: 'Data Validation', content: 'Are you sure, You want to delete record !', type: 'red', typeAnimated: true });
        }
        /*---------------------------------------------------------*/
        function openCustomerInfo(cat) {
            document.getElementById('spnModuleHeader').innerText = "Customer Information";
            var keyid,pageUrl;
            keyid = (cat == 'view' || cat == 'edit') ? jQuery('#hdnCustomerID').val() : "0";
            pageUrl = (cat == 'view' || cat == 'edit') ? "customers.aspx?mode=" + ((cat == 'view') ? "view" : "edit") + "&id=" + keyid +"" : "customers.aspx?mode=view&id=0";
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }
        /*Add Product view on Product Name Vikram Rajput 15-07-2020*/
        function openProductInfo(cat) {
            document.getElementById('spnModuleHeader').innerText = "Product Information";
            var keyid = "0";
            var pageUrl = "Products.aspx?mode=view&id=0";
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }
        function openProjectInfo(cat) {
            document.getElementById('spnModuleHeader').innerText = "Project Information";
            var keyid = "0";
            var pageUrl = "Projects.aspx?mode=add&id=0";
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }
        /*---------------------------------------------------------*/
        function showErrorPopup(xTitle, xMsg) {
            if (xTitle == '')
                xTitle = 'Message';
            // -------------------------------------
            if (xMsg != '') {
                jQuery.confirm({
                    title: xTitle, content: xMsg, type: 'red', typeAnimated: true, width: 'auto',
                    buttons: { close: { text: 'Close', btnClass: 'btn-blue ConfirmClose', action: function () { } } }
                });
            }
        }
        // --------------------------------------------------------
        function retainTabPosition() {

            var currTab = $("#hdnCurrTab").val();
            $("#lnkProducts").removeClass("active");
            $("#lnkTNC").removeClass("active");
            $("#lnkEmail").removeClass("active");
            $("#lnkFollowUp").removeClass("active");
            $("#lnkTransport").removeClass("active");
            $("#lnkAssumption").removeClass("active");
            $("#lnkAttachment").removeClass("active");

            $("#pnl_Products").css("display", "none");
            $("#pnl_TNC").css("display", "none");
            $("#pnl_Email").css("display", "none");
            $("#pnl_Transport").css("display", "none");
            $("#pnl_FollowUp").css("display", "none");
            $("#pnl_Assumption").css("display", "none");
            $("#pnl_Attachment").css("display", "none");

            if (currTab == 'pnl_Products') {
                $("#lnkProducts").addClass("active");
                $("#pnl_Products").css("display", "block");
            }
            else if (currTab == 'pnl_TNC') {
                $("#lnkTNC").addClass("active");
                $("#pnl_TNC").css("display", "block");
            }
            else if (currTab == 'pnl_Email') {
                $("#lnkEmail").addClass("active");
                $("#pnl_Email").css("display", "block");
            }
            else if (currTab == 'pnl_FollowUp') {
                $("#lnkFollowUp").addClass("active");
                $("#pnl_FollowUp").css("display", "block");
            }
            else if (currTab == 'pnl_Transport') {
                $("#lnkTransport").addClass("active");
                $("#pnl_Transport").css("display", "block");
            }
            else if (currTab == 'pnl_Assumption') {
                $("#lnkAssumption").addClass("active");
                $("#pnl_Assumption").css("display", "block");
            }
            else if (currTab == 'pnl_Attachment') {
                $("#lnkAttachment").addClass("active");
                $("#pnl_Attachment").css("display", "block");
            }
        }

        function showErrorPopup(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:none;">' + xMsg + '</ul>', displayLength: 4000 });
        }

        // ------------------------------------------------------------------------
        //  Open Bootstrap Modal Popup 
        // ------------------------------------------------------------------------
        function calcQuotation() {
            var q = parseFloat(jQuery("#txtQuantity").val() != '' ? jQuery("#txtQuantity").val() : 0);
            var ur = parseFloat(jQuery("#txtUnitRate").val() != '' ? jQuery("#txtUnitRate").val() : 0);
            var dp = parseFloat(jQuery("#txtDiscountPercent").val() != '' ? jQuery("#txtDiscountPercent").val() : 0);

            var nr = (ur - ((ur * dp) / 100)).toFixed(2);
            jQuery("#txtNetRate").val(nr);

            var a = (q * nr).toFixed(2);
            jQuery("#txtAmount").val(a);

            var tr = parseFloat(jQuery("#txtTaxRate").val() != '' ? jQuery("#txtTaxRate").val() : 0);
            ta = ((a * tr) / 100).toFixed(2);
            jQuery("#txtTaxAmount").val(ta);

            na = (parseFloat(a) + parseFloat(ta)).toFixed(2);
            jQuery("#txtNetAmount").val(na);
        }

        function gridAction(mode, id) {
            var pageUrl = ''
            var id = jQuery("#drpQuotationCategory").val();
            pageTitle = "Manage General Template";
            pageUrl = "GeneralTemplate.aspx?mode=" + mode + "&id=" + (id != '' ? id : 0);
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }
        // ----------------------------------------------------------
        function openERPModules(pProdID) {
            var t11;
            t11 = jQuery("#txtQuotationNo").val();
            var pageUrl = "QuotationERPModules.aspx?QuotationNo=" + t11 + "&ProductID=" + pProdID;
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }
        function openSpecification(pProdID, pkID) {
            document.getElementById('spnModuleHeader').innerText = "Product Specification";
            var t11;
            t11 = jQuery("#txtQuotationNo").val();
            var pageUrl = "QuotationSpecification.aspx?Module=Quotation&QuotationNo=" + t11 + "&FinishProductID=" + pProdID + "&RefNo=" + pkID;
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }

        function getSelectedInquiry() {
            var test = $(".select2-selection__rendered").find('li.select2-selection__choice').text().substring(1).replace("×", ",");
            $("#hdnSelectedReference").val(test.replace("×", ","));
        }

        function validateSize(input) {
            var fileSize = input.files[0].size / 1024 / 1024; // in MiB
            if (fileSize > 4) {
                alert('File size exceeds 4 MB');
            } 
        }

        function openHistory(pProdID, CustomerID) {
            document.getElementById('spnModuleHeader').innerText = "Product Rate History";
            var pageUrl = "History.aspx?ProductID=" + pProdID + "&CustomerID=" + CustomerID;
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }

        function openAssembly(pProdID, pOth1, pOth2, pOth3) {
            var t11;
            t11 = jQuery("#txtQuotationNo").val();
            document.getElementById('spnModuleHeader').innerText = "Manage Product Assembly";
            var pageUrl = "QuotationAssemblyRadiant.aspx?QuotationNo=" + t11 + "&FinishProductID=" + pProdID + "&OthRef1=" + pOth1 + "&OthRef2=" + pOth2 + "&OthRef3=" + pOth3;
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }

        function setHiddenControls() {
            var userData = JSON.stringify({ "pPageName": 'quotation' });
            $.ajax({
                type: "POST",
                url: "/Services/NagrikService.asmx/GetPageHiddenControls",
                data: userData,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $("#hdnHiddenControl").val(data.d);
                    // ---------------------------------------------------------------
                    $('#frmQuotation *').filter(':input').each(function () {
                        var idName = $(this).attr('id') + ',';
                        if ($("#hdnHiddenControl").val().indexOf(idName) >= 0) {
                            $(this).parent().hide();
                        }
                    });
                },
                failure: function (errMsg) { alert(errMsg); }
            });
        }
    </script>
</head>
<body class="loginpage" style="width:98%;">
    <form id="frmQuotation" runat="server" autocomplete="off">
        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
        <div id="contentwrapper" class="contentwrapper">
            <div class="widgetbox">
                <div class="clearall"></div>
                <asp:HiddenField ID="hdnInquiryNo" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnCustWisePro" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnSerialKey" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnProductUnitQty" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnMode" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnCustomerID" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnQuotationVersion" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnQuotationSpecification" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnQuotationCurrency" runat="server" ClientIDMode="Static" Value="No" />
                <asp:HiddenField ID="hdnPriceRangeValidation" runat="server" ClientIDMode="Static" Value="No" />
                <asp:HiddenField ID="hdnCurrTab" runat="server" ClientIDMode="Static" EnableViewState="true" Value="pnl_Products" />
                <asp:HiddenField ID="hdnApplicationIndustry" runat="server" ClientIDMode="Static" Value="" />
                <asp:HiddenField ID="hdnProductHistory" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnSelectedReference" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnProductUpload" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnQuotationAssembly" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnHiddenControl" runat="server" ClientIDMode="Static" Value=""/>
                <asp:HiddenField ID="hdnQuotationNoForPDF" runat="server" ClientIDMode="Static" />

                <div id="myModal" class="myModalClass" style="display: block; width: 100%;">
                    <div class="modal-content">
                        <div class="modal-body col m12">
                            <div class="row">
                                <div class="col m12">
                                    <div class="row">
                                        <div class="input-field col m1">
                                            <label class="active" for="txtQuotationNo">Quotation #</label>
                                            <asp:TextBox ID="txtQuotationNo" runat="server" placeholder="" MaxLength="20" class="form-control" ClientIDMode="Static" ReadOnly="true" />
                                        </div>
                                        <div class="input-field col m1">
                                            <label class="active" for="txtQuotationDate">Quotation Date <span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtQuotationDate" runat="server" placeholder="" class="form-control" ClientIDMode="Static" TabIndex="1" TextMode="Date" />
                                        </div>
                                        <div class="input-field col m4">
                                            <asp:HiddenField ID="hdnCustStateID" runat="server" ClientIDMode="Static" />
                                            <asp:TextBox ID="txtCustomerName" runat="server" ClientIDMode="Static" placeholder="Min. 3 Chars To Activate search" class="form-control" AutoPostBack="true" onKeyup="bindDDLTo('#txtCustomerName')" OnTextChanged="txtCustomerName_TextChanged" TabIndex="3" Style="margin-top: 3px" MaxLenght="50" />
                                            <label class="active" for="txtCustomerName" style="margin-top: 3px">
                                                Customer Name&nbsp; <span class="materialize-red-text font-weight-800">*</span>
                                                <a href="javascript:openCustomerInfo('view');">
                                                    <img src="images/registration.png" width="30" height="20" alt="Preview Customer Info" title="Preview Customer Info" style="display: inline-block; padding: 6px 0px 0px 0px;" />
                                                </a>
                                                <a href="javascript:openCustomerInfo('edit');">
                                                    <img src="images/edit.png" width="20" style="padding: 6px 0px 0px 0px;" height="20" alt="Add New Customer" title="Edit Customer" />
                                                </a>
                                                <a href="javascript:openCustomerInfo('add');">
                                                    <img src="images/addCustomer.png" width="30" style="padding: 6px 0px 0px 0px;" height="20" alt="Add New Customer" title="Add New Customer" />
                                                </a>
                                                &nbsp;&nbsp;&nbsp;<small id="isGSTAvailable" runat="server" style="padding-left: 5px;padding-right: 5px;border-radius: 8px;"></small>
                                            </label>
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="drpQuotationKindAttn">Kind Attn.</label>
                                            <asp:DropDownList ID="drpQuotationKindAttn" runat="server" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="4" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtCreditDays"> <% if (hdnSerialKey.Value == "PN9F-NPA1-EQH3-PS1H") { %> Validity Days <% } else {%> Credit Days<% } %></label>
                                            <asp:TextBox ID="txtCreditDays" runat="server" placeholder="" MaxLength="50" class="form-control onlyNumeric" ClientIDMode="Static" TabIndex="5" Style="width: 150px;"/>
                                        </div>
                                         <% if (hdnSerialKey.Value == "HEMA-AUTO-SI08-NVRL")
                                            { %>
                                                <div class="input-field col m2">
                                                    <label class="active" for="drpQuotationType">Quotation Type</label>
                                                    <asp:DropDownList ID="drpQuotationType" runat="server" ClientIDMode="Static" TabIndex="6" class="select2-theme browser-default" Style="height: inherit;" >
                                                        <asp:ListItem Text="---Select Offer---" Value="" Selected="True" />
                                                        <asp:ListItem Text="Project Offer" Value="Project Offer" />
                                                        <asp:ListItem Text="Trading Offer" Value="Trading Offer" />
                                                        <asp:ListItem Text="Service Offer" Value="Service Offer" />
                                                        <asp:ListItem Text="Repairing Offer" Value="Repairing Offer" />
                                                    </asp:DropDownList>
                                                </div>
                                        <% } %>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col m2">
                                            <label class="active" for="drpProjects">Projects 
                                                <a href="javascript:openProjectInfo('add');">
                                                    <img src="images/expand.png" width="30" height="20" style="padding: 5px 5px 0px 10px;" alt="Add New Product" title="Add New Product" />
                                                </a>
                                            </label>
                                            <asp:DropDownList ID="drpProjects" runat="server" placeholder="" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="6" />
                                        </div>
                                        <% if (hdnQuotationCurrency.Value.ToLower() == "yes" || hdnQuotationCurrency.Value.ToLower() == "y")
                                            { %>
                                        <div class="input-field col m2">
                                            <label class="active" for="drpCurrency">Select Currency</label>
                                            <asp:DropDownList ID="drpCurrency" runat="server" placeholder="" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="7" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtExchangeRate">Exchange Rate</label>
                                            <asp:TextBox ID="txtExchangeRate" runat="server" MaxLength="12" placeholder="" class="form-control onlyDecimal" ClientIDMode="Static" TabIndex="8" />
                                        </div>
                                        <% } %>
                                        <div class="input-field col m2">
                                            <label class="active" for="drpBankID">Bank Details </label>
                                            <asp:DropDownList ID="drpBankID" runat="server" placeholder="" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="9" onblur="javascript:setControlFocus('txtProductName');" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtReferenceNo">Reference No</label>
                                            <asp:TextBox ID="txtReferenceNo" runat="server" placeholder="" MaxLength="50" class="form-control" ClientIDMode="Static" TabIndex="9" Style="width: 150px;"/>
                                        </div>
                                         <div class="input-field col m2">
                                            <label class="active" for="txtRefernceDate">Reference Date</label>
                                            <asp:TextBox ID="txtRefernceDate" runat="server" placeholder="" class="form-control" ClientIDMode="Static" TabIndex="5" TextMode="Date" Style="width: 150px;" />
                                     <% if (hdnSerialKey.Value == "NSIO-BASD-M39F-67SI") { %>
                                        </div>
                                         <div class="input-field col m2">
                                            <label class="active" for="txtManualQuoteNo">Manual Quotation No</label>
                                            <asp:TextBox ID="txtManualQuoteNo" runat="server" placeholder="" MaxLength="50" class="form-control" ClientIDMode="Static" TabIndex="9" Style="width: 150px;"/>
                                        </div>
                                     <% } %>
                                     <% if (hdnSerialKey.Value == "NSIO-BASD-M39F-67SI") { %>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtBidDate">Due Date</label>
                                            <asp:TextBox ID="txtBidDate" runat="server" placeholder="" class="form-control" ClientIDMode="Static" TabIndex="5" TextMode="Date" Style="width: 150px;" />
                                        </div>
                                     <% } %>
                                    </div>
                                    <div class="row">
                                        <div id="divLoad1" runat="server" clientidmode="Static" class="input-field col m4">
                                            <label class="active" for="drpInquiry">Select Lead #</label>
                                            <%--<asp:DropDownList ID="drpInquiry" runat="server" placeholder="" class="select2-size-sm browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="10" multiple="multiple" />--%>
                                            <asp:listbox runat="server" id="drpInquiry" selectionmode="Multiple" style="width: 200px;" ClientIDMode="Static" EnableViewState="true" TabIndex="10" CssClass="select2-size-sm browser-default" AutoPostBack="true" onchange="YourChangeEventJS(this)"></asp:listbox>
                                        </div>
                                        <div id="divLoad2" runat="server" clientidmode="Static" class="input-field col m2">
                                            <button id="btnLoadItems" type="button" runat="server" clientidmode="Static" tabindex="11" class="btn cyan right mr-1" onclick="javascript:getSelectedInquiry();" onserverclick="btnLoadItems_Click">Load Products</button>
                                        </div>
                                        <% if (hdnProductUpload.Value == "yes" || hdnProductUpload.Value == "y")
                                            {%>
                                        <div id="divLoad3" runat="server" clientidmode="Static" class="input-field col m2">
                                            <asp:FileUpload ID="myfile" ClientIDMode="Static" runat="server" onchange="this.form.submit()" ToolTip="Select Only PDF File" />
                                        </div>
                                        <%} %>
                                     <% if (hdnSerialKey.Value == "KKS1-RR30-LL80-AA89") { %>
                                        <div class="input-field col m3" style="margin-left:20px;">
                                            <label class="active" for="drpOrgCode">Organization Name</label>
                                            <asp:DropDownList ID="drpOrgCode" runat="server" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="12" />
                                        </div>
                                     <% } %>
                                    </div>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                    <div class="row ml-1">
                                        <div class="col s12">
                                            <ul id="myTab" class="tabs" runat="server" clientidmode="Static" enableviewstate="true" style="background-color: antiquewhite;">
                                                <li class="tab col m2 p-0"><a id="lnkProducts" class="left active" href="#pnl_Products" tabindex="12">Product Detail</a></li>
                                             <% if (hdnSerialKey.Value == "U7NP-IBC9-VR3L-E3KG")
                                                { %>
                                                    <li class="tab col m2 p-0"><a id="lnkTransport" class="left" href="#pnl_Transport" tabindex="52">Transport</a></li>
                                             <% } %>
                                                <li class="tab col m2 p-0"><a id="lnkTNC" class="left" href="#pnl_TNC" tabindex="45">Terms & Conditions</a></li>
                                                <li class="tab col m2 p-0"><a id="lnkEmail" class="left" href="#pnl_Email" tabindex="48">Item Description</a></li>
                                                <li class="tab col m2 p-0"><a id="lnkFollowUp" class="left" href="#pnl_FollowUp" tabindex="52">Follow Up</a></li>
                                                <li class="tab col m2 p-0"><a id="lnkAssumption" class="left" href="#pnl_Assumption" tabindex="56">Assumption / Other </a></li>
                                                <li class="tab col m1 p-0"><a id="lnkAttachment" class="left" href="#pnl_Attachment" tabindex="59">Attachment</a></li>
                                            </ul>
                                        </div>

                                        <div id="pnl_Products" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true">
                                            <asp:Panel runat="server" ID="pnlDetail">
                                                <table id="tblQuotationDetail" class="table responsive-table striped " cellpadding="0" cellspacing="0" border="0">
                                                    <asp:Repeater ID="rptQuotationDetail" runat="server" ClientIDMode="Static" OnItemCommand="rptQuotationDetail_ItemCommand" OnItemDataBound="rptQuotationDetail_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <thead>
                                                                <tr>
                                                                    <th class="left-align" style="width: 25%;">Product Name <span class="materialize-red-text font-weight-800">*</span>
                                                                        <%--/*Add Product view on Product Name Vikram Rajput 15-07-2020*/--%>
                                                                        <a href="javascript:openProductInfo('add');">
                                                                            <img src="images/expand.png" width="30" height="20" style="padding: 5px 5px 0px 10px;" alt="Add New Product" title="Add New Product" />
                                                                        </a>
                                                                    </th>
                                                                    <th class="center-align" style="width:5%" >Unit</th>
                                                                    <th class="center-align" style="width:5%" >Location</th>
                                                                    <% if (hdnSerialKey.Value == "SA98-6HY9-HU67-LORF")
                                                                        { %>
                                                                    <th class="right-align" style="width: 3%;">Unit Qty </th>
                                                                    <% } %>
                                                                    <% if (hdnSerialKey.Value == "DARS-SAFE-TA12-Y808")
                                                                        { %>
                                                                    <th class="center-align" style="width: 3%;">Flag</th>
                                                                    <% } %>
                                                                    <th class="right-align" style="width: 5%;">Unit Width</th>
                                                                    <th class="right-align" style="width: 5%;">Unit Height</th>
                                                                    <th class="right-align" style="width: 6%;">Basic Price</th>
                                                                    <th class="right-align" style="width: 5%;">Quantity <span class="materialize-red-text font-weight-800">*</span></th>
                                                                    <th class="right-align hide" style="width: 6%;">Purchase Rate <span class="materialize-red-text font-weight-800">*</span></th>
                                                                    <th class="right-align" style="width: 6%;">Unit Rate <span class="materialize-red-text font-weight-800">*</span></th>
                                                                    <th class="right-align" style="width: 6%;">Assembly Rate</th>
                                                                    <th class="right-align hide">Disc. %</th>
                                                                    <th class="right-align hide">Disc.Amt</th>
                                                                    <th class="right-align" style="width: 6%">Net Rate</th>
                                                                    <th class="right-align hide">Header Disc</th>
                                                                    <th class="right-align" style="width:6%">Amount</th>
                                                                    <th class="right-align" style="width:5%; padding: 0px 12px 0px 0px;">Tax %</th>
                                                                    <th class="right-align" style="width:7%; padding: 0px 0px 0px 13px;">Tax Amount</th>
                                                                    <th class="right-align" style="width:7%; padding: 0px 8px 0px 0px;">Net Amount</th>
                                                                    <% if (hdnQuotationSpecification.Value.ToLower() == "yes")
                                                                        { %>
                                                                    <th class="center-align" style="width: 4%;">Specs</th>
                                                                    <% } %>
                                                                    <th class="center-align" style="width: 4%;">Assembly</th>
                                                                    <th class="center-align" style="width: 4%;">Action</th>
                                                                </tr>
                                                            </thead>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <asp:HiddenField ID="edpkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />
                                                                <asp:HiddenField ID="edDocRefNo" runat="server" ClientIDMode="Static" Value='<%# Eval("DocRefNo") %>' />
                                                                <asp:HiddenField ID="edProductID" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductID") %>' />
                                                                <asp:HiddenField ID="edAssRate" runat="server" ClientIDMode="Static" Value='<%# Eval("AssRate") %>' />
                                                                <asp:HiddenField ID="edLength" runat="server" ClientIDMode="Static" Value='<%# Eval("UnitLength") %>' />
                                                                <asp:HiddenField ID="edPurchasePrice" runat="server" ClientIDMode="Static" Value='<%# Eval("PurchasePrice") %>' />
                                                                <asp:HiddenField ID="edWidth" runat="server" ClientIDMode="Static" Value='<%# Eval("UnitWidth") %>' />
                                                                <asp:HiddenField ID="edUnitQuantity" runat="server" ClientIDMode="Static" Value='<%# Eval("UnitQuantity") %>' />
                                                                <td class="left-align limited" style="width: 25%;">
                                                                    <label><%# Eval("ProductNameLong") %></label>
                                                                    <asp:HiddenField ID="edProductName" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductName") %>' />
                                                                    <asp:HiddenField ID="edTaxType" runat="server" ClientIDMode="Static" Value='<%# Eval("TaxType") %>' />
                                                                    <asp:HiddenField ID="edBox_SQFT" runat="server" ClientIDMode="Static" Value='<%# Eval("Box_SQFT") %>' />
                                                                    <asp:HiddenField ID="edBox_SQMT" runat="server" ClientIDMode="Static" Value='<%# Eval("Box_SQMT") %>' />
                                                                </td>
                                                                <td class="center-align width-6" style="width: 5%;">
                                                                    <asp:TextBox ID="edUnit" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("Unit") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 2 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="center-align width-6" style="width: 5%;">
                                                                    <asp:TextBox ID="edOthRef1" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("OthRef1") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 1 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <% if (hdnSerialKey.Value == "SA98-6HY9-HU67-LORF")
                                                                    { %>
                                                                <td class="right-align" style="width: 3%;">
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="edUnitQty" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("UnitQty") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 3 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <% } %>
                                                                <% if (hdnSerialKey.Value == "DARS-SAFE-TA12-Y808")
                                                                    { %>
                                                                <td class="center-align" style="width: 3%;">
                                                                    <asp:TextBox ID="edFlag" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("Flag") %>' Style="width: 90%; text-align: right;" TabIndex="15" AutoPostBack="true" OnTextChanged="editItem_TextChanged"  />
                                                                </td>
                                                                <% } %>

                                                                <td class="right-align" style="width: 5%;">
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="edUnitWidth" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("UnitWidth") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 5 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="right-align" style="width: 5%;">
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="edUnitHeight" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("UnitHeight") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 4 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="right-align" style="width: 6%;">
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="edBasicPrice" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("BasicPrice") %>' AutoPostBack="true"  OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 6 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>

                                                                <td class="right-align" style="width: 5%;">
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="edQuantity" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("Quantity") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 7 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="right-align hide" style="width: 6%;">
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="edPPrice" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("PurchasePrice") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 8 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="right-align" style="width: 6%;">
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="edUnitRate" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("UnitRate") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 9 + (Container.ItemIndex+1)*100 %>' ReadOnly="true" />
                                                                </td>
                                                                <td class="center-align" style="width: 6%;"><%# Eval("AssRate") %></td>
                                                                <td class="right-align hide">
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="edDiscountPercent" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("DiscountPercent") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 10 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="right-align hide">
                                                                    <asp:TextBox ID="edDiscountAmt" CssClass="onlyDecimal" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("DiscountAmt") %>' OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" Enabled="false" TabIndex='<%# 11 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="right-align" style="width: 6%;">
                                                                    <asp:TextBox ID="edNetRate" MaxLength="12" CssClass="onlyDecimal" runat="server" ClientIDMode="Static" Text='<%# Eval("NetRate") %>' Style="width: 90%; text-align: right;" Enabled="false" TabIndex='<%# 12 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="right-align hide">
                                                                    <asp:TextBox ID="edHeaderDiscAmt" MaxLength="12" CssClass="onlyDecimal" runat="server" ClientIDMode="Static" Text='<%# Eval("HeaderDiscAmt") %>' Style="width: 90%; text-align: right;" Enabled="false" TabIndex='<%# 8 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="right-align" style="width: 7%;">
                                                                    <asp:TextBox ID="edAmount" CssClass="onlyDecimal" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("Amount") %>' Style="width: 90%; text-align: right;" Enabled="false" TabIndex='<%# 13 + (Container.ItemIndex+1)*100 %>'  />
                                                                </td>
                                                                <td class="right-align" style="width: 5%;">
                                                                    <asp:HiddenField ID="edhdnCGSTPer" runat="server" ClientIDMode="Static" Value='<%# Eval("CGSTPer") %>' />
                                                                    <asp:HiddenField ID="edhdnSGSTPer" runat="server" ClientIDMode="Static" Value='<%# Eval("SGSTPer") %>' />
                                                                    <asp:HiddenField ID="edhdnIGSTPer" runat="server" ClientIDMode="Static" Value='<%# Eval("IGSTPer") %>' />
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="edTaxRate" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("TaxRate") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 90%; text-align: right;" TabIndex='<%# 14 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="right-align" style="width: 7%;">
                                                                    <asp:HiddenField ID="edhdnCGSTAmt" runat="server" ClientIDMode="Static" Value='<%# Eval("CGSTAmt") %>' />
                                                                    <asp:HiddenField ID="edhdnSGSTAmt" runat="server" ClientIDMode="Static" Value='<%# Eval("SGSTAmt") %>' />
                                                                    <asp:HiddenField ID="edhdnIGSTAmt" runat="server" ClientIDMode="Static" Value='<%# Eval("IGSTAmt") %>' />
                                                                    <asp:TextBox ID="edTaxAmount" CssClass="onlyDecimal" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("TaxAmount") %>' AutoPostBack="true" Style="width: 90%; text-align: right;" Enabled="false" TabIndex='<%# 15 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <td class="right-align" style="width: 7%;">
                                                                    <asp:TextBox ID="edNetAmount" CssClass="onlyDecimal" MaxLength="12" runat="server" ClientIDMode="Static" Text='<%# Eval("NetAmount") %>' AutoPostBack="true" Style="width: 90%; text-align: right;" Enabled="false" TabIndex='<%# 16 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                                <% if (hdnQuotationSpecification.Value.ToLower() == "yes")
                                                                    { %>
                                                                <td class="center-align" style="width: 4%;">
                                                                    <a id="lnkSpecs" style="font-size:15px;color:black;width:95%;" class="btn cyan right mr-1" href="javascript:openSpecification('<%# Eval("ProductID") %>','<%# Eval("pkID") %>');" tabindex="19"><small>Specs</small></a>
                                                                </td>
                                                                <% } %>
                                                                <% if(hdnQuotationAssembly.Value.ToLower() == "yes") { %>
                                                                    <td class="center-align" style="width: 4%;">
                                                                        <a id="lnkAssembly" style="font-size:15px;color:black;width:95%;" class="btn cyan right mr-1" href="javascript:openAssembly('<%# Eval("ProductID") %>', '<%# Eval("OthRef1") %>', '<%# Eval("UnitHeight") %>', '<%# Eval("UnitWidth") %>');" tabindex="19"><small>Assembly</small></a>
                                                                    </td>
                                                                <% } %>
                                                                <td class="center-align" style="width: 4%;">
                                                                    <asp:ImageButton ID="ImgbtnDelete" runat="server" ClientIDMode="Static" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' Width="20" Height="20" OnClientClick="return delClientClick()" TabIndex='<%# 17 + (Container.ItemIndex+1)*100 %>' />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr style="background-color: #dde8f3;">
                                                                <td class="left-align" style="width: 25%;">
                                                                    <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnUnitQuantity" runat="server" ClientIDMode="Static" />
                                                                    
                                                                    <%--<asp:HiddenField ID="hdnUnitLength" runat="server" ClientIDMode="Static" />--%>
                                                                    <%--<asp:HiddenField ID="hdnUnitWidth" runat="server" ClientIDMode="Static" />--%>
                                                                    <%--<asp:HiddenField ID="hdnPurchasePrice" runat="server" ClientIDMode="Static" />--%>


                                                                    <asp:HiddenField ID="hdnUnitHeight" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnUnitWidth" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnBasicPrice" runat="server" ClientIDMode="Static" />

                                                                    <asp:HiddenField ID="hdnTaxType" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnOrgUnitRate" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnBox_SQFT" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnAssRate" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnBox_SQMT" runat="server" ClientIDMode="Static" />
                                                                    <%--<asp:DropDownList ID="drpProduct" runat="server" ClientIDMode="Static"  Width="200" TabIndex="51" AutoPostBack="true" OnSelectedIndexChanged="drpProduct_SelectedIndexChanged"/>--%>
                                                                    <asp:TextBox ID="txtProductName" runat="server" ClientIDMode="Static" class="form-control" onKeyup="bindDDLProductTo('#txtProductName')" AutoPostBack="true" OnTextChanged="txtProductName_TextChanged" TabIndex="12" Width="95%" />
                                                                </td>
                                                                <td class="center-align" style="width: 5%;">
                                                                    <asp:TextBox CssClass="center-align" MaxLength="12" ID="txtUnit" runat="server" ClientIDMode="Static" Width="90%" TabIndex="13" />
                                                                </td>
                                                                <td class="center-align" style="width: 5%;">
                                                                    <asp:TextBox CssClass="center-align" MaxLength="12" ID="txtOthRef1" runat="server" ClientIDMode="Static" Width="90%" TabIndex="13" />
                                                                </td>
                                                                <% if (hdnSerialKey.Value == "SA98-6HY9-HU67-LORF")
                                                                    { %>
                                                                <td class="right-align" style="width: 3%;">
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="txtUnitQty" runat="server" ClientIDMode="Static" Width="70" TabIndex="14" />
                                                                </td>
                                                                <% } %>
                                                                <% if (hdnSerialKey.Value == "DARS-SAFE-TA12-Y808")
                                                                    { %>
                                                                <td class="center-align" style="width: 3%;">
                                                                    <asp:TextBox CssClass="onlyDecimal" ID="txtFlag" runat="server" ClientIDMode="Static" Width="70" TabIndex="14" />
                                                                </td>
                                                                <% } %>

                                                                <td class="right-align" style="width: 5%;">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtUnitWidth" runat="server" ClientIDMode="Static" Width="90%" TabIndex="15" AutoPostBack="true" OnTextChanged="txtUnitHeight_TextChanged" />
                                                                </td>
                                                                <td class="right-align" style="width: 5%;">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtUnitHeight" runat="server" ClientIDMode="Static" Width="90%" TabIndex="15" AutoPostBack="true" OnTextChanged="txtUnitHeight_TextChanged" />
                                                                </td>
                                                                <td class="right-align" style="width: 6%;">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtBasicPrice" runat="server" ClientIDMode="Static" Width="90%" TabIndex="15" AutoPostBack="true" OnTextChanged="txtUnitHeight_TextChanged" />
                                                                </td>

                                                                <td class="right-align" style="width: 5%;">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtQuantity" runat="server" ClientIDMode="Static" Width="90%" TabIndex="15" AutoPostBack="true" OnTextChanged="txtUnitHeight_TextChanged" />
                                                                </td>
                                                                <td class="right-align hide" style="width: 6%;">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtPPrice" runat="server" ClientIDMode="Static" Width="90%" TabIndex="16" />
                                                                </td>
                                                                <td class="right-align" style="width: 6%;">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtUnitRate" runat="server" ClientIDMode="Static" Width="90%" TabIndex="16" ReadOnly="true" />
                                                                </td>
                                                                <td id="tdAssRate" runat="server" class="right-align" style="width: 6%;"> </td>
                                                                <td class="right-align hide">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtDiscountPercent" runat="server" ClientIDMode="Static" Width="90%" TabIndex="17" onblur="javascript:setControlFocus('txtTaxRate');"   />
                                                                </td>
                                                                <td class="right-align hide">
                                                                    <asp:TextBox ID="txtDiscountAmt" CssClass="onlyDecimal"  MaxLength="12" runat="server" ClientIDMode="Static" Width="90%" TabIndex="18" Enabled="false" />
                                                                </td>
                                                                <td class="center-align" style="width: 6%;">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" ID="txtNetRate" MaxLength="12" runat="server" ClientIDMode="Static" Width="90%" TabIndex="19" Enabled="false" />
                                                                </td>
                                                                <td class="right-align hide">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtHeaderDiscAmt" runat="server" ClientIDMode="Static" Width="90%" TabIndex="20" Enabled="false" AutoPostBack="true" />
                                                                </td>
                                                                <td class="right-align" style="width: 6%;">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtAmount" runat="server" ClientIDMode="Static" Width="90%" TabIndex="21" Enabled="false" />
                                                                </td>
                                                                <td class="right-align" style="width: 5%;">
                                                                    <asp:HiddenField ID="hdnCGSTPer" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnSGSTPer" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnIGSTPer" runat="server" ClientIDMode="Static" />
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtTaxRate" runat="server" ClientIDMode="Static" Width="90%" TabIndex="22" onblur="javascript:setControlFocus('imgBtnSave');"/>
                                                                </td>
                                                                <td class="right-align" style="width: 7%;">
                                                                    <asp:HiddenField ID="hdnCGSTAmt" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnSGSTAmt" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnIGSTAmt" runat="server" ClientIDMode="Static" />
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtTaxAmount" runat="server" ClientIDMode="Static" Width="90%" TabIndex="23" Enabled="false" />
                                                                </td>
                                                                <td class="right-align" style="width: 7%;">
                                                                    <asp:TextBox CssClass="right-align onlyDecimal" MaxLength="12" ID="txtNetAmount" runat="server" ClientIDMode="Static" Width="90%" TabIndex="24" Enabled="false" />
                                                                </td>
                                                                <td class="center-align" colspan="3" style="width: 12%;">
                                                                    <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="~/images/buttons/bt-add2.png" ToolTip="Add Item" CommandName="Save" CommandArgument='0' Width="110" Height="30" />
                                                                </td>
                                                            </tr>
                                                            <tr class="left hide" style="background-color: navy; min-height: 50px;">
                                                                <td class="right" colspan="5" style="width: 41%; color: White; font-size: 16px;">Grand Total: </td>
                                                                <td class="right" style="display: none;">
                                                                    <asp:Label ID="lblTotalDiscAmt" runat="server" ClientIDMode="Static" Width="100" TabIndex="35" Enabled="false" Style="color: White; font-size: 16px;" Text="1111" />
                                                                </td>
                                                                <td class="right" style="width: 10%;">
                                                                    <asp:Label ID="lblTotalAmt" runat="server" ClientIDMode="Static" Width="100" TabIndex="36" Enabled="false" Style="color: White; font-size: 16px;" Text="1111" />
                                                                </td>
                                                                <td class="right hide">
                                                                    <asp:Label ID="lblTotalTaxAmount" runat="server" ClientIDMode="Static" Width="100" TabIndex="37" Enabled="false" Style="color: White; font-size: 16px;" Text="1111" />
                                                                </td>
                                                                <td class="right" style="width: 38%;">
                                                                    <asp:Label ID="lblTotalNetAmount" runat="server" ClientIDMode="Static" Width="100" TabIndex="38" Enabled="false" Style="color: White; font-size: 16px;" Text="1111" />
                                                                </td>
                                                                <td colspan="2"></td>
                                                            </tr>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </asp:Panel>
                                            <div class="row">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="col m4">
                                                            <table id="tblCharge" class="table responsive-table striped" cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <thead>
                                                                    <th class="center-align">Charge Type</th>
                                                                    <th class="center-align">Percentage</th>
                                                                    <th class="center-align">Amount</th>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <asp:HiddenField ID="hdnOthChrgGST1" runat="server" ClientIDMode="Static" />
                                                                        <asp:HiddenField ID="hdnOthChrgBasic1" runat="server" ClientIDMode="Static" />
                                                                        <td class="width-50">
                                                                            <asp:DropDownList ID="drpOthChrg1" runat="server" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="25" AutoPostBack="true" OnSelectedIndexChanged="drpOthChrg1_SelectedIndexChanged" /></td>
                                                                        <td class="width-20">
                                                                            <asp:TextBox ID="txtOthChrgPer1" MaxLength="12" class="form-control right-align inputOther onlyDecimal" Width="90%" runat="server" ClientIDMode="Static" TabIndex="26" AutoPostBack="true" OnTextChanged="txtOthChrgPer1_TextChanged" /></td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtOthChrgAmt1" MaxLength="12" class="form-control inputOther onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="26" AutoPostBack="true" OnTextChanged="txtOthChrgAmt1_TextChanged" Style="text-align: right;" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <asp:HiddenField ID="hdnOthChrgGST2" runat="server" ClientIDMode="Static" />
                                                                        <asp:HiddenField ID="hdnOthChrgBasic2" runat="server" ClientIDMode="Static" />
                                                                        <td class="width-50">
                                                                            <asp:DropDownList ID="drpOthChrg2" runat="server" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="27" AutoPostBack="true" OnSelectedIndexChanged="drpOthChrg2_SelectedIndexChanged" /></td>
                                                                        <td class="width-20">
                                                                            <asp:TextBox ID="txtOthChrgPer2" MaxLength="12" class="form-control right-align inputOther onlyDecimal" Width="90%" runat="server" ClientIDMode="Static" TabIndex="26" AutoPostBack="true" OnTextChanged="txtOthChrgPer2_TextChanged" /></td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtOthChrgAmt2" MaxLength="12" class="form-control inputOther onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="28" AutoPostBack="true" OnTextChanged="txtOthChrgAmt2_TextChanged" Style="text-align: right;" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <asp:HiddenField ID="hdnOthChrgGST3" runat="server" ClientIDMode="Static" />
                                                                        <asp:HiddenField ID="hdnOthChrgBasic3" runat="server" ClientIDMode="Static" />
                                                                        <td class="width-50">
                                                                            <asp:DropDownList ID="drpOthChrg3" runat="server" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="29" AutoPostBack="true" OnSelectedIndexChanged="drpOthChrg3_SelectedIndexChanged" /></td>
                                                                        <td class="width-20">
                                                                            <asp:TextBox ID="txtOthChrgPer3" MaxLength="12" class="form-control right-align inputOther onlyDecimal" Width="90%" runat="server" ClientIDMode="Static" TabIndex="30" AutoPostBack="true" OnTextChanged="txtOthChrgPer3_TextChanged" /></td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtOthChrgAmt3" MaxLength="12" class="form-control inputOther onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="30" AutoPostBack="true" OnTextChanged="txtOthChrgAmt3_TextChanged" Style="text-align: right;" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <asp:HiddenField ID="hdnOthChrgGST4" runat="server" ClientIDMode="Static" />
                                                                        <asp:HiddenField ID="hdnOthChrgBasic4" runat="server" ClientIDMode="Static" />
                                                                        <td class="width-50">
                                                                            <asp:DropDownList ID="drpOthChrg4" runat="server" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="31" AutoPostBack="true" OnSelectedIndexChanged="drpOthChrg4_SelectedIndexChanged" /></td>
                                                                        <td class="width-20">
                                                                            <asp:TextBox ID="txtOthChrgPer4" MaxLength="12" class="form-control right-align inputOther onlyDecimal" Width="90%" runat="server" ClientIDMode="Static" TabIndex="32" AutoPostBack="true" OnTextChanged="txtOthChrgPer4_TextChanged" /></td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtOthChrgAmt4" MaxLength="12" class="form-control inputOther onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="32" AutoPostBack="true" OnTextChanged="txtOthChrgAmt4_TextChanged" Style="text-align: right;" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <asp:HiddenField ID="hdnOthChrgGST5" runat="server" ClientIDMode="Static" />
                                                                        <asp:HiddenField ID="hdnOthChrgBasic5" runat="server" ClientIDMode="Static" />
                                                                        <td class="width-50">
                                                                            <asp:DropDownList ID="drpOthChrg5" runat="server" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="33" AutoPostBack="true" OnSelectedIndexChanged="drpOthChrg5_SelectedIndexChanged" /></td>
                                                                        <td class="width-20">
                                                                            <asp:TextBox ID="txtOthChrgPer5" MaxLength="12" class="form-control right-align inputOther onlyDecimal" Width="90%" runat="server" ClientIDMode="Static" TabIndex="34" AutoPostBack="true" OnTextChanged="txtOthChrgPer5_TextChanged" /></td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtOthChrgAmt5" MaxLength="12" class="form-control inputOther onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="34" AutoPostBack="true" OnTextChanged="txtOthChrgAmt5_TextChanged" Style="text-align: right;" /></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="col m8">
                                                            <table id="tblSummary" class="table responsive-table striped" cellpadding="0" cellspacing="0" border="0" style="width:98% !important;">
                                                                <tbody>
                                                                    <asp:HiddenField ID="hdnTotCGSTAmt" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnTotSGSTAmt" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnTotIGSTAmt" runat="server" ClientIDMode="Static" />
                                                                    <asp:HiddenField ID="hdnTotItemGST" runat="server" ClientIDMode="Static" />
                                                                    <tr class="border-none">
                                                                        <td class="width-70 right-align">Discount Per</td>
                                                                        <td class="width-30">
                                                                            <table class="table responsive-table striped">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtHeadDiscountPer" MaxLength="12" Width="100px" class="form-control inputCalc onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="35" AutoPostBack="true" OnTextChanged="txtHeadDiscountPer_TextChanged" Style="text-align: right;" /></td>
                                                                                        <td><span>Amount</span></td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtHeadDiscount" ReadOnly="true" MaxLength="12" class="form-control inputCalc onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="35" AutoPostBack="false" OnTextChanged="txtHeadDiscount_TextChanged" Style="text-align: right;" /></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="border-none">
                                                                        <td class="width-70 right-align">Basic Amount</td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtTotBasicAmt" MaxLength="12" class="form-control inputCalc onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="36" ReadOnly="true" Style="text-align: right;" /></td>
                                                                    </tr>
                                                                    <tr class="border-none">
                                                                        <td class="width-70 right-align">Other Charge <small style="color: navy; font-weight: 600;">(With Tax)</small></td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtTotOthChrgBeforeGST" MaxLength="12" class="form-control inputCalc onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="37" ReadOnly="true" Style="text-align: right;" /></td>
                                                                    </tr>
                                                                    <tr class="border-none">
                                                                        <td class="width-70 right-align">
                                                                            <a id="lnkTaxSummary" href="javascript:openTaxSummary();">
                                                                            <small class="mr-3" id="spnTaxApplied" runat="server" style="padding-left: 5px;padding-right: 5px;border-radius: 8px;"></small>
                                                                            </a>
                                                                            Total GST
                                                                        </td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtTotGST" MaxLength="12" class="form-control inputCalc onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="38" ReadOnly="true" Style="text-align: right;" /></td>
                                                                    </tr>
                                                                    <tr class="border-none">
                                                                        <td class="width-70 right-align">Other Charges <small style="color: Navy; font-weight: 600;">(Excluding Tax)</small></td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtTotOthChrgAfterGST" MaxLength="12" class="form-control inputCalc onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="39" ReadOnly="true" Style="text-align: right;" /></td>
                                                                    </tr>
                                                                    <tr class="border-none">
                                                                        <td class="width-70 right-align">Rnd.Off</td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtRoff" class="form-control inputCalc onlyDecimal" MaxLength="12" runat="server" ClientIDMode="Static" TabIndex="40" ReadOnly="true" Style="text-align: right;" /></td>
                                                                    </tr>
                                                                    <tr class="border-none">
                                                                        <td class="width-70 right-align">Net Amount</td>
                                                                        <td class="width-30">
                                                                            <asp:TextBox ID="txtTotNetAmt" MaxLength="12" class="form-control inputCalc onlyDecimal" runat="server" ClientIDMode="Static" TabIndex="41" ReadOnly="true" Style="font-weight: bold; text-align: right;" /></td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>

                                        <div id="pnl_TNC" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true">
                                            <div class="row">
                                                <div class="input-field col m3">
                                                    <label class="active" for="drpTNC">Select Terms & Conditions</label>
                                                    <asp:DropDownList ID="drpTNC" runat="server" ClientIDMode="Static" class="browser-default" EnableViewState="true" TabIndex="46" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="drpTNC_SelectedIndexChanged" />
                                                </div>
                                                 <div class="input-field col m3">
                                                    <label class="active" for="">Software Hosting</label>
                                                    <asp:TextBox ID="txtHosting" MaxLength="50" runat="server" class="form-control" ClientIDMode="Static" TabIndex="47" Width="200px" placeholder="" />
                                                </div>
                                                <div class="input-field col m3">
                                                    <label class="active" for="">Max Users</label>
                                                    <asp:TextBox ID="txtMaxUsers" MaxLength="50" runat="server" class="form-control" ClientIDMode="Static" TabIndex="48" Width="200px" placeholder="" />
                                                </div>
                                                <div class="input-field col m3">
                                                    <label class="active" for="">Delivery Time</label>
                                                    <asp:TextBox ID="txtDeliveryTime" MaxLength="50" runat="server" class="form-control" ClientIDMode="Static" TabIndex="49" Width="200px" placeholder="" />
                                                </div>

                                                <div class="input-field col m12">
                                                    <label class="active" for="txtQuotationFooter">Terms & Conditions</label>
                                                    <asp:TextBox ID="txtQuotationFooter" Style="height: 7rem !important;" MaxLength="5000" runat="server" class="form-control" ClientIDMode="Static" TabIndex="47" TextMode="MultiLine" Rows="13" placeholder="" />
                                                </div>
                                            </div>
                                        </div>

                                        <div id="pnl_Email" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true">
                                            <div class="row">
                                                <div class="input-field col m2">
                                                    <label class="active" for="drpQuotationCategory">Select Subject</label>
                                                    <asp:DropDownList ID="drpQuotationCategory" runat="server" ClientIDMode="Static" class="select2-theme browser-default" EnableViewState="true" TabIndex="49" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="drpQuotationCategory_SelectedIndexChanged" />
                                                </div>
                                                <div class="input-field col m10">
                                                    <%--Section : Add New Entry --%>
                                                    <a class="material-icons background-round gradient-45deg-purple-amber gradient-shadow white-text float-Left tooltipped ml-5 mr-2" data-position="center" data-tooltip="Add New Entry" href="javascript:gridAction('add','<%# drpQuotationCategory.SelectedValue %>');" style="padding: 5px;"><i class="material-icons">add</i></a>
                                                </div>
                                                <div class="input-field col m12">
                                                    <label class="active" for="txtQuotationSubject">Subject</label>
                                                    <asp:TextBox ID="txtQuotationSubject" runat="server" placeholder="" class="form-control" ClientIDMode="Static" MaxLength="1500" TabIndex="50" />
                                                </div>
                                                <div class="input-field col m12">
                                                    <label class="active" for="txtQuotationHeader">Email Introduction</label>
                                                    <asp:TextBox ID="txtQuotationHeader" MaxLength="500" runat="server" class="form-control" ClientIDMode="Static" TabIndex="51" TextMode="MultiLine" Rows="13" placeholder="" />
                                                </div>
                                            </div>
                                        </div>

                                        <div id="pnl_FollowUp" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true">
                                            <div class="row">
                                                <div class="input-field col m12">
                                                    <div id="divFollowUp" runat="server" clientidmode="Static">
                                                        <div class="row">
                                                            <div class="input-field col m6">
                                                                <label class="active" for="txtNextFollowupDate">Next Followup</label>
                                                                <asp:TextBox ID="txtNextFollowupDate" MaxLength="500" runat="server" class="form-control" ClientIDMode="Static" TabIndex="53" placeholder="" TextMode="Date" />
                                                            </div>
                                                            <div class="input-field col m6">
                                                                <label class="active" for="drpFollowupType">Followup Type</label>
                                                                <asp:DropDownList ID="drpFollowupType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="54"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="input-field col m12">
                                                                <label class="active" for="txtMeetingNotes">Meeting Notes</label>
                                                                <asp:TextBox ID="txtMeetingNotes" runat="server" class="form-control" ClientIDMode="Static" TabIndex="55" MaxLength="500" TextMode="MultiLine" Rows="4" placeholder="" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         <% if (hdnSerialKey.Value == "U7NP-IBC9-VR3L-E3KG")
                                                { %>
                                        <div id="pnl_Transport" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true">
                                            <div class="row">
                                                <div class="input-field col m12">
                                                    <div id="div2" runat="server" clientidmode="Static">
                                                        <div class="row">                                                            
                                                            <div class="input-field col m4">
                                                               <asp:HiddenField ID="hdnDispatchTo" runat="server" ClientIDMode="Static" />
                                                               <asp:TextBox ID="txtDispatchTo" runat="server" ClientIDMode="Static" placeholder="Min. 3 Chars To Activate search" class="form-control" AutoPostBack="true" onKeyup="bindDDLToDispatchTo('#txtDispatchTo')" OnTextChanged="txtDispatchTo_TextChanged" TabIndex="3" Style="margin-top: 3px" MaxLenght="50" />
                                                               <label class="active" for="txtDispatchTo" style="margin-top: 3px">Dispatch To</label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                             <div class="input-field col m2">
                                                                <label class="active" for="drpTransport">Transport Name</label>
                                                                <asp:DropDownList ID="drpTransport" runat="server" placeholder="" class="select2-theme browser-default" EnableViewState="true" ClientIDMode="Static" TabIndex="9"/>
                                                             </div>
                                                             <div class="input-field col m6">
                                                                <label class="active" for="txtDestination">Destination</label>
                                                                <asp:TextBox ID="txtDestination" runat="server" class="form-control" ClientIDMode="Static" TabIndex="55" MaxLength="500" Rows="4" placeholder="" />
                                                             </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="input-field col m12 hide" >
                                                                <label class="active" for="txtOtherReference">Other Reference</label>
                                                                <asp:TextBox ID="txtOtherReference" runat="server" class="form-control" ClientIDMode="Static" TabIndex="55" MaxLength="500" TextMode="MultiLine" Rows="4" placeholder="" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="input-field col m12">
                                                                <label class="active" for="txtPaymentTerms">Payment Terms</label>
                                                                <asp:TextBox ID="txtPaymentTerms" runat="server" class="form-control" ClientIDMode="Static" TabIndex="55" MaxLength="500" TextMode="MultiLine" Rows="4" placeholder="" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="input-field col m12">
                                                                <label class="active" for="txtDeliveryTerms">Delivery Terms</label>
                                                                <asp:TextBox ID="txtDeliveryTerms" runat="server" class="form-control" ClientIDMode="Static" TabIndex="55" MaxLength="500" TextMode="MultiLine" Rows="4" placeholder="" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <% } %>
                                        <div id="pnl_Assumption" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true">
                                            <div class="row">
                                                <div class="input-field col m6">
                                                    <label class="active" for="txtAssumptionRemark">Ref. Enquiry</label>
                                                    <asp:TextBox ID="txtAssumptionRemark" MaxLength="500" runat="server" class="form-control" ClientIDMode="Static" TabIndex="57" TextMode="MultiLine" Rows="13" Height="200px" placeholder="" />
                                                </div>
                                                <div class="input-field col m6">
                                                    <label class="active" for="txtAdditionalRemark">Other Remarks</label>
                                                    <asp:TextBox ID="txtAdditionalRemark" MaxLength="500" runat="server" class="form-control" ClientIDMode="Static" TabIndex="58" TextMode="MultiLine" Rows="13" Height="200px" placeholder="" />
                                                </div>
                                            </div>
                                        </div>

                                        <div id="pnl_Attachment" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true" style="display: none;">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                    <uc1:myModuleAttachment runat="server" id="myModuleAttachment" />
                                            </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="txtHeadDiscount" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
                <a id="menuDiscovery" class="waves-effect waves-light btn btn-floating hide"><i class="material-icons">menu</i></a>
                <!-- Tap Target Structure -->
                <div class="tap-target" data-target="menuDiscovery">
                    <div class="tap-target-content">
                        <h5>Title</h5>
                        <p>A bunch of text</p>
                    </div>
                </div>

                <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom" style="margin-top: 10px;">
                    <div class="col m12">
                        <button type="button" id="btnQReset" runat="server" clientidmode="Static" class="btn orange left" onserverclick="btnReset_Click" tabindex="62"><i class="material-icons left">backspace</i>Clear & Add New</button>
                        <% if (hdnSerialKey.Value == "4JM1-E874-JBK0-5HAN")
                            {%>
                        <button type="button" id="btnQSaveEmail1" runat="server" clientidmode="Static" class="btn cyan  right mr-1" onserverclick="btnQSaveEmail_Click" tabindex="67"><i class="material-icons left">email</i>Save-Send Email (Tabular)</button>
                        <button type="button" id="btnQSaveEmail2" runat="server" clientidmode="Static" class="btn cyan  right mr-1" onserverclick="btnQSaveEmail_Click" tabindex="68"><i class="material-icons left">email</i>Save-Send Email (Remark)</button>
                        <%}
                            else
                            {%>
                        <a id="btnNotification"  runat="server" class="waves-effect waves-light gradient-45deg-deep-purple-blue btn modal-trigger z-depth-4 right ml-1 mr-1" href="#myNotificationModal"><i class="material-icons left">email</i>Save & Send Notfication</a>
                        <%--<button type="button" id="btnQSaveEmail" runat="server" clientidmode="Static" class="btn cyan  right mr-1" onserverclick="btnQSaveEmail_Click" tabindex="60"><i class="material-icons left">email</i>Save - Send Email</button>--%>
                        <%}%>
                        <button type="button" id="btnQSave" runat="server" clientidmode="Static" class="btn cyan right mr-1" onserverclick="btnQSave_Click" tabindex="61"><i class="material-icons left">save</i>Save</button>
                    </div>
                </div>
                <br />
                <%-- PopUp Modal Box to Open Window --%>
                <asp:Button ID="Button1" CssClass="hide" runat="server" Text="Fill Form in Popup" />
                <cc1:ModalPopupExtender ID="myModalPopup" BehaviorID="mpe" runat="server" ClientIDMode="Static" PopupControlID="Panl1" TargetControlID="Button1" CancelControlID="Button2" BackgroundCssClass="Background">
                </cc1:ModalPopupExtender>
                <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" Style="display: none; border-radius: 10px; padding-right: 10px !important;">
                    <div id="myModal123">
                        <div class="modal-header position-sticky gradient-45deg-light-blue-indigo m-0" style="margin-bottom: 10px !important;">
                            <h5 class=" z-depth-5" style="font-size: 2rem !important; font-weight: 800; line-height: 50px; margin: 0; text-align: left; padding-left: 15px;">
                                <i class="material-icons prefix">ac_unit</i>
                                <span id="spnModuleHeader" runat="server" clientidmode="static">Manage Module</span>
                                <asp:Button CssClass="btnTopRightCorner float-right" ID="Button2" runat="server" Text="" />
                            </h5>
                        </div>
                    </div>
                    <iframe id="ifrModule" src="about:blank" runat="server" clientidmode="static" scrolling="auto" style="border: 1px solid silver; background-color: transparent; width: 100%; height: 90%; padding: 5px;"></iframe>
                    <br />
                </asp:Panel>
                
                <div id="myNotificationModal" class="modal modal-fixed-footer width-80 border-radius-8" style="min-height:90% !important; border: 5px solid darkgrey; top: 5% !important;">
                    <div class="modal-footer">
                        <h5 class=" z-depth-5" style="position: fixed; top: 0; left:0px; width:100%; font-size: 2rem !important; font-weight:800; line-height: 50px; margin: 0; text-align: left; padding-left: 15px;">
                            <i class="material-icons prefix">ac_unit</i>
                            <span id="Span1" runat="server" clientidmode="static">Save & Send Notification</span>
                            <asp:Button CssClass="btnTopRightCorner float-right" ID="ucNotificationClose" runat="server" Text=""/>
                        </h5>
                    </div>
                    <div class="modal-content mt-3" style="overflow-x:hidden; overflow-y: auto !important;">
                        <uc1:myNotificationPanel runat="server" id="myNotificationPanel" />
                    </div>
                </div> 
                <input type="text" id="txtTemp" runat="server" clientidmode="Static" tabindex="11" onfocus="javascript:setControlFocus('txtProductName');" style="border:0px !important;" />
                <script type="text/javascript">
                    var isByDelete = false;

                    $(document).on("keypress", "input", function (event) {
                        if (event.which === 13 && event.target.type !== "image") {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                    });

                    $("#ucNotificationClose").click(function () {
                        const elem = document.getElementById('myNotificationModal');
                        const instance = M.Modal.init(elem, { dismissible: false });
                        instance.open();
                    });

                    function bindDDLTo(selector) {
                        var link;
                        if (jQuery('#hdnSerialKey').val() == 'HEMA-AUTO-SI08-NVRL')
                            link = 'InquiryInfo.aspx/FilterCustomerByModuleCityState'
                        else
                            link = 'InquiryInfo.aspx/FilterCustomerByEmployee'
                        var value = '<%= Session["LoginUserID"] %>';
                        if ($(selector).val().length >= 3) {
                            jQuery.ajax({
                                type: "POST",
                                url: link,
                                data: '{pCustName:\'' + $(selector).val() + '\', pSearchModule:\'CustomerSearchAll\', LoginUserID:\'' + value + '\''+'\}',
                                contentType: "application/json; charset=utf-8",
                                success: function (data) {
                                    console.log(data);
                                    //var resultdata = JSON.parse(data.d);
                                    var sample = JSON.parse(data.d);
                                    $(selector).autoComplete({
                                        minChars: 1,
                                        source: function (term, suggest) {
                                            term = term.toLowerCase();
                                            var choices = sample;
                                            suggest(choices);
                                        },
                                        renderItem: function (item, search) {
                                            $(".autocomplete-suggestion").remove();
                                            //search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
                                            //var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
                                            return '<div class="autocomplete-suggestion" data-langname="' + item.CustomerID + '" data-lang="' + item.CustomerName + '" data-val="' + search + '">' + item.CustomerName + '</div>';
                                        },
                                        onSelect: function (e, term, item) {
                                            //console.log('Item "' + item.data('langname') + ' (' + item.data('lang') + ')" selected by ' + (e.type == 'keydown' ? 'pressing enter or tab' : 'mouse click') + '.');
                                            $(selector).val(item.html());
                                            $("#hdnCustomerID").val(item.data('langname'));
                                            $("#drpInquiry").focus();
                                        }
                                    });

                                },
                                error: function (r) { alert('Error : ' + r.responseText); },
                                failure: function (r) { alert('failure'); }
                            });
                            return false;
                        }
                        else {
                            if ($(selector).val().length == 0) {
                                $("#hdnCustomerID").val('');
                            }
                        }
                    }

                     function bindDDLToDispatchTo(selector) {
                        var link;
                        link = 'InquiryInfo.aspx/FilterCustomerByEmployee'
                        var value = '<%= Session["LoginUserID"] %>';
                        if ($(selector).val().length >= 3) {
                            jQuery.ajax({
                                type: "POST",
                                url: link,
                                data: '{pCustName:\'' + $(selector).val() + '\', pSearchModule:\'CustomerSearchAll\', LoginUserID:\'' + value + '\''+'\}',
                                contentType: "application/json; charset=utf-8",
                                success: function (data) {
                                    console.log(data);
                                    //var resultdata = JSON.parse(data.d);
                                    var sample = JSON.parse(data.d);
                                    $(selector).autoComplete({
                                        minChars: 1,
                                        source: function (term, suggest) {
                                            term = term.toLowerCase();
                                            var choices = sample;
                                            suggest(choices);
                                        },
                                        renderItem: function (item, search) {
                                            $(".autocomplete-suggestion").remove();
                                            //search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
                                            //var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
                                            return '<div class="autocomplete-suggestion" data-langname="' + item.CustomerID + '" data-lang="' + item.CustomerName + '" data-val="' + search + '">' + item.CustomerName + '</div>';
                                        },
                                        onSelect: function (e, term, item) {
                                            //console.log('Item "' + item.data('langname') + ' (' + item.data('lang') + ')" selected by ' + (e.type == 'keydown' ? 'pressing enter or tab' : 'mouse click') + '.');
                                            $(selector).val(item.html());
                                            $("#hdnDispatchTo").val(item.data('langname'));
                                            $("#drpInquiry").focus();
                                        }
                                    });

                                },
                                error: function (r) { alert('Error : ' + r.responseText); },
                                failure: function (r) { alert('failure'); }
                            });
                            return false;
                        }
                        else {
                            if ($(selector).val().length == 0) {
                                $("#hdnDispatchTo").val('');
                            }
                        }
                    }
                    function bindDDLProductTo(selector) {
                        var X = $("#hdnCustWisePro").val();
                        var Y = 0;
                        if (X.toLowerCase() == 'yes' && $("#hdnCustomerID").val() != '')
                            Y = $("#hdnCustomerID").val();
                        //alert(Y);
                        if ($(selector).val().length >= 3) {
                            jQuery.ajax({
                                type: "POST",
                                url: "InquiryInfo.aspx/FilterProductCust",
                                data: '{pProductName:\'' + $(selector).val() + '\', pSearchModule:\'ProductSearchTypeQuotation\', CustomerID:' + Y + '}',
                                //data: '{pProductName:\'' + $(selector).val() + '\', pSearchModule:\'ProductSearchTypeQuotation\'}',
                                contentType: "application/json; charset=utf-8",
                                success: function (data) {
                                    var sample = JSON.parse(data.d);
                                    $(selector).autoComplete({
                                        minChars: 1,
                                        source: function (term, suggest) {
                                            term = term.toLowerCase();
                                            var choices = sample;
                                            suggest(choices);
                                        },
                                        renderItem: function (item, search) {
                                            $(".autocomplete-suggestion").remove();
                                            //$(".autocomplete-suggestion").style.width = 'auto';
                                            return '<div class="autocomplete-suggestion" style"color:red;" data-langname="' + item.pkID + '" data-lang="' + item.ProductNameLong + '" data-val="' + search + '">' + item.ProductNameLong + '</div>';
                                        },
                                        onSelect: function (e, term, item) {
                                            //console.log('Item "' + item.data('langname') + ' (' + item.data('lang') + ')" selected by ' + (e.type == 'keydown' ? 'pressing enter or tab' : 'mouse click') + '.');
                                            $(selector).val(item.html());
                                            $("#hdnProductID").val(item.data('langname'));
                                            $("#txtUnit").focus();
                                        }
                                    });

                                },
                                error: function (r) { alert('Error : ' + r.responseText); },
                                failure: function (r) { alert('failure'); }
                            });
                            return false;
                        }
                        else {
                            if ($(selector).val().length == 0) {
                                $("#hdnProductID").val('');
                            }
                        }
                    }

                    function clearProductField() {
                        $("#hdnProductID").val('');
                        $("#txtProductName").val('');
                        $("#txtQuantity").val('');
                        $("#txtUnit").val('');
                        $("#txtUnitRate").val('');
                        $("#txtDiscountPercent").val('');
                        $("#txtNetRate").val('');
                        $("#txtAmount").val('');
                        $("#txtTaxRate").val('');
                        $("#txtTaxAmount").val('');
                        $("#txtNetAmount").val('');
                        $("#txtProductName").focus();
                    }

                    function YourChangeEventJS(ddl) {
                        var test = $(".select2-selection__rendered").find('li.select2-selection__choice').text();
                        var myArr = test.substring(1).split("×");
                        $("#hdnSelectedReference").val(myArr.join());

                        //$("#hdnSelectedReference").val(test.substring(1).replace("×", ","));
                        //$("#hdnSelectedReference").val($("#hdnSelectedReference").val().replace("×", ","));

                    }
                </script>
            </div>
        </div>
    </form>
</body>
</html>
