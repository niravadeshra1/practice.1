<%@ Page Title="" Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="Products.aspx.cs" Inherits="StarsProject.Products" MaintainScrollPositionOnPostback="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/form-select2.min.css" />
    <link rel="stylesheet" href="app-assets/vendors/select2/select2.min.css" type="text/css" />
    <link rel="stylesheet" href="app-assets/vendors/select2/select2-materialize.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css"/>
    <link  rel="stylesheet" type="text/css" href="app-assets/css/pages/app-file-manager.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/custom/custom.css"/>
    <link href="css/jquery.auto-complete.css" rel="stylesheet" />

    <script type="text/javascript" src='<%=ResolveUrl("js/plugins/jquery-1.7.min.js") %>'></script>
    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>

    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>
    <script type="text/javascript" src="app-assets/js/scripts/app-file-manager.js"></script>
    <link href="css/font-awesome-Editor.min.css" rel="stylesheet" />

    <link href="css/richtext.min.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.richtext.min.js"></script>

    <style type="text/css">
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
        .MsoTableGrid {
            margin-left: 0px !important;
        }
        .tabs .tab a { padding: 0 8px !important; }

        [type='checkbox']:not(:checked), [type='checkbox']:checked { 
            position:relative !important; 
            opacity:100;
            pointer-events:all;
        }

        input:not([type]):focus:not([readonly]),
        input[type=image]:not(.browser-default):focus:not([readonly])
        {
            border-bottom: 1px solid #ff4081;
            box-shadow: 0 1px 0 0 #ff4081;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.datepicker').datepicker({ format: "dd/mm/yyyy" });
            $('.timepicker').timepicker();
            $('.tabs').tabs();
            $('.collapsible').collapsible({ accordion: true });
            $(".content").richText();

            $(".onlyNumeric").on("input", function (evt) {
                var self = $(this);
                self.val(self.val().replace(/\D/g, ""));
                if ((evt.which < 48 || evt.which > 57)) {
                    evt.preventDefault();
                }
                if (self.val() == '')
                    $(this).val("0");
            });
            $('.btnTopRightCorner').on("click", function () {
                __doPostBack('drpBrand', '');
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
            // ----------------------------------------------------
            setHiddenControls();
        });
        function reinitializePage() {
            $('.datepicker').datepicker({ format: "dd/mm/yyyy" });
            $('.timepicker').timepicker();
            $('.tabs').tabs();
            $('.collapsible').collapsible({ accordion: true });
            $(".content").richText();
        }
        /*---------------------------------------------------------*/
        function pageLoad(sender, args) {
            retainTabPosition();
        }

        function setUniqueIDFocus(id)
        {
            //debugger;
            //$('#' + id).focus();
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

        function ShowPDFfile(repFilename) {
            yhooWin = window.open('productimages//' + repFilename, "ywin", "width=1050,height=750");
            yhooWin.focus();
        }
        // ------------------------------------------------------------------------
        //  Open Bootstrap Modal Popup 
        // ------------------------------------------------------------------------
        function validateForm() {
            var errmsg = "";
            var validflag = true;
            // ----------------------------------------
            if (jQuery("#txtProductName").val() == "" || jQuery("#txtProductAlias").val() == "") {
                validflag = false;

                if (jQuery("#txtProductName").val() == "")
                    errmsg += "<li>Product Name is required</li>";

                if (jQuery("#txtProductAlias").val() == "")
                    errmsg += "<li>Product Alias is required</li>";
            }
            // ----------------------------------------
            if (validflag == false)
                showcaseError(errmsg);
            // ----------------------------------------
            return validflag;
        }

        function clearFormData() {
            //$(".usermsg").empty();
            jQuery('#form1').find('input:text, input:password, input:file, select, textarea').val('');
            jQuery("#hdnpkID").val('');
            jQuery("#FileUpload1").val("");
            jQuery("#imgProduct").attr("src", "~/images/no-figure.png");
            jQuery("#divImageControl").hide();
            
        }

        jQuery(".form-control").focus(function () {
            alert("Handler for .focus() called.");
        });

        function showFileExtError(xMode) {
            if (xMode == 'image')
                alert("Only BMP, JPEG, GIF and PNG file is valid for Attachment !");
            if (xMode == 'pdf')
                alert("Only PDF file attachment is valid for Upload !");
        }

        function showPDFContent() {
            alert('test');
        }

        $("li .nav-item").click(function () {
            alert('testeeeee');
        });

        /*---------------------------------------------------------*/
        /* Below section to Maintain Current TAB                   */
        /*---------------------------------------------------------*/
        $(function () {
            var tabName = $("[id*=hdnCurrentTab]").val() != "" ? $("[id*=hdnCurrentTab]").val() : "prodspecs";
            $("#myTab a").click(function () {
                var prevTab = $("[id*=hdnCurrentTab]").val() != "" ? $("[id*=hdnCurrentTab]").val() : "prodspecs";
                var currTab = $(this).attr("href").replace("#", "");
                $('#' + prevTab + '-tab').removeClass('show');
                $('#' + currTab + '-tab').addClass('show');
                $("#hdnCurrentTab").val(currTab);
                //alert("Curr.Tab Gen.Func : " + currTab)
            });
        });

        $(function () {
            $(".tabs a").click(function () {
                $("#hdnCurrTab").val($(this).attr("href").replace("#", ""));
                retainTabPosition();
            });
        });

        function retainTabPosition() {
            //alert($("#hdnCurrentTab").val());
            $('#lnkprodspecs').removeClass('active');
            $('#lnkshortdesc').removeClass('active');
            $('#lnkproddetail').removeClass('active');
            //$('#lnkprodsize').removeClass('active');
            $('#lnkproddocs').removeClass('active');
            $('#lnkprodimg').removeClass('active');
            $('#lnkprodacc').removeClass('active');
            //$('#lnkprodnew').removeClass('active');

            $('#prodspecs').css("display", "none");
            $('#shortdesc').css("display", "none");
            $('#proddetail').css("display", "none");
            //$('#prodsize').css("display", "none");
            $('#proddocs').css("display", "none");
            $('#prodimg').css("display", "none");
            $('#prodacc').css("display", "none");
            // --------------------------------------------------- 
            if ($("#hdnCurrentTab").val() == 'prodspecs') {
                //alert('1')
                $('#lnkprodspecs').addClass('active');
                $('#prodspecs').css("display", "block");
            }
            else if ($("#hdnCurrentTab").val() == 'shortdesc') {
                //alert('2')
                $('#lnkshortdesc').addClass('active');
                $('#shortdesc').css("display", "block");
            }
            else if ($("#hdnCurrentTab").val() == 'proddetail') {
                //alert('3')
                $('#lnkproddetail').addClass('active');
                $('#proddetail').css("display", "block");
            }
            //else if ($("#hdnCurrentTab").val() == 'prodsize') {
            //    //alert('3')
            //    $('#lnkprodsize').addClass('active');
            //    $('#prodsize').css("display", "block");
            //}
            else if ($("#hdnCurrentTab").val() == 'proddocs') {
                //alert('4')
                $('#lnkproddocs').addClass('active');
                $('#proddocs').css("display", "block");
            }
            else if ($("#hdnCurrentTab").val() == 'prodimg') {
                //alert('5')
                $('#lnkprodimg').addClass('active');
                $('#prodimg').css("display", "block");
            }
            else if ($("#hdnCurrentTab").val() == 'prodacc') {
                //alert('5')
                $('#lnkprodacc').addClass('active');
                $('#prodacc').css("display", "block");
            }
            //else if ($("#hdnCurrentTab").val() == 'prodnew') {
            //    //alert('5')
            //    $('#lnkprodnew').addClass('active');
            //    $('#prodnew').css("display", "block");
            //}

        }
        function setHiddenControls() {
            var userData = JSON.stringify({ "pPageName": 'product' });
            $.ajax({
                type: "POST",
                url: "/Services/NagrikService.asmx/GetPageHiddenControls",
                data: userData,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $("#hdnHiddenControl").val(data.d);
                    // ---------------------------------------------------------------
                    $('#frmProduct *').filter(':input').each(function () {
                        var idName = $(this).attr('id') + ',';
                        if ($("#hdnHiddenControl").val().indexOf(idName) >= 0) {
                            $(this).parent().hide();
                        }
                    });
                },
                failure: function (errMsg) { alert(errMsg); }
            });
        }

        function editItem(id, fldName, element) {
            var ctrlValue = event.target.value;
            //var quotno = $("#hdnQuotationNo").val();
            //var finishprodid = $("#hdnFinishProductID").val();
            // -----------------------------------------
            var link = 'Products.aspx/AutoSaveDetail'
            var myUrl = '{pID:' + id.toString() + ', pFieldName:\'' + fldName + '\', pFieldValue:\'' + ctrlValue + '\' }';
            // -----------------------------------------
            jQuery.ajax({
                type: "POST",
                url: link,
                data: myUrl,
                contentType: "application/json; charset=utf-8",
                success: function (data) { },
                error: function (r) { alert('Error : ' + r.responseText); },
                failure: function (r) { alert('failure'); }
            });
        }
        function openProductBrandInfo(cat) {
            document.getElementById('spnModuleHeader').innerText = "Product Brand Information";
            var keyid = "0";
            var pageUrl = "ProductBrand.aspx?mode=view&id=0";
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }

    </script>
</head>
<body class="loginpage">
    <form id="frmProduct" runat="server" autocomplete="off">
        <asp:ScriptManager ID="srcUser" runat="server" EnablePartialRendering="true" EnablePageMethods="true" EnableViewState="true"></asp:ScriptManager>

        <asp:HiddenField ID="hdnPageMode" runat="server" ClientIDMode="Static" EnableViewState="true" />
        <asp:HiddenField ID="hdnClientERPIntegration" runat="server" ClientIDMode="Static" EnableViewState="true" />
        <asp:HiddenField ID="hdnCurrentTab" runat="server" ClientIDMode="Static" Value="prodspecs" EnableViewState="true" />
        <asp:HiddenField ID="hdnQuatSpecRemark" runat="server" ClientIDMode="Static" EnableViewState="true" />
        <asp:HiddenField ID="hdnQuotSpecFormat" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnApplicationIndustry" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnLocationStockWisePosting" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnSerialKey" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnProductWithSerialNo" runat="server" ClientIDMode="Static" Value=""/>
    <div id="contentwrapper" class="contentwrapper">
            <div class="widgetbox">
            <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
            <div id="myModal" style="display:block; width:100%;">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="input-field col m5">
                                <div class="row">
                                     <% if (hdnClientERPIntegration.Value.ToLower() == "yes")
                                     { %>
                                        <div style="padding: 5px 15px; background-color: white; color: Blue; border-radius: 15px; font-size: 18px;">
                                             Closing Stock :&nbsp;&nbsp;<asp:Label CssClass="float-right" ID="lblClosingStock" runat="server" ClientIDMode="Static" />
                                        </div>
                                     <% } %>
                                </div>
                                <div class="row">
                                    <div class="input-field col m9">
                                        <asp:TextBox ID="txtProductName" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="1" MaxLength="100" />
                                        <label class="active" for="txtProductName">Product Name <span class="materialize-red-text font-weight-800">*</span></label>
                                    </div>
                                    <div class="input-field col m3">
                                        <label class="active" for="chkBlock">Active Status</label>
                                        <div class = "switch">
                                            <label>Inactive
                                            <asp:CheckBox ID="chkActive" runat="server" ClientIDMode="Static" Checked="true" TabIndex="2"/>
                                            <span class="lever"></span>Active</label>
                                        </div> 
                                    </div>
                                </div>
                                <div class="row">
                                    <% if (hdnSerialKey.Value == "ACCU-TEKT-ECHN-GIES")
                                        {%>
                                    <div class="input-field col m4">
                                        <asp:DropDownList ID="drpProductGroupAccuTek" runat="server"   AutoPostBack="true" OnSelectedIndexChanged="drpProductGroupAccuTek_SelectedIndexChanged" class="select2-theme browser-default" TabIndex="6" />
                                        <label class="active" for="drpProductGroupAccuTek">Product Category</label>
                                    </div>
                                    <%} %>

                                    <% if (hdnSerialKey.Value != "ACCU-TEKT-ECHN-GIES")
                                        {%>
                                        <div class="input-field col m4">
                                            <asp:TextBox ID="txtProductAlias" runat="server" MaxLength="50" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="3" />                                
                                            <label class="active" for="txtProductAlias">Product Alias <span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>
                                    <%} %>   
                                    <div class="input-field col m4">
                                        <asp:DropDownList ID="drpBrand" runat="server" class="select2-theme browser-default" TabIndex="4" />
                                        <label class="active" for="drpBrand">Product Brand
                                            <a href="javascript:openProductBrandInfo('add');">
                                                <img src="images/expand.png" width="30" height="20" style="padding: 5px 5px 0px 10px;" alt="Add New Product" title="Add New Product" tabindex="21" />
                                            </a>
                                        </label>
                                    </div>
                                    <div class="input-field col m4">
                                        <asp:DropDownList ID="drpProductType" runat="server" class="select2-theme browser-default" TabIndex="5">
                                            <asp:ListItem Text="General" Value="General" />
                                            <asp:ListItem Text="Finished" Value="Finished" />
                                            <asp:ListItem Text="Semi-Finished" Value="Semi-Finished" />
                                            <asp:ListItem Text="Raw Material" Value="Raw Material" />
                                        </asp:DropDownList>
                                        <label class="active" for="drpProductType">Type Of Product</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <% if (hdnSerialKey.Value != "ACCU-TEKT-ECHN-GIES")
                                        {%>
                                        <div class="input-field col m3">
                                            <asp:DropDownList ID="drpProductGroup" runat="server" class="select2-theme browser-default" TabIndex="6" />
                                            <label class="active" for="drpProductGroup">Product Category</label>
                                        </div> 
                                    <%} %>      
                                    <% if (hdnSerialKey.Value == "ACCU-TEKT-ECHN-GIES")
                                        {%>
                                        <div class="input-field col m3">
                                            <asp:TextBox ID="txtProductAliasAccuTek" runat="server" MaxLength="50" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="3" Enabled="false" />                                
                                            <label class="active" for="txtProductAliasAccuTek">Product Alias <span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>
                                    <%} %>                                                                        
                                    <div class="input-field col m3">
                                        <asp:TextBox ID="txtHSNCode" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="7" MaxLength="50" />
                                        <label class="active" for="txtHSNCode">HSN Code</label>
                                    </div>
                                    <% if (hdnSerialKey.Value == "CL45-A6R9-T34E-AS89")
                                        {%>
                                    <div class="input-field col m3">
                                        <asp:TextBox ID="txtPurcHSN" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="8"/>
                                        <label class="active" for="txtPurcHSN">Purchase HSN</label>
                                    </div>
                                    <%} %>
                                    <div class="input-field col m3">
                                        <asp:TextBox ID="txtUnit" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="8"  MaxLength="5"/>
                                        <label class="active" for="txtUnit">Product Unit</label>
                                    </div>
                                    <% if (hdnSerialKey.Value == "STX1-UP06-YU89-JK23")
                                        {%>
                                    <div class="input-field col m3">
                                        <label class="active" for="txtLRDate">Revised Date</label>
                                        <asp:TextBox ID="txtLRDate" runat="server" placeholder="" class="form-control" ClientIDMode="Static"  TextMode="Date" />
                                    </div>
                                    <%} %>
                                    <% if (hdnProductWithSerialNo.Value.ToLower() == "yes")
                                    {%>
                                    <div class="input-field col m3">
                                        <label class="active" for="chkBlock">Serial No</label>
                                        <div class = "switch">
                                            <label>Inactive
                                            <asp:CheckBox ID="chkSerialNo" runat="server" ClientIDMode="Static" Checked="true" TabIndex="2"/>
                                            <span class="lever"></span>Active</label>
                                        </div> 
                                    </div>
                                    <%} %>
                                </div>
                                <div class="row">
                                    <% if (hdnSerialKey.Value != "ACCU-TEKT-ECHN-GIES")
                                       { %>                                       
                                    <div class="input-field col m4">
                                        <asp:TextBox ID="txtUnitQuantity" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="9"  MaxLength="5" ReadOnly="true"/>
                                        <label class="active" for="txtUnitQuantity">Unit Quantity</label>
                                    </div>
                                    <% } %> 
                                    <div id="dvCeraSize" runat="server" clientidmode="Static" class="input-field col m4">
                                        <asp:TextBox ID="txtUnitSize" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="10"  MaxLength="30"/>
                                        <label class="active" for="txtUnitSize">Unit Size</label>
                                    </div>
                                    <div id="dvCeraSurface" runat="server" clientidmode="Static" class="input-field col m4">
                                        <asp:TextBox ID="txtUnitSurface" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="11"  MaxLength="30"/>
                                        <label class="active" for="txtUnitSurface">Unit Surface</label>
                                    </div>   
                                    <% if (hdnSerialKey.Value != "ACCU-TEKT-ECHN-GIES")
                                       { %>                                       
                                    <div class="input-field col m4">
                                        <asp:DropDownList ID="drpColor" runat="server" class="select2-theme browser-default" TabIndex="6" />
                                        <label class="active" for="drpColor">Product Color</label>
                                    </div>
                                    <div class="input-field col m4">
                                        <asp:DropDownList ID="drpSize" runat="server" class="select2-theme browser-default" TabIndex="6" />
                                        <label class="active" for="drpSize">Product Size</label>
                                    </div>    
                                    <% } %>    
                                </div>
                                <div id="dvCeraBox" runat="server" clientidmode="Static" class="row">
                                    <div class="input-field col m3">
                                        <asp:DropDownList ID="drpUnitGrade" runat="server" class="select2-theme browser-default" TabIndex="12">
											<asp:ListItem Text="PRM" Value="PRM" />
											<asp:ListItem Text="STD" Value="STD" />
											<asp:ListItem Text="COM" Value="COM" />
										</asp:DropDownList>
                                        <label class="active" for="txtUnitQuantity">Unit Grade</label>
                                    </div>
                                    <div class="input-field col m3">
                                        <asp:TextBox ID="txtBox_Weight" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="13"  MaxLength="12"/>
                                        <label class="active" for="txtBox_Weight">Wght Per Box</label>
                                    </div>
                                    <div class="input-field col m3">
                                        <asp:TextBox ID="txtBox_SQFT" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="14"  MaxLength="12"/>
                                        <label class="active" for="txtBox_SQFT">Sq.Ft Per Box</label>
                                    </div>
                                    <div class="input-field col m3">
                                        <asp:TextBox ID="txtBox_SQMT" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="15"  MaxLength="12"/>
                                        <label class="active" for="txtBox_SQMT">Sq.Mtr Per Box</label>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="input-field col m4">
                                        <asp:TextBox ID="txtUnitPrice" runat="server" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder=" " TabIndex="12" MaxLength="10"/>
                                        <label class="active" for="txtUnitPrice">Product Price <span class="materialize-red-text font-weight-800">*</span></label>
                                    </div>

                                    <div class="input-field col m4">
                                        <asp:TextBox ID="txtTaxRate" runat="server" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder=" " TabIndex="17" MaxLength="10"/>
                                        <label class="active" for="txtTaxRate">GST Tax %</label>
                                    </div>
                                    <div class="input-field col m4">
                                        <asp:DropDownList ID="drpTaxType" runat="server" class="select2-theme browser-default" TabIndex="18">
                                            <asp:ListItem Text="Exclusive" Value="1" />
                                            <asp:ListItem Text="Inclusive" Value="0" />
                                            <asp:ListItem Text="None" Value="2" />
                                        </asp:DropDownList> 
                                        <label class="active" for="drpTaxType">GST Tax</label>
                                    </div>
                                </div>
                            <% if (hdnSerialKey.Value == "RD41-PADF-SS42-VE1K")
                                {%>
                                <div class ="row">
                                    <div class="input-field col m4 ">
                                        <asp:TextBox ID="txtUnitLenght" runat="server" class="form-control onlyDecimal" ClientIDMode="Static"  Placeholder=" " TabIndex="12" MaxLength="10"/>
                                        <label class="active" for="txtUnitLenght">Unit Length</label>
                                    </div>
                                    <div class="input-field col m4 ">
                                        <asp:TextBox ID="txtUnitWidth" runat="server" class="form-control onlyDecimal" ClientIDMode="Static"  Placeholder=" " TabIndex="12" MaxLength="10"/>
                                        <label class="active" for="txtUnitWidth">Unit Width</span></label>
                                    </div>
                                    <div class="input-field col m4 ">
                                        <asp:TextBox ID="txtPurchasePrice" runat="server" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder=" " TabIndex="12" MaxLength="10"/>
                                        <label class="active" for="txtPurchasePrice">Purchase Price</label>
                                    </div>
                                </div>
                            <%}%>
                                <div class="row">
                                    <div class="input-field col m3">
                                        <asp:TextBox ID="txtMinQuantity" runat="server" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder=" " TabIndex="19" MaxLength="12" />
                                        <label class="active" for="txtMinQuantity">Min.Stock Qty</label>
                                    </div>
                                    <div class="input-field col m3">
                                        <asp:TextBox ID="txtMinUnitPrice" runat="server" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder=" " TabIndex="20" MaxLength="10"/>
                                        <label class="active" for="txtMinUnitPrice">Lower Price</label>
                                    </div>
                                    <div class="input-field col m3">
                                        <asp:TextBox ID="txtMaxUnitPrice" runat="server" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder=" " TabIndex="21" MaxLength="10" />
                                        <label class="active" for="txtMaxUnitPrice">Upper Price</label>
                                    </div>
                                    <% if (hdnSerialKey.Value != "ACCU-TEKT-ECHN-GIES")
                                       { %>  
                                    <div class="input-field col m3">
                                        <asp:TextBox ID="txtProfitRatio" runat="server" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder=" " TabIndex="22" MaxLength="10" />
                                        <label class="active" for="txtProfitRatio">Profit Ratio (%)</label>
                                    </div>
                                     <%}%>
                                </div>
                                <div class="row">
                                    <% if (hdnSerialKey.Value != "ACCU-TEKT-ECHN-GIES")
                                       { %>  
                                    <div class="input-field col m4">
                                        <asp:TextBox ID="txtOpeningValuation" runat="server" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder=" " TabIndex="19" MaxLength="12" />
                                        <label class="active" for="txtOpeningValuation">Opening Valuation</label>
                                    </div>
                                    <div class="input-field col m4">
                                        <asp:TextBox ID="txtOpeningWeightRate" runat="server" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder=" " TabIndex="20" MaxLength="10"/>
                                        <label class="active" for="txtOpeningWeightRate">Opening Weight Rate</label>
                                    </div>
                                     <%}%>
                                    <% if (hdnSerialKey.Value != "ACCU-TEKT-ECHN-GIES")
                                       { %> 
                                    <div class="input-field col m4">
                                        <asp:TextBox ID="txtHorsePower" runat="server" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder=" " TabIndex="20" MaxLength="10"/>
                                        <label class="active" for="txtHorsePower">Horse Power</label>
                                    </div>
                                     <%}%>
                                </div>
                                <div class="row">
                                    <% if (hdnSerialKey.Value != "ACCU-TEKT-ECHN-GIES")
                                        {%>
                                    <div class="input-field col m5">
                                        <asp:TextBox ID="txtReferenceLink" runat="server" class="form-control" ClientIDMode="Static" Placeholder=" " width="500px"/>
                                        <label class="active" for="txtReferenceLink">Reference Link</label>
                                    </div>
                                    <% } %> 
                                </div>
                                    <% if (hdnSerialKey.Value == "ACCU-TEKT-ECHN-GIES")
                                        {%>
                                <div class="row">
                                    <div class="input-field col m6">
                                        <asp:TextBox ID="txtLocation" runat="server" class="form-control" ClientIDMode="Static" Placeholder="" TabIndex="8"/>
                                        <label class="active" for="txtLocation">Location</label>
                                    </div>
                                    <div class="input-field col m6">
                                        <asp:TextBox ID="txtDrawingNo" runat="server" class="form-control" ClientIDMode="Static" Placeholder=" " TabIndex="20" MaxLength="20"/>
                                        <label class="active" for="txtDrawingNo">Drawing No</label>
                                    </div>
                                 </div>
                                <div class="row">
                                    <div class="input-field col m12">
                                        <asp:TextBox ID="txtRemarks" runat="server" class="form-control" TextMode ="MultiLine" ClientIDMode="Static" Placeholder=" " TabIndex="20"/>
                                        <label class="active" for="txtRemarks">Remarks</label>
                                    </div>
                                </div>
                                    <%}%>

                            </div>

                            <div class="input-field col m7 mt-0">
                                <div class="row" style="box-shadow: navy -6px 8px 6px -6px;">
                                    <div class="card user-card-negative-margin z-depth-0" id="feed" style="margin:0px;">
                                        <div class="card-content card-border-gray" style="height:500px;padding-top: 5px;">
                                            <div class="row">
                                                <ul id="myTab" class="tabs card-border-gray" runat="server" clientidmode="Static" enableviewstate="true">
                                                    <li class="tab col m2.5 p-0"><a id="lnkprodspecs" class="left active" href="#prodspecs" tabindex="23">Specification</a></li>
                                                    <li class="tab col m2.5 p-0"><a id="lnkshortdesc" class="left" href="#shortdesc" tabindex="35">Short Description</a></li>
                                                    <li class="tab col m2 p-0"><a id="lnkproddetail" class="left" href="#proddetail" tabindex="37">Assembly</a></li>
<%--                                                    <li class="tab col m2 p-0"><a id="lnkprodsize" class="left" href="#prodsize" tabindex="37">Size</a></li>--%>
                                                    <li class="tab col m2 p-0"><a id="lnkprodacc" class="left" href="#prodacc" tabindex="41">Accessories</a></li>
<%--                                                    <li class="tab col m2 p-0"><a id="lnkprodnew" class="left" href="#prodnew" tabindex="41">Sub Product</a></li>--%>
                                                    <li id="liBrochure" runat="server" class="tab col m2.5 p-0"><a id="lnkproddocs" class="left" href="#proddocs" tabindex="44" >Brochure</a></li>
                                                    <li id="liProdImages" runat="server" class="tab col m2.5 p-0"><a id="lnkprodimg" class="left" href="#prodimg" tabindex="46">Image Gallery</a></li>
                                                </ul>
                                            </div>
                                            <div id="prodspecs" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:block;">
                                                <div class="input-field col m12" style="height:400px; overflow-y:auto;">
                                                    <div id="container1" runat="server" clientidmode="Static" class="container">
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="row">
                                                                <div class="input-field col m12 p-0 m-0">
                                                                    
                                                                    <div id="divTabRemarks" runat="server" clientidmode="Static" class="input-field col m12 p-0  m-0">
                                                                        <table class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                            <asp:Repeater ID="rptProductSpecs" runat="server" ClientIDMode="Static" OnItemCommand="rptProductSpecs_ItemCommand">
                                                                                <HeaderTemplate>
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th class="center" style="width:15px">Order.#</th>
                                                                                            <th class="center">Group Description</th>
                                                                                            <th class="center">Head</th>
                                                                                            <th class="center">Specification</th>
                                                                                            <th class="center">Action</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>                                                                    
                                                                                    <tr class="blueShed" id="itemRow<%# Container.ItemIndex + 1 %>">
                                                                                        <asp:HiddenField ID="hdnspecpkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />
                                                                                        <asp:HiddenField ID="hdnitemOrder" runat="server" ClientIDMode="Static" Value='<%# Eval("itemOrder") %>' />
                                                                                        <td class="center-align">
                                                                                            <asp:TextBox class="form-control center" style="width:50px" ID="newOrder" runat="server" ClientIDMode="Static" TabIndex="<%# (((Container.ItemIndex + 1) * 100) + 1) %>" Text='<%# Eval("itemOrder") %>' />
                                                                                        </td>
                                                                                        <td class="center-align">
                                                                                            <asp:TextBox class="form-control center" ID="newGroupHead" runat="server" ClientIDMode="Static" TabIndex="<%# (((Container.ItemIndex + 1) * 100) + 2) %>"  Text='<%# Eval("GroupHead") %>' onblur='<%# String.Format("return editItem({0}, \"{1}\", \"{2}\");", Eval("pkID"), "GroupHead", (Container.ItemIndex + 1).ToString()) %>' />
                                                                                        </td>
                                                                                        <td class="center-align">
                                                                                            <asp:TextBox class="form-control center" ID="newMaterialHead" runat="server" ClientIDMode="Static" TabIndex="<%# (((Container.ItemIndex + 1) * 100) + 3) %>"  Text='<%# Eval("MaterialHead") %>' onblur='<%# String.Format("return editItem({0}, \"{1}\", \"{2}\");", Eval("pkID"), "MaterialHead", (Container.ItemIndex + 1).ToString()) %>' />
                                                                                        </td>
                                                                                        <td class="center-align">
                                                                                            <asp:TextBox class="form-control center" ID="newMaterialSpec" runat="server" ClientIDMode="Static" TabIndex="<%# (((Container.ItemIndex + 1) * 100) + 4) %>"  Text='<%# Eval("MaterialSpec") %>' onblur='<%# String.Format("return editItem({0}, \"{1}\", \"{2}\");", Eval("pkID"), "MaterialSpec", (Container.ItemIndex + 1).ToString()) %>' />
                                                                                        </td>
                                                                                        <td class="center-align">
                                                                                            <asp:ImageButton ID="ImgbtnDelete" runat="server" ClientIDMode="Static" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' TabIndex="<%# (((Container.ItemIndex + 1) * 100) + 6) %>" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr class="blueShed">
                                                                                        <td class="center-align" colspan="3">
                                                                                            <asp:TextBox class="form-control center" ID="newMaterialRemarks" runat="server" ClientIDMode="Static" TabIndex="<%# (((Container.ItemIndex + 1) * 100) + 5) %>"  Text='<%# Eval("MaterialRemarks") %>' onblur='<%# String.Format("return editItem({0}, \"{1}\", \"{2}\");", Eval("pkID"), "MaterialRemarks", (Container.ItemIndex + 1).ToString()) %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <tr class="blueShed mt-1" style="border-top:3px solid grey; padding-top:5px;">
                                                                                <td class="center-align">
                                                                                    <asp:TextBox class="form-control text-left" style="width:50px" ID="newOrder1" runat="server" ClientIDMode="Static" TabIndex="29" Text='<%# Eval("itemOrder") %>' />
                                                                                </td>
                                                                                <td class="center-align">
                                                                                    <asp:TextBox class="form-control text-left" ID="newGroupHead1" runat="server" ClientIDMode="Static" TabIndex="30" Text='<%# Eval("GroupHead") %>' />
                                                                                </td>
                                                                                <td class="center-align">
                                                                                    <asp:TextBox class="form-control text-left" ID="newMaterialHead1" runat="server" ClientIDMode="Static" TabIndex="31" Text='<%# Eval("MaterialHead") %>' />
                                                                                </td>
                                                                                <td class="center-align">
                                                                                    <asp:TextBox class="form-control text-left" ID="newMaterialSpec1" runat="server" ClientIDMode="Static" TabIndex="32" Text='<%# Eval("MaterialSpec") %>' />
                                                                                </td>
                                                                                <td class="center-align">
                                                                                    <asp:ImageButton CssClass="text-center" ID="btnSaveSpecAdd" runat="server" ClientIDMode="Static" ImageUrl="~/images/Buttons/bt-add.png" Width="70" Height="30" OnClick="btnSaveSpecAdd_Click"/>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="blueShed mb-1" style="border-bottom:3px solid grey; padding-bottom:5px;">
                                                                                <td class="center-align" colspan="3">
                                                                                    <asp:TextBox class="form-control text-left" ID="newMaterialRemarks1" runat="server" ClientIDMode="Static" TabIndex="33" Text='<%# Eval("MaterialRemarks") %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <div class="row">
                                                                            <div class="col m12">
                                                                                <div id="divspecmsg" class="usermsg" runat="server" clientidmode="Static"></div>
                                                                            </div>
                                                                            <div class="col m12">
                                                                                <asp:Button class="btn cyan center mr-1" ID="btnSaveSpec" runat="server" ClientIDMode="Static" Text="Save" TabIndex="34" OnClick="btnSaveSpec_Click" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>

                                                </div>
                                            </div>

                                            <div id="shortdesc" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:none;">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                <div class="row">
                                                    <div class="input-field col m12" style="height:400px; overflow-y:auto;">
                                                        <div class="row">
                                                            <div id="divRemarks" runat="server" clientidmode="Static" class="input-field col m12 p-5  m-5">
                                                                <asp:TextBox ID="txtProductSpecification" runat="server" TabIndex="36" class="content" TextMode="MultiLine" placeholder="" EnableViewState="true" ClientIDMode="Static" Style="min-height:350px;" MaxLength="500" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <%--<div id="prodnew" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:none;">
                                                <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                        <div class="row">
                                                           <div class="input-field col m8">
                                                               <label class="active" for="txtSubProductName">Product Name</label>
                                                               <asp:TextBox ID="txtSubProductName" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                           <div class="input-field col m4">
                                                               <label class="active" for="txtPCode">PCode</label>
                                                               <asp:TextBox ID="txtPCode" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"/>
                                                           </div>
                                                        </div>
                                                        <div class="row">
                                                           <div class="input-field col m4">
                                                               <label class="active" for="txtParentAPI">Parent API</label>
                                                               <asp:TextBox ID="txtParentAPI" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                           <div class="input-field col m4">
                                                               <label class="active" for="txtTitle">Title</label>
                                                               <asp:TextBox ID="txtTitle" runat="server" placeholder="" class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                           <div class="input-field col m4">
                                                               <label class="active" for="txtCategories">Categories</label>
                                                               <asp:TextBox ID="txtCategories" runat="server" placeholder="" class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                        </div>
                                                        <div class="row">
                                                           <div class="input-field col m6">
                                                               <label class="active" for="txtChemicalName">Chemical Names</label>
                                                               <asp:TextBox ID="txtChemicalName" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                           <div class="input-field col m6">
                                                               <label class="active" for="txtSynonyms">Synonyms</label>
                                                               <asp:TextBox ID="txtSynonyms" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                        </div>
                                                        <div class="row">
                                                           <div class="input-field col m6">
                                                               <label class="active" for="txtCASNo">CAS NO</label>
                                                               <asp:TextBox ID="txtCASNo" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                           <div class="input-field col m6">
                                                               <label class="active" for="txtStorage">Storage</label>
                                                               <asp:TextBox ID="txtStorage" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                        </div>
                                                        <div class="row">
                                                           <div class="input-field col m6">
                                                               <label class="active" for="txtMolecularFormula">Molecular Formula</label>
                                                               <asp:TextBox ID="txtMolecularFormula" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                           <div class="input-field col m6">
                                                               <label class="active" for="txtMolecularWeight">Molecular Weight</label>
                                                               <asp:TextBox ID="txtMolecularWeight" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                        </div>
                                                        <div class="row">
                                                           <div class="input-field col m6">
                                                               <label class="active" for="txtAppearance">Appearance</label>
                                                               <asp:TextBox ID="txtAppearance" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                           <div class="input-field col m6">
                                                               <label class="active" for="txtApplications">Applications</label>
                                                               <asp:TextBox ID="txtApplications" runat="server" placeholder=""  class="form-control" ClientIDMode="Static"  />
                                                           </div>
                                                        </div>
                                                </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>--%>

                                            <div id="proddetail" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:none;">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                <div class="row">
                                                    <div class="input-field col m12" style="height:400px; overflow-y:auto;">
                                                        <table class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%">
                                                            <asp:Repeater ID="rptProductDetail" runat="server" ClientIDMode="Static" OnItemCommand="rptProductDetail_ItemCommand">
                                                                <HeaderTemplate>
                                                                    <thead>
                                                                        <tr>
                                                                            <th class="left-align" >Product Name</th>
                                                                            <th class="center-align">Unit</th>
                                                                            <th class="center-align">Quantity</th>
                                                                            <th class="center-align">Rate</th>
                                                                            <th class="center-align">Amount</th>
                                                                            <th class="center-align">Action</th>
                                                                        </tr>
                                                                    </thead>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr class="blueShed">
                                                                        <asp:HiddenField ID="edpkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID")%>' />
                                                                        <td class="left-align" ><%# Eval("ProductName")%></td>
                                                                        <td class="center-align"><%# Eval("Unit")%></td>
                                                                        <td class="center-align">
                                                                            <asp:TextBox class="center-align form-control onlyDecimal" ID="edQuantity" runat="server" ClientIDMode="Static" Width="100px" Text='<%# Eval("Quantity")%>' TabIndex="<%# (((Container.ItemIndex + 1) * 500) + 1) %>" AutoPostBack="true" OnTextChanged="editItem_TextChangedProductDetail" />
                                                                        </td>
                                                                        <td id="tdRate" runat="server" class="center-align"><%# Eval("Rate")%></td>
                                                                        <td class="center-align"><%# Eval("Amount")%></td>
                                                                        <td class="center-align">
                                                                            <asp:ImageButton ID="imgBtnDelDetail" runat="server" ClientIDMode="Static" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="DeleteDetail" CommandArgument='<%# Eval("ProductID") %>' Width="20" Height="20" TabIndex="<%# (((Container.ItemIndex + 1) * 500) + 2) %>" />
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <tr class="blueShed">
                                                                <asp:HiddenField ID="hdnSubProductID" runat="server" ClientIDMode="Static" />
                                                                <td class="left width-100">
                                                                    <asp:TextBox class="form-control" ID="newProductName" runat="server" ClientIDMode="Static" TabIndex="381" AutoPostBack="true" onKeyup="bindDDLProductTo('#newProductName')" OnTextChanged="newProductName_TextChanged" placeholder="Min. 3 Char. To Search Product ..." />
                                                                </td>
                                                                <td class="center-align">
                                                                    <asp:TextBox class="form-control" ID="newUnit" runat="server" ClientIDMode="Static" Width="100px" TabIndex="382" style="display:inline-block;" />
                                                                </td>
                                                                <td class="center-align">
                                                                    <asp:TextBox class="form-control onlyDecimal" ID="newQuantity" runat="server" ClientIDMode="Static" Width="100px" TabIndex="383" style="display:inline-block;" AutoPostBack="true" OnTextChanged="newQuantity_TextChanged"/>
                                                                </td>
                                                                <td class="center-align">
                                                                    <asp:TextBox class="form-control onlyDecimal" ID="newRate" runat="server" ClientIDMode="Static" Width="100px" TabIndex="384" style="display:inline-block;" ReadOnly="true" />
                                                                </td>
                                                                <td class="center-align">
                                                                    <asp:TextBox class="form-control onlyDecimal" ID="newAmount" runat="server" ClientIDMode="Static" Width="100px" TabIndex="385" style="display:inline-block;" ReadOnly="true" />
                                                                </td>
                                                                <td class="center-align">
                                                                    <asp:ImageButton ID="imgBtnSaveDetail" runat="server" ClientIDMode="Static" ImageUrl="~/images/Buttons/bt-add.png" TabIndex="386" Width="70" Height="30" OnClick="imgBtnSaveDetail_Click"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>

