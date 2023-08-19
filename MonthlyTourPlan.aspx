<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlyTourPlan.aspx.cs" Inherits="StarsProject.MonthlyTourPlan" %>

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

    <script type="text/javascript" src='<%=ResolveUrl("js/plugins/jquery-1.7.min.js") %>'></script>
    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>
    <link rel="stylesheet" href="app-assets/vendors/select2/select2.min.css" type="text/css" />
    <link rel="stylesheet" href="app-assets/vendors/select2/select2-materialize.css" type="text/css" />

    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>
    <script type="text/javascript" src="js/dataValidation.js"></script>
    <script type="text/javascript" src="js/myGeneric.js"></script>

    <style type="text/css">
        .clDiv70 {
            height: 50px;
            vertical-align: middle;
        }

        .clTrans {
            background-color: transparent;
        }

        .star-fg .glyphicon-star {
            color: red !important;
        }

        #hearts {
            color: #FF0000;
        }

        #hearts-existing {
            color: #87bad7;
        }

        .ui-widget-header, .ui-state-default, ui-button {
            background: #b9cd6d;
            border: 1px solid #b9cd6d;
            color: #FFFFFF;
            font-weight: bold;
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

        
    </style>

    <script type="text/javascript">

        function pageLoad(sender, args) {
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
        }

        $(document).ready(function () {
            $('.datepicker').datepicker({ format: "dd-mm-yyyy" });
            $('.timepicker').timepicker();
            checkedEventCall();
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

        /*---------------------------------------------------------*/
        function openEmployeeInfo(cat) {
            var keyid = "";
            keyid = (cat == 'view') ? $('#drpAssignTo').val() : "0";
            var pageUrl = (cat == 'view') ? "OrgEmployee.aspx?mode=view&id=" + keyid : "OrgEmployee.aspx?mode=view&id=0";
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

        function bindDDLTo(selector) {
            var link;
            if (jQuery('#hdnSerialKey').val() == 'BLUE-CHEM-56JK-BC88')
                link = 'InquiryInfo.aspx/FilterCustomerByEmployee'
            else
                link = 'InquiryInfo.aspx/FilterCustomerByModule'
            var value = '<%= Session["LoginUserID"] %>';
            if ($(selector).val().length >= 3) {
                jQuery.ajax({
                    type: "POST",
                    url: link,
                    data: '{pCustName:\'' + $(selector).val() + '\', pSearchModule:\'CustomerSearchAll\'}',
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
    </script>
</head>
<body class="loginpage">
    <form id="frmEntry" runat="server" autocomplete="off">

    <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
    
    <asp:HiddenField ID="hdnCustomerID" runat="server" ClientIDMode="Static" />
    <div id="contentwrapper" class="contentwrapper" >

        <%--<asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
                <div class="widgetbox" >
                    <div class="clearall"></div>
                    <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="hdnSerialKey" runat="server" ClientIDMode="Static" />
                    
                    <div id="myModal" style="display:block; width:100%;" >
                        <div class="modal-content" >
                            <div class="modal-body" >
                                <div class="row mt-1 mb-1" style="border-bottom:4px solid;" >
                                    <div class="row">
                                        <div class="col m2">
                                            <label class="active" for="txtTourDate">Tour Date <span class="materialize-red-text font-weight-800">*</span> </label>
                                            <asp:TextBox ID="txtTourDate" runat="server" class="form-control" ClientIDMode="Static" TabIndex="1" placeholder="" AutoPostBack="true" OnTextChanged="txtTourDate_TextChanged" TextMode="Date" />
                                        </div>
                                        <div class="col m2">
                                            <label class="active" for="txtTourDay">Tour Day</label>
                                            <asp:TextBox ID="txtTourDay" runat="server" class="form-control onlyDecimal" ClientIDMode="Static"  placeholder="" Enabled="false" /> 
                                        </div>
                                        <div class="col m3">
                                            <label class="active" for="txtMeetingStartTime">Meeting Start Time</label>
                                            <asp:TextBox ID="txtMeetingStartTime" runat="server" class="timepicker" PlaceHolder="Start Time" onkeypress="return false;" onpaste="return false" ClientIDMode="Static"  TabIndex="2" />
                                        </div>
                                        <div class="col m3">
                                            <label class="active" for="txtMeetingEndTime" style="margin-top:3px">Meeting End Time</label>
                                            <asp:TextBox ID="txtMeetingEndTime" runat="server" class="timepicker" PlaceHolder="End Time" onkeypress="return false;" onpaste="return false" ClientIDMode="Static" TabIndex="3" />
                                        </div>
                                        <div class="col m2">
                                            <label class="active" for="drpVisitType" style="margin-top:3px">Visit Type</label>
                                            <asp:DropDownList ID="drpVisitType" runat="server" ClientIDMode="Static" CssClass="browser-default" Width="150px" TabIndex="3">
                                            <asp:ListItem Value="" Text="---Select---" Selected="True"/>
                                            <asp:ListItem Value="Attend" Text="Attend" />
                                            <asp:ListItem Value="Miss" Text="Miss" />
                                            <asp:ListItem Value="Cancel" Text="Cancel" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="input-field col m3">
                                            <asp:TextBox ID="txtCustomerName" runat="server" ClientIDMode="Static" placeholder="Minimum 3 chars to activate search" class="form-control" AutoPostBack="true" onKeyup="bindDDLTo('#txtCustomerName')" TabIndex="4" style="margin-top:3px" OnTextChanged="txtCustomerName_TextChanged"/>
                                            <label class="active" for="txtCustomerName" style="margin-top:3px">Select Customer</label>
                                        </div>
                                        <div class="input-field col m3">
                                            <label class="active" for="txtArea">Area</label>
                                            <asp:TextBox ID="txtArea" runat="server" class="form-control" ClientIDMode="Static" TabIndex="5" MaxLength="50" placeholder="Max 50 char" />
                                        </div>
                                        <div class="input-field col m5">
                                            <label class="active" for="txtRemark">Remark</label>
                                            <asp:TextBox ID="txtRemark" runat="server" class="form-control" ClientIDMode="Static" TabIndex="6" MaxLength="500" placeholder="Max 500 char" />
                                        </div>
                                        <div class="input-field col m1">
                                            <button ID="btnFooterSave" type="button" runat="server" clientidmode="Static" Text="Save" class="btn cyan right mr-1" onserverclick="btnFooterSave_ServerClick" TabIndex="6"><i class="material-icons left">save</i>Add</button>
                                        </div>
                                    </div>
                                    <div class="row hide">
                                        <div class="input-field col m6">
                                            <label class="active" for="txtAddress">Address</label>
                                            <asp:TextBox ID="txtAddress" runat="server" class="form-control" ClientIDMode="Static" TabIndex="6" MaxLength="500" placeholder="Max 500 char" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtCity">City</label>
                                            <asp:TextBox ID="txtCity" runat="server" class="form-control" ClientIDMode="Static" TabIndex="7" MaxLength="1000" placeholder="Max 100 char" />
                                        </div>
                                    </div>
                                     <div class="row">
                                        <table id="tblTourDetails" class="table responsive-table striped width-100">
                                            <asp:Repeater ID="rptTourDetails" runat="server" ClientIDMode="Static" OnItemCommand="rptTourDetails_ItemCommand" OnItemDataBound="rptTourDetails_ItemDataBound">
                                                <HeaderTemplate>
                                                    <thead>
                                                        <tr>
                                                            <th class="center-align" style="width:300px;">Customer Name<span class="materialize-red-text font-weight-800">*</span></th>
                                                            <th class="center-align hide" style="width:300px;">Address</th>
                                                            <th class="center-align" style="width:100px;">Area</th>
                                                            <th class="center-align" style="width:100px;">Mt. Start Date</th>
                                                            <th class="center-align" style="width:100px;">Mt. End Date</th>
                                                            <th class="center-align" style="width:100px;">Visit Type</th>
                                                            <th class="center-align" style="width:250px;">Remarks</th>
                                                            <th class="center-align" style="width:50px;">Delete</th>
                                                        </tr>
                                                    </thead>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:HiddenField id="edpkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />
                                                        <asp:HiddenField id="edCustomerID" runat="server" ClientIDMode="Static" Value='<%# Eval("CustomerID") %>' />
                                                        <asp:HiddenField id="edVisit" runat="server" ClientIDMode="Static" Value='<%# Eval("VisitType") %>' />
                                                        <td class="text-center">
                                                            <asp:TextBox ID="edCustomerName" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("CustomerName") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="text-align: left;" TabIndex="12"  />
                                                        </td>
                                                        <td class="left-align hide">
                                                            <asp:TextBox ID="edAddress" runat="server" ClientIDMode="Static" Text='<%# Eval("Address") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="text-align: left;" TabIndex="14" />
                                                        </td>
                                                        <td class="left-align">
                                                            <asp:TextBox ID="edArea" runat="server" ClientIDMode="Static" Text='<%# Eval("Area") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="text-align: left;" TabIndex="15" />
                                                        </td>
                                                        <td class="left-align hide">
                                                            <asp:TextBox ID="edCity" runat="server" ClientIDMode="Static" Text='<%# Eval("City") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="text-align: left;" TabIndex="16" />
                                                        </td>
                                                        <td class="left-align">
                                                            <asp:TextBox ID="edMeetStart" runat="server" ClientIDMode="Static" Text='<%# (DateTime.Parse(Eval("MeetingStartTime").ToString()).ToString("HH:MM")) %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="text-align: left;" TabIndex="17" TextMode="Time" />
                                                        </td>
                                                        <td class="left-align">
                                                            <asp:TextBox ID="edMeetEnd" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# (DateTime.Parse(Eval("MeetingEndTime").ToString()).ToString("HH:MM")) %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="text-align: left;" TabIndex="12" TextMode="Time" />
                                                        </td>
                                                        <td class="left-align">
                                                            <asp:DropDownList ID="edVisitType" MaxLength="15" runat="server" CssClass="browser-default" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="editItem_TextChanged" Style="text-align: left;" TabIndex="12" TextMode="Time" >
                                                                <asp:ListItem Value="Attend" Text="Attend" />
                                                                <asp:ListItem Value="Miss" Text="Miss" />
                                                                <asp:ListItem Value="Cancel" Text="Cancel" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="left-align">
                                                            <asp:TextBox ID="edRemark" runat="server" ClientIDMode="Static" Text='<%# Eval("Remark") %>' OnTextChanged="editItem_TextChanged" Style="text-align: left;" TabIndex="18" />
                                                        </td>
                                                        <td class="center-align width-5" >
                                                            <asp:ImageButton ID="ImgbtnDelete" runat="server" ClientIDMode="Static" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' Width="20" Height="20" TabIndex="27" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </div>

                                </div>
                            </div>
                                
                            <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom" style="margin-top:10px;"">
                                <button ID="btnReset" type="button" runat="server"  clientidmode="Static" Text="Reset" class="btn orange left" onserverclick="btnReset_Click" TabIndex="7"><i class="material-icons left">backspace</i>Clear & Add New</button>
                                <button ID="btnSave" type="button" runat="server" clientidmode="Static" Text="Save" class="btn cyan right mr-1" onserverclick="btnSave_Click" TabIndex="6"><i class="material-icons left">save</i>Save</button>
                            </div>
                        </div>
                    </div>
                  
                </div>
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>

                <%--**************************** Employee Popup ***********************************--%>
                <asp:Button ID="Button1" CssClass="hide" runat="server" Text="Fill Form in Popup" /> 
                <cc1:ModalPopupExtender ID="myModalPopup" BehaviorID="mpe" runat="server" ClientIDMode="Static" PopupControlID="Panl1" TargetControlID="Button1" CancelControlID="Button2" BackgroundCssClass="Background">  
                </cc1:ModalPopupExtender>  
                <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" style = "display:none; border-radius:10px; padding-right: 10px !important;">  
                    <div id="myModal1215">
                        <div class="modal-header position-sticky gradient-45deg-light-blue-indigo m-0" style="margin-bottom:10px !important;">
                            <h5 class=" z-depth-5" style="font-size: 2rem !important; font-weight:800; line-height: 50px; margin: 0; text-align: left; padding-left: 15px;">
                                <i class="material-icons prefix">ac_unit</i>
                                <span id="spnModuleHeader" runat="server" clientidmode="static">Manage Module</span>
                                <asp:Button CssClass="btnTopRightCorner float-right" ID="Button2" runat="server" Text=""/>
                            </h5>
                        </div>
                    </div>
                    <iframe id="ifrModule" src="about:blank" runat="server" clientidmode="static" scrolling="auto" style="border:1px solid silver; background-color:transparent; width:100%; height:90%; padding:5px;"></iframe>  
                   <br/>  
                </asp:Panel> 
                
    </form>
</body>
</html>
