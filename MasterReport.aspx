<%@ Page Title="" Language="C#" MasterPageFile="~/StarsSite.Master" AutoEventWireup="true" CodeBehind="MasterReport.aspx.cs" Inherits="StarsProject.MasterReport" culture="en-US" EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="plugins/jquery/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/animate-css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/data-tables/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/data-tables/extensions/responsive/css/responsive.dataTables.min.css"/>

    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css"/>--%>



    <style type="text/css">
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
        .popover {
            left: 225px !important;
            top: 6px;
            min-width: 600px;
        }
        .popover .arrow {
            left: 6px !important;
        }
        .depth {
            overflow: scroll;
            /*height: 450px;*/
            width: 1112px;
            z-index: 0;
        }
          .cssrpt {
            width: auto;
            /*height: auto;*/
            padding: 1px;
            border: 1px solid black;
        }

        .color {
            background-color: blueviolet;
        }

        .center-model {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        .divbox {
            padding: 5px;
            margin: 2px;
            word-wrap: break-word;
        }

        .divborder {
            border: 0px solid #bdbbbb;
            border-radius: 3px 4px;
        }
        
        #CrystalReportViewer1_toptoolbar {height:auto;}
        td, th {
            display: inline-table;
        }

         [type='checkbox']:not(:checked), [type='checkbox']:checked { position: none; opacity: 1; margin-right: 10px; margin-top: 5px; pointer-events:all;}

        .mychklist label { margin-left: 15px;}
    </style>
    <script type="text/javascript">

        //$(function () {
        //    $("#txtFromDate").datepicker({ dateFormat: "dd-mm-yyyy" });
        //});

        $(document).ready(function () {
            // For Fixing Report Bug Issue
            $('.sidenav').sidenav();
        });


        function ShowPopup() {
            $("#btnShowPopup").click();
        }
        function CallSelectedIndexChanged() {
            __doPostBack("<%=drpEmployee.UniqueID %>", "");
        }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hdnCustomerID" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnSerialKey" runat="server" ClientIDMode="Static" />
    <div id="contentwrapper" class="contentwrapper">

        <div class="row" id="divReportTitle" runat="server" clientidmode="Static">
            <div class="col m12">
                <div class="row" style="background: linear-gradient(45deg, silver, #7f88ec6e); color: Navy;">
                    <div class="col m4">
                        <asp:Label ID="lblReportTitle" class="form-control" runat="server" ReadOnly="true" Style="width: 100%; border: none; text-align: right; font-weight: 400; font-size: x-large;" />
                    </div>
                    <div class="col m8">
                        <div class="row">
                            <div class="input-field col m12 float-right" style="margin-top: 0.5rem;">
                                <a id="report-content" class="profile-button float-right" href="javascript:void(0);" style="margin-top: 0.5rem;" title="Filter Data">
                                    <i class="material-icons left">blur_on</i>
                                </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <button ID="btnSearch" type="button" runat="server" clientidmode="Static" text="Load Report" class="btn cyan right mr-1" onserverclick="btnShow_Click" tabindex="12"><i class="material-icons left">search</i>Show Report</button>
                            </div>
                        </div>

                        <div class="row dropdown-content-report hide" id="profile-dropdown-report" style="background: linear-gradient(45deg, silver, #f9e3b1); left:0px !important; min-width:80% !important;">
                            <form action="#" class="form-inline" role="form" style="width: 400px;">
                                <div class="input-field col m12">
                                    
                                    <div id="divSelection" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="txtAsOnDate">Date</label>
                                            <asp:TextBox ID="txtAsOnDate" runat="server" CssClass="form-control" ClientIDMode="Static" placeholder="" TabIndex="1" TextMode="Date" />
                                        </div>
                                    </div>
                                    
                                    <div id="divMonthYear" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m3">
                                            <label class="active" for="drpMonth">Month</label>
                                            <asp:DropDownList ID="drpMonth" runat="server" CssClass="select2-theme browser-default" TabIndex="3">
                                                <asp:ListItem Text="-----Select------" Value="0" Selected="True" />
                                                <asp:ListItem Text="January" Value="1" />
                                                <asp:ListItem Text="February" Value="2" />
                                                <asp:ListItem Text="March" Value="3" />
                                                <asp:ListItem Text="April" Value="4" />
                                                <asp:ListItem Text="May" Value="5" />
                                                <asp:ListItem Text="June" Value="6" />
                                                <asp:ListItem Text="July" Value="7" />
                                                <asp:ListItem Text="August" Value="8" />
                                                <asp:ListItem Text="September" Value="9" />
                                                <asp:ListItem Text="October" Value="10" />
                                                <asp:ListItem Text="November" Value="11" />
                                                <asp:ListItem Text="December" Value="12" />
                                            </asp:DropDownList>
                                        </div>
                                


                                    </div>
                                    </div>
                                    <div id="divYear" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m3">
                                            <label class="active" for="drpYear">Year</label>
                                            <asp:DropDownList ID="drpYear" runat="server" CssClass="select2-theme browser-default" TabIndex="3">
                                                <asp:ListItem Text="-----Select------" Value="0" Selected="True" />
                                                <asp:ListItem Text="2019" Value="2019" />
                                                <asp:ListItem Text="2020" Value="2020" />
                                                <asp:ListItem Text="2021" Value="2021" />
                                                <asp:ListItem Text="2022" Value="2022" />
                                                <asp:ListItem Text="2023" Value="2023" />
                                                <asp:ListItem Text="2024" Value="2024" />
                                                <asp:ListItem Text="2025" Value="2025" />
                                                <asp:ListItem Text="2026" Value="2026" />
                                                <asp:ListItem Text="2027" Value="2027" />
                                                <asp:ListItem Text="2028" Value="2028" />
                                                <asp:ListItem Text="2029" Value="2029" />
                                                <asp:ListItem Text="2030" Value="2030" />
                                                <asp:ListItem Text="2031" Value="2031" />
                                                <asp:ListItem Text="2032" Value="2032" />
                                                <asp:ListItem Text="2033" Value="2033" />
                                                <asp:ListItem Text="2034" Value="2034" />
                                                <asp:ListItem Text="2035" Value="2035" />
                                                <asp:ListItem Text="2036" Value="2036" />
                                                <asp:ListItem Text="2037" Value="2037" />
                                                <asp:ListItem Text="2038" Value="2038" />
                                                <asp:ListItem Text="2039" Value="2039" />
                                                <asp:ListItem Text="2040" Value="2040" />
                                                <asp:ListItem Text="2041" Value="2041" />
                                                <asp:ListItem Text="2042" Value="2042" />
                                                <asp:ListItem Text="2043" Value="2043" />
                                                <asp:ListItem Text="2044" Value="2044" />
                                                <asp:ListItem Text="2045" Value="2045" />
                                                <asp:ListItem Text="2046" Value="2046" />
                                                <asp:ListItem Text="2047" Value="2047" />
                                                <asp:ListItem Text="2048" Value="2048" />
                                                <asp:ListItem Text="2049" Value="2049" />
                                                <asp:ListItem Text="2050" Value="2050" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divBasicPer" class="input-field col m6"  runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpBasic">Basic Per</label>
                                            <asp:DropDownList ID="drpBasic" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                                <asp:ListItem Text="----Selct----" Value="" Selected="True" />
                                                <asp:ListItem Text="Daily" Value="Daily" />
                                                <asp:ListItem Text="Monthly" Value="Monthly" />
                                                <asp:ListItem Text="Hourly" Value="Hourly" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divProjectList" class="input-field col m6"  runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpProjectCategory">Category</label>
                                            <asp:DropDownList ID="drpProjectCategory" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                                <asp:ListItem Text="Quotation" Value="quotationfromprojectname" Selected="True" />
                                                <asp:ListItem Text="PurchaseOrder" Value="purchaseorderfromprojectname" />
                                                <asp:ListItem Text="SalesOrder" Value="salesorderfromprojectname" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divPurchaseAgainstDoc" class="input-field col m6"  runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpPurchaseAgainstDoc">Category</label>
                                            <asp:DropDownList ID="drpPurchaseAgainstDoc" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                                <asp:ListItem Text="PurchaseBill" Value="Order" />
                                                <asp:ListItem Text="Inward" Value="Inward" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divSOAgainstDoc" class="input-field col m6"  runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpSOAgainstDoc">Category</label>
                                            <asp:DropDownList ID="drpSOAgainstDoc" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                                <asp:ListItem Text="SalesBill" Value="Order" />
                                                <asp:ListItem Text="Outward" Value="Outward" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                        <%--<h6 class="card-title padding-1 mb-4 center-align width-100 gradient-45deg-light-blue-indigo">&nbsp;Select & Assign City</h6>--%>
                                    <div id="divListEmp" class="input-field mychklist col m12" runat="server" clientidmode="Static" style="height:200px; overflow-y:auto;" visible="false">
                                        <label class="active" for="chkEmp">Employee</label>
                                        <asp:CheckBoxList ID="chkEmp" runat="server" TabIndex="4">
                                        </asp:CheckBoxList>
                                    </div>
                                   
                                    <div id="divShift" class="input-field col m6" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpShift">Shift</label>
                                            <asp:DropDownList ID="drpShift" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divSO" class="input-field col m6" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpSO">Sales Order</label>
                                            <asp:DropDownList ID="drpSO" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divPendingTextBox" class="input-field col m12" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="txtPendingFrom">Pending From</label>
                                            <asp:TextBox ID="txtPendingFrom" runat="server" CssClass="form-control" ClientIDMode="Static" placeholder="" TabIndex="1"/>
                                        </div>
                                        <div class="input-field col m6">
                                            <label class="active" for="txtPendingTo">Pending To</label>
                                            <asp:TextBox ID="txtPendingTo" runat="server" CssClass="form-control" ClientIDMode="Static" placeholder="" TabIndex="1" />
                                        </div>
                                    </div>
                                    <div id="divBasedCountry" class="input-field col m12" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpBasedCountry">Based on Country</label>
                                            <asp:DropDownList ID="drpBasedCountry" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                                <asp:ListItem Text ="---Select Country" Value ="" Selected ="True" />
                                                <asp:ListItem Text ="India" Value="IND" />
                                                <asp:ListItem Text="Other Than India" Value="NotIND" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divDateDropdown" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpDatedurationOn">Date Duration On</label>
                                            <asp:DropDownList ID="drpDatedurationOn" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="11">
                                                <asp:ListItem Text="Lead Added" Value="1" Selected="True" />
                                                <asp:ListItem Text="Lead Set To Assigned" Value="2" />
                                            </asp:DropDownList>
                                        </div>

                                    </div>

                                    <div id="divInqTele" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpInqTele">Report Based On</label>
                                            <asp:DropDownList ID="drpInqTele" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="11">
                                                <asp:ListItem Text="Both" Value="both" Selected="True" />
                                                <asp:ListItem Text="Telecaller" Value="telecaller"/>
                                                <asp:ListItem Text="Inquiry" Value="inquiry" />
                                                <asp:ListItem Text="Last Followup" Value="lastfollowup" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                  <div id="divTodoStatus" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m2">
                                            <label class="active" for="drpTodoStatus">Status</label>
                                            <asp:DropDownList ID="drpTodoStatus" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="11">
                                            </asp:DropDownList>
                                        </div>
                                      </div>
                                    <div id="divQtyAmt" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpQtyAmt">Report Based On</label>
                                            <asp:DropDownList ID="drpQtyAmt" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                                <asp:ListItem Text="Qty" Value="1" Selected="True" />
                                                <asp:ListItem Text="Gross Amt" Value="2" />
                                                <asp:ListItem Text="Net Amt" Value="3" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divFixedLedger" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpFixedLedger">Select A/c</label>
                                            <asp:DropDownList ID="drpFixedLedger" runat="server" CssClass="select2-theme browser-default" TabIndex="3"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divDurationSelection" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="txtFromDate">Period Start</label>
                                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" ClientIDMode="Static" placeholder="" TabIndex="1" TextMode="Date"/>
                                        </div>
                                        <div class="input-field col m6">
                                            <label class="active" for="txtToDate">Period End</label>
                                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" ClientIDMode="Static" placeholder="" TabIndex="2" TextMode="Date" />
                                        </div>
                                    </div>
                                    <div id="divEmployee" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpEmployee">Employee Name</label>
                                            <asp:DropDownList ID="drpEmployee" runat="server" CssClass="select2-theme browser-default" TabIndex="3"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divUser" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpUsersName">User Name</label>
                                            <asp:DropDownList ID="drpUsersName" runat="server" CssClass="select2-theme browser-default" TabIndex="3"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divVehiclelist" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpVehicleList">Vehicle List</label>
                                            <asp:DropDownList ID="drpVehicleList" runat="server" CssClass="select2-theme browser-default" TabIndex="3"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divFollowUpCust" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="txtCustomerName">Customer Name</label>
                                            <asp:TextBox ID="txtCustomerName" runat="server" ClientIDMode="Static" class="form-control" placeholder="" AutoPostBack="true" onKeyup="bindDDLTo('#txtCustomerName');" TabIndex="4" MaxLength="50" />
                                        </div>
                                    </div>
                                    <div id="divInquiry" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpInquiryStatus">Inquiry Status</label>
                                            <asp:DropDownList ID="drpInquiryStatus" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="5" />
                                        </div>
                                        <div class="input-field col m6">
                                            <label class="active" for="drpInquirySource">Source Of Inquiry</label>
                                            <asp:DropDownList ID="drpInquirySource" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="6"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divProduct" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpBrand">Product Brand</label>
                                            <asp:DropDownList ID="drpBrand" runat="server" class="select2-theme browser-default" TabIndex="7" />
                                        </div>
                                        <div class="input-field col m6">
                                            <label class="active" for="drpProductGroup">Product Group</label>
                                            <asp:DropDownList ID="drpProductGroup" runat="server" class="select2-theme browser-default" TabIndex="8" />
                                        </div>
                                    </div>
                                    <div id="divProductGroup" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpProductGroup1">Product Group</label>
                                            <asp:DropDownList ID="drpProductGroup1" runat="server" class="select2-theme browser-default" TabIndex="8" />
                                        </div>
                                    </div>
                                     <div id="divSize" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpSize">SizeName</label>
                                            <asp:DropDownList ID="drpSize" runat="server" class="select2-theme browser-default" TabIndex="8" />
                                        </div>
                                    </div>
                                    <div id="divIndustry" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpIndustry">Industry</label>
                                            <asp:DropDownList ID="drpIndustry" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="4"></asp:DropDownList>
                                        </div>
                                        <div class="input-field col m6">
                                            <label class="active" for="drpCustomerSource">Source</label>
                                            <asp:DropDownList ID="drpCustomerSource" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="4"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divInqPriority" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m4">
                                            <label class="active" for="drpInqPriority">Lead Priority</label>
                                            <asp:DropDownList ID="drpInqPriority" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="4">
                                                <asp:ListItem Text="--All--" Value=" " />
                                                <asp:ListItem Text="Low" Value="Low" />
                                                <asp:ListItem Text="Medium" Value="Medium" />
                                                <asp:ListItem Text="High" Value="High" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divCustomer" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpCustomer">Cutomer Name</label>
                                            <asp:DropDownList ID="drpCustomer" runat="server" CssClass="select2-theme browser-default" TabIndex="3" AutoPostBack="true" OnSelectedIndexChanged="drpCustomer_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divProducts" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpProducts">Product Name</label>
                                            <asp:DropDownList ID="drpProducts" runat="server" CssClass="select2-theme browser-default" TabIndex="3"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divCustomerList" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpStatus">Status</label>
                                            <asp:DropDownList ID="drpStatus" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="9">
                                                <asp:ListItem Text="--All--" Value=" " />
                                                <asp:ListItem Text="Active" Value="Active" />
                                                <asp:ListItem Text="Inactive" Value="Inactive" />
                                            </asp:DropDownList>
                                        </div>
                                        <div class="input-field col m6">
                                            <label class="active" for="drpCustomerType">Category</label>
                                            <asp:DropDownList ID="drpCustomerType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="10">
                                                <%--<asp:ListItem Text="--All--" Value=" " />
                                                <asp:ListItem Text="C A" Value="C A" />
                                                <asp:ListItem Text="End Customer" Value="End Customer" />
                                                <asp:ListItem Text="FIXED LEDGER" Value="FIXED LEDGER"></asp:ListItem>
                                                <asp:ListItem Text="Reseller" Value="Reseller"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divCategory" class="row" runat="server" clientidmode="Static" visible="false">
                                    <div class="input-field col m6">
                                            <label class="active" for="drpCategory">Category</label>
                                            <asp:DropDownList ID="drpCategory" runat="server" CssClass="select2-theme browser-default" TabIndex="10"></asp:DropDownList>    
                                            
                                        </div>
                                    </div>
                                    <div id="divCreditors" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpStatus">Select Credit Option</label>
                                            <asp:DropDownList ID="drpCreditOption" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="9">
                                                <asp:ListItem Text="--All--" Value="5" />
                                                <asp:ListItem Text="Fulfilled Credit" Value="2" />
                                                <asp:ListItem Text="Remaining Credit" Value="1" />
                                                <asp:ListItem Text="Empty Credit" Value="0" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divLeadStatus1" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpLeadStatus1">Lead Status</label>
                                            <asp:DropDownList ID="drpLeadStatus1" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="11">
                                                <asp:ListItem Text="--All--" Value="0" />
                                                <asp:ListItem Text="Disqualified" Value="Disqualified" />
                                                <asp:ListItem Text="Qualified" Value="Qualified" />
                                                <asp:ListItem Text="In-Process" Value="InProcess" />
                                            </asp:DropDownList>
                                        </div>
                                        <div class="input-field col m6">
                                            <label class="active" for="drpDisqulifiedReason">Reason</label>
                                            <asp:DropDownList ID="drpDisqulifiedReason" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divLeadStatus" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpLeadStatus">Lead Status</label>
                                            <asp:DropDownList ID="drpLeadStatus" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="11">
                                                <asp:ListItem Text="--All--" Value="0" />
                                                <asp:ListItem Text="Disqualified" Value="Disqualified" />
                                                <asp:ListItem Text="Qualified" Value="Qualified" />
                                                <asp:ListItem Text="In-Process" Value="In-Process" />
                                            </asp:DropDownList>
                                        </div>
                                        <%--<div class="input-field col m6">
                                            <label class="active" for="drpDisqulifiedReason">Reason</label>
                                            <asp:DropDownList ID="drpDisqulifiedReason" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                            </asp:DropDownList>
                                        </div>--%>
                                    </div>
                                    <div id="divCustomerLedger" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpTransactionType">Transaction Type</label>
                                            <asp:DropDownList ID="drpTransactionType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="14">
                                                <asp:ListItem Text="-- Transaction Type --" Value="" />
                                                <asp:ListItem Text="Payable" Value="Payable" />
                                                <asp:ListItem Text="Receivable" Value="Receivable" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divLeaveStatus" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpLeadStatus">Leave Status</label>
                                            <asp:DropDownList ID="drpLeaveStatus" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="15">
                                                <asp:ListItem Text="--All--" Value=" " />
                                                <asp:ListItem Text="Approved" Value="Approved" />
                                                <asp:ListItem Text="Pending" Value="Pending" />
                                                <asp:ListItem Text="Rejected" Value="Rejected" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divTodo" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6" id="divdrptodoStatus" runat="server">
                                            <label class="active" for="drpTodo">Status</label>
                                            <asp:DropDownList ID="drpTodo" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="16">
                                                <asp:ListItem Text="--All--" Value=" " Selected="True" />
                                                <asp:ListItem Text="Pending" Value="Pending" />
                                                <asp:ListItem Text="Completed" Value="Completed" />
                                                <asp:ListItem Text="Completed-OverDue" Value="Completed-OverDue" />
                                                <asp:ListItem Text="Overdue" Value="Overdue" />
                                            </asp:DropDownList>
                                        </div>
                                        <div class="input-field col m6" id="divAssignTo" visible="false" runat="server">
                                            <label class="active" for="drpAssignToEmployee">Assign To</label>
                                            <asp:DropDownList ID="drpAssignToEmployee" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="17"></asp:DropDownList>
                                        </div>

                                        <div class="input-field col m6" id="divCompliantStatus" runat="server">
                                            <label class="active" for="drpComplaintStatus">Complaint Status</label>
                                            <asp:DropDownList ID="drpComplaintStatus" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="13">
                                                <%--<asp:ListItem Text="--All--" Value=" " Selected="True" />
                                                <asp:ListItem Text="Open" Value="Open" />
                                                <asp:ListItem Text="Close" Value="Close" />--%>
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                    <div id="divInsType" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpInsType">Inspection Type</label>
                                            <asp:DropDownList ID="drpInsType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                                 <asp:ListItem Text="---Select Trans Type---" Selected="True"  />
                                                <asp:ListItem Text="Installation" Value="IN"  />
                                                <asp:ListItem Text="Fabrication" Value="OUT"/>
                                               
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div id="divCompstatus" runat="server" visible="false" clientidmode="Static">
                                        <div class ="input-field col m12">
                                            <label class="active" for="drpCompstatus">Complaint Status</label>
                                            <asp:DropDownList ID="drpCompstatus" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="13">
                                                <asp:ListItem Text="--All--" Value=" " Selected="True" />
                                                <asp:ListItem Text="Open" Value="Open" />
                                                <asp:ListItem Text="Close" Value="Close" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divPriority" runat="server" visible="false" clientidmode="Static">
                                        <div class ="input-field col m12">
                                            <label class="active" for="drpPriority">Priority</label>
                                            <asp:DropDownList ID="drpPriority" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="13">
                                                <%--<asp:ListItem Text="Todays" Value="Todays" Selected="True" />--%>
                                                <asp:ListItem Text="Todays" Value="Todays" />
                                                <asp:ListItem Text="Pending" Value="Pending" />
                                                <asp:ListItem Text="Future" Value="Future" />
                                                <asp:ListItem Text="Completed" Value="Completed" />
                                                <asp:ListItem Text="Pending-OverDue" Value="Pending-OverDue" />
                                                <asp:ListItem Text="Completed-OverDue" Value="Completed-OverDue" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divPriority1" runat="server" visible="false" clientidmode="Static">
                                        <div class ="input-field col m12">
                                            <label class="active" for="drpPriority1">Priority</label>
                                            <asp:DropDownList ID="drpPriority1" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="13">
                                                <%--<asp:ListItem Text="Todays" Value="Todays" Selected="True" />--%>
                                                <asp:ListItem Text="--Select--" Value="0" selected="True"/>
                                                <asp:ListItem Text="High" Value="1" />
                                                <asp:ListItem Text="Medium" Value="2" />
                                                <asp:ListItem Text="Low" Value="3" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divFollowupStatus" runat="server" visible="false" clientidmode="Static">
                                        <div class ="input-field col m12">
                                            <label class="active" for="drpFollowupStatus">Followup Status</label>
                                            <asp:DropDownList ID="drpFollowupStatus" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="13">
                                                <%--<asp:ListItem Text="Todays" Value="Todays" Selected="True" />--%>
                                                <asp:ListItem Text="--Select--" Value="0" selected="True"/>
                                                <asp:ListItem Text="Today's" Value="todays" />
                                                <asp:ListItem Text="Missed" Value="missed" />
                                                <asp:ListItem Text="Future" Value="Future" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divExpenseType" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpExpenseType">Expense Type</label>
                                            <asp:DropDownList ID="drpExpenseType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="18">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divTaskCategory" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpTaskCategory">Task Category</label>
                                            <asp:DropDownList ID="drpTaskCategory" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="19">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <div id="divStateCity" runat="server" clientidmode="Static" class="row" visible="false">
                                                <%if (hdnReportName.Value.ToLower() != "salesorderdetail" || hdnReportName.Value.ToLower() != "reportcustomerlist")
                                                {%>
                                                <div id="divCountry" runat="server" clientidmode="Static" class="row" visible="false">                                                
                                                    <div  class="input-field col m4 ml-1">
                                                        <label class="active" for="drpCountry">Country</label>
                                                        <asp:DropDownList ID="drpCountry" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="20" AutoPostBack="true" OnSelectedIndexChanged="drpCountry_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%}%>
                                        <div class="input-field col m4">
                                            <label class="active" for="drpState">State</label>
                                            <asp:DropDownList ID="drpState" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="20" AutoPostBack="true" OnSelectedIndexChanged="drpState_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="input-field col m4">
                                            <label class="active" for="drpCity">City</label>
                                            <asp:DropDownList ID="drpCity" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="21">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <%--<asp:PostBackTrigger ControlID="drpCountry" />
                                            <asp:PostBackTrigger ControlID="drpState" />--%>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    
                                    <div id="divApprovalStatus" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpApprovalStatus">Approval Status</label>
                                            <asp:DropDownList ID="drpApprovalStatus" runat="server" ClientIDMode="Static" class="select2-theme browser-default" TabIndex="21">
                                                <asp:ListItem Text="--All--" Value="0" />
                                                <asp:ListItem Text="Pending" Value="Pending" />
                                                <asp:ListItem Text="On Hold" Value="On Hold" />
                                                <asp:ListItem Text="Approved" Value="Approved" />
                                                <asp:ListItem Text="Dispatched" Value="Dispatched" />
                                                <asp:ListItem Text="Rejected" Value="Rejected" />
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                    <div id="divProjectName" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpProject">Project Name</label>
                                            <asp:DropDownList ID="drpProject" runat="server" ClientIDMode="Static" class="select2-theme browser-default" TabIndex="21">
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                    <div id="divTransType" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpTransType">Transaction Type</label>
                                            <asp:DropDownList ID="drpTransType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                                 
                                                <asp:ListItem Text="Inward" Value="IN"  />
                                                <asp:ListItem Text="Outward" Value="OUT"/>
                                            </asp:DropDownList>
                                        </div>
                                        </div>

                                    <div id="divEmployeeDate" class="input-field col m6"  runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpEmployeeDate">Group By</label>
                                            <asp:DropDownList ID="drpEmployeeDate" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                                <asp:ListItem Text="Employee" Value="Employee" Selected="True" />
                                                <asp:ListItem Text="Date" Value="Date" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                     <div id="divAttendenceType" class="input-field col m6"  runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpEmployeeDate">Select The type</label>
                                            <asp:DropDownList ID="drpAttendenceType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="12">
                                                <asp:ListItem Text="---Select Type---" Value="0" Selected="True" />
                                                <asp:ListItem Text="Type 1" Value="1"/>
                                                <asp:ListItem Text="Type 2" Value="2" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divLocation" runat="server" clientidmode="Static" class="row" visible="false">
                                        <div class="input-field col m12">
                                            <label class="active" for="drpLocation">Location Name</label>
                                            <asp:DropDownList ID="drpLocation" runat="server" CssClass="select2-theme browser-default" TabIndex="3"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div id="divFollowupType" class="row" runat="server" clientidmode="Static" visible="false">
                                        <div class="input-field col m6">
                                            <label class="active" for="drpDatedurationOn">FollowUp Type</label>
                                            <asp:DropDownList ID="drpFollowupType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="1"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="padding-top: 10px">
            <div class="col m12">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" HasToggleGroupTreeButton="False" HasPrintButton="true" HasPageNavigationButtons="True" DisplayToolbar="True" ToolPanelView="None" SeparatePages="True" Width="100%" BestFitPage="false" CssClass="depth" HasExportButton="True" HasDrillUpButton="False" HasCrystalLogo="False" PrintMode="Pdf" EnableParameterPrompt="false" EnableDrillDown="False" HasDrilldownTabs="False" />
            </div>
        </div>
        <br />
        <div id="rptviewer" runat="server" clientidmode="Static" style="background-color: white; width: 100%; min-height: 500px; overflow-y: auto;">
            <rsweb:ReportViewer ID="myViewer" runat="server" Font-Names="Verdana" Font-Size="8pt"
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
                ShowRefreshButton="true" SizeToReportContent="true" ShowPrintButton="true"
                ShowPageNavigationControls="true" ShowReportBody="true" ShowZoomControl="true"
                ZoomMode="Percent">
                <LocalReport>
                    <DataSources>
                        <rsweb:ReportDataSource />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>

        </div>
        <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalpopup">
            button click event for model
        </button>

        <div class="modal fade" id="myModalpopup" data-keyboard="false" data-backdrop="static" role="dialog">
            <div class="modal-dialog  modal-dialog-centered">
                <div class="modal-content" style="border-top: solid 7px #e74c3c;">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="row">
                            <div class="col m12">
                                <div>
                                    <asp:Label ID="lblModelHeading" runat="server" Text="Label" Font-Size="Larger" Style="font-weight: 500"></asp:Label>
                                </div>
                                <hr />
                                <div class="divbox divborder">
                                    <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div style="float: right">
                                    <asp:Button ID="btnCloseError" runat="server" Text="Close" class="btn btn-danger btn-sm" data-dismiss="modal" OnClick="btnCloseError_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hdnReportName" runat="server" Value="" />
        </div>

        <script type="text/javascript">
            // -----------------------------------------------------
            // Report Filter Content Popup
            // -----------------------------------------------------
            (function () {
                jQuery('#report-content').click(function () {
                    if ($("#profile-dropdown-report").hasClass("hide"))
                        return jQuery('#profile-dropdown-report').removeClass('hide');
                    else
                        return jQuery('#profile-dropdown-report').addClass('hide');
                });
            }.call(this));
            // -----------------------------------------------------
            function bindDDLTo(selector) {
                var link;
                if (jQuery('#hdnSerialKey').val() == 'BLUE-CHEM-56JK-BC88')
                    link = 'InquiryInfo.aspx/FilterCustomerByEmployee'
                else
                    link = 'InquiryInfo.aspx/FilterCustomerByModule'
                var value = '<%= Session["LoginUserID"] %>';
                if (jQuery(selector).val().length >= 1) {
                    jQuery.ajax({
                        type: "POST",
                        url: link,
                        data: '{pCustName:\'' + $(selector).val() + '\', pSearchModule:\'CustomerSearchAll\'}',
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log(data);
                            var sample = JSON.parse(data.d);
                            $(selector).autoComplete({
                                minLength: 1,
                                source: function (term, suggest) {
                                    term = term.toLowerCase();
                                    var choices = sample;
                                    suggest(choices);
                                },
                                renderItem: function (item, search) {
                                    jQuery(".autocomplete-suggestion").remove();
                                    return '<div class="autocomplete-suggestion" data-langname="' + item.CustomerID + '" data-lang="' + item.CustomerName + '" data-val="' + search + '">' + item.CustomerName + '</div>';
                                },
                                onSelect: function (e, term, item) {
                                    //console.log('Item "' + item.data('langname') + ' (' + item.data('lang') + ')" selected by ' + (e.type == 'keydown' ? 'pressing enter or tab' : 'mouse click') + '.');
                                    $ery(selector).val(item.html());
                                    $("#hdnCustomerID").val(item.data('langname'));
                                    $("#drpInquiryStatus").focus();
                                }
                            });

                        },
                        error: function (r) { alert('Error : ' + r.responseText); },
                        failure: function (r) { alert('failure'); }
                    });
                    
                }
                else {
                    if ($(selector).val().length == 0) {
                        $("#hdnCustomerID").val('');
                    }
                }
            }

            //$(document).ready(function () {
            //    $("[data-toggle=popover]").popover({
            //        html: true,
            //        content: function () {
            //            var stri = $('#popover-content').html();
            //            return stri;
            //        }
            //    }).on('hide.bs.popover', function () {
            //        $(".popover-body .form-control").each(function (idx, ele) {
            //            $(".form-control#" + ele.id).val(ele.value).trigger("change");
            //            $(".form-control#" + ele.id).find("option[value='" + ele.value + "']").attr("selected", true);
            //        });
            //    }).on("shown.bs.popover", function () {
            //        $(".popover-body .form-control").each(function (idx, ele) {
            //            if ($(".form-control#" + ele.id)[0].value !== $(".form-control#" + ele.id)[1].value) {
            //                $(".form-control#" + ele.id)[1].value = $(".form-control#" + ele.id)[0].value;
            //            }
            //        });
            //    });
            //});
        </script>
    </div>
</asp:Content>
