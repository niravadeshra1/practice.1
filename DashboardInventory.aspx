<%@ Page Title="" Language="C#" MasterPageFile="~/StarsSite.Master" AutoEventWireup="true" CodeBehind="DashboardInventory.aspx.cs" Inherits="StarsProject.DashboardInventory" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="~/myLocationWiseMinStockLevel.ascx" TagPrefix="uc1" TagName="myLocationWiseMinStockLevel" %>
<%@ Register Src="~/myMinStockLevel.ascx" TagPrefix="uc1" TagName="myMinStockLevel" %>
<%@ Register Src="~/myMaterialStatus.ascx" TagPrefix="uc1" TagName="myMaterialStatus" %>
<%@ Register Src="~/myJobCardStatus.ascx" TagPrefix="uc1" TagName="myJobCardStatus" %>
<%@ Register Src="~/myLocationProductStock.ascx" TagPrefix="uc1" TagName="myLocationProductStock" %>
<%@ Register Src="~/myAssemblyStock.ascx" TagPrefix="uc1" TagName="myAssemblyStock" %>
<%@ Register Src="~/myAssemblyStockProductWise.ascx" TagPrefix="uc1" TagName="myAssemblyStockProductWise" %>
<%@ Register Src="~/myMaterialIndent.ascx" TagPrefix="uc1" TagName="myMaterialIndent" %>
<%@ Register Src="~/myDieList.ascx" TagPrefix="uc1" TagName="myDieList" %>
<%@ Register Src="~/myMoldingFinishedQty.ascx" TagPrefix="uc1" TagName="myMoldingFinishedQty" %>
<%@ Register Src="~/myRepairingSummary.ascx" TagPrefix="uc1" TagName="myRepairingSummary" %>
<%@ Register Src="~/myProductionStatusfromSO.ascx" TagPrefix="uc1" TagName="myProductionStatusfromSO" %>
<%@ Register Src="~/myOrderApproval1.ascx" TagPrefix="uc1" TagName="myOrderApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <link rel="stylesheet" type="text/css" href="app-assets/vendors/data-tables/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/data-tables/extensions/responsive/css/responsive.dataTables.min.css" />
    
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="plugins/jquery/jquery.min.js"></script>
    <script src="app-assets/vendors/data-tables/js/jquery.dataTables.min.js"></script>
    <script src="app-assets/vendors/data-tables/extensions/responsive/js/dataTables.responsive.min.js"></script>
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
            background-color: #f9e3b1;
            color: navy;
            font-size: medium;
            width: 150px;
            height: 30px !important;
            border: 1px solid black;
            margin-top: 1px;
            padding: 1px 5px;
            border: none;
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
    </style>
    <script type="text/javascript">

        function loadAssemblyStockSummary(para1, para2) {
            var groupColumnTitle = "Finish Product >>> ";
            var groupColumn = 0;
            var valColspan = 7;
            //para1 = jQuery.trim(jQuery("#drpAssemblyStatus").val());
            //para2 = jQuery.trim(jQuery("#drpAssemblyOrder").val());
            // ---------------------------------------------------------
            dataurl = '/Services/NagrikService.asmx/webAssemblyStockSummary?Status=' + para1 + "&OrderNo=" + para2;
            colstructure = [
                { title: "Finish Product", data: "FinishProductName", className: "left-align", width: "250" },
                { title: "Assembly", data: "AssemblyName", className: "left-align", width: "250" },
                { title: "Assembly Qty", data: "AssemblyQty", className: "center-align", width: "90" },
                { title: "Required Qty", data: "RequiredQty", className: "center-align", width: "80" },
                { title: "Available Qty", data: "ClosingSTK", className: "center-align", width: "80" },
                { title: "Balance Qty", data: "BalanceQty", className: "center-align", width: "80" },
                { title: "Status", data: "BalanceStatus", className: "center-align", width: "100" }
            ];

            jQuery.ajax({
                url: dataurl,
                type: "get",
                success: function (data) {
                    var resultdata = JSON.parse(data.getElementsByTagName("string")[0].innerHTML);
                    // ----------------------------------------------
                    //var table;
                    //table = $('#tblView').DataTable();
                    //if (table != null) {
                    //    table.clear();
                    //    //table.rows.add(resultdata).draw();
                    //}
                    // ----------------------------------------------
                    jQuery('#tblView').DataTable({
                        "columnDefs": [{ "visible": false, "targets": groupColumn }],
                        "order": [[groupColumn, 'asc']],
                        data: resultdata,
                        columns: colstructure,
                        "displayLength": 10,
                        "drawCallback": function (settings) {
                            var api = this.api();
                            var rows = api.rows({ page: 'current' }).nodes();
                            var last = null;

                            api.column(groupColumn, { page: 'current' }).data().each(function (group, i) {
                                if (last !== group) {
                                    $(rows).eq(i).before('<tr class="group"><td colspan="' + valColspan + '"  style="background-color:#483d8b !important; color:white !important; font-size:18px !important; font-weight:bold !important; text-transform:capitalize;"><b>' + groupColumnTitle + ' </b>' + group + '</td></tr>');
                                    last = group;
                                }
                            });
                        }
                    })
                },
                error: function (r) {
                    alert('Error : ' + r.responseText);
                },
                failure: function (r) {
                    alert('failure');
                }
            });
            $('#tblView').on('draw.dt', function () { window.setTimeout(hide_loader, 500); });
        }

        function loadAssemblyStockSummaryProductWise(para1, para2, para3) {
            var groupColumnTitle = "Finish Product >>> ";
            var groupColumn = 0;
            var valColspan = 7;
            //var para3 = 1;

            //para1 = jQuery.trim(jQuery("#drpAssemblyStatus1").val());
            //para2 = jQuery.trim(jQuery("#drpProduct").val());
            //para3 = jQuery.trim(jQuery("#txtQuantity").val());

            // ---------------------------------------------------------
            dataurl = '/Services/NagrikService.asmx/webAssemblyStockSummaryProductWise?Status=' + para1 + '&ProductID=' + para2 + '&Quantity=' + para3;
            colstructure = [
                { title: "Finish Product", data: "FinishProductName", className: "left-align", width: "250" },
                { title: "Assembly", data: "AssemblyName", className: "left-align", width: "250" },
                { title: "Assembly Qty", data: "AssemblyQty", className: "center-align", width: "90" },
                { title: "Required Qty", data: "RequiredQty", className: "center-align", width: "80" },
                { title: "Available Qty", data: "ClosingSTK", className: "center-align", width: "80" },
                { title: "Balance Qty", data: "BalanceQty", className: "center-align", width: "80" },
                { title: "Status", data: "BalanceStatus", className: "center-align", width: "100" }
            ];

            jQuery.ajax({
                url: dataurl,
                type: "get",
                success: function (data) {
                    var resultdata = JSON.parse(data.getElementsByTagName("string")[0].innerHTML);
                    // ----------------------------------------------
                    //var table;
                    //table = $('#tblView1').DataTable();
                    //if (table != null) {
                    //    table.clear();
                    //    //table.rows.add(resultdata).draw();
                    //}
                    // ----------------------------------------------
                    jQuery('#tblView1').DataTable({
                        "columnDefs": [{ "visible": false, "targets": groupColumn }],
                        "order": [[groupColumn, 'asc']],
                        data: resultdata,
                        columns: colstructure,
                        "displayLength": 10,
                        "drawCallback": function (settings) {
                            var api = this.api();
                            var rows = api.rows({ page: 'current' }).nodes();
                            var last = null;

                            api.column(groupColumn, { page: 'current' }).data().each(function (group, i) {
                                if (last !== group) {
                                    $(rows).eq(i).before('<tr class="group"><td colspan="' + valColspan + '"  style="background-color:#483d8b !important; color:white !important; font-size:18px !important; font-weight:bold !important; text-transform:capitalize;"><b>' + groupColumnTitle + ' </b>' + group + '</td></tr>');
                                    last = group;
                                }
                            });
                        }
                    })

                },
                error: function (r) {
                    alert('Error : ' + r.responseText);
                },
                failure: function (r) {
                    alert('failure');
                }
            });
            $('#tblView1').on('draw.dt', function () { window.setTimeout(hide_loader, 500); });
        }

        function OpenProduction(Orderid,ProductID,CustomerID) {
            pageUrl = "ProductionBySo.aspx?mode=pro&id=0&CustomerID=" + CustomerID + "&OrderID="+ Orderid +"&ProductID=" + ProductID;
            spnModuleHeader.innerText = "Production By So";
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }

        function showOrderForm(mode, id) {
            if (mode == 'purchase') {
                pageUrl = "PurchaseOrders.aspx?mode=view&id=" + id;
                spnModuleHeader.innerText = "Manage Purchase Order";
                $('#ifrModuleInventory').attr('src', pageUrl);
                $find("mpeInven").show();
            }
            else if (mode == 'sale') {
                pageUrl = "SalesOrder.aspx?mode=view&id=" + id;
                spnModuleHeader.innerText = "Manage Sales Order";
                $('#ifrModuleInventory').attr('src', pageUrl);
                $find("mpeInven").show();
            }
            else if (mode == 'jobcardoutward') {
                pageUrl = "JobCardOutward.aspx?mode=view&id=" + id;
                spnModuleHeader.innerText = "Manage JobCard";
                $('#ifrModuleInventory').attr('src', pageUrl);
                $find("mpeInven").show();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ClientIDMode="Static" EnablePageMethods="true"></asp:ScriptManager>
    <asp:HiddenField ID="hdnRoleCode" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnLoginUserID" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnClientURL" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnWelcomeGreet" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnLocationStockWisePosting" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnLocationWiseStock" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnProductionWithoutCustomer" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnSerialKey" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />

<%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate--%>>
            <!-- BEGIN: Complaint Section -->
<%--            <asp:UpdatePanel ID="upLeadSection" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>
                    <div id="divLedger" style="background: linear-gradient(45deg, silver, #f9e3b1); margin-bottom: 10px; padding-left: 10px; padding-right: 10px;">
                        <asp:Button ID="Button3" CssClass="hide" runat="server" Text="Fill Form in Popup" />
                        <div class="content-wrapper-before gradient-45deg-indigo-purple"></div>

                        <% if (hdnSerialKey.Value == "U041-RB97-S3KP-AP1P")
                            { %>
                        <%--------------------------------Making Prodiction Special Widget for Uma-----------------------------%>
                        <div id="divDepartmentWork" runat="server" clientidmode="static" class="row">
                            <div class="col m12">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="card user-statistics-card cardRound mb-1"  style="margin-top:10px;">
                                            <div class="card-content p-0">
                                                <h5 class="h5Round">
                                                    <span id="Span14" runat="server" clientidmode="Static" class="titleHead text-top">Order Details
                                                    </span>
                                                    <asp:DropDownList ID="drpStatusSO" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpStatusSO_SelectedIndexChanged">
                                                        <asp:ListItem Text="-- All --" Value="" />
                                                        <asp:ListItem Text="Pending" Value="Pending" />
                                                        <asp:ListItem Text="Complete" Value="Complete" />
                                                    </asp:DropDownList>
                                                </h5>
                                                <div style="width: 100%; min-height: 450px; max-height: 450px; padding: 2px 10px 0px 10px; margin-top:10px; overflow-x: hidden; overflow-y: auto;">
                                                    <table id="tblMaterial" class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%" >
                                                        <asp:Repeater ID="rptMaterial" runat="server" OnItemDataBound="rptMaterial_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <thead>
                                                                    <tr>
                                                                        <th class="center-align">Order #</th>
                                                                        <th class="center-align">Order Date</th>
                                                                        <th class="left-align" style="width:250px;">Product Name</th>
                                                                        <% if (hdnRoleCode.Value == "production")
                                                                            { %>
                                                                            <th class="center-align">Order Qty</th>
                                                                            <th class="center-align">Production Qty</th>
                                                                            <th class="center-align">Pending Qty</th>
                                                                        <%}
                                                                        else if (hdnRoleCode.Value == "packing")
                                                                        { %>
                                                                            <th class="center-align">Production Qty</th> 
                                                                            <th class="center-align">Packed Qty</th> 
                                                                            <th class="center-align">Pending Qty</th>
                                                                        <%} else if (hdnRoleCode.Value == "dispatch")
                                                                        { %>
                                                                            <th class="center-align">Packed Qty</th>  
                                                                            <th class="center-align">Dispatched Qty</th> 
                                                                            <th class="center-align">Pending Qty</th>
                                                                        <% } else if(hdnRoleCode.Value == "admin") {%>
                                                                            <th class="center-align">Order Qty</th>  
                                                                            <th class="center-align">Production Qty</th>
                                                                            <th class="center-align">Packed Qty</th>
                                                                            <th class="center-align">Dispatched Qty</th>
                                                                        <% }%>
                                                                        <th class="center-align hide">Make Production</th>
                                                                        <th class="center-align"> SO Status</th>
                                                                    </tr>
                                                                </thead>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr class="blueShed">
                                                                    <asp:HiddenField ID="hdnStatus" runat="server" ClientIDMode="Static" EnableViewState="true" Value='<%# Eval("Status") %>' />
                                                                    <asp:HiddenField ID="hdnCustomerId" runat="server" ClientIDMode="Static" EnableViewState="true" Value='<%# Eval("CustomerID") %>' />
                                                                    <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" EnableViewState="true" Value='<%# Eval("pkID") %>' />
                                                                    <asp:HiddenField ID="hdnOrderNo" runat="server" ClientIDMode="Static" EnableViewState="true" Value='<%# Eval("OrderNo") %>' />
                                                                    <asp:HiddenField ID="hdnRemQty" runat="server" ClientIDMode="Static" EnableViewState="true" Value='<%# Eval("RemQty") %>' />
                                                                    <td class="center-align"><%# Eval("OrderNo") %></td>
                                                                    <td class="center-align"><%# Eval("CreatedDate") %></td>
                                                                    <td class="left-align" style="width:250px;"><%# Eval("ProductName") %></td>
                                                                    <% if (hdnRoleCode.Value == "production" || hdnRoleCode.Value == "packing" || hdnRoleCode.Value == "dispatch")
                                                                        { %>
                                                                    <td class="center-align"><%# Eval("SoQty") %></td>
                                                                    <td class="center-align"><%# Eval("ProQty") %></td>
                                                                    <td class="center-align"><%# Eval("RemQty") %></td>  
                                                                    <%} else if (hdnRoleCode.Value == "admin") { %>
                                                                    <td class="center-align"><%# Eval("SoQty") %></td>
                                                                    <td class="center-align"><%# Eval("ProQty") %></td>
                                                                    <td class="center-align"><%# Eval("PackQty") %></td>
                                                                    <td class="center-align"><%# Eval("OutQty") %></td>
                                                                    <% } %> 
                                                                    <td class="center-align">
                                                                        <asp:Label ID="tdStatus" runat="server" style="padding: 4px 4px 4px 8px !important;border-radius: 5px;"><%# Eval("Status") %></asp:Label>
                                                                    </td>
                                                                    <td class="center-align hide"><a href="javascript:OpenProduction('<%# Eval("OrderNo") %>',<%# Eval("ProductID") %>)" style="color:white;font-size:20px;background-color:brown;border-radius:5px;padding:5px"> Make Production </a></td>   
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <%} %>
                        <div class="row">
                            <div class="col m12">
                                <div class="card user-statistics-card mb-0 mt-1">
                                    <div class="card-content p-0">
                                        <h5 class="h5RoundHead">
                                            <span id="Span4" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Sales Data Filter : </span>
                                            <asp:DropDownList ID="drpInvMonth" runat="server" ClientIDMode="Static" class="select2-theme browser-default mr-2 float-right myDropDownClass" AutoPostBack="true" OnSelectedIndexChanged="drpInvMonthYear_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:DropDownList ID="drpInvYear" runat="server" ClientIDMode="Static" class="select2-theme browser-default mr-2 float-right myDropDownClass" AutoPostBack="true" OnSelectedIndexChanged="drpInvMonthYear_SelectedIndexChanged"></asp:DropDownList>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col m6" style="padding-right: 5px;">
                                        <div class="card user-statistics-card cardRound mb-2">
                                            <div class="card-content p-0">
                                                <h5 class="h5Round">
                                                    <span id="Span2" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Material Request Status</span>
                                                    <asp:DropDownList ID="drpPurcOrderStatus" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpPurcOrderStatus_SelectedIndexChanged">
                                                        <asp:ListItem Text="Summary" Value="summary" />
                                                        <asp:ListItem Text="Detail" Value="Detail" />
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="drpPurcStatusType" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpPurcOrderStatus_SelectedIndexChanged">
                                                        <asp:ListItem Text="-- All --" Value="" />
                                                        <asp:ListItem Text="Pending" Value="Pending" />
                                                        <asp:ListItem Text="Complete" Value="Complete" />
                                                        <asp:ListItem Text="Access" Value="Access" />
                                                    </asp:DropDownList>
                                                    <asp:ImageButton ID="btnExportRequest" runat="server" ClientIDMode="Static" CssClass="btn-floating float-right ml-1 mr-1 tooltipped" AlternateText="Export" data-tooltip="Export To Excel" ImageAlign="left" ImageUrl="images/buttons/export2excel.png" OnClick="btnExportRequest_Click" Height="35px" Width="35px" Style="z-index: 0;" />
                                                </h5>
                                                <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                                    <uc1:myMaterialStatus runat="server" ID="myPurchaseStatus" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col m6" style="padding-right: 5px;">
                                        <div class="card user-statistics-card cardRound mb-2">
                                            <div class="card-content p-0">
                                                <h5 class="h5Round">
                                                    <span id="Span5" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Material Dispatch Status</span>
                                                    <asp:DropDownList ID="drpSalesOrderStatus" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpSalesOrderStatus_SelectedIndexChanged">
                                                        <asp:ListItem Text="Summary" Value="summary" />
                                                        <asp:ListItem Text="Detail" Value="Detail" />
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="drpSalesStatusType" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpSalesOrderStatus_SelectedIndexChanged">
                                                        <asp:ListItem Text="-- All --" Value="" />
                                                        <asp:ListItem Text="Pending" Value="Pending" />
                                                        <asp:ListItem Text="Complete" Value="Complete" />
                                                        <asp:ListItem Text="Access" Value="Access" />
                                                    </asp:DropDownList>
                                                    <asp:ImageButton ID="btnExportDispatch" runat="server" ClientIDMode="Static" CssClass="btn-floating float-right ml-1 mr-1 tooltipped" AlternateText="Export" data-tooltip="Export To Excel" ImageAlign="left" ImageUrl="images/buttons/export2excel.png" OnClick="btnExportDispatch_Click" Height="35px" Width="35px" Style="z-index: 0;" />
                                                </h5>
                                                <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                                    <uc1:myMaterialStatus runat="server" ID="mySalesOrderStatus" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="drpPurcOrderStatus" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="drpPurcStatusType" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="drpSalesOrderStatus" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="drpSalesStatusType" EventName="SelectedIndexChanged" />
                                <asp:PostBackTrigger ControlID="btnExportRequest" />
                                <asp:PostBackTrigger ControlID="btnExportDispatch" />
                                
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="row">
                            <div class="col m6" style="padding-right: 5px;">
                                <div class="card user-statistics-card cardRound mb-2">
                                    <div class="card-content p-0">
                                        <h5 class="h5Round">
                                            <span id="spnLedgerRec" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Alert : Minimum Stock Level</span>
                                            <asp:DropDownList ID="drpLocation1" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpLocation1_SelectedIndexChanged">
                                            </asp:DropDownList>                                        
                                        </h5>
                                        <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                            <% if (hdnLocationStockWisePosting.Value == "yes")
                                                { %>                                            
                                                <uc1:myLocationWiseMinStockLevel runat="server" ID="myLocationWiseMinStockLevel" />
                                            <% } %>  
                                            <% else
                                                { %>                                            
                                                <uc1:myMinStockLevel runat="server" ID="myMinStockLevel" />
                                            <% } %>                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col m6" style="padding-right: 5px;">
                                <div class="card user-statistics-card cardRound mb-2">
                                    <div class="card-content p-0">
                                        <h5 class="h5Round">
                                            <span id="Span3" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Location-Product Stock</span>
                                            <asp:DropDownList ID="drpLocationCategory" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpLocation_SelectedIndexChanged">
                                                <asp:ListItem Text="Summary" Value="summary" />
                                                <asp:ListItem Text="Detail" Value="Detail" />
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="drpLocation" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpLocation_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </h5>
                                        <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                            <uc1:myLocationProductStock runat="server" id="myLocationProductStock" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col m12" style="padding-right: 5px;">
                                <div class="card user-statistics-card cardRound mb-2">
                                    <div class="card-content p-0">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <h5 class="h5Round">
                                                <span id="Span6" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Assembly Stock</span>
                                                <asp:DropDownList ID="drpAssemblyOrder" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpAssemblyStatus_SelectedIndexChanged" style="width:200px;"></asp:DropDownList>
                                                <asp:DropDownList ID="drpAssemblyStatus" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpAssemblyStatus_SelectedIndexChanged">
                                                    <asp:ListItem Text="-- All --" Value="" />
                                                    <asp:ListItem Text="Negative Stock" Value="Negative" />
                                                </asp:DropDownList>
                                            </h5>
                                            <div style="width: 100%; min-height: 400px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                                <uc1:myAssemblyStock runat="server" id="myAssemblyStock" />
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="drpAssemblyOrder" EventName="SelectedIndexChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="drpAssemblyStatus" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col m12" style="padding-right: 5px;">
                                <div class="card user-statistics-card cardRound mb-2">
                                    <div class="card-content p-0">
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                        <h5 class="h5Round">
                                            <span id="Span7" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Assembly Stock Product Wise</span>
                                            <asp:TextBox ID="txtQuantity" CssClass="float-right OnlyNumeric" ClientIDMode="Static" runat="server" PlaceHolder="Quantity" Style="Width:100px; background-color:#f9e3b1;" AutoPostBack="true" OnTextChanged="txtQuantity_TextChanged"></asp:TextBox>
                                            <asp:DropDownList ID="drpProduct" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpAssemblyStatus1_SelectedIndexChanged" style="width:200px;"></asp:DropDownList>
                                            <asp:DropDownList ID="drpAssemblyStatus1" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpAssemblyStatus1_SelectedIndexChanged">
                                                <asp:ListItem Text="-- All --" Value="" />
                                                <asp:ListItem Text="Negative Stock" Value="Negative" />
                                            </asp:DropDownList>
                                            <asp:ImageButton ID="btnExportAssemblyStkProductwise" runat="server" ClientIDMode="Static" CssClass="btn-floating float-right ml-1 mr-1 tooltipped" AlternateText="Export" data-tooltip="Export To Excel" ImageAlign="left" ImageUrl="images/buttons/export2excel.png" OnClick="btnExportAssemblyStkProductwise_Click" Height="35px" Width="35px" Style="z-index: 0;" />
                                        </h5>
                                        <div style="width: 100%; min-height: 400px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                            <uc1:myAssemblyStockProductWise runat="server" id="myAssemblyStockProductWise" />
                                        </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="drpProduct" EventName="SelectedIndexChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="drpAssemblyStatus1" EventName="SelectedIndexChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="txtQuantity" EventName="TextChanged" />
                                        </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col m6" style="padding-right: 5px;">
                                        <div class="card user-statistics-card cardRound mb-2">
                                            <div class="card-content p-0">
                                                <h5 class="h5Round">
                                                    <span id="Span1" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Job Card Status</span>
                                                    <asp:DropDownList ID="drpJobCardStatus" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpJobCardStatus_SelectedIndexChanged">
                                                        <asp:ListItem Text="Summary" Value="summary" />
                                                        <asp:ListItem Text="Detail" Value="Detail" />
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="drpJobCardStatusType" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpJobCardStatusType_SelectedIndexChanged">
                                                        <asp:ListItem Text="-- All --" Value="" />
                                                        <asp:ListItem Text="Pending" Value="Pending" />
                                                        <asp:ListItem Text="Complete" Value="Complete" />
                                                        <asp:ListItem Text="Access" Value="Access" />
                                                    </asp:DropDownList>
                                                </h5>
                                                <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                                    <uc1:myJobCardStatus runat="server" ID="myJobCardStatus" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col m6" style="padding-right: 5px;">
                                        <div class="card user-statistics-card cardRound mb-2">
                                            <div class="card-content p-0">
                                                <h5 class="h5Round">
                                                    <span id="Span11" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Repairing Material Status</span>
                                                    <asp:DropDownList ID="drpStatus" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpStatus_SelectedIndexChanged">
                                                        <asp:ListItem Text="Summary" Value="Summary" />
                                                        <asp:ListItem Text="Detail" Value="Detail" />
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="drpStatus2" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpStatus2_SelectedIndexChanged">
                                                        <asp:ListItem Text="-- All --" Value="" />
                                                        <asp:ListItem Text="Pending" Value="Pending" />
                                                        <asp:ListItem Text="Complete" Value="Complete" />
                                                        <asp:ListItem Text="Access" Value="Access" />
                                                    </asp:DropDownList>
                                                </h5>
                                                <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                                    <uc1:myRepairingSummary runat="server" ID="myRepairingSummary" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="drpJobCardStatus" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="drpJobCardStatusType" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="drpStatus" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="drpStatus2" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>

                        <asp:UpdatePanel ID="updMaterialIndent" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col m6" style="padding-right: 5px;">
                                        <div class="card user-statistics-card cardRound mb-2">
                                            <div class="card-content p-0">
                                                <h5 class="h5Round">
                                                    <span id="Span8" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Material Indent Status</span>
                                                    <asp:DropDownList ID="drpApprovalIndent" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpApprovalIndent_SelectedIndexChanged">
                                                        <asp:ListItem Text="-- All --" Value="" />
                                                        <asp:ListItem Text="Pending" Value="Pending" />
                                                        <asp:ListItem Text="Complete" Value="Complete" />
                                                        <asp:ListItem Text="Cancelled" Value="Cancelled" />
                                                    </asp:DropDownList>
                                                </h5>
                                                <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                                    <uc1:myMaterialIndent runat="server" ID="myMaterialIndent" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col m6" style="padding-right: 5px;">
                                        <div class="card user-statistics-card cardRound mb-2">
                                            <div class="card-content p-0">
                                                <h5 class="h5Round">
                                                    <span id="Span12" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Production Status Against PO</span>
                                                    <asp:DropDownList ID="drpStatusView" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpStatusView_SelectedIndexChanged">
                                                        <asp:ListItem Text="Summary" Value="summary" />
                                                        <asp:ListItem Text="Detail" Value="Detail" />
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="drpStatusView2" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right" AutoPostBack="true" OnSelectedIndexChanged="drpStatusView2_SelectedIndexChanged">
                                                        <asp:ListItem Text="-- All --" Value="" />
                                                        <asp:ListItem Text="Pending" Value="Pending" />
                                                        <asp:ListItem Text="Complete" Value="Complete" />
                                                        <asp:ListItem Text="Access" Value="Access" />
                                                    </asp:DropDownList>
                                                </h5>
                                                <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                                    <uc1:myProductionStatusfromSO runat="server" ID="myProductionStatusfromSO" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="drpApprovalIndent" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="row">
                            <div class="col m6" style="padding-right: 5px;">
                                <div class="card user-statistics-card cardRound mb-2">
                                    <div class="card-content p-0">
                                        <h5 class="h5Round">
                                            <span id="Span9" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Die List</span>
                                        </h5>
                                        <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                            <uc1:myDieList runat="server" id="myDieList" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col m6" style="padding-right: 5px;">
                                <div class="card user-statistics-card cardRound mb-2">
                                    <div class="card-content p-0">
                                        <h5 class="h5Round">
                                            <span id="Span10" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Die List</span>
                                        </h5>
                                        <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                            <uc1:myMoldingFinishedQty runat="server" id="myMoldingFinishedQty" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class="row hide">
                                <!-- Sales Order Approval -->
                                <div class="col m12" style="padding-right: 5px;">
                                    <asp:UpdatePanel ID="updSalesOrder" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="card user-statistics-card cardRound mb-2">
                                                <div class="card-content p-0">
                                                    <a class="material-icons background-round gradient-45deg-red-pink white-text float-left p-0 adddialog" data-position="center" data-tooltip="New Sales Order" href="javascript:openDashboardBox('salesorder', 'add', 0);" style="margin: 8px 0 8px 8px;"><i class="material-icons" style="font-size: 20px; padding: 5px;">add</i></a>
                                                    <h5 class="h5Round">
                                                        <span id="Span13" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Sales Order</span>
                                                        <asp:DropDownList ID="drpApprovalStatus" runat="server" ClientIDMode="Static" class="myDropDownClass select2-theme browser-default mr-2 float-right hide" AutoPostBack="true" OnSelectedIndexChanged="drpApprovalStatus_SelectedIndexChanged">
                                                            <asp:ListItem Text="Pending" Value="Pending" />
                                                            <asp:ListItem Text="On Hold" Value="On Hold" />
                                                            <asp:ListItem Text="Approved" Value="Approved" />
                                                            <asp:ListItem Text="Dispatched" Value="Dispatched" />
                                                            <asp:ListItem Text="Rejected" Value="Rejected" />
                                                        </asp:DropDownList>
                                                    </h5>
                                                    <div style="width: 100%; min-height: 350px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto;">
                                                        <uc1:myOrderApproval runat="server" ID="myOrderApproval" />
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="drpApprovalStatus" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>                                
                            </div>
                    </div>
<%--                </ContentTemplate>
            </asp:UpdatePanel>--%>
            <!-- END: Complaint Section -->

            
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
    <br />
    <br />
    <br />
    <asp:Button ID="Button1" CssClass="hide" runat="server" Text="Fill Form in Popup" />
    <cc1:ModalPopupExtender ID="myModalPopup" BehaviorID="mpe" runat="server" ClientIDMode="Static" PopupControlID="Panl1" TargetControlID="Button1" CancelControlID="Button2" BackgroundCssClass="Background">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" Style="display: none; border-radius: 10px; padding-right: 10px !important;">
        <div id="myModal">
            <div class="modal-header position-sticky gradient-45deg-light-blue-indigo m-0" style="margin-bottom: 10px !important;">
                <h5 class=" z-depth-5" style="font-size: 2rem !important; font-weight: 800; line-height: 50px; margin: 0; text-align: left; padding-left: 15px;">
                    <i class="material-icons prefix">ac_unit</i>
                    <span id="spnModuleHeader" runat="server" clientidmode="static">Manage Module</span>
                    <asp:Button CssClass="btnTopRightCorner float-right" ID="Button2" runat="server" Text="" />
                </h5>
            </div>
        </div>
        <iframe id="ifrModule" src="about:blank" runat="server" clientidmode="static" scrolling="auto" style="border: 1px solid silver; background-color: transparent; width: 100%; height: 85%; padding: 5px;"></iframe>
        <br />
    </asp:Panel>
</asp:Content>
