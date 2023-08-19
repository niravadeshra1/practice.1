<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountGroup.aspx.cs" Inherits="StarsProject.AccountGroup" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/form-select2.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/custom/custom.css"/>
    <link rel="stylesheet" href="app-assets/vendors/select2/select2.min.css" type="text/css" />
    <link rel="stylesheet" href="app-assets/vendors/select2/select2-materialize.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/data-tables/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/data-tables/extensions/responsive/css/responsive.dataTables.min.css" />

    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>
    <script type="text/javascript" src="app-assets/vendors/data-tables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="app-assets/vendors/data-tables/extensions/responsive/js/dataTables.responsive.min.js"></script>


    <style type="text/css">
        .myDropDownClass {
            background-color: #fff6e1;
            color: navy;
            font-size: medium;
            width: 250px;
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

        #tblBalance_length { display:none !important;}
        #tblBalance_filter { padding-right:25px; }
        /*#tblBalance_Wrapper { 
            border: 3px ridge silver !important;
            padding: 10px  !important;
            border-radius:8px  !important;
        }
        #tblBalance_paginate { display:none; }
        #tblBalance_info { display:none; }*/

        tr.odd td:first-child,
        tr.even td:first-child {
            padding-left: 4em;
        }
        /* --------------------------------------------- */
        .trHead { 
            background-color: navy;
            box-shadow: 0 0 8px 0 #3f51b5;
            color: white;
            font-size: 18px;
        }
        .trSumm { 
            background-color: beige;
            box-shadow: 0 0 8px 0 #3f51b5;
            color: navy;
            font-size: 18px;
        }
        .trTrial { 
            background-color: white;
            box-shadow: 0 0 8px 0 #3f51b5;
            color: black;
            font-size: 14px;
        }
        /* --------------------------------------------- */
        .tdSide { 
            background-color: #3f51b5;
            box-shadow: 0 0 8px 0 #3f51b5;
            color: white;
            font-size: 24px;
        }
        .trLevel1 {
            background-color: lightblue;
            color: Navy; 
            font-size: 18px;
        }

        .trLevel2 {
            background-color: white;
            color: navy; 
            font-size: 16px;
        }
        .padLevel2 { padding-left:30px; }

        .trLevel3 {
            background-color: white;
            color: black; 
            font-size: 14px;
        }
        .padLevel3 { padding-left:60px; }
    </style>

    <script type="text/javascript">
        function capitalizeString(str) {
            return str.replace(/\w\S*/g, function (txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase(); });
        }

        $(document).ready(function () {
            //$('.datepicker').datepicker({
            //    defaultDate: new Date((new Date()).getFullYear(), (new Date()).getMonth(), (new Date()).getDay()),
            //    format: "dd-mm-yyyy",
            //    minDate: new Date(1990, 12, 31)
            //});
            //$('.timepicker').timepicker();

            //$('.tabs').tabs();
            // -------------------------------------
            //loadLayout();
        });
        function loadLayoutMyWay()
        {
            var dataurl = '/Services/NagrikService.asmx/webAccountGroupFollowerList?pkID=0&AccType=BAL&AccSide=';
            jQuery.ajax({
                url: dataurl, type: "get",
                success: function (data) {
                    var resultdata1 = JSON.parse(data.getElementsByTagName("string")[0].innerHTML);
                    var tmpID1 = 0, tmpHead1 = "";
                    var tmpID2 = 0, tmpHead2 = "";
                    var tmpID3 = 0, tmpHead3 = "";
                    var tmpID4 = 0, tmpHead4 = "";
                    $.each(resultdata1, function (key, value) {
                        tmpID1 = value.pkID;
                        tmpHead1 = value.AccountHead;
                        //alert(tmpHead1)
                        $('#tblBalance').append("<tr><td colspan='3'>" + tmpHead1 + " -- " + value.AccLevel.toString() + "</td></tr>");
                        //$('#tblBalance').append("<tr><td>" + value.ParentAccountHead + "</td><td>" + value.AccountHead + "</td><td>" + value.Closing + "</td></tr>");
                        // -----------------------------------------------------------------------------------------
                        populateChild(tmpID1, tmpHead1);
                        e.preventDefault();
                        
                    })
                }
            });
        }
        function populateChild(pID, pHead, pLevel)
        {
            debugger;
            var resultdata2, innerUrl = "";
            innerUrl = '/Services/NagrikService.asmx/webAccountGroupFollowerList?pkID=' + pID.toString() + '&AccType=BAL&AccSide=';
            //alert(pHead + ' .... ' + innerUrl)
            jQuery.ajax({
                url: innerUrl, type: "get",
                success: function (data) {
                    resultdata2 = JSON.parse(data.getElementsByTagName("string")[0].innerHTML);
                    
                    if (resultdata2 != null && resultdata2.length > 0)
                    {
                        $.each(resultdata2, function (key, value) {
                            var tmpID2 = value.pkID;
                            var tmpHead2 = value.AccountHead;
                            var tmpLevel2 = value.AccLevel;
                            // ----------------------------------------------------
                            populateChild(tmpID2, tmpHead2, tmpLevel2)
                        })
                    }
                    else {
                        var tdpad = 0;
                        tdpad = (pLevel * 10);
                        $('#tblBalance').append("<tr><td colspan='3' style='padding-left:" + tdpad.toString() + ";'>" + pHead + " -- " + pLevel.toString() + "</td></tr>");
                    }
                },
                error: function (r) { alert('error') },
                failure: function (r) { alert('failure') }
            });
        }
        // ------------------------------------------------------------------------
        function loadLayout()
        {
            var dataurl, para1, para2, para3, para4, para5, para0;
            var viewmode = jQuery("#hdnView").val();
            var groupColumn = 0, valColspan = 4;
            var groupColumnTitle = "";
            var currDt = "Balance As On " + Date.now.toLocaleString();
            // --------------------------------------------------------
            dataurl = '/Services/NagrikService.asmx/webAccountGroup?AccType=BAL';

            colstructure = [
                { title: "Parent", data: "ParentAccountHead", width: "150", className: "left-align" },
                { title: "Description", data: "AccountHead", width: "150", className: "left-align" },
                {
                    title: currDt, data: "Closing", width: "150", className: "right-align",
                    render: function (data, type, row, meta) {
                        if (row.Closing<0)
                            data = '<p class="mb-0 pr-2" style="color:red;">(' + row.Closing + ')</p>';
                        else
                            data = '<p class="mb-0 pr-2" style="color:navy;">' + row.Closing + '</p>';
                        return data;
                    }
                },
            ];
            // --------------------------------------------------------
            jQuery.ajax({
                url: dataurl, type: "get",
                success: function (data) {
                    var resultdata = JSON.parse(data.getElementsByTagName("string")[0].innerHTML);
                    // ----------------------------------------------
                    var table;

                    if ($.fn.dataTable.isDataTable('#tblBalance')) {
                        table = $('#tblBalance').DataTable({
                            data: resultdata, columns: colstructure,
                            order: [[0, 'asc'], [1, 'asc']],
                            rowGroup: {
                                dataSrc: [0, 1]
                            },
                            columnDefs: [{
                                targets: [0, 1],
                                visible: false
                            }]

                        });
                        table.clear();
                        table.rows.add(resultdata).draw();
                    }
                    else {
                        table = jQuery('#tblBalance').DataTable({
                            data: resultdata, columns: colstructure,
                            "columnDefs": [{ "visible": false, "targets": groupColumn }],
                            "order": [[0, 'asc']],
                            "displayLength": 1000,
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
                        }).on('draw.dt', function () { });
                    }
                },
                error: function (r) { alert('Error : ' + r.responseText); },
                failure: function (r) { alert('failure'); }
            });
        }
    </script>
</head>
<body>
    <form id="frmAccountGroup" runat="server">
        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnParentID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnAccOrder" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnGrossProfit" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnGrossLoss" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnNetProfit" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnNetLoss" runat="server" ClientIDMode="Static" />
        <div id="contentwrapper" class="contentwrapper">
            <div class="row">
                <div class="col m3">
                    <div class="card user-statistics-card cardRound mb-1">
                        <div class="card-content p-0">
                            <h5 class="h5Round"><span id="Span1" runat="server" clientidmode="Static" class="titleHead text-top">Add Group</span></h5>
                            <div style="width: 100%; padding: 2px 10px 10px 10px; overflow-x: hidden; overflow-y: auto;">
                                <div class="row">
                                    <div class="input-field col m12">
                                        <label class="active" for="drpAccType">Group For</label>
                                        <asp:DropDownList ID="drpAccType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="1">
                                            <asp:ListItem Text="BalanceSheet" Value="BAL" />
                                            <asp:ListItem Text="Profit & Loss" Value="P&L" />
                                            <asp:ListItem Text="Trading" Value="TRAD" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col m12">
                                        <label class="active" for="txtAccountHead">Group Name</label>
                                        <asp:TextBox ID="txtAccountHead" class="form-control" runat="server" ClientIDMode="Static"  MaxLength="50" Placeholder="" TabIndex="1"  />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col m12">
                                        <label class="active" for="drpParentHead">Foll Under</label>
                                        <asp:DropDownList ID="drpParentHead" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="4" AutoPostBack="true" OnSelectedIndexChanged="drpParentHead_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                                <div id="divAccSide" runat="server" class="row">
                                    <div class="input-field col m12">
                                        <label class="active" for="drpAccSide">Select Asset/Liability</label>
                                        <asp:DropDownList ID="drpAccSide" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="1">
                                            <asp:ListItem Text="Asset" Value="Asset" />
                                            <asp:ListItem Text="Liability" Value="Liability" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col m12">
                                        <button id="btnSave" type="button" runat="server" clientidmode="Static" Text="Save" class="btn cyan right mr-1" onserverclick="btnSave_Click" TabIndex="3"><i class="material-icons left">save</i>Save</button>
                                        <button ID="btnReset" type="button" runat="server"  clientidmode="Static" Text="Reset" class="btn orange left" onserverclick="btnReset_Click" TabIndex="37"><i class="material-icons left">backspace</i>Clear & Add New</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="card user-statistics-card cardRound mb-1">
                        <div class="card-content p-0">
                            <h5 class="h5Round"><span id="Span2" runat="server" clientidmode="Static" class="titleHead text-top">Statement Summary</span></h5>
                            <div style="width: 100%; padding: 2px 10px 10px 10px; overflow-x: hidden; overflow-y: auto;">
                                <div class="row">
                                    <div class="input-field col m12" id="ulError" runat="server" clientidmode="Static">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col m9">
                    <div class="card user-statistics-card cardRound mb-1">
                        <div class="card-content p-0">
                            <h5 class="h5Round"><span id="spnHead" runat="server" clientidmode="Static" class="titleHead text-top">Financial Statement</span>
                                <asp:DropDownList ID="drpView" runat="server" class="myDropDownClass select2-theme browser-default mr-2 float-right" ClientIDMode="Static"  TabIndex="5" AutoPostBack="true" OnSelectedIndexChanged="drpView_SelectedIndexChanged">
                                    <asp:ListItem Text="Trial Balance" Value="TRIAL" />
                                    <asp:ListItem Text="Trading" Value="TRAD" />
                                    <asp:ListItem Text="Profit & Loss" Value="P&L" />
                                    <asp:ListItem Text="BalanceSheet" Value="BAL" />
                                    <asp:ListItem Text="Missing Group" Value="missinggroup" />
                                </asp:DropDownList>
                            </h5>
                            <div style="width: 100%; padding: 2px 10px 10px 10px; overflow-x: hidden; overflow-y: auto;">
                                <div id="divBalance" runat="server" clientidmode="Static" class="col m12"></div>
                            </div>
                            <div id="divSummary" runat="server" clientidmode="Static" style="width: 100%; padding: 2px 10px 10px 10px; margin-left:15px; overflow-x: hidden; overflow-y: auto;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
