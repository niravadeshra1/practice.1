<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductSearch.aspx.cs" Inherits="StarsProject.ProductSearch" ValidateRequest="false" %>
<%@ Register Src="~/myProductLedger.ascx" TagPrefix="uc1" TagName="myProductLedger" %>
<%@ Register Src="~/myWhatsppMsgSender.ascx" TagPrefix="uc1" TagName="myWhatsppMsgSender" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/form-select2.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/custom/custom.css" />

    <script type="text/javascript" src='<%=ResolveUrl("js/plugins/jquery-1.7.min.js") %>'></script>
    <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='<%=ResolveUrl("~/js/plugins/jquery.colorbox-min.js") %>'></script>
    <link href="css/plugins/colorbox.css" rel="stylesheet" type="text/css" />
    <link href="plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="plugins/datatables/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.11.2/jquery-ui.min.js" />
        <script type="text/javascript" src="app-assets/js/scripts/advance-ui-modals.js"></script>
    <link href="css/Registration.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>

    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="app-assets/js/plugins.js"></script>
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>

    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>
    <script type="text/javascript" src="app-assets/js/scripts/advance-ui-modals.js"></script>

    <style type="text/css">
        .text-input {
            position: relative;
            margin-top: 50px;
            input [type="text"];
        }

        input[type="text"] + label {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            height: 40px;
            line-height: 40px;
            color: white;
            border-radius: 3px 0 0 3px;
            padding: 0 20px;
            background: #E03616;
            transform: translateZ(0) translateX(0);
            transition: all 0.3s ease-in;
            transition-delay: 0.2s;
        }

        input[type="text"]:focus + label {
            transform: translateY(-120%) translateX(0%);
            border-radius: 3px;
            transition: all 0.1s ease-out;
        }

        input[type="text"]:focus {
            padding: 10px;
            transition: all 0.3s ease-out;
            transition-delay: 0.2s;
        }

        }

        /* =================================================================================== */
        .row.heading h2 {
            color: #fff;
            font-size: 52.52px;
            line-height: 95px;
            font-weight: 400;
            text-align: center;
            margin: 0 0 40px;
            padding-bottom: 20px;
            text-transform: uppercase;
        }

        ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .heading.heading-icon {
            display: block;
        }

        .padding-lg {
            display: block;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .practice-area.padding-lg {
            padding-bottom: 55px;
            padding-top: 55px;
        }

        .practice-area .inner {
            border: 1px solid #999999;
            text-align: center;
            margin-bottom: 28px;
            padding: 40px 25px;
        }

        .our-webcoderskull .cnt-block:hover {
            box-shadow: 0px 0px 10px rgba(0,0,0,0.3);
            border: 0;
        }

        .practice-area .inner h3 {
            color: #3c3c3c;
            font-size: 24px;
            font-weight: 500;
            font-family: 'Poppins', sans-serif;
            padding: 10px 0;
        }

        .practice-area .inner p {
            font-size: 14px;
            line-height: 22px;
            font-weight: 400;
        }

        .practice-area .inner img {
            display: inline-block;
        }


        .our-webcoderskull {
            /*background: url("http://www.webcoderskull.com/img/right-sider-banner.png") no-repeat center top / cover;*/
            background-color: #e8e8e8;
        }

        .our-webcoderskull .cnt-block {
            float: left;
            width: 100%;
            background: #fff;
            padding: 30px 20px;
            text-align: center;
            border: 2px solid #d5d5d5;
            margin: 0 0 28px;
        }

        .our-webcoderskull .cnt-block figure {
            width: 80px;
            height: 80px;
            border-radius: 100%;
            display: inline-block;
            margin-bottom: 15px;
        }

        .our-webcoderskull .cnt-block img {
            width: 80px;
            height: 80px;
            border-radius: 100%;
        }

        .our-webcoderskull .cnt-block h3 {
            color: #2a2a2a;
            font-size: 20px;
            font-weight: 500;
            padding: 6px 0;
            text-transform: uppercase;
        }

        .our-webcoderskull .cnt-block h3 a {
            text-decoration: none;
            color: #2a2a2a;
        }

        .our-webcoderskull .cnt-block h3 a:hover {
            color: #337ab7;
        }

        .our-webcoderskull .cnt-block p {
            color: #2a2a2a;
            font-size: 13px;
            line-height: 20px;
            font-weight: 400;
        }

        .our-webcoderskull .cnt-block .follow-us {
            margin: 20px 0 0;
        }

        .our-webcoderskull .cnt-block .follow-us li {
            display: inline-block;
            width: auto;
            margin: 0 5px;
        }

        .our-webcoderskull .cnt-block .follow-us li .fa {
            font-size: 24px;
            color: #767676;
        }

        .our-webcoderskull .cnt-block .follow-us li .fa:hover {
            color: #025a8e;
        }

        .flip-card {
            background-color: transparent;
            width: 300px;
            height: 180px;
            margin-top: 15px;
            perspective: 1000px;
        }

        .flip-card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.6s;
            transform-style: preserve-3d;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        }

        .flip-card:hover .flip-card-inner {
            transform: rotateY(180deg);
        }

        .flip-card-front, .flip-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
        }

        .flip-card-front {
            background-color: white;
            color: black;
            padding-top: 10px;
            border-radius: 4px;
        }

        .flip-card-back {
            background-color: #2980b9;
            color: white;
            transform: rotateY(180deg);
            border-radius: 4px;
        }

        .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
            color: white;
            background-color: navy;
            border-color: #dee2e6 #dee2e6 #fff;
        }
        th {
            color: #e6e6f1 !important;
            background-color: #4a69d8 !important;
        }
        .nav-tabs {
            border-bottom: 1px solid #234b73;
        }
    </style>

    <script type="text/javascript">
        function viewLedgerDocument(id, cat) {
            if (cat == 'SalesOrder') {
                $.colorbox({ width: "98%", height: "95%", iframe: true, href: "SalesOrder.aspx?mode=view&id=" + id, onClosed: function () { } });
            }
            else {
                $.colorbox({ width: "98%", height: "95%", iframe: true, href: "FinancialTrans.aspx?mode=view&category=" + cat + "&id=" + id, onClosed: function () { } });
            }
        }
        function openContFollowup(mode, pkid) {
            var pageUrl = "Followup.aspx?mode=" + mode + "&id=" + pkid
            $.colorbox({ width: "98%", height: "95%", iframe: true, href: pageUrl, onClosed: function () { } });
        }

        function openContFollowup(mode, pkid) {
            var pageUrl = "Followup.aspx?mode=" + mode + "&id=" + pkid
            $.colorbox({ width: "98%", height: "95%", iframe: true, href: pageUrl, onClosed: function () { } });
        }
    </script>

