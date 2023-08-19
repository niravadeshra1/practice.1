<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductionBySo.aspx.cs" Inherits="StarsProject.ProductionBySo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>
    <link rel="stylesheet" href="app-assets/vendors/select2/select2.min.css" type="text/css" />
    <link rel="stylesheet" href="app-assets/vendors/select2/select2-materialize.css" type="text/css" />
    
    <script src="app-assets/vendors/select2/select2.full.min.js"></script>
    <script src="app-assets/js/scripts/form-select2.js"></script>
    
    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>

<%--    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>--%>
    <%--http://www.codingfusion.com/Download/146267254--%>
    <link type="text/css" href="css/sumoselect.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.sumoselect.min.js"></script>


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
            // --------------------------------------------------------
            $(function () {
                $(".tabs a").click(function () {
                    $("#hdnCurrTab").val($(this).attr("href").replace("#", ""));
                    retainTabPosition();
                });
            });
            //// --------------------------------------------------------
            //$('#drpReferenceNo').multiselect();
        });
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

        /*---------------------------------------------------------*/
        function retainTabPosition() {

            var currTab = $("#hdnCurrTab").val();

            $("#lnkProducts").removeClass("active");
            $("#lnkTransport").removeClass("active");

            $("#pnl_Products").css("display", "none");
            $("#pnl_Transport").css("display", "none");

            if (currTab == 'pnl_Products') {
                $("#lnkProducts").addClass("active");
                $("#pnl_Products").css("display", "block");
            }
            else if (currTab == 'pnl_Transport') {
                $("#lnkTransport").addClass("active");
                $("#pnl_Transport").css("display", "block");
            }
        }
        function getSelectedOrders() {
            var test = $(".select2-selection__rendered").find('li.select2-selection__choice').text().substring(1).replace("×", ",");
            $("#hdnSelectedReference").val(test);
        }
        /*---------------------------------------------------------*/
        function showcaseError(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:circle;">' + xMsg + '</ul>', displayLength: 4000 });
        }

        function showcaseMessage(xText, xIcon) {
            xText = (xText == '') ? 'Action Performed !' : xText;
            xIcon = (xIcon == '') ? 'Info' : xIcon;
            swal({ title: "Message", text: xText, icon: xIcon });
        }

        function showErrorMessage(strMess) {
            jQuery.confirm({ title: 'Data Validation', content: 'Are you sure, You want to delete record !', type: 'red', typeAnimated: true });
        }

        function openProductSerialNo(pProdID, pRefNo, pProductName) {
            document.getElementById('spnModuleHeader').innerText = "FillUp Product Serial No";
            var t11 = jQuery("#txtProNo").val();
            var pageUrl = "ProductSerialNo.aspx?FromPage=ProductionBySo&Module=productionin&InvoiceNo=" + t11 + "&ProductID=" + pProdID + "&RefNo=" + pRefNo + "&ProductName=" + pProductName;
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }

        /*---------------------------------------------------------*/
        function openCustomerInfo(cat) {
            var keyid = (cat == 'view') ? jQuery('#hdnCustomerID').val() : "0";
            document.getElementById('spnModuleHeader').innerText = "Manage Customer";
            var pageUrl = (cat == 'view') ? "customers.aspx?mode=view&id=" + keyid : "customers.aspx?mode=view&id=0";
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }

        function openProductInfo(cat, id) {
            var keyid = "0";
            document.getElementById('spnModuleHeader').innerText = "Manage Product";
            var pageUrl = "Products.aspx?mode=" + cat + "&id=" + id;
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

        function calcQuotation() {
            var q = parseFloat(jQuery("#txtQuantity").val() != '' ? jQuery("#txtQuantity").val() : 0);
            var ur = parseFloat(jQuery("#txtUnitRate").val() != '' ? jQuery("#txtUnitRate").val() : 0);
            var dp = parseFloat(jQuery("#txtDiscountPercent").val() != '' ? jQuery("#txtDiscountPercent").val() : 0);

            var nr = (ur - ((ur * dp) / 100)).toFixed(2);
            jQuery("#txtNetRate").val(nr);

            var a = (q * nr).toFixed(2);
            jQuery("#txtAmount").val(a);

            var tr = parseFloat(jQuery("#txtTaxRate").val() != '' ? jQuery("#txtTaxRate").val() : 0);
            ta = ((a * tr) / 100).toFixed(2);
            jQuery("#txtTaxAmount").val(ta);

            na = (parseFloat(a) + parseFloat(ta)).toFixed(2);
            jQuery("#txtNetAmount").val(na);
        }

        $('.select2').select2({
            dropdownAutoWidth: true, width: '100%', containerCssClass: 'select-sm'
        });

        //function getSelectedOrders() {
        //    var test = $(".select2-selection__rendered").find('li.select2-selection__choice').text();
        //    $("#hdnSelectedReference").val(test.substring(1).replace("×", ","));
        //    $("#hdnSelectedReference").val($("#hdnSelectedReference").val().replace("×", ","));
        //    // --------------------------------------------------
        //}
        function openAssembly(pProdID,pOrderNo) {
            var t11;
            t11 = jQuery("#txtProNo").val();
            var pageUrl = "SalesOrderAssembly.aspx?OrderNo=" + pOrderNo + "&FinishProductID=" + pProdID;
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }
        function getSelectedOrders() {
            var test = $(".select2-selection__rendered").find('li.select2-selection__choice').text();
            var myArr = test.substring(1).split("×");
            $("#hdnSelectedReference").val(myArr.join());
        }
    </script>

</head>
<body class="loginpage">
    <form id="frmEntry" runat="server" autocomplete="off">

        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>

        <div id="contentwrapper" class="contentwrapper">

<%--            <asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>
                    <div class="widgetbox">
                        <%-- Bootstrap Quotation Modal Popup --%>
                        <div class="clearall"></div>
                        <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnCustomerID" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnLocationStock" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnLocationStockWisePosting" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnCurrTab" runat="server" ClientIDMode="Static" EnableViewState="true" Value="pnl_Products" />
                        <asp:HiddenField ID="hdnSelectedReference" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnProductionWithoutCustomer" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnProductWithSerialNo" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="hdnSerialKey" runat="server" ClientIDMode="Static" />
                        <div id="myModal" style="display: block; width: 100%;">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="input-field col m1">
                                            <label class="active" for="txtProNo">Prodution ID</label>
                                            <asp:TextBox ID="txtProNo" runat="server" class="form-control" MaxLength="20" ClientIDMode="Static" TabIndex="1" ReadOnly="true" placeholder=""/>
                                        </div>
                                        <div class="input-field col m1">
                                            <label class="active" for="txtProDate">Production Date <span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtProDate" runat="server" class="form-control" ClientIDMode="Static" onkeypress="return false;" onpaste="return false" placeholder="" TabIndex="2" TextMode="Date" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="drpType">Select Type</label>
                                            <asp:DropDownList ID="drpType" runat="server" ClientIDMode="Static" TabIndex="12" CssClass="select2-size-sm browser-default" AutoPostBack="true" OnSelectedIndexChanged="drpType_SelectedIndexChanged" >
                                                <asp:ListItem Value="so" Text="Sales Order" Selected="True"/>
                                            </asp:DropDownList>
                                        </div>                                            
                                        <div id="divCust" visible="true" runat="server" clientidmode="Static" class="input-field col m3">
                                            <asp:HiddenField ID="hdnProductIDOuter" runat="server" ClientIDMode="Static" />
                                            <label class="active" for="txtCustomer">Select Customer</label>
                                            <asp:TextBox ID="txtCustomer" runat="server" ClientIDMode="Static" class="form-control" onKeyup="bindDDLTo('#txtCustomer')" AutoPostBack="true" TabIndex="12" Width="95%" PlaceHolder="" OnTextChanged="txtCustomer_TextChanged"/>
                                        </div>
                                        <div id="dvLoadItems" runat="server" class="row">
                                            <div class="input-field col m2">
                                                <label id="lblLabel" runat="server" class="active" for="drpReferenceNo">Select Movement #</label>
                                                <asp:listbox ID="drpReferenceNo" runat="server" ClientIDMode="Static" TabIndex="12" data-placeholder="Select ..." CssClass="select2-size-sm browser-default" />
                                            </div>
                                            <div class="input-field col m2">
                                                <button id="btnLoadItems" type="button" runat="server" clientidmode="Static" TabIndex="13" class="btn cyan right mr-1" onclick="javascript:getSelectedOrders();" onserverclick="btnLoadItems_Click">Load Products</button>
                                            </div>
                                        </div>
                                        <% if (hdnLocationStockWisePosting.Value == "yes")
                                            {%>
                                        <div class="input-field col m2">
                                            <label class="active" for="drpLocation">Location</label>
                                            <asp:DropDownList ID="drpLocation" runat="server" ClientIDMode="Static" TabIndex="6" class="select2-theme browser-default" />
                                        </div>
                                        <%}%>
                                    </div>

                                    <div class="row">
                                        <div class="col m12">
                                            <ul id="Ul1" class="tabs" runat="server" clientidmode="Static" enableviewstate="true" style="background-color:antiquewhite; color:navy;">
                                                <li class="tab col m3 p-0"><a id="lnkProducts" class="left active" href="#pnl_Products">Product Detail</a></li>
                                            </ul>
                                        </div>
                                        <div id="pnl_Products" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true" style="display:block;">
                                            <div class="row">
                                                <div class="col m12">
                                                    <table id="tblPro" class="stdtable" cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                                                        <asp:Repeater ID="rptPro" runat="server" ClientIDMode="Static" OnItemCommand="rptPro_ItemCommand" OnItemDataBound="rptPro_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <thead>
                                                                    <tr>
                                                                        <th>Product Name <span class="materialize-red-text font-weight-800">*</span>
                                                                            <a href="javascript:openProductInfo('add',0);">
                                                                                <img src="images/expand.png" width="30" height="20" style="padding: 5px 5px 0px 10px;" alt="Add New Product" title="Add New Product" tabindex="51" />
                                                                            </a>
                                                                        </th>
                                                                        <th class="center-align" style="width:7%;" >Quantity <span class="materialize-red-text font-weight-800">*</span></th>
                                                                        <th class="center-align" style="width:5%;" >Unit</th>
                                                                        <th class="left-align" style="width:43%;" >Remarks</th>
                                                                        <th class="center-align" style="width:10%;" >SO No</th>
                                                                        <th class="center-align" style="width:5%;" >Assembly</th>
                                                                        <th class="center-align" style="width:5%;" >Action</th>
                                                                    </tr>
                                                                </thead>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <asp:HiddenField ID="edSerialNoFlag" runat="server" ClientIDMode="Static" Value='<%# Eval("SerialNoFlag") %>' />
                                                                    <asp:HiddenField ID="edOrderNo" runat="server" ClientIDMode="Static" Value='<%# Eval("OrderNo") %>' />
                                                                    <asp:HiddenField ID="edpkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />
                                                                    <asp:HiddenField ID="edProductID" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductID") %>' />
                                                                    <td class="center-align"><%# Eval("ProductNameLong") %></td>
                                                                    <td class="center-align" style="width:7%;">
                                                                        <asp:TextBox ID="edQuantity" CssClass="onlyDecimal"  MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Quantity") %>' AutoPostBack="true" OnTextChanged="edQuantity_TextChanged"  Style="width: 100%; text-align: center;"  TabIndex="6"/>
                                                                    </td>
                                                                    <td class="center-align" style="width:5%;">
                                                                        <asp:TextBox ID="edUnit" runat="server" ClientIDMode="Static" Text='<%# Eval("Unit") %>' Enabled="true" AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 100%; text-align: left;" TabIndex="9"/>
                                                                    </td>                                                                    
                                                                    <td class="left-align" style="width:43%;">
                                                                        <asp:TextBox ID="edRemarks" runat="server" ClientIDMode="Static" Text='<%# Eval("Remarks") %>' Enabled="true" AutoPostBack="true" OnTextChanged="editItem_TextChanged" Style="width: 100%; text-align: left;" TabIndex="9"/>
                                                                    </td>
                                                                    <td class="center-align" style="width:10%;"><%# Eval("SONo") %></td>
                                                                    <td class="center-align" style="width:5%;">
                                                                        <a id="lnkAssembly" href="javascript:openAssembly('<%# Eval("ProductID") %>','<%# Eval("OrderNo") %>');" tabindex="19"><small>Assembly</small></a>
                                                                    </td>
                                                                     <% if(hdnProductWithSerialNo.Value == "yes") { %>
                                                                    <td id="lnkSerial" runat="server" clientidmode="static" class="right-align width-5">
                                                                        <a href="javascript:openProductSerialNo('<%# Eval("ProductID") %>', '<%# Eval("Refno") %>', '<%# Eval("ProductName") %>');" style="background-color:blue;color:white;font-size:medium;padding:5px;padding-left:10px;padding-right:10px;border-radius:10px;" tabindex="19"><small>Serial No</small></a>
                                                                    </td>
                                                                    <% } %>
                                                                    <td class="center-align" style="width:5%;">
                                                                        <asp:ImageButton ID="ImgbtnDelete" runat="server" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' Width="20" Height="20" TabIndex="16" />
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <tr style="background-color: #dde8f3;">
                                                                    <td>
                                                                        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />
                                                                        <asp:TextBox ID="txtProductName" runat="server" ClientIDMode="Static" class="form-control" onKeyup="bindDDLProductTo('#txtProductName')"  TabIndex="17" Width="100%" AutoPostBack="true" OnTextChanged="txtProductName_TextChanged"/>
                                                                    </td>
                                                                    <td class="center-align" style="width:7%;">
                                                                        <asp:TextBox ID="txtQuantity" MaxLength="15" runat="server" ClientIDMode="Static" CssClass="form-control onlyDecimal" Width="100%" TabIndex="18" AutoPostBack="true" OnTextChanged="txtQuantity_TextChanged" />
                                                                    </td>
                                                                    <td class="center-align" style="width:5%;">
                                                                        <asp:TextBox MaxLength="15" ID="txtUnit" runat="server" ClientIDMode="Static" Width="100%" TabIndex="19" Enabled="false" />
                                                                     </td>
                                                                    <td class="left-align " style="align-content:flex-start;width:47%;">
                                                                        <asp:TextBox ID="txtRemarks" runat="server" ClientIDMode="Static" Width="100%" TabIndex="20"  />
                                                                    </td>
                                                                    <td class="right-align" colspan="3" >
                                                                        <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="images/buttons/bt-add2.png" ToolTip="Add Item" CommandName="Save" CommandArgument='0' Width="90" Height="30" TabIndex="29" />
                                                                    </td>
                                                                </tr>
                                                            </FooterTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom" style="margin-top:10px;"">
                            <button id="btnReset" type="button" runat="server"  clientidmode="Static" Text="Reset" class="btn orange left" onserverclick="btnReset_Click" TabIndex="47"><i class="material-icons left">backspace</i>Clear & Add New</button>
                            <button id="btnSave" type="button" runat="server" clientidmode="Static" Text="Save" class="btn cyan right mr-1" onserverclick="btnSave_Click" TabIndex="48"><i class="material-icons left">save</i>Save</button>
                        </div>
                    </div>

            <%--**************************** Customer Popup ***********************************--%>
            <asp:Button ID="Button1" CssClass="hide" runat="server" Text="Fill Form in Popup" />
            <cc1:ModalPopupExtender ID="myModalPopup" BehaviorID="mpe" runat="server" ClientIDMode="Static" PopupControlID="Panl1" TargetControlID="Button1" CancelControlID="Button2" BackgroundCssClass="Background">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" Style="display: none; border-radius: 10px; padding-right: 10px !important;">
                <div id="myModal123">
                    <div class="modal-header position-sticky gradient-45deg-light-blue-indigo m-0" style="margin-bottom: 10px !important;">
                        <h5 class=" z-depth-5" style="font-size: 2rem !important; font-weight: 800; line-height: 50px; margin: 0; text-align: left; padding-left: 15px;">
                            <i class="material-icons prefix">ac_unit</i>
                            <span id="spnModuleHeader" runat="server" clientidmode="static">Manage Module</span>
                            <asp:Button CssClass="btnTopRightCorner float-right" ID="Button2" runat="server" Text="" />
                        </h5>
                    </div>
                </div>
                <iframe id="ifrModule" src="about:blank" runat="server" clientidmode="static" scrolling="auto" style="border: 1px solid silver; background-color: transparent; width: 100%; height: 90%; padding: 5px;"></iframe>
                <br />
            </asp:Panel>

                    <script type="text/javascript">
                        $("#txtProductName").focusin(function () {
                            window.scrollBy(0, 150);
                        });

                        function
                            bindDDLTo(selector) {
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
                                                return '<div class="autocomplete-suggestion" data-langname="' + item.CustomerID + '" data-lang="' + item.CustomerName + '" data-val="' + search + '">' + item.CustomerName + '</div>';
                                            },
                                            onSelect: function (e, term, item) {
                                                console.log('Item "' + item.data('langname') + ' (' + item.data('lang') + ')" selected by ' + (e.type == 'keydown' ? 'pressing enter or tab' : 'mouse click') + '.');
                                                $(selector).val(item.html());
                                                $("#hdnCustomerID").val(item.data('langname'));
                                                $("#txtInwardDate").focus();
                                            }
                                        });
                                    },
                                    error: function (r) { alert('Error : ' + r.responseText); },
                                    failure: function (r) { alert('failure'); }
                                });
                                return false;
                            }
                        }

                        function bindDDLProductToOuter(selector) {
                            if ($(selector).val().length >= 3) {
                                jQuery.ajax({
                                    type: "POST",
                                    url: "InquiryInfo.aspx/FilterProduct",
                                    data: '{pProductName:\'' + $(selector).val() + '\', pSearchModule:\'ProductSearchTypeMaterialInward\'}',
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
                                                $("#hdnProductIDOuter").val(item.data('langname'));
                                                $("#txtReferenceName").focus();
                                            }
                                        });

                                    },
                                    error: function (r) { alert('Error : ' + r.responseText); },
                                    failure: function (r) { alert('failure'); }
                                });
                                return false;
                            }
                        }
                        function bindDDLProductTo(selector) {
                            if ($(selector).val().length >= 3) {
                                jQuery.ajax({
                                    type: "POST",
                                    url: "InquiryInfo.aspx/FilterProduct",
                                    data: '{pProductName:\'' + $(selector).val() + '\', pSearchModule:\'ProductSearchTypeMaterialInward\'}',
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
                                                return '<div class="autocomplete-suggestion" data-langname="' + item.pkID + '" data-lang="' + item.ProductNameLongStk + '" data-val="' + search + '">' + item.ProductNameLongStk + '</div>';
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
                        }
                        

                        function clearProductField() {
                            $("#txtProductName").val('');
                            $("#txtQuantity").val('');
                            $("#txtUnit").val('');
                            $("#txtUnitRate").val('');
                            $("#txtDiscountPercent").val('');
                            $("#txtNetRate").val('');
                            $("#txtAmount").val('');
                            $("#txtTaxRate").val('');
                            $("#txtTaxAmount").val('');
                            $("#txtNetAmount").val('');
                            $("#txtProductName").focus();
                        }

                        function YourChangeEventJS(ddl) {
                            var test = $(".select2-selection__rendered").find('li.select2-selection__choice').text();
                            $("#hdnSelectedReference").val(test.substring(1).replace("×", ","));
                            $("#hdnSelectedReference").val($("#hdnSelectedReference").val().replace("×", ","));
                        }
                    </script>
<%--                </ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
    </form>
</body>
</html>
