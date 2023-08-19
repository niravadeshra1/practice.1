<%@ Page Title="" Language="C#" MasterPageFile="~/StarsSite.Master" AutoEventWireup="true" CodeBehind="DashboardNew.aspx.cs" Inherits="StarsProject.DashboardNew" %>
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
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>

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

        table.dataTable thead th, table.dataTable thead td, {
            padding: 5px 5px;
            font-size: 12px;
        }

        table.dataTable tbody th, table.dataTable tbody td {
            padding: 5px 5px;
            font-size: 11px;
        }

        .myDropDownClass {
            background-color: #fff6e1;
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
        select {
            background-color: white !important;
        }
        tr td { color: black; }
        tbody tr td.tdNavy  {
            background: linear-gradient(45deg, #0288d1, #26c6da) !important;
            /*background: linear-gradient(45deg, #8e24aa, #ff6e40) !important;*/
        }
    </style>

    <script type="text/javascript">
        var pageUrl = '';

        $(document).ready(function () {
            $('tabs').tabs();

            $('.btnTopRightCorner').on("click", function () {
                var pgSource = $('#ifrModuleCRM').attr('src');
                var strPos1 = pgSource.indexOf('mode=add');
                var strPos2 = pgSource.indexOf('mode=edit');
                var strPos3 = pgSource.indexOf('mode=continue');
                if (strPos1 >= 0 || strPos2 >= 0 || strPos3 >= 0) {
                    __doPostBack('', '');
                }
            });

            $("#drpEmployee").change(function () {
                ShowLeadList();
            });

            ShowLeadList();
        });

        function openMixFollowup(mode, pkid, custid, extpkid) {
            if (extpkid == '0' || extpkid == '')
                openContFollowup(mode, pkid);
            else
                openContFollowFromTeleCaller('add', extpkid);
        }
        function openContFollowup(mode, pkid) {
            Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "Manage FollowUp";
            var pageUrl = "Followup.aspx?mode=" + mode + "&id=" + pkid
            $('#ifrModuleCRM').attr('src', pageUrl);
            $find("mpe").show();
        }

        function openMixTimeline(xExtID, xCustID, xCustName) {
            if (xCustID != '0')
                openTimeline('followup', xCustID, xCustName);
            else
                openTimelineExt('followupext', xExtID, xCustName);
        }

        function openTimeline(xView, xCustID, xCustName) {
            var pageUrl = "FollowupTimeline.aspx?view=" + xView + "&id=" + xCustID + "&name=" + xCustName;
            $('#ifrModuleCRM').attr('src', pageUrl);
            $find("mpe").show();
        }
        /*---------------------------------------------------------*/
        function pageLoad(sender, args) {
            retainTabPosition();
        }

        function show_loader() {
            jQuery("#myLoader").removeClass("hide-loader");
            jQuery("#myLoader").addClass("loader");
            //event.preventDefault();
        }

        function hide_loader() {
            jQuery("#myLoader").removeClass("loader");
            jQuery("#myLoader").addClass("hide-loader");
            //event.preventDefault();
        }

        /*---------------------------------------------------------*/
        /* Below section to Maintain Current TAB                   */
        /*---------------------------------------------------------*/
        $(function () {
            var tabName = $("[id*=hdnCurrentTab]").val() != "" ? $("[id*=hdnCurrentTab]").val() : "followup";
            $("#myTab a").click(function () {
                var prevTab = $("[id*=hdnCurrentTab]").val() != "" ? $("[id*=hdnCurrentTab]").val() : "followup";
                var currTab = $(this).attr("href").replace("#", "");
                $('#' + prevTab + '-tab').removeClass('show');
                $('#' + currTab + '-tab').addClass('show');
                $("#hdnCurrentTab").val(currTab);
                // ------------------------------------
                if ($("[id*=hdnCurrentTab]").val() == "followup") {
                    ShowLeadList();

                    $('#divForFollowUp').css("display", "block");
                    $('#divForToDOTask').css("display", "none");
                }
                else if ($("[id*=hdnCurrentTab]").val() == "todotask")
                {
                    ShowLeadList();

                    $('#divForFollowUp').css("display", "none");
                    $('#divForToDOTask').css("display", "block");
                }
                    
            });
        });

        function retainTabPosition() {
            $('#lnkfollowup').removeClass('active');
            $('#lnktodotask').removeClass('active');

            $('#followup').css("display", "none");
            $('#todotask').css("display", "none");
            
            // --------------------------------------------------- 
            if ($("#hdnCurrentTab").val() == 'followup') {
                $('#lnkfollowup').addClass('active');
                $('#followup').css("display", "block");

                $('#divForFollowUp').css("display", "block");
                $('#divForToDOTask').css("display", "none");
                
            }
            if ($("#hdnCurrentTab").val() == 'todotask') {
                $('#lnktodotask').addClass('active');
                $('#todotask').css("display", "block");

                $('#divForFollowUp').css("display", "none");
                $('#divForToDOTask').css("display", "block");
            }
        }

        function ShowLeadList() {
            show_loader();
            // -----------------------------------------------------------
            var myTableName = '';
            var colstructure, dataurl, para1, para2, para3, para4, para5, para0;
            var groupColumn, valColspan, groupColumnTitle = "", dataurl = "";
            // -----------------------------------------------------------
            var viewmode = $("#hdnCurrentTab").val();

            if (viewmode == undefined)
                viewmode = 'followup';
            // -----------------------------------------------------------
            if (viewmode == 'followup') {
                colstructure = [
                        //{
                        //    title: "Sr.No", data: "RowNum", className: "center-align", width: "50",
                        //    render: function (data, type, row, meta) {
                        //        return meta.row + meta.settings._iDisplayStart + 1;
                        //    }
                        //},
                        { title: "Sr.No", data: "RowNum", className: "center-align", width: "50" },
                        {
                            title: "Customer Name", data: "CustomerName", className: "limited left-align", width: "250",
                            render: function (data, type, row, meta) {
                                data = '<a title="Add Folloup in Continuation" href="javascript:openMixFollowup(\'continue\',\'' + row.pkID + '\', \'' + row.CustomerID + '\', \'' + row.ExtpkID + '\');">' +
                                        '<img id="Img1" class="float-left" runat="server" clientidmode="static" src="images/expand.png" style="width:20px; height:20px;" />' +
                                        '</a>&nbsp;&nbsp;<span class="blue-text">' + row.CustomerName + '</span>';
                                return data;
                            }
                        },
                        {
                            title: "FollowUp Notes", data: "MeetingNotes", className: "left-align", width: "250",
                            render: function (data, type, row, meta) {
                                data = '<p><small>' + data + "</small></p>";
                                return data;
                            }
                        },
                        { title: "Followup Date", data: "FollowupDate", type: "date", className: "center-align", width: "150", render: function (data, type, full) { return (data) ? moment(data).format('DD-MMM-YYYY') : ''; } },
                        { title: "Next Followup", data: "NextFollowupDate", type: "date", className: "center-align", width: "150", render: function (data, type, full) { return (data) ? moment(data).format('DD-MMM-YYYY') : ''; } },
                        {
                            title: "Lead #", data: "InquiryNo", className: "center-align", width: "120",
                            render: function (data, type, row, meta) {
                                data = '<p style="color:navy; font-weight:800;"><i class="material-icons" style="color:red; vertical-align:bottom;">phone_in_talk</i><span style="color:navy;"><b>&nbsp;' + row.InquiryNo + '</b></span></p><br />' +
                                       '&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/multi-user-icon.jpg" alt="" style="width:20px; height:20px;" onclick="openInquiryShare(\'' + row.InquiryNo + '\');"/>';
                                return data;
                            }
                        },
                        { title: "Quotation #", data: "QuotationNo", className: "center-align", width: "120" },
                        {
                            title: "Contact #1", data: "ContactNo1", className: "left-align", width: "250",
                            render: function (data, type, row, meta) {
                                data = '<p style="color:navy; font-weight:800;"><i class="material-icons" style="color:red; vertical-align:bottom;">phone_in_talk</i><span style="color:navy;"><b>&nbsp;' + row.ContactNo1 + '</b></span></p><br />' +
                                       '<p style="color:blue; font-weight:800;"><i class="material-icons" style="color:maroon; vertical-align:bottom;">phone_in_talk</i><span style="color:blue;"><b>&nbsp;' + row.ContactNo2 + '</b></span></p>';
                                return data;
                            }
                        },
                        {
                            title: "Contact Person", data: "ContactPerson", className: "left-align", width: "350",
                            render: function (data, type, row, meta) {
                                data = '<p style="color:navy; font-weight:800;"><i class="material-icons" style="color:black; vertical-align:bottom;">person</i><span style="color:navy;"><b>&nbsp;' + row.ContactPerson + '</b></span></p><br />' +
                                       '<p style="color:blue; font-weight:800;"><i class="material-icons" style="color:black; vertical-align:bottom;">phone_in_talk</i><span style="color:green;"><b>&nbsp;' + row.ContactPersonPhone + '</b></span></p>';
                                return data;
                            }
                        },
                        { title: "Initiate By & Date", data: "EmployeeName", className: "tdNavy left-align", width: "350",
                            render: function (data, type, row, meta) {
                                data = '<p style="color:navy; font-size:14px;"><i class="material-icons" style="color:yellow; margin:3px 0 3px 0; vertical-align:bottom;">person</i><span style="color:white;"><b>&nbsp;' + row.EmployeeName + '</b></span></p>' +
                                       '<p style="color:black; font-size:14px;"><i class="material-icons" style="color:yellow; margin:3px 0 3px 0; vertical-align:bottom;">access_alarm</i><span style="color:white;"><b>&nbsp;' + ((row.CreatedDate) ? moment(row.CreatedDate).format('DD-MMM-YYYY    hh:mm') : '') + '</b></span></p>' +
                                       '<p class="badge gradient-45deg-yellow-green black-text gradient-shadow" style="margin:3px 0 3px 0;">&nbsp;' +
                                       '<a title="Show Followup Timeline" href="javascript:openMixTimeline(\'' + row.ExtpkID + '\',\'' + row.CustomerID + '\',\'' + row.CustomerName + '\');">' +
                                       '<img id="follTimeline" class="float-left mr-2 mt-1" src="images/timeline3.png" style="width:20px; height:20px;" />' +
                                       '</a>' +
                                       '<span style="font-size:18px;"><i class="fa fa-clock-o"></i>&nbsp;' + row.InquiryStatus + '</span>' +
                                       '</p>';

                                return data;
                            }
                        }
                ];

            }
            else if (viewmode == 'todotask') {
                colstructure = [
                    //{
                    //    title: "Sr.No", data: "pkID", className: "center-align", width: "50",
                    //    render: function (data, type, row, meta) {
                    //        return meta.row + meta.settings._iDisplayStart + 1;
                    //    }
                    //},
                    //{ title: "Sr.No", data: "RowNum", className: "center-align", width: "50" },
                    {
                        title: "Task #", data: "pkID", className: "center", width: "110",
                        render: function (data, type, row, meta) {
                            if ($("#hdnLoginUserID").val() == row.CreatedBy)
                                data = '<a href="javascript:openModule(' + row.pkID + ');">' + data + '</a>';
                            else
                                data = '<a style="border-radius:8px; background-color:red; color:white; padding:5px;"  href="javascript:openModule(' + row.pkID + ');">' + data + '</a>';

                            return data;
                        }
                    },
                    { title: "Start Date", data: "StartDate", type: "date", className: "center", width: "150", render: function (data, type, full) { return (data) ? moment(data).format('DD-MMM-YYYY') : ''; } },
                    { title: "Due Date", data: "DueDate", type: "date", className: "center", width: "150", render: function (data, type, full) { return (data) ? moment(data).format('DD-MMM-YYYY') : ''; } },
                    { title: "Category", data: "TaskCategory", width: "250" }
                ];
            }

            // *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
            if (viewmode == 'followup') {
                
                jQuery.ajax({
                    url: '/Services/NagrikService.asmx/setGridPageSizeFollowUp?pSize=' + $("#drpPageSizeFollowUp").val(),
                    type: "get",
                    success: function (data) { }
                });
                // -----------------------------------------------------------
                $("#hdnCurrPage").val("1");
                $("#spnPageNoFollowUp").text("Page # : " + $("#hdnCurrPage").val());
                dataurl = '/Services/NagrikService.asmx/webDashboardFollowupList?currPageNo=1' + '&FollowupStatus=' + $("#drpFollowup").val() + '&LoginUserID=' + $("#drpEmployee").val();
                myTableName = '#data-table-followup';
            }
            else if (viewmode == 'todotask') {
                jQuery.ajax({
                    url: '/Services/NagrikService.asmx/setGridPageSizeToDO?pSize=' + $("#drpPageSizeToDO").val(),
                    type: "get",
                    success: function (data) { }
                });
                // -----------------------------------------------------------
                $("#hdnCurrPage").val("1");
                $("#spnPageNoToDOTask").text("Page # : " + $("#hdnCurrPage").val());
                dataurl = '/Services/NagrikService.asmx/webDashboardToDoList?currPageNo=1' + '&TaskStatus=' + $("#drpToDO").val() + '&LoginUserID=' + $("#drpEmployeeToDO").val();
                myTableName = '#data-table-todotask';
            }
            // -----------------------------------------------------------------------------

            jQuery.ajax({
                url: dataurl, type: "get",
                success: function (data) {
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
                            "ordering": false,
                            "bFilter": false,
                            "bInfo": false,
                            "bPaginate": false,
                            "scrollY": 500,
                            "scrollX": true,
                            "bScrollCollapse": false
                        }).on('draw.dt', function (e, settings, data) {

                        });
                        //document.getElementById('spnHeaderCount').innerText = resultdata.length;
                    }

                },
                error: function (r) { alert('Error : ' + r.responseText); },
                failure: function (r) { alert('failure'); }
            });
            window.setTimeout(hide_loader, 500);
        }

        function openDashboardBox(view, mode, id) {
            if (view == 'followup') {
                Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "Manage Followup";
                var pageUrl = "Followup.aspx?mode=" + mode + "&id=" + id;
                $('#ifrModuleCRM').attr('src', pageUrl);
                $find("mpe").show();
            }

            if (view == 'todo') {
                Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "Manage Task Activity";
                var pageUrl = "ToDo.aspx?mode=" + mode + "&id=" + id;
                $('#ifrModuleCRM').attr('src', pageUrl);
                $find("mpe").show();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" CompositeScript-ScriptMode="Inherit"></asp:ScriptManager>
<%--    <asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>--%>
    <asp:HiddenField ID="hdnLoginUserID" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnSerialKey" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnRoleCode" runat="server" ClientIDMode="Static" Value="" EnableViewState="true" />
    <asp:HiddenField ID="hdnCurrentTab" runat="server" ClientIDMode="Static" Value="followup" EnableViewState="true" />
    
    <asp:HiddenField ID="hdnCurrPage" runat="server" ClientIDMode="Static" Value="1" EnableViewState="true" />

    <div id="myLoader" class="hide-loader"></div>
    
    <div id="contentwrapper" class="contentwrapper">


            <div class="row">
                <div class="col m6">
                    <ul id="myTab" class="tabs card-border-gray" runat="server" clientidmode="Static" enableviewstate="true">
                        <li class="tab col p-0"><a id="lnkfollowup" class="left active" style="padding:0 15px;" href="#followup">FollowUps</a></li>
                        <li class="tab col p-0"><a id="lnktodotask" class="left" style="padding:0 15px;" href="#todotask">To-DO Task</a></li>
                    </ul>
                </div>
                <div id="divForFollowUp" class="col m6 badge gradient-45deg-indigo-purple no-shadow black-text gradient-shadow" style="height: 48px; border-top: 1px solid navy; border-bottom: 3px solid navy;">
                    <div class="row mt-1">
                        <div class="col m4">
                            <asp:DropDownList ID="drpFollowup" runat="server" class="myDropDownClass select2-theme browser-default mr-2 float-left" ClientIDMode="Static" OnSelectedIndexChanged="drpFollowup_SelectedIndexChanged" TabIndex="5" AutoPostBack="true">
                                <asp:ListItem Text="Todays" Value="Todays" />
                                <asp:ListItem Text="Missed" Value="Missed" />
                                <asp:ListItem Text="Future" Value="Future" />
                            </asp:DropDownList>
                        </div>
                        <div class="col m6">
                            <asp:DropDownList ID="drpEmployee" runat="server" class="myDropDownClass select2-theme browser-default float-left" ClientIDMode="Static" TabIndex="5">
                            </asp:DropDownList>
                        </div>
                        <div class="col m2">
                            <a class="material-icons background-round gradient-45deg-red-pink white-text float-right p-0 adddialog" data-position="center" data-tooltip="Add New FollowUp" href="javascript:openDashboardBox('followup', 'add', 0);"><i class="material-icons" style="font-size: 20px; padding: 5px;">add</i></a>
                        </div>
                    </div>
                </div>
                <div id="divForToDOTask" class="col m6 badge gradient-45deg-indigo-purple no-shadow black-text gradient-shadow" style="display: none; height: 48px; border-top: 1px solid navy; border-bottom: 3px solid navy;">
                    <div class="row mt-1">
                        <div class="col m4">
                            <asp:DropDownList ID="drpToDO" runat="server" class="myDropDownClass select2-theme browser-default float-left" ClientIDMode="Static" OnSelectedIndexChanged="drpToDO_SelectedIndexChanged" TabIndex="5" AutoPostBack="true">
                                <asp:ListItem Text="Todays" Value="Todays" />
                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Completed" Value="Completed" />
                                <asp:ListItem Text="Pending-OverDue" Value="Pending-OverDue" />
                                <asp:ListItem Text="Completed-OverDue" Value="Completed-OverDue" />
                            </asp:DropDownList>
                        </div>
                        <div class="col m6">
                            <asp:DropDownList ID="drpEmployeeToDO" runat="server" class="myDropDownClass select2-theme browser-default mr-2 float-left" ClientIDMode="Static" OnSelectedIndexChanged="drpEmployeeToDO_SelectedIndexChanged" TabIndex="5" AutoPostBack="true" />
                        </div>
                        <div class="col m2">
                            <a class="material-icons background-round gradient-45deg-red-pink white-text float-right p-0 adddialog" data-position="center" data-tooltip="Add New ToDO" href="javascript:openDashboardBox('todo', 'add', 0);"><i class="material-icons" style="font-size: 20px; padding: 5px;">add</i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="followup" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="margin-left:5px;">
                    <div class="gradient-45deg-light-blue-cyan gradient-shadow width-100" style="min-height:50px;">
                        <span class="float-left ml-2" style="margin-top: 10px;"><h6 class="white-text">Select Page Size :</h6></span>
                        <asp:DropDownList ID="drpPageSizeFollowUp" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default float-left" AutoPostBack="true" OnSelectedIndexChanged="drpPageSizeFollowUp_SelectedIndexChanged" style="width: 60px; display:inline-block; background-color: beige; margin-left: 5px; height: 1.8rem; padding: 0px; font-size:14px; margin-top: 15px;">
                            <asp:ListItem Text="50" Value="50" />
                            <asp:ListItem Text="100" Value="100" />
                            <asp:ListItem Text="150" Value="150" />
                            <asp:ListItem Text="200" Value="200" />
                            <asp:ListItem Text="250" Value="250" />
                            <asp:ListItem Text="300" Value="300" />
                        </asp:DropDownList>
                        
                        <span id="spnPageNoFollowUp" class="ml-1 float-right black-text width-30" style="font-size: 18px; border-radius: 5px; margin-top: 12px; margin-right: 4%; text-align: right;">Page # : </span>
                    </div>
                    <!-- Content Area Starts -->
                    <div class="content-area content-right">
                        <div class="app-wrapper">
                            <div id="button-trigger-followup" class="card card card-default scrollspy border-radius-6 fixed-width">
                                <div class="card-content p-0">
                                    <table id="data-table-followup" class="display" style="width: 100%"></table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Content Area Ends -->
            </div>
            <div id="todotask" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:none; margin-left:5px;">
                    <div class="gradient-45deg-light-blue-cyan gradient-shadow width-100" style="min-height:50px;">
                        <span class="float-left ml-2" style="margin-top: 10px;"><h6 class="white-text">Select Page Size :</h6></span>
                        <asp:DropDownList ID="drpPageSizeToDO" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default float-left" AutoPostBack="true" OnSelectedIndexChanged="drpPageSizeToDO_SelectedIndexChanged" style="width: 60px; display:inline-block; background-color: beige; margin-left: 5px; height: 1.8rem; padding: 0px; font-size:14px; margin-top: 15px;">
                            <asp:ListItem Text="50" Value="50" />
                            <asp:ListItem Text="100" Value="100" />
                            <asp:ListItem Text="150" Value="150" />
                            <asp:ListItem Text="200" Value="200" />
                            <asp:ListItem Text="250" Value="250" />
                            <asp:ListItem Text="300" Value="300" />
                        </asp:DropDownList>
                        
                        <span id="spnPageNoToDOTask" class="ml-1 float-right black-text width-30" style="font-size: 18px; border-radius: 5px; margin-top: 1%; margin-right: 4%; text-align: right;">Page # : </span>
                    </div>
                    <!-- Content Area Starts -->
                    <div class="content-area content-right">
                        <div class="app-wrapper">
                            <div id="button-trigger-todotask" class="card card card-default scrollspy border-radius-6 fixed-width">
                                <div class="card-content p-0">
                                    <table id="data-table-todotask" class="display" style="width: 100%"></table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Content Area Ends -->
            </div>
            <div class="row">
                <div class="col m12" style="text-align: center; width: 100%; margin: auto;">
                    <a id="lnkResetPage" class="material-icons background-round gradient-45deg-red-pink gradient-shadow white-text float-left tooltipped ml-1 mr-1" data-tooltip="Refresh Data" href="javascript:gridReloadData('reset');" style="position: relative; padding: 10px; top: -25px;"><i class="material-icons">autorenew</i></a>
                    <a id="lnkPrevPage" class="material-icons background-round gradient-45deg-purple-deep-orange gradient-shadow white-text tooltipped ml-1 mr-1 hide" data-tooltip="Previous" href="javascript:gridReloadData('prev');" style="position: relative; padding: 10px; top: -25px;"><i class="material-icons">chevron_left</i></a>
                    <a id="lnkNextPage" class="material-icons background-round gradient-45deg-purple-deep-orange gradient-shadow white-text tooltipped ml-1 mr-1" data-tooltip="Next" href="javascript:gridReloadData('next');" style="position: relative; padding: 10px; top: -25px;"><i class="material-icons">chevron_right</i></a>
                </div>
            </div>
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
        <iframe id="ifrModuleCRM" src="about:blank" scrolling="auto" style="border: 1px solid silver; background-color: transparent; width: 100%; height: 85%; padding: 5px;"></iframe>
        <br />
    </asp:Panel>
    <asp:Button ID="Button1" CssClass="hide" runat="server" Text="Fill Form in Popup" />

    <script type="text/javascript">
        $(document).ready(function () {
            
        });
       
        // *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
        function openInquiryShare(inqno)
        {
            var pageUrl = "", pageTitle = "";
            pageTitle = "Share Inquiry";
            pageUrl = "InquiryShare.aspx?inquiryno=" + inqno;
            Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = pageTitle;
            $('#ifrModuleCRM').attr('src', pageUrl);
            $find("mpe").show();
        }

        function openModule(id)
        {
            var mode = $('#hdnCurrentTab').val();
            var pageUrl = "", pageTitle = "";

            if (mode.toLowerCase() == 'followup')
            {
                pageTitle = "Manage FollowUps";
                pageUrl = "FollowUp.aspx?mode=edit&id=" + id
            }
            else if (mode.toLowerCase() == 'todotask') {
                pageTitle = "Manage To-DO Task";
                pageUrl = "ToDO.aspx?mode=edit&id=" + id
            }
            // ----------------------------------------------------------------------------------
            Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = pageTitle;
            $('#ifrModuleCRM').attr('src', pageUrl);
            $find("mpe").show();
        }

        function gridReloadData(action) {
            show_loader();
            var oldPgNo = 1, currPageNo = 1, currPageSize = 10;
            var dataurl = "", myTableName = "", viewmode = "";
            viewmode = $('#hdnCurrentTab').val();
            
            // -------------------------------------------------------------
            // && ($('#hdnRoleCode').val() == 'purchase' || $('#hdnRoleCode').val() == 'admin' || $('#hdnRoleCode').val() == 'bradmin')
            if (viewmode.toLowerCase() == 'followup')
            {
                currPageSize = $("#drpPageSizeFollowUp").val();

                oldPgNo = $('#hdnCurrPage').val();
                currPageNo = (parseInt($('#hdnCurrPage').val()) + 1).toString();
                // -----------------------------------------------------------
                jQuery.ajax({
                    url: '/Services/NagrikService.asmx/setGridPageSizeFollowUp?pSize=' + $("#drpPageSizeFollowUp").val(),
                    type: "get",
                    success: function (data) { }
                });
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
                $("#hdnCurrPage").val(currPageNo);
                // ---------------------------------------------------                
                dataurl = '/Services/NagrikService.asmx/webDashboardFollowupList?currPageNo=' + currPageNo + '&FollowupStatus=' + $("#drpFollowup").val() + '&LoginUserID=' + $("#drpEmployee").val();
                myTableName = '#data-table-followup';
            }
            else if (viewmode.toLowerCase() == 'todotask')
            {
                currPageSize = $("#drpPageSizeToDO").val();
                oldPgNo = $('#hdnCurrPage').val();
                currPageNo = (parseInt($('#hdnCurrPage').val()) + 1).toString();
                // -----------------------------------------------------------
                jQuery.ajax({
                    url: '/Services/NagrikService.asmx/setGridPageSizeToDO?pSize=' + $("#drpPageSizeToDO").val(),
                    type: "get",
                    success: function (data) { }
                });
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
                $("#hdnCurrPage").val(currPageNo);
                // ---------------------------------------------------                
                dataurl = '/Services/NagrikService.asmx/webDashboardToDoList?currPageNo=' + currPageNo + '&TaskStatus=' + $("#drpToDO").val() + '&LoginUserID=' + $("#drpEmployeeToDO").val();
                myTableName = '#data-table-todotask';
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
            window.setTimeout(hide_loader, 500);
        }
        // -----------------------------------------------------------------
        function getMyPageNo() {
            var retValue = '';
            var mode = $('#hdnCurrentTab').val();
            if (mode.toLowerCase() == 'followup') 
                retValue = $('#hdnCurrPage_followup').val();
            else if (mode.toLowerCase() == 'todotask') 
                retValue = $('#hdnCurrPage_todotask').val();
            // ------------------------------------------------
            return retValue;
        }
        // -----------------------------------------------------------------
        function setMyPageNo() {
            var mode = $('#hdnCurrentTab').val();

            if (mode.toLowerCase() == 'followup')
                $("#spnPageNoFollowUp").text("Page # : " + $("#hdnCurrPage").val());
            else if (mode.toLowerCase() == 'todotask') 
                $("#spnPageNoToDOTask").text("Page # : " + $("#hdnCurrPage").val());
        }
    </script>
</asp:Content>
