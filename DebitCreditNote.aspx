﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DebitCreditNote.aspx.cs" Inherits="StarsProject.DebitCreditNote" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/form-select2.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/custom/custom.css" />

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
    </script>
</head>
<body class="loginpage">
    <form id="frmEntry" runat="server" autocomplete="off">

    <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>

    <div id="contentwrapper" class="contentwrapper">
        <div class="widgetbox">
            <div class="clearall"></div>

            <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hdnDBCustomerID" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hdnCRCustomerID" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hdnDBC" runat="server" ClientIDMode="Static" />

            <div id="myModal" style="display: block; width: 100%;">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="input-field col m2">
                                <label class="active" for="txtVoucherDate">Voucher Date <span class="materialize-red-text font-weight-800">*</span></label>
                                <asp:TextBox ID="txtVoucherDate" runat="server" class="form-control" onkeypress="return false;" onpaste="return false" ClientIDMode="Static" TabIndex="1" placeholder="" TextMode="Date" />
                            </div>
                            <div class="input-field col m2">
                                <label class="active" for="txtVoucherNo">Voucher No</label>
                                <asp:TextBox ID="txtVoucherNo" runat="server" class="form-control" MaxLength="20" ClientIDMode="Static" TabIndex="2" ReadOnly="true" placeholder="" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col m6" style="background-color: #efe6e6; padding: 15px; border: 2px solid silver; border-radius: 5px;">
                                <div class="row">
                                    <div class="input-field col m6">
                                        <label class="active" runat="server" clientidmode="Static" id="lblCreditName" for="txtCRCustomerName">Credit A/c<small class="text-muted font-italic">&nbsp;(Min 3 chars to search)</small> <span class="materialize-red-text font-weight-800">*</span></label>
                                        <asp:TextBox ID="txtCRCustomerName" runat="server" ClientIDMode="Static" class="form-control" placeholder="" AutoPostBack="true" onKeyup="bindDDLToCredit('#txtCRCustomerName')" TabIndex="6" />
                                    </div>
                                    <div class="input-field col m6">
                                        <label class="active" runat="server" clientidmode="Static" id="lblDebitName" for="txtDBCustomerName">Debit A/c<small class="text-muted font-italic">&nbsp;(Min 3 chars to search)</small> <span class="materialize-red-text font-weight-800">*</span></label>
                                        <asp:TextBox ID="txtDBCustomerName" runat="server" ClientIDMode="Static" class="form-control" placeholder="" AutoPostBack="true" onKeyup="bindDDLToDebit('#txtDBCustomerName')" TabIndex="7" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col m6">
                                        <label class="active" for="txtVoucherAmount">Voucher Amount</label>
                                        <asp:TextBox ID="txtVoucherAmount" runat="server" class="form-control onlyDecimal" MaxLength="15" ClientIDMode="Static" TabIndex="8" placeholder="" />
                                    </div>
                                </div>
                            </div>
                            <div class="col m6" style="background-color: #efe6e6; padding: 15px; border: 2px solid silver; border-radius: 5px;">
                                <div class="row mt-1 badge-secondary" style="border-radius: 5px; padding: 5px;">
                                    <div class="input-field col m12">
                                        <label class="active" for="txtRemarks">Transaction Notes <span class="materialize-red-text font-weight-800">*</span></label>
                                        <asp:TextBox ID="txtRemarks" runat="server" class="textarea" ClientIDMode="Static" TabIndex="19" MaxLength="250" TextMode="MultiLine" Rows="3" placeholder="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom" style="margin-top:10px;"">
                        <button ID="btnReset" type="button" runat="server"  clientidmode="Static" Text="Reset" class="btn orange left" onserverclick="btnReset_Click" TabIndex="20"><i class="material-icons left">backspace</i>Clear & Add New</button>
                        <button ID="btnSave" type="button" runat="server" clientidmode="Static" Text="Save" class="btn cyan right mr-1" onserverclick="btnSave_Click" TabIndex="21"><i class="material-icons left">save</i>Save</button>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function bindDDLToDebit(selector) {
                var link;
                        if (jQuery('#hdnSerialKey').val() == 'BLUE-CHEM-56JK-BC88')
                            link = 'InquiryInfo.aspx/FilterCustomerByEmployee'
                        else
                            link = 'InquiryInfo.aspx/FilterCustomer'
                        var value = '<%= Session["LoginUserID"] %>';
                if ($(selector).val().length >= 3) {
                    jQuery.ajax({
                        type: "POST",
                        url: link,
                        data: '{pCustName:\'' + $(selector).val() + '\'}',
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            var sample = JSON.parse(data.d);
                            $(selector).autoComplete({
                                minLength: 1,
                                source: function (term, suggest) {
                                    term = term.toLowerCase();
                                    var choices = sample;
                                    suggest(choices);
                                },
                                renderItem: function (item, search) {
                                    $(".autocomplete-suggestion").remove();
                                    return '<div class="autocomplete-suggestion" style="position:relative !important;" data-langname="' + item.CustomerID + '" data-lang="' + item.CustomerName + '" data-val="' + search + '">' + item.CustomerName + '</div>';
                                },
                                onSelect: function (e, term, item) {
                                    console.log('Item "' + item.data('langname') + ' (' + item.data('lang') + ')" selected by ' + (e.type == 'keydown' ? 'pressing enter or tab' : 'mouse click') + '.');
                                    $(selector).val(item.html());
                                    $("#hdnDBCustomerID").val(item.data('langname'));
                                    $("#txtDBCustomerName").focus();
                                }
                            });

                        },
                        error: function (r) { alert('Error : ' + r.responseText); },
                        failure: function (r) { alert('failure'); }
                    });
                    return false;
                }
            }
            function bindDDLToCredit(selector) {
                var link;
                        if (jQuery('#hdnSerialKey').val() == 'BLUE-CHEM-56JK-BC88')
                            link = 'InquiryInfo.aspx/FilterCustomerByEmployee'
                        else
                            link = 'InquiryInfo.aspx/FilterCustomer'
                        var value = '<%= Session["LoginUserID"] %>';
                if ($(selector).val().length >= 3) {
                    jQuery.ajax({
                        type: "POST",
                        url: link,
                        data: '{pCustName:\'' + $(selector).val() + '\'}',
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            var sample = JSON.parse(data.d);
                            $(selector).autoComplete({
                                minLength: 1,
                                source: function (term, suggest) {
                                    term = term.toLowerCase();
                                    var choices = sample;
                                    suggest(choices);
                                },
                                renderItem: function (item, search) {
                                    $(".autocomplete-suggestion").remove();
                                    return '<div class="autocomplete-suggestion" style="position:relative !important;" data-langname="' + item.CustomerID + '" data-lang="' + item.CustomerName + '" data-val="' + search + '">' + item.CustomerName + '</div>';
                                },
                                onSelect: function (e, term, item) {
                                    console.log('Item "' + item.data('langname') + ' (' + item.data('lang') + ')" selected by ' + (e.type == 'keydown' ? 'pressing enter or tab' : 'mouse click') + '.');
                                    $(selector).val(item.html());
                                    $("#hdnCRCustomerID").val(item.data('langname'));
                                    $("#txtCRCustomerName").focus();
                                }
                            });

                        },
                        error: function (r) { alert('Error : ' + r.responseText); },
                        failure: function (r) { alert('failure'); }
                    });
                    return false;
                }
            }
        </script>
    </div>
    </form>
</body>
</html>