<%--                                             <% if (hdnSerialKey.Value == "BLG3-AF78-TO5F-NW16")
                                                { %>--%>
                                                <%--<div id="prodsize" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:none;">
                                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                    <div class="row">
                                                        <div class="input-field col m12" style="height:400px; overflow-y:auto;">
                                                            <table class="stdtable" cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                                <asp:Repeater ID="rptProductSize" runat="server" ClientIDMode="Static">
                                                                    <HeaderTemplate>
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="center-align" style="width:5%;">Select</th>
                                                                                <th class="center-align" style="width: 10%; color: white;">Size Name</th>
                                                                            </tr>
                                                                        </thead>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <asp:HiddenField ID="edpkID" runat="server" ClientIDMode="Static" Value='<%#Eval("pkID") %>' />
                                                                            <%--<asp:HiddenField ID="edProductID" runat="server" ClientIDMode="Static" Value='<%#Eval("ProductID") %>' />
                                                                            <asp:HiddenField ID="edProductName" runat="server" ClientIDMode="Static" Value='<%#Eval("ProductName") %>' />
                                                                            <asp:HiddenField ID="edSizeID" runat="server" ClientIDMode="Static" Value='<%#Eval("SizeID") %>' />--%>

                                                                            <%--<td class="center-align">
                                                                                <asp:CheckBox CssClass="chkToCompare" ID="chkSelectCust" runat="server" ClientIDMode="Static" />
                                                                            </td>
                                                                            <td class="right-align">
                                                                                <asp:TextBox ID="edSizeName" runat="server" class="form-control" ClientIDMode="Static" TabIndex="101" MaxLength="250" Text='<%#Eval("SizeName") %>' ReadOnly="true"/>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>--%>
                                            <%--<% } %>--%>

                                            <div id="prodacc" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:none;">
                                                <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                <div class="row">
                                                    <div class="input-field col m12" style="height:400px; overflow-y:auto;">
                                                        <table class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%">
                                                            <asp:Repeater ID="rptAccessories" runat="server" ClientIDMode="Static" OnItemCommand="rptAccessories_ItemCommand">
                                                                <HeaderTemplate>
                                                                    <thead>
                                                                        <tr>
                                                                            <th class="left-align">Product Name</th>
                                                                            <th class="center-align">Quantity</th>
                                                                            <th class="center-align">Action</th>
                                                                        </tr>
                                                                    </thead>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr class="blueShed">
                                                                        <td class="left-align" ><%# Eval("ProductName")%></td>
                                                                        <td class="center-align"><%# Eval("Quantity")%></td>
                                                                        <td class="center-align">
                                                                            <asp:ImageButton ID="imgBtnDelDetail" runat="server" ClientIDMode="Static" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="DeleteDetail" CommandArgument='<%# Eval("ProductID") %>' Width="20" Height="20" />
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <tr class="blueShed">
                                                                <asp:HiddenField ID="hdnAccProductID" runat="server" ClientIDMode="Static" />
                                                                <td class="left width-100">
                                                                    <asp:TextBox class="form-control" ID="accProductName" runat="server" ClientIDMode="Static" TabIndex="42" AutoPostBack="true" onKeyup="bindDDLProductToAcc('#accProductName')" placeholder="Min. 3 Char. To Search Product ..." />
                                                                </td>
                                                                <td class="center">
                                                                    <asp:TextBox class="form-control onlyDecimal" ID="accQuantity" runat="server" ClientIDMode="Static" Width="100px" TabIndex="43" style="display:inline-block;" MaxLength="5"/>
                                                                </td>
                                                                <td class="center">
                                                                    <asp:ImageButton ID="imgBtnSaveDetailAcc" runat="server" ClientIDMode="Static" ImageUrl="~/images/Buttons/bt-add.png" Width="70" Height="30" OnClick="imgBtnSaveDetailAcc_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>

                                            <div id="proddocs" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:none;">
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                <div class="section app-file-manager-wrapper">
                                                <div class="app-file-overlay"></div>
                                                <div class="row">
                                                    <div class="app-file-area" style="height:400px;">
                                                        <div class="app-file-header">
                                                            <div class="row">
                                                                <div class="input-field col m12 add-new-file mt-0">
                                                                    <div class="col m12">
                                                                        <label class="active" for="uploadDocument">Upload Product Specification Document Here  </label>
                                                                    </div>
                                                                    <div class="col m12">
                                                                        <asp:FileUpload ID="uploadDocument" runat="server" ClientIDMode="Static" CssClass="Cntrl1" onchange="this.form.submit()" ToolTip="Select Only PDF File" /> 
                                                                        <asp:Button ID="btnUpload1" CssClass="hide" runat="server" Text="Upload" onclick="btnUpload1_Click"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="app-file-content">
                                                            <div class="app-file-sidebar-content row">
                                                                <div class="col m12 app-file-files">
                                                                    <asp:Repeater ID="rptProdDocs" runat="server" ClientIDMode="Static" OnItemCommand="rptProdDocs_ItemCommand">
                                                                    <ItemTemplate>
                                                                        <div class="col xl4 l6 m4 s6">
                                                                            <div class="card box-shadow-none mb-1 app-file-info">
                                                                                <div class="card-content" style="background-color:beige; padding: 10px;border-radius: 4px;border: 1px solid silver">
                                                                                <div class="app-file-content-logo grey lighten-4" style="height:100px">
                                                                                    <div class="row fonticon p2">
                                                                                        <div class="col m6">
                                                                                            <asp:LinkButton ID="ImgBtnDelete" runat="server" CommandName="Delete" TabIndex="47" CommandArgument='<%# Eval("pkID") %>'>
                                                                                            <i class="material-icons delete" style="padding: 5px 0px 0px 20px;">delete_outline</i>
                                                                                            </asp:LinkButton>
                                                                                        </div>
                                                                                        <div class="col m6">
                                                                                            <a id="lnkViewFile" onclick="ShowPDFfile('<%# Eval("FileName").ToString() %>');">
                                                                                                <i class="material-icons" style="padding: 5px 0px 0px 20px;">find_in_page</i>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                    <img class="recent-file" src="app-assets/images/icon/pdf.png" height="38" width="30" alt="Card image cap" style="display: block; margin: 5px auto;">
                                                                                </div>
                                                                                <div class="app-file-details" style="background-color:silver;border-radius: 8px; padding-left: 10px;">
                                                                                    <div class="app-file-name font-weight-700">
                                                                                        <p style="display: block;width: 180px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><%# Eval("FileName").ToString().Substring(6) %></p>
                                                                                    </div>
                                                                                </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnUpload1" />
                                                </Triggers>
                                                </asp:UpdatePanel>
                                            </div>

                                            <div id="prodimg" class="row" runat="server" clientidmode="Static" enableviewstate="true" style="display:none;">
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                <div class="row">
                                                    <div class="col s12">