</head>
<body>
    <form id="frmProductSearch" runat="server" autocomplete="off">
        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnLocationStock" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnProductionWithoutCustomer" runat="server" ClientIDMode="Static" EnableViewState="true" Value="0" />
        <asp:HiddenField ID="hdnLoginUserID" runat="server" ClientIDMode="Static" EnableViewState="true" Value="0" />
        <asp:HiddenField ID="hdnSerialNo" runat="server" ClientIDMode="Static" EnableViewState="true" Value="0" />
        <asp:HiddenField ID="hdnClosing" runat="server" ClientIDMode="Static" EnableViewState="true" Value="0" />
        <div id="myModal" style="display: block; width: 98%; overflow-x:hidden;">
            <div class="modal-content">
                <div class="modal-header" style="background-color: white; border-bottom: 4px solid darkgrey;">
                    <div class="row m-0">
                        <div class="col m8">
                            <label class="active text-dark" for="txtProductName" style="font-size: 18px;">Product Name<small class="text-muted text-white font-italic pl-2">(Min. 3 chars to search)</small></label>
                            <asp:TextBox ID="txtProductName" runat="server" ClientIDMode="Static" class="form-control mb-0" AutoPostBack="true" onKeyup="bindDDLProductTo('#txtProductName')" OnTextChanged="txtProductName_TextChanged" TabIndex="3" Style="width: 500px;" />
                        </div>
                        <div class="col m3">
                            <div id="notification" visible="false" runat="server" class="col m10">
                                <a id="btnNotification"  runat="server" class="waves-effect waves-light gradient-45deg-deep-purple-blue btn modal-trigger z-depth-4 right ml-1 mr-1" href="#myNotificationModal"><i class="material-icons left">email</i>Send Message</a>
                            </div>
                        </div>
                         
                    </div>
                </div>
                <div class="customize-devider"></div>
                <div class="modal-body" style="min-height: 500px; padding: 0px 5px;">
                    <div class="row">
                        <div id="showContacts" class="col m12 mt-2 p-1" style="color: navy; border-top-left-radius: 0.5rem; border-bottom-left-radius: 0.5rem; border-top-right-radius: 0.5rem; border-bottom-right-radius: 0.5rem;">
                            <div id="Contacts-content">
                                <div class="emp-profile" style="padding: 10px;">
                                <% if (hdnLocationStock.Value == "yes") {%>
                                    <div class="row">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpLocation">Select Location</label>
                                            <asp:DropDownList ID="drpLocation" runat="server" ClientIDMode="Static" TabIndex="6" class="select2-theme browser-default" Style="width:150px;" AutoPostBack="true" OnSelectedIndexChanged="drpLocation_SelectedIndexChanged"/>
                                        </div>
                                    </div>
                                <%}%>
                                    <div class="row">
                                        
                                        <div class="col m12">
                                            <div class="profile-head">
                                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" id="primary-tab" data-toggle="tab" href="#primary" role="tab" aria-controls="home" aria-selected="true">Primary Information</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="productledger-tab" data-toggle="tab" href="#productledger" role="tab" aria-controls="productledger" aria-selected="false">Stock Ledger</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="jobcardledger-tab" data-toggle="tab" href="#jobcardledger" role="tab" aria-controls="productledger" aria-selected="false">Job Card Ledger</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="tab-content profile-tab" id="myTabContent">
                                                <div class="tab-pane fade show active" id="primary" role="tabpanel" aria-labelledby="primary-tab">
                                                    <div class="row">
                                                        <div class="col m3">
                                                            <div class="flip-card">
                                                                <p><h5>Product Alias</h5></p>
                                                                <p class="m-0 p-0" style="text-transform: uppercase;">
                                                                    <asp:Label CssClass="blue-text font-weight-bold" ID="lblProductAlias" runat="server" ClientIDMode="Static" Font-Size="18px" />
                                                                </p>
                                                                <hr />
                                                                    
                                                                <p><h5>Product Brand</h5></p>
                                                                <p class="m-0 p-0" style="text-transform: uppercase;">
                                                                    <asp:Label CssClass="blue-text font-weight-bold" ID="lblBrandName" runat="server" ClientIDMode="Static" Font-Size="18px" />
                                                                </p>
                                                                <hr />

                                                                <p><h5>Product Category</h5></p>
                                                                <p class="m-0 p-0" style="text-transform: uppercase;">
                                                                    <asp:Label CssClass="blue-text font-weight-bold" ID="lblCategoryName" runat="server" ClientIDMode="Static" Font-Size="18px" />
                                                                </p>
                                                                <hr />

                                                                <p><h5>Product Type</h5></p>
                                                                <p class="m-0 p-0" style="text-transform: uppercase;">
                                                                    <asp:Label CssClass="blue-text font-weight-bold" ID="lblProductType" runat="server" ClientIDMode="Static" Font-Size="18px" />
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="col m3">
                                                            <div class="flip-card">
                                                                <h5>General Infomation</h5>
                                                                <table style="width: 100%;">
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">Unit    :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                        <asp:Label CssClass="blue-text" ID="lblUnit" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                    <% if (hdnSerialNo.Value != "U041-RB97-S3KP-AP1P")
                                                                        { %>
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">HSN Code :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                        <asp:Label CssClass="blue-text" ID="lblHSNCode" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">Price   :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                        <asp:Label CssClass="blue-text" ID="lblUnitPrice" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">Tax Info :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                        <asp:Label CssClass="blue-text" ID="lblGST" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                    <%} %>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="col m3">
                                                            <div class="flip-card">
                                                                <h5>Other Details</h5>
                                                                <table style="width: 100%;">
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">Min.Stock Qty :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                        <asp:Label CssClass="blue-text" ID="lblMinStock" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">Low Price     :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                        <asp:Label CssClass="blue-text"  ID="lblMinUnitPrice" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">High Price    :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                        <asp:Label CssClass="blue-text" ID="lblMaxUnitPrice" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="col m3">
                                                            <div class="flip-card">
                                                                <h5>Stock Information</h5>
                                                                <table style="width: 100%;">
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">Opening :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                            <asp:Label CssClass="red-text" ID="lblOpeningSTK" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">Inward  :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                            <asp:Label CssClass="blue-text" ID="lblInward" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">Outward :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                            <asp:Label CssClass="blue-text" ID="lblOutward" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                    <tr style="margin-bottom: 3px;">
                                                                        <td class="float-left font-weight-bold" style="width: 40%;">Closing :</td>
                                                                        <td class="float-left font-weight-bold" style="width: 60%;">
                                                                            <asp:Label CssClass="red-text" ID="lblClosingSTK" runat="server" ClientIDMode="Static" Font-Size="18px" /></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="productledger" role="tabpanel" aria-labelledby="productledger-tab">
                                                    <section class="our-webcoderskull padding-lg" style="height: 405px; padding: 10px; overflow-y: auto;">
                                                        <asp:UpdatePanel ID="updDashboardLead" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                           
                                                            <div class="row">
                                                                <div class="col m12">
                                                                    <uc1:myProductLedger runat="server" ID="myProductLedger" />
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </section>
                                                </div>
                                                <div class="tab-pane fade" id="jobcardledger" role="tabpanel" aria-labelledby="jobcardledger-tab">
                                                    <section class="our-webcoderskull padding-lg" style="height: 405px; padding: 10px; overflow-y: auto;">
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <table id="tblJobInOut" class="stdtable" style="width: 100%; font-size: 12px; border: 1px ridge silver;">
                                                            <asp:Repeater ID="rptJobInOut" runat="server">
                                                                <HeaderTemplate>
                                                                    <thead>
                                                                        <tr>
                                                                            <th class="text-center">Outward #</th>
                                                                            <th class="text-center">Outward Date</th>
                                                                            <% if (hdnProductionWithoutCustomer.Value.ToLower() != "yes" || hdnLoginUserID.Value == "admin")
                                                                                { %>
                                                                            <th class="text-center">Company Name</th>
                                                                            <% } %>
                                                                            <th class="text-center">Material Name</th>
                                                                            <th class="text-right">Qty (OUT)</th>
                                                                            <th class="text-center">Inward #</th>
                                                                            <th class="text-center">Inward Date</th>
                                                                            <th class="text-right">Qty (IN)</th>
                                                                            <th class="text-right">Balance</th>
                                                                        </tr>
                                                                    </thead>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr class="blueShed">
                                                                        <asp:HiddenField ID="hdnCustomerID" runat="server" ClientIDMode="Static" Value='<%#Eval("CustomerID") %>' />
                                                                        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" Value='<%#Eval("ProductID") %>' />
                                                                        <td class="text-center"><%# Eval("OutwardNo") %></td>
                                                                        <td class="text-center"><%# Eval("OutwardDate", "{0:dd/MM/yyyy}") %></td>
                                                                        <% if (hdnProductionWithoutCustomer.Value.ToLower() != "yes" || hdnLoginUserID.Value == "admin")
                                                                            { %>
                                                                        <td class="text-center"><%# Eval("CustomerName") %></td>
                                                                        <%} %>
                                                                        <td class="text-center"><%# Eval("ProductName") %></td>
                                                                        <td class="text-right"><%# Eval("Quantity_OUT") %></td>
                                                                        <td class="text-center"><%# Eval("InwardNo") %></td>
                                                                        <td class="text-center"><%# Eval("InwardDate", "{0:dd/MM/yyyy}") %></td>
                                                                        <td class="text-right"><%# Eval("Quantity_IN") %></td>
                                                                        <td class="text-right"><%# (Convert.ToDecimal(Eval("Quantity_OUT")) - Convert.ToDecimal(Eval("Quantity_IN"))).ToString("0.00") %></td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            </table>
                                                        </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </section>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $("input").keypress(function (event) {
                if (event.which == 13) {
                    event.preventDefault();
                }
            });
            // -------------------------------------------------------------
            function bindDDLProductTo(selector) {
                if ($(selector).val().length >= 1) {
                    jQuery.ajax({
                        type: "POST",
                        url: "InquiryInfo.aspx/FilterProduct",
                        data: '{pProductName:\'' + $(selector).val() + '\', pSearchModule:\'ProductSearchTypeSalesBill\'}',
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
                                    return '<div class="autocomplete-suggestion" data-langname="' + item.pkID + '" data-lang="' + item.ProductNameLong + '" data-val="' + search + '">' + item.ProductNameLong + '</div>';
                                },
                                onSelect: function (e, term, item) {
                                    console.log('Item "' + item.data('langname') + ' (' + item.data('lang') + ')" selected by ' + (e.type == 'keydown' ? 'pressing enter or tab' : 'mouse click') + '.');
                                    $(selector).val(item.html());
                                    $("#hdnProductID").val(item.data('langname'));
                                    $("#txtReferenceName").focus();
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

            // -------------------------------------------------------------
            function ShowPDFfile(repFilename) {
                yhooWin = window.open(repFilename, "ywin", "width=1050,height=750");
                yhooWin.focus();
            }

            function ShowQuotationPreview(id) {
                jQuery.ajax({
                    type: "POST", url: 'Quotation.aspx/GetQuotationNoForPDF', data: '{pkID:\'' + id + '\'}',
                    contentType: "application/json; charset=utf-8", success: function (data11) {
                        QuotationNoForPDF = (data11.d).replace("/", "-");
                        if (QuotationNoForPDF != "") {
                            ShowPDFfile('PDF/' + QuotationNoForPDF.toString() + '.pdf');
                        }
                        else {
                            alert('Quotation PDF Not Found !')
                        }
                    }
                });
            }
        </script>
        <div id="myNotificationModal" class="modal modal-fixed-footer width-80 border-radius-8" style="min-height:90% !important; border: 5px solid darkgrey; top: 5% !important;">
            <div class="modal-footer">
                <h5 class=" z-depth-5" style="position: fixed; top: 0; left:0px; width:100%; font-size: 2rem !important; font-weight:800; line-height: 50px; margin: 0; text-align: left; padding-left: 15px;">
                    <i class="material-icons prefix">ac_unit</i>
                    <span id="Span1" runat="server" clientidmode="static">Save & Send Notification</span>
                    <asp:Button CssClass="btnTopRightCorner float-right" ID="ucNotificationClose" runat="server" Text=""/>
                </h5>
            </div>
            <div class="modal-content mt-3" style="overflow-x:hidden; overflow-y: auto !important;">
                <uc1:myWhatsppMsgSender runat="server" id="myWhatsppMsgSender" />
            </div>
        </div>      
        <script type="text/javascript">
            $("#ucNotificationClose").click(function () {
                const elem = document.getElementById('myNotificationModal');
                const instance = M.Modal.init(elem, { dismissible: false });
                instance.open();
            });

        </script>
    </form>
</body>
</html>