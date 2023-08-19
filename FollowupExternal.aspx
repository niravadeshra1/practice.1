<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FollowupExternal.aspx.cs" Inherits="StarsProject.FollowupExternal" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>  
<%@ Register Src="~/myFollowupTimeline.ascx" TagPrefix="uc1" TagName="myFollowupTimeline" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%-- Section Start : Below Section need to copy in all page--%>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css"/>
    <script type="text/javascript" src='<%=ResolveUrl("js/plugins/jquery-1.7.min.js") %>'></script>
    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="app-assets/js/plugins.js"></script>
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>
    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>
    <%-- Section End --%>

    <style type="text/css">
        .clDiv70 {
            height: 50px;
            vertical-align: middle;
        }

        .imgChart {
            vertical-align: middle;
            Height: 40px;
            width: 40px;
        }

        #drpSelectDepartment {
            margin: 7px 0px;
            font-family: Verdana,Arial;
            font-size: 12px;
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


        $(document).ready(function () {
            $('.timepicker').timepicker();

            $('#drpInquiryStatus').on('change', function () {
                //resetClosure();
            });
        });
        function resetClosure() {
            //    var drp = document.getElementById("drpClosureReason");
            //    if (drp != null) {
            //        var optionsText = drp.options[drp.selectedIndex].text;
            //        alert(optionsText)
            //        if (optionsText == 'Close - Lost') {
            //            $("#drpClosureReason").css('display', 'block');
            //            $("#lblReason").css('display', 'block');
            //        }
            //        else {
            //            $("#drpClosureReason").css('display', 'none');
            //            $("#lblReason").css('display', 'none');
            //        }
            //    }
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
            var keyid = (cat == 'view') ? jQuery('#hdnCustomerID').val() : "0";
            var pageUrl = (cat == 'view') ? "customers.aspx?mode=view&id=" + keyid : "customers.aspx?mode=view&id=0";
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

        function showInquiryInfo(inqno) {
            jQuery.ajax({
                type: "POST",
                url: 'InquiryInfo.aspx/GetInquiryNoPrimaryID',
                data: '{pInqNo:\'' + inqno + '\'}',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var resultdata = JSON.parse(data.d);
                    var returnID = parseInt(data.d);
                    if (returnID > 0) {
                        spnModuleHeader.innerText = "Manage Lead";
                        $('#ifrModule').attr('src', "InquiryInfo.aspx?mode=view&id=" + returnID);
                        $find("mpe").show();
                    }
                },
                error: function (r) { alert('Error : ' + r.responseText); },
                failure: function (r) { alert('failure'); }
            });
        }
        function showQuotationInfo(quono) {
            jQuery.ajax({
                type: "POST",
                url: 'Quotation.aspx/GetQuotationNoPrimaryID',
                data: '{pQuotationNo:\'' + quono + '\'}',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var resultdata = JSON.parse(data.d);
                    var returnID = parseInt(data.d);
                    if (returnID > 0) {
                        spnModuleHeader.innerText = "Manage Quotation";
                        $('#ifrModule').attr('src', "Quotation.aspx?mode=view&id=" + returnID);
                        $find("mpe").show();
                    }
                },
                error: function (r) { alert('Error : ' + r.responseText); },
                failure: function (r) { alert('failure'); }
            });
        }
    </script>