<%--                                                        <ul class="collapsible collapsible-accordion">
                                                            <li>--%>
<%--                                                                <div class="collapsible-header purple lightrn-1 white-text"><i class="material-icons">settings_backup_restore</i> Primary Image</div>
                                                                <div class="collapsible-body purple lighten-5 padding-1">--%>
                                                                    <div class="section app-file-manager-wrapper no-margin border-none">
                                                                        <div class="app-file-overlay"></div>
                                                                        <div class="app-file-area">
                                                                                <div class="app-file-header">
                                                                                    <div class="row">
                                                                                        <div class="input-field col m12 add-new-file mt-0">
                                                                                            <div class="col m12">
                                                                                                <label class="active" for="uploadDocument">Upload Product Image ...</label>
                                                                                            </div>
                                                                                            <div class="col m12">
                                                                                                <asp:FileUpload ID="FileUpload1" runat="server" ClientIDMode="Static" CssClass="Cntrl1" onchange="this.form.submit()" ToolTip="Select Only PDF File" /> 
                                                                                                <asp:Button ID="Button2" CssClass="hide" runat="server" Text="Upload" TabIndex="48" onclick="btnUpload1_Click" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="app-file-content">
                                                                                    <div id="divImageControl2 col m12">
                                                                                        <div class="col m3 center-align" style="padding: 10px;border-radius: 4px;border: 1px solid silver;">
                                                                                            <asp:Image ID="imgProduct" runat="server" ClientIDMode="Static" Width="100" Height="100" TabIndex="49" ImageUrl="images/noimage.png" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div id="divImageControl3 col m12">
                                                                                    <asp:ImageButton ID="btnDeleteImg" runat="server" ClientIDMode="Static" ImageUrl="~/images/delete.png" ToolTip="Delete" OnClick="btnDeleteImg_Click" Width="20" Height="20" TabIndex="39" />
                                                                                </div>

                                                                            </div>
                                                                    </div>
