<%@ Page Title="" Language="C#" MasterPageFile="~/StarsSite.Master" AutoEventWireup="true" CodeBehind="MY_ScriptGenerator.aspx.cs" Inherits="StarsProject.MY_ScriptGenerator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/form-select2.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/custom/custom.css"/>

    <script type="text/javascript" src='<%=ResolveUrl("js/plugins/jquery-1.7.min.js") %>'></script>
    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>
    <link rel="stylesheet" href="app-assets/vendors/select2/select2.min.css" type="text/css" />
    <link rel="stylesheet" href="app-assets/vendors/select2/select2-materialize.css" type="text/css" />

    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>
    <script type="text/javascript" src="js/dataValidation.js"></script>
    <script type="text/javascript" src="js/myGeneric.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById('<%=((Label)Master.FindControl("lblModule")).ClientID %>').innerText = "Daily Work Log";
            $('.datepicker').datepicker({ format: "dd-mm-yyyy" });
            // -------------------------------------------------------
            $('#chkAll').click(function () {
                var checked = $(this).prop('checked');
                $('.chkReminder').prop('checked', checked);
            });
        });
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

        function showErrorPopup(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:none;">' + xMsg + '</ul>', displayLength: 4000 });
        }
        // -----------------------------------------------------
        function CheckAll() {
            jQuery("#spnSelected").text($("#contentwrapper .chkToCompare").find('input:checked').length);
        }


    </script>
    
    <style type="text/css">
        .titleHead {
            font-weight:800;
            margin-left: 15px;
        }
        .cardRound { box-shadow: black -6px 8px 6px -6px !important; border-radius: 8px 8px 0px 0px !important; }
        .h5Round { border-radius: 8px 8px 0px 0px; margin-bottom:5px; padding:5px; line-height:35px; background: linear-gradient(45deg, #303f9f, #7b1fa2) !important; color:white !important; }
        .h5RoundHead { 
            border-radius: 0px 0px 0px 0px; 
            margin-bottom:5px; padding:5px; 
            line-height:35px; 
            /*background: linear-gradient(45deg, silver, #7f88ec6e);*/ 
            background: linear-gradient(45deg, #303f9f, #7b1fa2) !important; color:white !important;
        }

        .stdtable thead th {
            font-size: 16px !important;
            font-weight:bold;
        }

        .stdtable tr td {
            font-size: 16px !important;
            color:black !important;
        }

        .form-control {
            font-size: 12px !important;
        }
        
        /*.checkbox-container input {
            visibility: hidden;
            position: absolute;
            z-index: 2;
        }*/
        .chkReminderAll { position: relative !important; pointer-events:all !important; opacity: 100 !important; width:20px !important; height:20px !important; top:3px;}
        .chkReminder { position: relative !important; pointer-events:all !important; opacity: 100 !important; width:20px !important; height:20px !important; top:3px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hdnView" runat="server" ClientIDMode="Static" EnableViewState="true" />
    <asp:HiddenField ID="hdnMonth" runat="server" ClientIDMode="Static" EnableViewState="true" />
    <asp:HiddenField ID="hdnYear" runat="server" ClientIDMode="Static" EnableViewState="true" />
    <asp:HiddenField ID="hdnDebit" runat="server" ClientIDMode="Static" EnableViewState="true" Value="0" />
    <asp:HiddenField ID="hdnCredit" runat="server" ClientIDMode="Static" EnableViewState="true" Value="0" />

    <div id="contentwrapper" class="contentwrapper">
        <div class="row">
            <div class="col m6">
                <div class="row">
                    <div class="input-field col m6">
                        <label class="active" for="txtTableName">Select Table Name</label>
                        <asp:TextBox ID="txtTableName" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" placeholder="" Text="MST_Cylinder" />
                    </div>        
                    <div class="input-field col m3">
                        <button id="btnGetCols" type="button" runat="server" clientidmode="Static" class="btn cyan right mr-1" onserverclick="btnGetCols_Click" TabIndex="8"><i class="material-icons left">save</i>Get Structure</button>
                    </div>        
                </div>
            </div>
            <div class="col m6">
                <div class="row">
                    <div class="input-field col m3 float-right">
                        <button id="btnGenerate" type="button" runat="server" clientidmode="Static" class="btn cyan right mr-1" onserverclick="btnGenerate_Click" TabIndex="8"><i class="material-icons left">save</i>Generate Script</button>
                    </div>        
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col m6">
                <table id="tblStructure" class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <asp:Repeater ID="rptStructure" runat="server">
                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th class="center-align width-10">Select
                                        <input class="chkReminderAll" id="chkAll" runat="server" clientidmode="static" type="checkbox" />
                                    </th>
                                    <th class="center-align width-10">Position</th>
                                    <th class="center-align width-20">Column Name</th>
                                    <th class="center-align width-10">Column Type</th>
                                    <th class="center-align width-10">Width</th>
                                    <th class="center-align width-10">Scale</th>
                                    <th class="center-align width-10">Type</th>
                                </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="blueShed">
                                <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" Value='<%#Eval("pkID") %>' />
                                <asp:HiddenField ID="hdnColName" runat="server" ClientIDMode="Static" Value='<%#Eval("ColName") %>' />
                                <asp:HiddenField ID="hdnColType" runat="server" ClientIDMode="Static" Value='<%#Eval("ColType") %>' />
                                <asp:HiddenField ID="hdnColIsNull" runat="server" ClientIDMode="Static" Value='<%#Eval("ColIsNull") %>' />
                                <asp:HiddenField ID="hdnColWidth" runat="server" ClientIDMode="Static" Value='<%#Eval("ColWidth") %>' />
                                <asp:HiddenField ID="hdnColScale" runat="server" ClientIDMode="Static" Value='<%#Eval("ColScale") %>' />
                                <td class="center-align">
                                    <input class="chkReminder" id="chkSelect" runat="server" clientidmode="static" type="checkbox" />
                                </td>
                                <td class="center-align"><%# Eval("pkID") %></td>
                                <td class="center-align"><%# Eval("ColName") %></td>
                                <td class="center-align"><%# Eval("ColType") %></td>
                                <td class="center-align"><%# Eval("ColWidth") %></td>
                                <td class="center-align"><%# Eval("ColScale") %></td>
                                <td class="center-align">
                                    <asp:DropDownList ID="drpType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" Width="200px" TabIndex="6">
                                        <asp:ListItem Text="TextBox" Value="TextBox" />
                                        <asp:ListItem Text="DropDown" Value="DropDown" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div class="col m6">
                <div class="row">
                    <div class="input-field col m3">
                        <label class="active" for="txtSPList">File Store Location</label>
                        <asp:TextBox ID="txtLocation" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" placeholder=" " Text="H:\ScriptGenerator\"  MaxLength="30" style="font-size: 16px !important;"/>
                    </div> 
                </div>
                <div class="row">
                    <h5 class="h5RoundHead">
                        <span id="Span3" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Database Script</span>
                        <input class="chkReminder float-left mt-1 mr-2" id="chkScript" runat="server" clientidmode="static" type="checkbox" />
                    </h5>
                    <div class="input-field col m12">
                        <label class="active" for="txtEntityName" style="width:200px;">Entity Name</label>
                        <asp:TextBox ID="txtEntityName" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" placeholder="" AutoPostBack="true" OnTextChanged="txtEntityName_TextChanged" style="width:200px; font-size:16px !important" />
                    </div> 
                </div>
                <div class="row">
                    <div class="input-field col m3">
                        <label class="active" for="txtSPList">SP - For List</label>
                        <asp:TextBox ID="txtSPList" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" placeholder=" "  style="font-size: 16px !important;"/>
                    </div> 
                    <div class="input-field col m3">
                        <label class="active" for="txtSPInsUpd">SP - For Ins/Upd</label>
                        <asp:TextBox ID="txtSPInsUpd" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" placeholder="" Text="_INS_UPD" style="font-size: 16px !important;" />
                    </div> 
                    <div class="input-field col m3">
                        <label class="active" for="txtSPDel">SP - For Del</label>
                        <asp:TextBox ID="txtSPDel" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" placeholder=" " Text="_DEL" style="font-size: 16px !important;" />
                    </div> 
                </div>
                <div class="row">
                    <h5 class="h5RoundHead">
                        <span id="Span1" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Entity / BAL / DAL</span>
                        <input class="chkReminder float-left mt-1 mr-2" id="chkBalDal" runat="server" clientidmode="static" type="checkbox" />
                    </h5>
                    <div class="input-field col m3">
                        <label class="active" for="txtBALList">BAL - For List</label>
                        <asp:TextBox ID="txtBALList" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" placeholder="" Text="Get" style="font-size: 16px !important;"/>
                    </div> 
                    <div class="input-field col m3">
                        <label class="active" for="txtBALInsUpd">BAL - AddUpdate</label>
                        <asp:TextBox ID="txtBALInsUpd" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" placeholder="" Text="AddUpdate" style="font-size: 16px !important;" />
                    </div> 
                    <div class="input-field col m3">
                        <label class="active" for="txtBALDel">BAL - Delete</label>
                        <asp:TextBox ID="txtBALDel" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" placeholder="" Text="Delete" style="font-size: 16px !important;" />
                    </div> 
                </div>
                <%--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--%>
                <div class="row">
                    <h5 class="h5RoundHead">
                        <span id="Span2" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">ASPX & C# -  Code</span>
                        <input class="chkReminder float-left mt-1 mr-2" id="chkPage" runat="server" clientidmode="static" type="checkbox" />
                    </h5>
                </div>
            </div>
        </div>
    </div>
    <br /><br />
</asp:Content>