<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InwardQCTest.aspx.cs" Inherits="StarsProject.InwardQCTest" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="apple-touch-icon" href="app-assets/images/favicon/apple-touch-icon-152x152.png"/>
    <link rel="shortcut icon" type="image/x-icon" href="app-assets/images/favicon/favicon-32x32.png"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css"/>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/flag-icon/css/flag-icon.min.css"/>
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
            //$('.datepicker').datepicker({ format: "dd/mm/yyyy" });
            //$('.timepicker').timepicker();
        });
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

        function showErrorPopup(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:none;">' + xMsg + '</ul>', displayLength: 4000 });
        }
        // ------------------------------------------------------------------------
        //  Open Bootstrap Modal Popup 
        // ------------------------------------------------------------------------
        //function validateForm() {
        //    var errmsg = "";
        //    var validflag = true;
        //    // ----------------------------------------
        //    if (jQuery("#txtBundleName").val().trim() == "") {

        //        if (jQuery("#txtBundleName").val().trim() == "")
        //            errmsg += "Bundle Name is required</br>";

        //        validflag = false;
        //    }
        //    // ----------------------------------------
        //    if (validflag == false) {
        //        showcaseError(errmsg);
        //    }
        //    return validflag;
        //}

        function clearFormData() {
            jQuery(".usermsg").empty();
            jQuery('#form1').find('input:text, input:password, input:file, select, textarea').val('');
            jQuery("#hdnPkIDEmp").val('');
        }
    </script>

</head>
<body class="loginpage">
    <form id="frmEntry" runat="server">
        <asp:HiddenField ID="hdnInwardNo" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />

        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
        <div id="contentwrapper" class="contentwrapper" style="padding:20px 15px;">
            <asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="widgetbox">
                        <%--<asp:HiddenField ID="hdnColorID" runat="server" ClientIDMode="Static" />--%>
                        <%-- Bootstrap Modal Popup --%>
                        <div class="clearall"></div>
                        <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
                        <div id="myModal" style="display: block; width: 100%;">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="input-field col m2">
                                            <label class="active" for="txtActual">Actual<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtActual" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="1" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtUnit">Unit<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtUnit" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="2" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtVisual">Visual<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtVisual" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="3" />
                                        </div>
                                         <div class="input-field col m2">
                                            <label class="active" for="txtTall">Tol(%)<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtTall" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="4" />
                                        </div>
                                    </div>
                                    <%-- 222222222222222222222222 --%>
                                    <div class="row">           
                                        <div class="input-field col m2">
                                            <label class="active" for="txtOne">1<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtOne" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="5"  />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtTwo">2<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtTwo" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="6" />
                                        </div>
                                    <%--</div>--%>
                                    <%-- 3333333333333333333333 --%>
                                    <%--<div class="row">--%>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtThree">3<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtThree" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="7" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtFour">4<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtFour" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="8" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtFive">5<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtFive" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="9" />
                                        </div>
                                    </div>
                                    <%-- 444444444444444444444 --%>
                                    <div class="row">
                                        <div class="input-field col m2">
                                            <label class="active" for="txtSamplingQty">sampling Qty<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtSamplingQty" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="10" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtRejectionQty">Rejection Qty<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtRejectionQty" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="11" />
                                        </div>
                                        <div class="input-field col m2">
                                            <label class="active" for="txtCheckBy">Checked By<span class="materialize-red-text font-weight-800">*</span></label>
                                            <asp:TextBox ID="txtCheckBy" runat="server" class="form-control" ClientIDMode="Static" placeholder="" TabIndex="12" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom" style="margin-top:40px;">
                            <%--<button ID="btnReset" type="button" runat="server"  clientidmode="Static" Text="Reset" class="btn orange left" onserverclick="btnReset_Click" TabIndex="2"><i class="material-icons left">backspace</i>Clear & Add New</button>--%>
                            <button ID="btnSave" type="button" runat="server" clientidmode="Static" Text="Save" class="btn cyan right mr-1" onserverclick="btnSave_Click" TabIndex="13"><i class="material-icons left">save</i>Save</button>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