<%--                                                                </div>--%>
<%--                                                            </li>
                                                            <li>--%>
<%--                                                                <div class="collapsible-header cyan white-text"><i class="material-icons">toll</i> Additional Image Gallery</div>
                                                                <div class="collapsible-body cyan lighten-5 lighten-5 padding-1">--%>
                                                                    <div class="section app-file-manager-wrapper no-margin  border-none">
                                                                    <div class="app-file-overlay"></div>
                                                                        <div class="app-file-area" style="height:400px; overflow-y:auto;">
                                                                            <div class="app-file-header">
                                                                                <div class="row">
                                                                                    <div class="input-field col m12 add-new-file mt-0">
                                                                                        <div class="col m12">
                                                                                            <label class="active" for="FileUpload2">Upload Image Gallery</label>
                                                                                        </div>
                                                                                        <div class="col m12">
                                                                                            <asp:FileUpload ID="uploadImgGallery" multiple="multiple" runat="server" ClientIDMode="Static" CssClass="Cntrl1" onchange="this.form.submit()" ToolTip="Select Only PDF File" /> 
                                                                                            <asp:Button ID="btnUpload3" CssClass="hide" runat="server" Text="Upload" TabIndex="45" onclick="btnUpload3_Click" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="app-file-content">
                                                                                <div class="app-file-sidebar-content row">
                                                                                    <div class="col m12 app-file-files">
                                                                                        <asp:Repeater ID="rptProductImages" runat="server" ClientIDMode="Static" OnItemCommand="rptProductImages_ItemCommand">
                                                                                        <ItemTemplate>
                                                                                            <div class="col m4">
                                                                                                <div class="card box-shadow-none mb-1 app-file-info">
                                                                                                    <div class="row col m12 p-0">
                                                                                                        <div class="col m6 p-0 left-align">
                                                                                                            <asp:LinkButton ID="ImgBtnDelete" runat="server" CommandName="Delete" TabIndex="47" CommandArgument='<%# Eval("pkID") %>'>
                                                                                                            <i class="material-icons delete" style="padding: 5px 0px 0px 20px;">delete_outline</i>
                                                                                                            </asp:LinkButton>
                                                                                                        </div>
                                                                                                        <div class="col m6 p-0 right-align">
                                                                                                            <a id="lnkViewFile">
                                                                                                                <i class="material-icons" style="padding: 5px 0px 0px 20px;">find_in_page</i>
                                                                                                            </a>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="card-content" style="background-color:beige; padding: 10px;border-radius: 4px;border: 1px solid silver">
                                                                                                    <div class="app-file-content-logo grey lighten-4" style="height:100px">
                                                                                                            
                                                                                                        <div class="row fonticon p2" style="background:url('<%# "productimages/" + Eval("Name").ToString() %>') no-repeat top center; background-size:cover; width: 150px; height: 98px; margin-left: 10px;">

                                                                                                        </div>
                                                                                                        <%--<img class="recent-file" src='<%# "productimages/" + Eval("Name").ToString() %>' height="38" width="30" alt="Card image cap" style="display: block; margin: 5px auto;">--%>
                                                                                                    </div>
                                                                                                    <div class="app-file-details" style="background-color:silver;border-radius: 8px; padding-left: 10px;">
                                                                                                        <div class="app-file-name font-weight-700">
                                                                                                            <p style="display: block;width: 180px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><%# Eval("Name").ToString() %></p>
                                                                                                        </div>
                                                                                                        
                                                                                                    </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </ItemTemplate>
                                                                                        </asp:Repeater>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