</head>
<body class="loginpage">
    <form id="frmEntry" runat="server" autocomplete="off">

        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>

        <div id="contentwrapper" class="contentwrapper">

            <%--<asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>
                    <div class="widgetbox">
                        <%-- Bootstrap INQUIRY INFO Modal Popup --%>
                        <div class="clearall"></div>
                        <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnExtpkID" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnEntryMode" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnFollowUpSource" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnCityCode" runat="server" ClientIDMode="Static"/>
                        <asp:HiddenField ID="hdnStateCode" runat="server" ClientIDMode="Static"/>
                        <asp:HiddenField ID="hdnCountryCode" runat="server" ClientIDMode="Static"/>
                        <asp:HiddenField ID="hdnCustomerID" runat="server" ClientIDMode="Static"/>
                        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static"/>
                        <asp:HiddenField ID="hdnAllowBackDatedFollowup" runat="server" ClientIDMode="Static" Value="Yes" />
                        <asp:HiddenField ID="hdnInquirySource" runat="server" ClientIDMode="Static" />

                        <div id="myModal" style="display: block; width: 100%;">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col m6 padding-1" style="min-height:450px; border-right:3px ridge silver;">
                                            <div class="row">
                                                <div class="input-field col m4">
                                                    <label class="active" for="drpFollowupType">Followup Type <span class="materialize-red-text font-weight-800">*</span></label>
                                                    <asp:DropDownList ID="drpFollowupType" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="1"></asp:DropDownList>
                                                </div>
                                                <div class="input-field col m4">
                                                    <label class="active" for="txtFollowupDate">FollowUp Date <span class="materialize-red-text font-weight-800">*</span></label>
                                                    <asp:TextBox ID="txtFollowupDate" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" onkeypress="return false;" onpaste="return false" placeholder="" TextMode="Date" />
                                                </div>
                                            </div>
                                            <div class="row mt-2 badge-secondary" style="border-radius: 5px; padding: 5px;">
                                                <div class="input-field col m12">
                                                    <label class="active" for="txtMeetingNotes">Meeting Notes <span class="materialize-red-text font-weight-800">*</span></label>
                                                    <asp:TextBox ID="txtMeetingNotes" runat="server" class="form-control" ClientIDMode="Static" TabIndex="5" MaxLength="500" TextMode="MultiLine" Rows="3" placeholder="Maximum 500 Characters..." />
                                                </div>
                                            </div>
                                            <div class="row mt-2 badge-secondary" style="border-radius: 5px; padding: 5px;">
                                                <div class="input-field col m3">
                                                    <label class="active" for="txtNextFollowupDate">Next Followup <span class="materialize-red-text font-weight-800">*</span></label>
                                                    <asp:TextBox ID="txtNextFollowupDate" runat="server" class="form-control" ClientIDMode="Static" TabIndex="6" onkeypress="return false;" onpaste="return false" placeholder="" TextMode="Date" />
                                                </div>
                                                <div class="input-field col m3">
                                                    <label class="active" for="txtNextFollowupDate">Preferred Time</label>
                                                    <asp:TextBox ID="txtPreferredTime" runat="server" class="timepicker" ClientIDMode="Static" TabIndex="7" onkeypress="return false;" onpaste="return false" Style="width: 100px; display: inline-block;" ReadOnly="false" placeholder="00:00" />
                                                </div>
                                            </div>
                                            <div class="row mt-2" id="divStatus" runat="server" clientidmode="Static" style="border-radius: 5px;">
                                                <div class="input-field col m4">
                                                    <label class="active" for="drpLeadStatus">Lead Status</label>
                                                    <asp:DropDownList ID="drpLeadStatus" runat="server" ClientIDMode="Static" class="select2-theme browser-default" TabIndex="15" Style="height: inherit;" placeholder="" AutoPostBack="true" OnSelectedIndexChanged="drpLeadStatus_SelectedIndexChanged">
                                                        <asp:ListItem Text="In-Process" Value="InProcess" Selected="True" />
                                                        <asp:ListItem Text="Disqualified" Value="Disqualified" />
                                                        <asp:ListItem Text="Qualified" Value="Qualified" />
                                                    </asp:DropDownList>
                                                </div>
                                                <div id="divClosureReason" runat="server" class="input-field col m4" visible="false">
                                                    <label runat="server" clientidmode="Static" class="active" for="drpClosureReason">Closure Reason</label>
                                                    <asp:DropDownList ID="drpClosureReason" runat="server" ClientIDMode="Static" class="select2-theme browser-default" EnableViewState="true" TabIndex="10"/>
                                                </div> 
                                                <div id="divAssignTo" runat="server" class="input-field col m4" visible="false">
                                                    <label runat="server" clientidmode="Static" class="active" for="drpAssignTo">Assign To</label>
                                                    <asp:DropDownList ID="drpAssignTo" runat="server" ClientIDMode="Static" class="select2-theme browser-default" EnableViewState="true" TabIndex="10"/>
                                                </div> 
                                                <div class="row">
                                                    <div class="col m12">
                                                        <div id="divQualified" runat="server" clientidmode="static" visible="false">
                                                            <h5 class="card-title padding-1 mb-1 float-left left-align width-100 gradient-45deg-light-blue-indigo">&nbsp;Matured Lead Information<i class="material-icons float-left">ac_unit</i></h5>
                                                            <div class="row">
                                                                <div class="input-field col m12">
                                                                    <label class="active" for="drpProduct" style="color: black !important; margin: -4px 0px 0px 0px;">
                                                                        Product&nbsp;&nbsp;<small class="text-muted font-italic" style="color: maroon !important;">(Min. 3 chars to search)</small><span class="materialize-red-text font-weight-800">*</span>
                                                                        <a href="javascript:openProductInfo('add');">
                                                                            <img src="images/expand.png" width="30" height="20" style="padding: 0px 0px 0px 10px; margin: 5px 0px 0px 0px;" alt="Add New Product" title="Add New Product"/>
                                                                        </a>
                                                                    </label>
                                                                    <asp:TextBox ID="txtProductName" runat="server" ClientIDMode="Static" class="form-control" onKeyup="bindDDLProductTo('#txtProductName')" TabIndex="13" placeholder="" />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="input-field col m6">
                                                                    <label class="active required" for="drpCountry" style="color: black !important;">Country
                                                                        <a href="javascript:openRegion('add');">
                                                                            <img src="images/RegionAdd.jpg" width="20" height="20" alt="Add Country" title="Add Country" />
                                                                        </a>
                                                                    </label>
                                                                    <asp:DropDownList ID="drpCountry" runat="server" ClientIDMode="Static" TabIndex="14" class="select2-theme browser-default" AutoPostBack="true" OnSelectedIndexChanged="drpCountry_SelectedIndexChanged" />
                                                                </div>
                                                                <div class="input-field col m6">
                                                                    <label class="active required" for="drpState" style="color: black !important;">State
                                                                        <a href="javascript:openRegion('add');">
                                                                            <img src="images/RegionAdd.jpg" width="20" height="20" alt="Add State" title="Add State" />
                                                                        </a>
                                                                    </label>
                                                                    <asp:DropDownList ID="drpState" runat="server" ClientIDMode="Static" TabIndex="15" class="select2-theme browser-default" AutoPostBack="true" OnSelectedIndexChanged="drpState_SelectedIndexChanged" />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="input-field col m6">
                                                                    <label class="active required" for="drpCity" style="color: black !important;">City
                                                                        <a href="javascript:openRegion('add');">
                                                                            <img src="images/RegionAdd.jpg" width="20" height="20" alt="Add City" title="Add City" />
                                                                        </a>
                                                                    </label>
                                                                    <asp:DropDownList ID="drpCity" runat="server" ClientIDMode="Static" TabIndex="16" class="select2-theme browser-default" placeholder="" />
                                                                </div>
                                                                <div class="input-field col m6">
                                                                    <label class="active" for="txtPinCode" style="color: black !important;">Pincode</label>
                                                                    <asp:TextBox ID="txtPinCode" runat="server" MaxLength="50" ClientIDMode="Static" class="form-control" TabIndex="17" placeholder="" />
                                                                </div>
                                                            </div>
                                                            <div class="row hide">
                                                                <div class="input-field col m12">
                                                                    <label class="active" for="txtCustomerName" style="color: black !important;">
                                                                        Search Customer&nbsp;&nbsp;<small class="text-muted font-italic" style="color: maroon !important;">(Min. 3 chars to search)</small> <span class="materialize-red-text font-weight-800">*</span>
                                                                        <a href="javascript:openCustomerInfo('view');">
                                                                            <img src="images/registration.png" width="30" height="20" alt="Preview Customer Info" title="Preview Customer Info" style="display: inline-block;"  />
                                                                        </a>
                                                                        <a href="javascript:openCustomerInfo('add');">
                                                                            <img src="images/addCustomer.png" width="30" height="20" alt="Add New Customer" title="Add New Customer" />
                                                                        </a>
                                                                    </label>
                                                                    <asp:TextBox ID="txtCustomerName" runat="server" ClientIDMode="Static" class="form-control" AutoPostBack="true" onKeyup="bindDDLTo('#txtCustomerName')" TabIndex="18" placeholder="" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom" style="margin-top:10px;"">
                                                <button ID="btnReset" type="button" runat="server" text="Reset" class="btn orange left" onserverclick="btnReset_Click" tabIndex="13"><i class="material-icons left">backspace</i>Clear & Add New</button>
                                                <button ID="btnSave" type="button" runat="server" clientidmode="Static" text="Save" class="btn cyan right mr-1" onserverclick="btnSave_Click" tabindex="12"><i class="material-icons left">save</i>Save</button>
                                            </div>
                                        </div>
                                        <div class="col m6 padding-1" style="min-height:450px; border-right:3px ridge silver;">
                                            <uc1:myFollowupTimeline runat="server" ID="myFollowupTimeline" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
        <script type="text/javascript">

             function bindDDLTo(selector) {
                    var value = '<%= Session["LoginUserID"] %>';
                    if ($(selector).val().length >= 3) {
                        jQuery.ajax({
                            type: "POST",
                            url: 'InquiryInfo.aspx/FilterCustomerByEmployee',
                            data: '{pCustName:\'' + $(selector).val() + '\', pSearchModule:\'CustomerSearchAll\', LoginUserID:\'' + value + '\'' + '\}',
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log(data);
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
                                        console.log('Item "' + item.data('langname') + ' (' + item.data('lang') + ')" selected by ' + (e.type == 'keydown' ? 'pressing enter or tab' : 'mouse click') + '.');
                                        $(selector).val(item.html());
                                        $("#hdnCustomerID").val(item.data('langname'));
                                        $("#txtFollowupNotes").focus();
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

            function bindDDLProductTo(selector) {
                if ($(selector).val().length >= 3) {
                    jQuery.ajax({
                        type: "POST",
                        url: "InquiryInfo.aspx/FilterProduct",
                        data: '{pProductName:\'' + $(selector).val() + '\', pSearchModule:\'ProductSearchTypeQuotation\'}',
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
        </script>
    </form>
</body>
</html>

