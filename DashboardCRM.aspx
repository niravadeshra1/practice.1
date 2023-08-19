<%@ Page Title="" Language="C#" MasterPageFile="~/StarsSite.Master" AutoEventWireup="true" CodeBehind="DashboardCRM.aspx.cs" Inherits="StarsProject.DashboardCRM" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/quill/quill.snow.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/app-sidebar.css" />

    <link rel="stylesheet" type="text/css" href="app-assets/vendors/data-tables/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/data-tables/extensions/responsive/css/responsive.dataTables.min.css" />

    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="app-assets/vendors/sortable/jquery-sortable-min.js"></script>
    <script type="text/javascript" src="app-assets/vendors/quill/quill.min.js"></script>
    <script type="text/javascript" src="app-assets/js/plugins.js"></script>
    <script type="text/javascript" src="app-assets/js/scripts/advance-ui-carousel.js"></script>

    <style type="text/css">
        .card-title {
            color: #1e90ff;
        }

        .mydropdowncontent {
            width: 230px !important;
            height: auto !important;
        }

        .mydropdowncontent li {
            min-height: auto;
            padding: 0px;
        }

        .mydropdowncontent li > a {
            min-height: auto;
            padding: 2px;
            font-size: 12px;
            color: navy;
            padding: 3px 5px;
            background-color: #f3ebeb;
        }

        .dataTables_filter, .dataTables_info, .dataTables_length {
            display: none;
        }

        table.dataTable thead th, table.dataTable thead td {
            padding: 5px 5px;
            font-size: 14px;
        }

        table.dataTable tbody th, table.dataTable tbody td {
            padding: 5px 5px;
            font-size: 14px;
            color: black;
        }

        .myDropDownClass {
            background-color: white;
            color: navy;
            font-size: medium;
            width: 150px;
            height: 30px !important;
            border: 1px solid black;
            margin-top: 1px;
            padding: 1px 5px;
            border: none;
            border-radius: 5px;
        }

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

        .titleHead {
            font-weight: 800;
            margin-left: 10px;
        }

        .cardRound {
            box-shadow: black -6px 8px 6px -6px !important;
            border-radius: 8px 8px 0px 0px !important;
        }

        .h5Round {
            border-radius: 8px 8px 0px 0px;
            margin-bottom: 5px;
            padding: 5px;
            line-height: 35px;
            background: linear-gradient(45deg, #303f9f, #7b1fa2) !important;
            color: white !important;
        }

        .h5RoundHead {
            border-radius: 0px 0px 0px 0px;
            margin-bottom: 5px;
            padding: 5px;
            line-height: 35px;
            background: linear-gradient(45deg, silver, #7f88ec6e);
        }
        /* ------------------------------------------------------------------ */
        /* Filter Menu */
        /* ------------------------------------------------------------------ */
        .sidepanel {
          min-height: 100%; /* Specify a height */
          height: 100%; /* Specify a height */
          width: 0; /* 0 width - change this with JavaScript */
          position: absolute; /* Stay in place */
          z-index: 999; /* Stay on top */
          top: 50;
          left: 0;
          background-color: silver; /* Black*/
          overflow-x: hidden; /* Disable horizontal scroll */
          padding-top: 60px; /* Place content 60px from the top */
          transition: 0.5s; /* 0.5 second transition effect to slide in the sidepanel */
        }

        /* The sidepanel links */
        .sidepanel a {
          padding: 8px 8px 8px 32px;
          text-decoration: none;
          font-size: 25px;
          color: #818181;
          display: block;
          transition: 0.3s;
        }

        /* When you mouse over the navigation links, change their color */
        .sidepanel a:hover {
          color: #f1f1f1;
        }

        /* Position and style the close button (top right corner) */
        .sidepanel .closebtn {
          position: absolute;
          top: 0;
          right: 25px;
          font-size: 36px;
          margin-left: 50px;
        }

        /* Style the button that is used to open the sidepanel */
        .openbtn {
          font-size: 20px;
          cursor: pointer;
          background: linear-gradient(45deg, #c5e1a5, #fff8e1);
          color: navy;
          padding: 10px 15px;
          border: none;
        }

        .openbtn:hover {
          background-color: beige;
        }
        /* ------------------------------------------------------------------ */
        .task-cat { font-size:16px !important; padding:3px !important; color: navy !important; }


        .widget-user .widget-user-header {
            padding: 5px 0px 5px 5px;
            height: 45px;
            border-top-left-radius: .25rem;
            border-top-right-radius: .25rem;
        }

        .widget-user .widget-user-image {
            position: relative;
            top: 50%;
            left: 25% !important;
            margin-left: 0px !important;
        }

        .widget-user .widget-user-image > img {
            width: 60px;
            height: auto;
            border: 3px solid #fff;
        }

        .widget-user-username {
            text-transform: capitalize;
            color: navy;
            float: left;
            padding-left: 3px;
        }

        .widget-user-desc {
            text-transform: capitalize;
            color: maroon;
            float: right;
            padding-right: 5px;
        }

        .card-widget {
            margin-right: 3px;
            min-height: 30px;
            min-width: 90px;
            text-align: center;
            border-radius: 6px;
            padding: 0px;
            box-shadow: 0 3px 6px rgba(0,0,0,.16), 0 3px 6px rgba(0,0,0,.23);
            background-color: #f0f8ff;
        }

        .description-text {
            display: block;
            color: navy;
            font-size: 13px;
        }

        .card-widget .row .col-sm-3 {
            text-align: center;
            padding: 3px;
            box-shadow: 0 3px 6px rgba(0,0,0,.16), 0 3px 6px rgba(0,0,0,.23);
            background-color: #f0f8ff;
        }

        .card-widget .row .col-sm-6 {
            text-align: center;
            padding: 3px;
            box-shadow: 0 3px 6px rgba(0,0,0,.16), 0 3px 6px rgba(0,0,0,.23);
            background-color: #f0f8ff;
        }

        .elevation-2 {
            box-shadow: 0 3px 6px rgba(0,0,0,.16), 0 3px 6px rgba(0,0,0,.23);
        }

    </style>

    <script type="text/javascript">
        var pageUrl = '';

        $(document).ready(function () {
            $('tabs').tabs();
        });
        /* --------------------------------------------------------- */
        function showVehicleGallery(vid) {
            // ------------------------------------------------------
            // .popup-gallery
            // ------------------------------------------------------
            $('#ifrModuleAdmin').attr('src', 'imageGallery.aspx?Module=vehpic&KeyValue=' + vid.toString() + '&imgLocation=vehicledocs');
            $find("mpe").show();
        };
        
        /*---------------------------------------------------------*/
        function pageLoad(sender, args) {
            retainTabPosition();
        }
        /*---------------------------------------------------------*/
        function openVehicleLeads(xtype, xmake) {
            var pageUrl = "VehicleLeads.aspx?type=" + xtype;
            if (xmake != '' && xmake != null)
                pageUrl = pageUrl + "&make=" + xmake;
            //if (xmodel != '' && xmodel != null)
            //    pageUrl = "&model=" + xmodel;
            $('#ifrModuleAdmin').attr('src', pageUrl);
            $find("mpe").show();
        }
        /* ------------------------------------------------------------------ */
        function openNav() {
            document.getElementById("mySidepanel").style.width = "400px";
        }

        /* Set the width of the sidebar to 0 (hide it) */
        function closeNav() {
            document.getElementById("mySidepanel").style.width = "0";
        }

        // *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
        function ShowPriceListPreview() {
            var OrderNoForPDF = 'KMPriceList.pdf';
            if (OrderNoForPDF != "")
                ShowPDFfile('PDF/' + 'KMPriceList.pdf');
            else
                alert('PDF Not Found !')
        }

        function generateVehicleSpec(id) {
            jQuery.ajax({
                type: "POST",
                url: 'DashboardAdmin.aspx/GenerateVehicleSpec',
                data: '{pkID:\'' + id + '\'}',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var tmpfile = data.d.toString();
                    
                    ShowPDFfile('PDF/' + tmpfile);
                },
                error: function (r) { alert('Error : ' + r.responseText); },
                failure: function (r) { alert('failure'); }
            });
        }

        function ShowPDFfile(repFilename) {
            var today = new Date();
            var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date + ' ' + time;

            //yhooWin = window.open(repFilename + "?id=" + dateTime, "ywin", "width=1050,height=750");
            yhooWin = window.open(repFilename, "ywin", "width=1050,height=750");
            yhooWin.focus();
        }
        /*---------------------------------------------------------*/
        /* Below section to Maintain Current TAB                   */
        /*---------------------------------------------------------*/
        $(function () {
            var tabName = $("[id*=hdnCurrentTab]").val() != "" ? $("[id*=hdnCurrentTab]").val() : "empimg";
            $("#myTab a").click(function () {
                var prevTab = $("[id*=hdnCurrentTab]").val() != "" ? $("[id*=hdnCurrentTab]").val() : "empimg";
                var currTab = $(this).attr("href").replace("#", "");
                $('#' + prevTab + '-tab').removeClass('show');
                $('#' + currTab + '-tab').addClass('show');
                $("#hdnCurrentTab").val(currTab);
                // ------------------------------------
                //if ($("[id*=hdnCurrentTab]").val() == "buylead")
                //    ShowLeadList('buy', 'Manage Buy Leads');
                //else if ($("[id*=hdnCurrentTab]").val() == "salelead")
                //    ShowLeadList('sale', 'Manage Sales Leads');
                //else if ($("[id*=hdnCurrentTab]").val() == "workshoplead")
                //    ShowLeadList('workshop', 'Manage WorkShop Leads');
                //else if ($("[id*=hdnCurrentTab]").val() == "rtolead")
                //    ShowLeadList('rto', 'Manage RTO Leads');
                //else if ($("[id*=hdnCurrentTab]").val() == "financelead")
                //    ShowLeadList('finance', 'Manage Finance Leads');
                //else if ($("[id*=hdnCurrentTab]").val() == "insurancelead")
                //    ShowLeadList('insurance', 'Manage Insurance Leads');
            });
        });

        function retainTabPosition() {
            $('#lnkdashboard').removeClass('active');
            $('#lnkinventory').removeClass('active');
            $('#lnkbuylead').removeClass('active');
            $('#lnksalelead').removeClass('active');
            $('#lnkworkshoplead').removeClass('active');
            $('#lnkrtolead').removeClass('active');
            $('#lnkfinancelead').removeClass('active');
            $('#lnkinsurancelead').removeClass('active');

            $('#dashboard').css("display", "none");
            $('#inventory').css("display", "none");
            $('#buylead').css("display", "none");
            $('#salelead').css("display", "none");
            $('#workshoplead').css("display", "none");
            $('#rtolead').css("display", "none");
            $('#financelead').css("display", "none");
            $('#insurancelead').css("display", "none");
            // --------------------------------------------------- 
            if ($("#hdnCurrentTab").val() == 'dashboard') {
                $('#lnkdashboard').addClass('active');
                $('#dashboard').css("display", "block");
            }
            if ($("#hdnCurrentTab").val() == 'inventory') {
                $('#lnkinventory').addClass('active');
                $('#inventory').css("display", "block");
            }
            if ($("#hdnCurrentTab").val() == 'buylead') {
                $('#lnkbuylead').addClass('active');
                $('#buylead').css("display", "block");
            }
            if ($("#hdnCurrentTab").val() == 'salelead') {
                $('#lnksalelead').addClass('active');
                $('#salelead').css("display", "block");
            }
            if ($("#hdnCurrentTab").val() == 'workshoplead') {
                $('#lnkworkshoplead').addClass('active');
                $('#workshoplead').css("display", "block");
            }
            if ($("#hdnCurrentTab").val() == 'rtolead') {
                $('#lnkrtolead').addClass('active');
                $('#rtolead').css("display", "block");
            }
            if ($("#hdnCurrentTab").val() == 'financelead') {
                $('#lnkfinancelead').addClass('active');
                $('#financelead').css("display", "block");
            }
            if ($("#hdnCurrentTab").val() == 'insurancelead') {
                $('#lnkinsurancelead').addClass('active');
                $('#insurancelead').css("display", "block");
            }
        }

        function ShowLeadList(viewmode, title) {
            $('#hdnViewMode').val(viewmode);
            // -----------------------------------------------------------
            var myTableName = '';
            var colstructure, dataurl, para1, para2, para3, para4, para5, para0;
            var groupColumn, valColspan, groupColumnTitle = "";
            // -----------------------------------------------------------
            colstructure = [
                    { title: "Lead Date", data: "InquiryDate", type: "date", className: "center", width: "150", render: function (data, type, full) { return (data) ? moment(data).format('DD-MMM-YYYY') : ''; } },
                    {
                        title: "Lead #", data: "InquiryNo", className: "center", width: "110",
                        render: function (data, type, row, meta) {
                            if ($("#hdnLoginUserID").val() == row.CreatedBy)
                                data = '<a href="javascript:openModule(' + row.pkID + ');">' + data + '</a>';
                            else
                                data = '<a style="border-radius:8px; background-color:red; color:white; padding:5px;"  href="javascript:openModule(' + row.pkID + ');">' + data + '</a>';

                            return data;
                        }
                    },
                    { title: "Customer Name", data: "CustomerName", width: "250" },
                    { title: "ContactNo", data: "CustomerMobile", className: "center", width: "100" },
                    { title: "Area", data: "CustomerArea", className: "center", width: "100" },
                    { title: "Source", data: "InquirySource", className: "center", width: "100" },
                    { title: "Status", data: "InquiryStatus", className: "center", width: "150" },
                    { title: "Make", data: "VehicleMake", className: "center", width: "150" },
                    { title: "Model", data: "VehicleModel", className: "center", width: "150" },
                    {
                        title: "Next Folloup", data: "LastNextFollowupDate", className: "center", type: "date", width: "200",
                        render: function (data, type, full) {
                            var newdate;
                            if (moment(data).year() > 2000)
                                newdate = moment(data).format('DD-MMM-YYYY');
                            else
                                newdate = '';
                            return newdate;
                        }
                    },
                    { title: "Min.Budget", data: "BudgetFrom", className: "right-align", width: "150", render: jQuery.fn.dataTable.render.number(',', '.', 2, '') },
                    { title: "Max.Budget", data: "BudgetTo", className: "right-align", width: "150", render: jQuery.fn.dataTable.render.number(',', '.', 2, '') },
                    { title: " Sales Executive", data: "EmployeeName", width: "150" }
            ];

            // *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
            if (viewmode.toLowerCase() == 'buy')
            {
                document.getElementById('spnHeaderBuy').innerText = title;
                $("#spnPageNoBuy").text("Page # : " + $("#hdnCurrPage_buy").val());
                dataurl = '/Services/NagrikService.asmx/webInquiryPurchaseDetailByStatus?currPageNo=1';
                myTableName = '#tblBuyLead';
            }
            else if (viewmode.toLowerCase() == 'sale')
            {
                document.getElementById('spnHeadersale').innerText = title;
                $("#spnPageNoSale").text("Page # : " + $("#hdnCurrPage_sale").val());
                dataurl = '/Services/NagrikService.asmx/webInquiryDetailByStatus?currPageNo=1';
                myTableName = '#tblSaleLead';
            }
            else if (viewmode.toLowerCase() == 'workshop') {
                document.getElementById('spnHeaderWorkshop').innerText = title;
                $("#spnPageNoWorkshop").text("Page # : " + $("#hdnCurrPage_workshop").val());
                dataurl = '/Services/NagrikService.asmx/webWorkShopDetailByStatus?currPageNo=1';
                myTableName = '#tblWorkshopLead';
            }
            else if (viewmode.toLowerCase() == 'rto') {
                document.getElementById('spnHeaderRTO').innerText = title;
                $("#spnPageNoRTO").text("Page # : " + $("#hdnCurrPage_rto").val());
                dataurl = '/Services/NagrikService.asmx/webRTODetailByStatus?currPageNo=1';
                myTableName = '#tblRTOLead';
            }
            else if (viewmode.toLowerCase() == 'finance') {
                document.getElementById('spnHeaderFinance').innerText = title;
                $("#spnPageNoFinance").text("Page # : " + $("#hdnCurrPage_finance").val());
                dataurl = '/Services/NagrikService.asmx/webFinanceDetailByStatus?currPageNo=1';
                myTableName = '#tblFinanceLead';
            }
            else if (viewmode.toLowerCase() == 'insurance') {
                document.getElementById('spnHeaderInsurance').innerText = title;
                $("#spnPageNoInsurance").text("Page # : " + $("#hdnCurrPage_insurance").val());
                dataurl = '/Services/NagrikService.asmx/webInsuranceDetailByStatus?currPageNo=1';
                myTableName = '#tblInsuranceLead';
            }
            // -----------------------------------------------------------------------------
            jQuery.ajax({
                url: dataurl, type: "get", 
                success: function (data) {
                    debugger;
                    var resultdata = JSON.parse(data.getElementsByTagName("string")[0].innerHTML);
                    // ----------------------------------------------
                    var table;
                    if ($.fn.dataTable.isDataTable(myTableName)) {
                        table = $(myTableName).DataTable();
                        table.clear();
                        table.rows.add(resultdata).draw();
                        //document.getElementById('spnHeaderCount').innerText = resultdata.length;
                    }
                    else {
                        table = jQuery(myTableName).DataTable({
                            data: resultdata,
                            columns: colstructure,
                            "displayLength": 15,
                            "ordering": false,
                            "bFilter": false,
                            "bInfo": false,
                            "bPaginate": false,
                            "scrollY": 500,
                            "scrollX": true,
                            "bScrollCollapse": false
                        }).on('draw.dt', function () { });
                        //document.getElementById('spnHeaderCount').innerText = resultdata.length;
                    }

                },
                error: function (r) { alert('Error : ' + r.responseText); },
                failure: function (r) { alert('failure'); }
            });

        }

        function viewInquiryTypeList(pMode, pStatus) {
            var pMon = 0, pYear = 0;
            var userid = '<%=Session["LoginUserID"].ToString() %>';
            // --------------------------------------------------------------------------
            var newStatus = "";
            if (pStatus == 'open')
                newStatus = "Fresh / New";
            else if (pStatus == 'opportunities')
                newStatus = "In-Prgress";
            else if (pStatus == 'close - success')
                newStatus = "Close Success";
            else if (pStatus == 'close - lost')
                newStatus = "Close Lost";
            // --------------------------------------------------------------------------
            if (pMode == 'salelead')
                Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "List Of Sales Leads" + " >> " + newStatus;
            else if (pMode == 'buylead')
                Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "List Of Purchase Leads" + " >> " + newStatus;
            else if (pMode == 'workshoplead')
                Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "List Of WorkShop Leads" + " >> " + newStatus;
            else if (pMode == 'rtolead')
                Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "List Of RTO Leads" + " >> " + newStatus;
            else if (pMode == 'financelead')
                Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "List Of Finance Leads" + " >> " + newStatus;
            else if (pMode == 'insurancelead')
                Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "List Of Insurance Leads" + " >> " + newStatus;
            // --------------------------------------------------------------------------
            pageUrl = "myCustomView.aspx?view=" + pMode + "&para1=" + userid + "&para2=" + pStatus + "&para3=" + pMon + "&para4=" + pYear
            $('#ifrModuleAdmin').attr('src', pageUrl);
            $find("mpe").show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" CompositeScript-ScriptMode="Inherit"></asp:ScriptManager>
    <div id="contentwrapper" class="contentwrapper">
        <asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:HiddenField ID="hdnCurrentTab" runat="server" ClientIDMode="Static" Value="dashboard" EnableViewState="true" />

            <asp:HiddenField ID="hdnCurrPage_sale" runat="server" ClientIDMode="Static" Value="1" EnableViewState="true" />
            <asp:HiddenField ID="hdnCurrPage_purc" runat="server" ClientIDMode="Static" Value="1" EnableViewState="true" />
            <asp:HiddenField ID="hdnCurrPage_work" runat="server" ClientIDMode="Static" Value="1" EnableViewState="true" />
            <asp:HiddenField ID="hdnCurrPage_rto" runat="server" ClientIDMode="Static" Value="1" EnableViewState="true" />
            <asp:HiddenField ID="hdnCurrPage_fin" runat="server" ClientIDMode="Static" Value="1" EnableViewState="true" />
            <asp:HiddenField ID="hdnCurrPage_ins" runat="server" ClientIDMode="Static" Value="1" EnableViewState="true" />

            <div class="row">
                <ul id="myTab" class="tabs card-border-gray" runat="server" clientidmode="Static" enableviewstate="true">
                    <li class="tab col p-0"><a id="lnkdashboard" class="left active" style="padding:0 15px;" href="#dashboard">Dashboard</a></li>
                    <li class="tab col p-0"><a id="lnksalelead" class="left" style="padding:0 15px;" href="#salelead">My Sales Leads</a></li>
                </ul>
            </div>
            <div id="dashboard" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:block;">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div id="card-stats" class="pt-0">
                        <div class="row">
                            <div class="col m8">
                                <div class="row">
                                    <div class="col m4">
                                        <ul id="sale-collection" class="collection z-depth-1 gradient-shadow padding-2">
                                            <li class="collection-item avatar mb-0 gradient-45deg-light-blue-cyan gradient-shadow" style="min-height:70px;">
                                                <i class="material-icons red accent-2 circle">card_travel</i>
                                                <h6 class="collection-header m-0 white-text">Portal Lead</h6>
                                                <span id="lblportalTotalCount" runat="server" class="badge gradient-45deg-yellow-green black-text gradient-shadow" style="margin-top:3px; border-radius:8px;">0</span>
                                                <p class="italic black-text mt-2">Total Summary</p>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>Fresh/New</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('portal', 'open');">
                                                            <span id="portalNew" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>In-Progress</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('portal', 'opportunities');">
                                                            <span id="portalInProgress" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>Success</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('portal', 'close - success');">
                                                            <span id="portalSuccess" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>Lost</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('portal', 'close - lost');">
                                                            <span id="portalLost" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col m4">
                                        <ul id="buy-collection" class="collection z-depth-1 gradient-shadow padding-2">
                                            <li class="collection-item avatar mb-0 gradient-45deg-light-blue-cyan gradient-shadow" style="min-height:70px;">
                                                <i class="material-icons red accent-2 circle">card_travel</i>
                                                <h6 class="collection-header m-0 white-text">TeleCaller Lead</h6>
                                                <span id="lblteleTotalCount" runat="server" clientidmode="static" class="badge gradient-45deg-yellow-green black-text gradient-shadow" style="margin-top:3px; border-radius:8px;">0</span>
                                                <p class="italic black-text mt-2"><small>Total Summary</small></p>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>Fresh/New</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('purclead', 'open');">
                                                            <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('telecaller', 'close - lost');">
                                                                <span id="teleNew" runat="server" class="task-cat">0</span>
                                                            </a>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>In-Progress</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('telecaller', 'opportunities');">
                                                            <span id="teleInProgress" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>Success</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('telecaller', 'close - success');">
                                                            <span id="teleSuccess" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>Lost</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('telecaller', 'close - lost');">
                                                            <span id="teleLost" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col m4">
                                        <ul id="work-collection" class="collection z-depth-1 gradient-shadow padding-2">
                                            <li class="collection-item avatar mb-0 gradient-45deg-light-blue-cyan gradient-shadow" style="min-height:70px;">
                                                <i class="material-icons red accent-2 circle">card_travel</i>
                                                <h6 class="collection-header m-0 white-text">Qualified Lead</h6>
                                                <span id="lblinquiryTotalCount" runat="server" clientidmode="static" class="badge gradient-45deg-yellow-green black-text gradient-shadow" style="margin-top:3px; border-radius:8px;">0</span>
                                                <p class="italic black-text mt-2">Total Summary</p>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>Fresh/New</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('inquiry', 'open');">
                                                            <span id="inquiryNew" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>In-Progress</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('inquiry', 'opportunities');">
                                                            <span id="inquiryInProgress" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>Success</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('inquiry', 'close - success');">
                                                            <span id="inquirySuccess" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="collection-item">
                                                <div class="row">
                                                    <div class="col s7">
                                                        <p class="collections-title font-weight-600 m-0"><strong>Lost</strong></p>
                                                    </div>
                                                    <div class="col s2">
                                                        <a data-position="center" data-tooltip="Show Leads" href="javascript:viewInquiryTypeList('inquiry', 'close - lost');">
                                                            <span id="inquiryLost" runat="server" class="task-cat">0</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col m4">
                                <div class="row">
                                    <div class="col m12">
                                        <div class="collection z-depth-1 gradient-shadow padding-2 pb-0 mb-0">
                                            <div class="collection-item avatar mb-0 gradient-45deg-purple-deep-orange gradient-shadow" style="min-height:70px;">
                                                <i class="material-icons red accent-2 circle">card_travel</i>
                                                <h6 class="collection-header m-0 white-text">This Month Closure</h6>
                                            </div>
                                        </div>
                                        <div  style="min-height:475px; height:475px; overflow-y: auto;">
                                            <ul id="inventory-collection" class="collection z-depth-1 gradient-shadow padding-2">
                                                <asp:Repeater ID="rptClosure" runat="server" ClientIDMode="Static">
                                                    <HeaderTemplate>
                                                        <li class="collection-item">
                                                            <div class="row">
                                                                <div class="col m6 pr-0">Employee Name</div>
                                                                <div class="col m2 pr-0 pl-0">Closure</div>
                                                                <div class="col m4 pr-0 pl-0">Booked Revenue</div>
                                                            </div>
                                                        </li>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <li class="collection-item">
                                                            <div class="row">
                                                                <div class="col m6 pr-0 pl-0">
                                                                    <p class="collections-title font-weight-600 m-0"><strong><%# Eval("label")%></strong></p>
                                                                </div>
                                                                <div class="col m2 pr-0 pl-0">
                                                                    <span class="task-cat white-text accent-2" style="font-size: 18px; padding: 5px; border-radius: 5px;"><%# Eval("value")%></span> 
                                                                
                                                                </div>
                                                                <div class="col m4 pr-0 pl-0">
                                                                    <span class="task-cat black-text accent-2" style="font-size: 18px; background-color: beige !important; padding: 5px; border-radius: 5px;"><strong>Rs.</strong><%# Eval("value1")%></span>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col m4">
                                <div class="collection z-depth-1 gradient-shadow padding-2 pb-0 mb-0">
                                    <div class="collection-item avatar mb-0 gradient-45deg-purple-deep-orange gradient-shadow" style="min-height:70px;">
                                        <i class="material-icons red accent-2 circle">card_travel</i>
                                        <h6 class="collection-header m-0 white-text">Software Expiration</h6>
                                        <p class="italic black-text mt-2"><small>(In Next 15 Days)</small></p>
                                    </div>
                                </div>
                                <div  style="min-height:555px; height:555px; overflow-y: auto;">
                                    <ul class="collection z-depth-1 gradient-shadow padding-2" style="min-height:555px; height:555px; overflow-y: auto;">
                                        <asp:Repeater ID="rptInsurance" runat="server" ClientIDMode="Static">
                                            <HeaderTemplate>
                                                <div class="row">
                                                    <div class="col m6 pr-0">Registration #</div>
                                                    <div class="col m3 pr-0 pl-0">Already Expired</div>
                                                    <div class="col m3 pr-0 pl-0">Expiration Due</div>
                                                </div>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li class="collection-item">
                                                    <div class="row">
                                                        <div class="col m6 pr-0 pl-0">
                                                            <p class="collections-title font-weight-600 m-0"><strong><%#Eval("RegistrationNo") %></strong></p>
                                                        </div>
                                                        <div class="col m3 pr-0 pl-0">
                                                            <span class="task-cat white-text accent-2" style="font-size: 18px; padding: 5px;"><%#Eval("Expired") %></span> 
                                                        </div>
                                                        <div class="col m3 pr-0 pl-0">
                                                            <span class="task-cat white-text accent-2" style="font-size: 18px; padding: 5px;"><%#Eval("DueExpired") %></span> 
                                                        </div>
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="salelead" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:none;">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div class="gradient-45deg-light-blue-cyan gradient-shadow width-100">
                        <h5 class="white-text mt-1 width-50" id="spnHeadersale" style="display:inline-block;">Today's Due</h5>
                        <span id="spnPageNoSale" class="ml-1 float-right white-text width-30" style="font-size: 18px; border-radius: 5px; margin-top: 1%; margin-right: 4%; text-align: right;">Page # : </span>
                    </div>
                    <table id="tblSaleLead" class="stdtable" style="width: 100%;"></table>
                </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="row">
                <div class="col m12" style="text-align: center; width: 100%; margin: auto;">
                    <a id="lnkResetPage" class="material-icons background-round gradient-45deg-red-pink gradient-shadow white-text float-left tooltipped ml-1 mr-1" data-tooltip="Refresh Data" href="javascript:gridReloadData('reset');" style="position: relative; padding: 10px; top: -25px;"><i class="material-icons">autorenew</i></a>
                    <a id="lnkPrevPage" class="material-icons background-round gradient-45deg-purple-deep-orange gradient-shadow white-text tooltipped ml-1 mr-1 hide" data-tooltip="Previous" href="javascript:gridReloadData('prev');" style="position: relative; padding: 10px; top: -25px;"><i class="material-icons">chevron_left</i></a>
                    <a id="lnkNextPage" class="material-icons background-round gradient-45deg-purple-deep-orange gradient-shadow white-text tooltipped ml-1 mr-1" data-tooltip="Next" href="javascript:gridReloadData('next');" style="position: relative; padding: 10px; top: -25px;"><i class="material-icons">chevron_right</i></a>
                </div>
            </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <br />
    <br />
    <cc1:ModalPopupExtender ID="myModalPopup" BehaviorID="mpe" runat="server" ClientIDMode="Static" PopupControlID="Panl1" TargetControlID="Button1" CancelControlID="Button2" BackgroundCssClass="Background">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panl1" runat="server" ClientIDMode="Static" CssClass="Popup" align="center" Style="display: none; border-radius: 10px; padding-right: 10px !important;">
        <div id="myModal">
            <div class="modal-header position-sticky gradient-45deg-light-blue-indigo m-0" style="margin-bottom: 10px !important;">
                <h5 class=" z-depth-5" style="width:100%; font-size: 2rem !important; font-weight: 800; line-height: 50px; margin: 0; text-align: left; padding-left: 15px;">
                    <i class="material-icons prefix">ac_unit</i>
                    <span id="spnModuleHeader" runat="server" clientidmode="static" style="width:100%;">Manage Module.</span>
                    <asp:Button CssClass="btnTopRightCorner float-right" ID="Button2" runat="server" ClientIDMode="Static" Text="" />
                </h5>
            </div>
        </div>
        <iframe id="ifrModuleAdmin" src="about:blank" scrolling="auto" style="border: 1px solid silver; background-color: transparent; width: 100%; height: 85%; padding: 5px;"></iframe>
        <br />
    </asp:Panel>
    <asp:Button ID="Button1" CssClass="hide" runat="server" Text="Fill Form in Popup" />

    <script type="text/javascript">
        window.onload = function () {
            document.getElementById('<%=((Label)Master.FindControl("lblModule")).ClientID %>').innerText = "Daily Activity - Analytics & Summary";
        }
       

        $(document).ready(function () {

            $('.btnTopRightCorner').on("click", function () {
                //debugger;
                var pgSource = $('#ifrModuleDaily').attr('src');
                var strPos1 = pgSource.indexOf('mode=add');
                var strPos2 = pgSource.indexOf('mode=edit');
                var strPos3 = pgSource.indexOf('mode=continue');
                if (strPos1 >= 0 || strPos2 >= 0 || strPos3 >= 0) {
                    __doPostBack('', '');
                }
            });
        });

        function openVehicleMaster(id)
        {
            Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "Manage Sales Lead";
            var pageUrl = "VehicleMaster.aspx?mode=edit&id=" + id
            $('#ifrModuleAdmin').attr('src', pageUrl);
            $find("mpe").show();
        }

        // *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
        function openModule(id)
        {
            var mode = $('#hdnCurrentTab').val();
            var pageUrl = "", pageTitle = "";

            if (mode.toLowerCase() == 'buylead')
            {
                pageTitle = "Manage Purchase Lead";
                pageUrl = "InquiryPurchase.aspx?mode=edit&id=" + id
            }
            else if (mode.toLowerCase() == 'salelead') {
                pageTitle = "Manage Sales Lead";
                pageUrl = "InquiryInfo.aspx?mode=edit&id=" + id
            }
            else if (mode.toLowerCase() == 'workshoplead')
            {
                pageTitle = "Manage Workshop Lead";
                pageUrl = "Workshop.aspx?mode=edit&id=" + id
            }
            else if (mode.toLowerCase() == 'rtolead') {
                pageTitle = "Manage RTO Lead";
                pageUrl = "RTO.aspx?mode=edit&id=" + id
            }
            else if (mode.toLowerCase() == 'financelead') {
                pageTitle = "Manage Finance Lead";
                pageUrl = "Finance.aspx?mode=edit&id=" + id
            }
            else if (mode.toLowerCase() == 'insurancelead')
            {
                pageTitle = "Manage Insurance Lead";
                pageUrl = "Insurance.aspx?mode=edit&id=" + id
            }
            // ----------------------------------------------------------------------------------
            Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = pageTitle;
            $('#ifrModuleAdmin').attr('src', pageUrl);
            $find("mpe").show();
        }
        function gridReloadData(action) {
            var oldPgNo = 1, currPageNo = 1;
            var dataurl = "", myTableName = "", viewmode = "";
            viewmode = $('#hdnCurrentTab').val();
            // -------------------------------------------------------------
            if (viewmode.toLowerCase() == 'buylead')
            {
                oldPgNo = $('#hdnCurrPage_purc').val();
                currPageNo = (parseInt($('#hdnCurrPage_purc').val()) + 1).toString();
                // -----------------------------------------------------------
                if (action == 'next') {
                    currPageNo = (parseInt(oldPgNo) + 1);
                    $("#lnkPrevPage").removeClass("hide");
                }
                else if (action == 'prev') {
                    if (parseInt(oldPgNo) > 1)
                        currPageNo = (parseInt(oldPgNo) - 1);
                    else {
                        currPageNo = parseInt(oldPgNo);
                        $("#lnkPrevPage").addClass("hide");
                    }
                }
                else if (action == 'reset') {
                    currPageNo = 1;
                    $("#lnkPrevPage").removeClass("hide");
                    $("#lnkNextPage").removeClass("hide");
                }
                else if (action == 'reload') {
                    currPageNo = (parseInt(oldPgNo));
                }
                $("#hdnCurrPage_purc").val(currPageNo);
                // ---------------------------------------------------                
                dataurl = '/Services/NagrikService.asmx/webInquiryPurchaseDetailByStatus?currPageNo=' + currPageNo;
                myTableName = '#tblBuyLead';
            }
            else if (viewmode.toLowerCase() == 'salelead')
            {
                oldPgNo = $('#hdnCurrPage_sale').val();
                currPageNo = (parseInt($('#hdnCurrPage_sale').val()) + 1).toString();
                // -----------------------------------------------------------
                if (action == 'next') {
                    currPageNo = (parseInt(oldPgNo) + 1);
                    $("#lnkPrevPage").removeClass("hide");
                }
                else if (action == 'prev') {
                    if (parseInt(oldPgNo) > 1)
                        currPageNo = (parseInt(oldPgNo) - 1);
                    else {
                        currPageNo = parseInt(oldPgNo);
                        $("#lnkPrevPage").addClass("hide");
                    }
                }
                else if (action == 'reset') {
                    currPageNo = 1;
                    $("#lnkPrevPage").removeClass("hide");
                    $("#lnkNextPage").removeClass("hide");
                }
                else if (action == 'reload') {
                    currPageNo = (parseInt(oldPgNo));
                }
                $("#hdnCurrPage_sale").val(currPageNo);
                // ---------------------------------------------------                
                dataurl = '/Services/NagrikService.asmx/webInquiryDetailByStatus?currPageNo=' + currPageNo;
                myTableName = '#tblSaleLead';
            }
            else if (viewmode.toLowerCase() == 'workshoplead') {
                oldPgNo = $('#hdnCurrPage_work').val();
                currPageNo = (parseInt($('#hdnCurrPage_work').val()) + 1).toString();
                // -----------------------------------------------------------
                if (action == 'next') {
                    currPageNo = (parseInt(oldPgNo) + 1);
                    $("#lnkPrevPage").removeClass("hide");
                }
                else if (action == 'prev') {
                    if (parseInt(oldPgNo) > 1)
                        currPageNo = (parseInt(oldPgNo) - 1);
                    else {
                        currPageNo = parseInt(oldPgNo);
                        $("#lnkPrevPage").addClass("hide");
                    }
                }
                else if (action == 'reset') {
                    currPageNo = 1;
                    $("#lnkPrevPage").removeClass("hide");
                    $("#lnkNextPage").removeClass("hide");
                }
                else if (action == 'reload') {
                    currPageNo = (parseInt(oldPgNo));
                }
                $("#hdnCurrPage_work").val(currPageNo);
                // ---------------------------------------------------    
                dataurl = '/Services/NagrikService.asmx/webWorkShopDetailByStatus?currPageNo=' + currPageNo;
                myTableName = '#tblWorkshopLead';
            }
            else if (viewmode.toLowerCase() == 'rtolead') {
                oldPgNo = $('#hdnCurrPage_rto').val();
                currPageNo = (parseInt($('#hdnCurrPage_rto').val()) + 1).toString();
                // -----------------------------------------------------------
                if (action == 'next') {
                    currPageNo = (parseInt(oldPgNo) + 1);
                    $("#lnkPrevPage").removeClass("hide");
                }
                else if (action == 'prev') {
                    if (parseInt(oldPgNo) > 1)
                        currPageNo = (parseInt(oldPgNo) - 1);
                    else {
                        currPageNo = parseInt(oldPgNo);
                        $("#lnkPrevPage").addClass("hide");
                    }
                }
                else if (action == 'reset') {
                    currPageNo = 1;
                    $("#lnkPrevPage").removeClass("hide");
                    $("#lnkNextPage").removeClass("hide");
                }
                else if (action == 'reload') {
                    currPageNo = (parseInt(oldPgNo));
                }
                $("#hdnCurrPage_rto").val(currPageNo);
                // ---------------------------------------------------    
                dataurl = '/Services/NagrikService.asmx/webRTODetailByStatus?currPageNo=' + currPageNo;
                myTableName = '#tblRTOLead';
            }
            else if (viewmode.toLowerCase() == 'financelead') {
                oldPgNo = $('#hdnCurrPage_fin').val();
                currPageNo = (parseInt($('#hdnCurrPage_fin').val()) + 1).toString();
                // -----------------------------------------------------------
                if (action == 'next') {
                    currPageNo = (parseInt(oldPgNo) + 1);
                    $("#lnkPrevPage").removeClass("hide");
                }
                else if (action == 'prev') {
                    if (parseInt(oldPgNo) > 1)
                        currPageNo = (parseInt(oldPgNo) - 1);
                    else {
                        currPageNo = parseInt(oldPgNo);
                        $("#lnkPrevPage").addClass("hide");
                    }
                }
                else if (action == 'reset') {
                    currPageNo = 1;
                    $("#lnkPrevPage").removeClass("hide");
                    $("#lnkNextPage").removeClass("hide");
                }
                else if (action == 'reload') {
                    currPageNo = (parseInt(oldPgNo));
                }
                $("#hdnCurrPage_fin").val(currPageNo);
                // ---------------------------------------------------    
                dataurl = '/Services/NagrikService.asmx/webFinanceDetailByStatus?currPageNo=' + currPageNo;
                myTableName = '#tblFinanceLead';
            }
            else if (viewmode.toLowerCase() == 'insurancelead') {
                oldPgNo = $('#hdnCurrPage_ins').val();
                currPageNo = (parseInt($('#hdnCurrPage_ins').val()) + 1).toString();
                // -----------------------------------------------------------
                if (action == 'next') {
                    currPageNo = (parseInt(oldPgNo) + 1);
                    $("#lnkPrevPage").removeClass("hide");
                }
                else if (action == 'prev') {
                    if (parseInt(oldPgNo) > 1)
                        currPageNo = (parseInt(oldPgNo) - 1);
                    else {
                        currPageNo = parseInt(oldPgNo);
                        $("#lnkPrevPage").addClass("hide");
                    }
                }
                else if (action == 'reset') {
                    currPageNo = 1;
                    $("#lnkPrevPage").removeClass("hide");
                    $("#lnkNextPage").removeClass("hide");
                }
                else if (action == 'reload') {
                    currPageNo = (parseInt(oldPgNo));
                }
                $("#hdnCurrPage_ins").val(currPageNo);
                // ---------------------------------------------------    
                dataurl = '/Services/NagrikService.asmx/webInsuranceDetailByStatus?currPageNo=' + currPageNo;
                myTableName = '#tblInsuranceLead';
            }
            // *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
            jQuery.ajax({
                url: dataurl, type: "get",
                success: function (data) {
                    var resultdata = JSON.parse(data.getElementsByTagName("string")[0].innerHTML);
                    // ----------------------------------------------
                    if (resultdata != null && resultdata != '') {
                        var table;
                        if ($.fn.dataTable.isDataTable(myTableName)) {
                            table = $(myTableName).DataTable();
                            table.clear();
                            table.rows.add(resultdata).draw();
                        }
                        else {
                            table = jQuery(myTableName).DataTable({
                                data: resultdata,
                                columns: colstructure,
                                "displayLength": 15,
                                "ordering": false,
                                "bFilter": false,
                                "bInfo": false,
                                "bPaginate": false,
                                "scrollY": 500,
                                "scrollX": true,
                                "bScrollCollapse": false
                            }).on('draw.dt', function () { });
                            //document.getElementById('spnHeaderCount').innerText = resultdata.length;
                        }
                    }
                    else {
                        if (action == 'prev' && parseInt(getMyPageNo()) == 1 && oldPgNo == 2) {
                            swal({ title: "Data Information !", text: "You are on First Page !", icon: 'info' })
                        }
                        else if (action == 'next') {
                            $("#hdnCurrPageNo").val(oldPgNo);
                            swal({ title: "Data Information !", text: "You are on Last Page !", icon: 'info' });
                        }
                    }
                    // *-*-*-*-*-*-*-*-
                    setMyPageNo();
                },
                error: function (r) { alert('Error : ' + r.responseText); },
                failure: function (r) { alert('failure'); }
            });
        }
        // -----------------------------------------------------------------
        function getMyPageNo() {
            var retValue = '';
            var mode = $('#hdnCurrentTab').val();
            if (mode.toLowerCase() == 'buylead') 
                retValue = $('#hdnCurrPage_purc').val();
            else if (mode.toLowerCase() == 'salelead') 
                retValue = $('#hdnCurrPage_sale').val();
            else if (mode.toLowerCase() == 'workshoplead') 
                retValue = $('#hdnCurrPage_workshop').val();
            else if (mode.toLowerCase() == 'rtolead') 
                retValue = $('#hdnCurrPage_rto').val();
            else if (mode.toLowerCase() == 'financelead') 
                retValue = $('#hdnCurrPage_finance').val();
            else if (mode.toLowerCase() == 'insurancelead') 
                retValue = $('#hdnCurrPage_insurance').val();
            // ------------------------------------------------
            return retValue;
        }
        // -----------------------------------------------------------------
        function setMyPageNo() {
            var mode = $('#hdnCurrentTab').val();

            if (mode.toLowerCase() == 'buylead')
                $("#spnPageNoBuy").text("Page # : " + $("#hdnCurrPage_buy").val());
            else if (mode.toLowerCase() == 'salelead') 
                $("#spnPageNoSale").text("Page # : " + $("#hdnCurrPage_sale").val());
            else if (mode.toLowerCase() == 'workshoplead')
                $("#spnPageNoWorkshop").text("Page # : " + $("#hdnCurrPage_workshop").val());
            else if (mode.toLowerCase() == 'rtolead')
                $("#spnPageNoRTO").text("Page # : " + $("#hdnCurrPage_rto").val());
            else if (mode.toLowerCase() == 'financelead')
                $("#spnPageNoFinance").text("Page # : " + $("#hdnCurrPage_finance").val());
            else if (mode.toLowerCase() == 'insurancelead')
                $("#spnPageNoInsurance").text("Page # : " + $("#hdnCurrPage_insurance").val());
        }
    </script>
</asp:Content>