<%--                                                                </div>
                                                            </li>
                                                        </ul>--%>
                                                    </div>
                                                 </div>

                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnUpload1" />
                                                    <asp:PostBackTrigger ControlID="btnDeleteImg" />
                                                </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% if (hdnLocationStockWisePosting.Value == "yes")
                            { %> 
                                 <div id="LocationStock" runat="server" class="row border-radius-5" style="border:2px solid navy;">
                                    <h5 class="card-title left-align width-100 white-text gradient-45deg-indigo-purple" style="min-height:35px; padding:8px;">Stock Information</h5>
                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                        <div class="row">
                                                            <div class="input-field col m12" style="height:400px; overflow-y:auto;">
                                                                <table class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                    <asp:Repeater ID="rptStockBalance" runat="server" ClientIDMode="Static" OnItemCommand="rptStockBalance_ItemCommand">
                                                                        <HeaderTemplate>
                                                                            <thead>
                                                                                <tr>
                                                                           
                                                                                    <th class="left-align" >Location Name</th>
                                                                                    <th class="center">Opening Stock</th>
                                                                                    <th class="center">Inward Stock</th>
                                                                                    <th class="center">Outward Stock</th>
                                                                                    <th class="center">Closing Stock</th>
                                                                                    <th class="center">Minimum Stock</th>
                                                                                </tr>
                                                                            </thead>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <tr class="blueShed">
                                                                                <asp:HiddenField ID="hdnLocationID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />

                                                                                <td class="left-align" ><%# Eval("LocationName")%></td>
                                                                                <td class="right-align width-6">
                                                                                    <asp:TextBox ID="edOpeningSTK" runat="server" ClientIDMode="Static" Text='<%# Eval("OpeningSTK") %>' AutoPostBack="true" OnTextChanged="edOpeningSTK_TextChanged" Style="width: 150px; text-align: right;"  TabIndex="64"/>
                                                                                </td>
                                                                               <%-- <td class="center"><%# Eval("OpeningSTK")%></td>--%>
                                                                                <td class="center"><%# Eval("InwardSTK")%></td>
                                                                                <td class="center"><%# Eval("OutwardSTK")%></td>
                                                                                <td class="center"><%# Eval("ClosingSTK")%></td>
<%--                                                                                <td class="center"><%# Eval("MinimumLocationSTK")%></td>--%>
                                                                                <td class="right-align width-6">
                                                                                    <asp:TextBox ID="edMinimumLocationSTK" runat="server" ClientIDMode="Static" Text='<%# Eval("MinimumLocationSTK") %>' AutoPostBack="true" OnTextChanged="edOpeningSTK_TextChanged" Style="width: 150px; text-align: right;"  TabIndex="64"/>
                                                                                </td>                                                                        
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        </ContentTemplate>
                                     </asp:UpdatePanel>
                                </div>                                                       
                        <% } %> 
                        
                        <% else 
                            { %> 
                        <div class="row border-radius-5" style="border:2px solid navy;">
                            <h5 class="card-title left-align width-100 white-text gradient-45deg-indigo-purple" style="min-height:35px; padding:8px;">Stock Information</h5>
                            <div class="input-field col m3">
                                <asp:TextBox ID="txtOpeningSTK" runat="server" MaxLength="50" class="form-control onlyDecimal" ClientIDMode="Static" Placeholder="" TabIndex="44" AutoPostBack="true" OnTextChanged="txtOpeningSTK_TextChanged" /> 
                                <label class="active" for="txtOpeningSTK">Opening Stock</label>
                            </div>
                            <div class="input-field col m3">
                                <asp:TextBox ID="txtInwardSTK" runat="server" MaxLength="50" class="form-control" ClientIDMode="Static" ReadOnly="true" Placeholder=""  />                                
                                <label class="active" for="txtInwardSTK">Inward Stock</label>
                            </div>
                            <div class="input-field col m3">
                                <asp:TextBox ID="txtOutwardSTK" runat="server" MaxLength="50" class="form-control" ClientIDMode="Static" ReadOnly="true" Placeholder="" />                                
                                <label class="active" for="txtOutwardSTK">Outward Stock</label>
                            </div>
                            <div class="input-field col m3">
                                <asp:TextBox ID="txtClosingSTK" runat="server" MaxLength="50" class="form-control" ClientIDMode="Static" ReadOnly="true" Placeholder="" />                                
                                <label class="active" for="txtClosingSTK">Closing Stock</label>
                            </div>
                        </div>
                        <% } %> 

                        <div class="row">
                            <div class="input-field col m12">
                                <div id="divErrorMessage" class="usermsg" runat="server" clientidmode="Static"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom center-align yellow-text" id="divRestriction" runat="server" clientidmode="Static" style="display:none;margin-top:10px;margin-bottom:10px; font-size:20px;" />
                    <div id="btnPanel" runat="server" clientidmode="Static" class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom" style="margin-top:10px;">
                        <button ID="btnReset" type="button" runat="server" Text="Reset" class="btn orange left" onserverclick="btnReset_Click" tabIndex="46"><i class="material-icons left">backspace</i>Clear & Add New</button>
                        <button ID="btnSave" type="button" runat="server" Text="Save" class="btn cyan right mr-1" onserverclick="btnSave_Click" tabindex="45"><i class="material-icons left">save</i>Save</button>
                    </div>
                </div>
            </div>
         <%-- PopUp Modal Box to Open Window --%>
        <asp:Button ID="Button1" CssClass="hide" runat="server" Text="Fill Form in Popup" />
        <cc1:ModalPopupExtender ID="myModalPopup" BehaviorID="mpe" runat="server" ClientIDMode="Static" PopupControlID="Panl1" TargetControlID="Button1" CancelControlID="Button2" BackgroundCssClass="Background">
        </cc1:ModalPopupExtender>
        <asp:Panel ID="Panl1" runat="server" CssClass="Popup" Style="display: none; border-radius: 10px; padding-right: 10px !important;">
            <div id="myModal123">
                <div class="modal-header position-sticky gradient-45deg-light-blue-indigo m-0" style="margin-bottom: 10px !important;">
                    <h5 class=" z-depth-5" style="font-size: 2rem !important; font-weight: 800; line-height: 50px; margin: 0; text-align: left; padding-left: 15px;">
                        <i class="material-icons prefix">ac_unit</i>
                        <span id="spnModuleHeader" runat="server" clientidmode="static">Manage Module</span>
                        <asp:Button CssClass="btnTopRightCorner float-right" ID="Button3" runat="server" Text="" />
                    </h5>
                </div>
            </div>
            <iframe id="ifrModule" src="about:blank" runat="server" clientidmode="static" scrolling="auto" style="border: 1px solid silver; background-color: transparent; width: 100%; height: 90%; padding: 5px;"></iframe>
            <br />
        </asp:Panel>

        <script type="text/javascript">
            $("input").keypress(function (event) {
                if (event.which == 13) {
                    event.preventDefault();
                }
            });
            function setAssemblyPosition()
            {
                $('html, body').animate({
                    scrollTop: $("#proddetail").offset().top + $("#proddetail")[0].scrollHeight
                }, 2000);
                return false;
            }
            // -------------------------------------------------------------
            function bindDDLProductTo(selector) {
                if ($(selector).val().length >= 3) {
                    jQuery.ajax({
                        type: "POST",
                        url: "InquiryInfo.aspx/FilterProduct",
//                        data: '{pProductName:\'' + $(selector).val() + '\', pSearchModule:\'ProductSearchTypePurchaseBill\'}',
                        data: '{pProductName:\'' + $(selector).val() + '\', pSearchModule:\'ProductSearchTypeQuotation\''+'}',
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
                                    $("#hdnSubProductID").val(item.data('langname'));
                                    $("#newQuantity").focus();
                                }
                            });

                        },
                        error: function (r) { alert('Error : ' + r.responseText); },
                        failure: function (r) { alert('failure'); }
                    });
                    return false;
                }
            }
            // -------------------------------------------------------------
            function bindDDLProductToAcc(selector) {
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
                                    $("#hdnAccProductID").val(item.data('langname'));
                                    $("#accQuantity").focus();
                                }
                            });

                        },
                        error: function (r) { alert('Error : ' + r.responseText); },
                        failure: function (r) { alert('failure'); }
                    });
                    return false;
                }
            }
            // -------------------------------------------------------------
            //$(function () {
            //    var tabName = $("[id*=hdnCurrentTab]").val() != "" ? $("[id*=hdnCurrentTab]").val() : "prodspecs";
            //    $('#myTab a[href="#' + tabName + '"]').tab('show');
            //    $("#myTab a").click(function () {
            //        $("[id*=hdnCurrentTab]").val($(this).attr("href").replace("#", ""));
            //    });
            //});
        </script>
        </div>
    </form>
</body>
</html>