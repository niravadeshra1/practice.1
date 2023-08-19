<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Type.aspx.cs" Inherits="StarsProject.Type" %>

<!DOCTYPE html>

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

        function clearFormData() {
            jQuery(".usermsg").empty();
            jQuery('#form1').find('input:text, input:password, input:file, select, textarea').val('');
            jQuery("#hdnPkIDEmp").val('');
        }
    </script>

</head>
<body class="loginpage">
    <form id="frmEntry" runat="server">
        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
        <div id="contentwrapper" class="contentwrapper" style="padding:20px 15px;">
            <asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="widgetbox">
                        <%--<asp:HiddenField ID="hdnTypeID" runat="server" ClientIDMode="Static" />--%>
                        <%-- Bootstrap Modal Popup --%>
                        <div class="clearall"></div>
                        <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
                        <div id="myModal" style="display: block; width: 100%;">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="input-field col m4">
                                            <asp:TextBox ID="txtTypeName" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" placeholder="Enter Type Name" />
                                            <label class="active" for="txtTypeName">Type Name <span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col m3">
                                            <asp:TextBox ID="txtTestPotential" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" placeholder=" " />
                                            <label class="active" for="txtTestPotential">Test Potential<span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>
                                        <div class="input-field col m3">
                                            <asp:TextBox ID="txtWorkPotential" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" placeholder=" " />
                                            <label class="active" for="txtWorkPotential">Working Potential<span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>
                                        <div class="input-field col m3">
                                            <asp:TextBox ID="txtRS" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" placeholder=" " />
                                            <label class="active" for="txtRS">Ruppes<span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>
                                        <div class="input-field col m3">
                                            <asp:TextBox ID="txtPackingBags" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" placeholder=" " />
                                            <label class="active" for="txtPackingBags">Packing Bags<span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col m2">
                                            <asp:TextBox ID="txtLeakage" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" PlaceHolder="" />
                                            <label class="active" for="txtLeakage">Leakage Current<span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>                                    
                                        <div class="input-field col m2">
                                            <asp:TextBox ID="txtStrength" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" PlaceHolder="" />
                                            <label class="active" for="txtStrength">Tensile Strength Average</label>
                                        </div>
                                        <div class="input-field col m2">
                                            <asp:TextBox ID="txtStrengthMpa" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" PlaceHolder="" />
                                            <label class="active" for="txtStrengthMpa">Tensile Strength MPa</label>
                                        </div>
                                        <div class="input-field col m2">
                                            <asp:TextBox ID="txtElonBreak" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" PlaceHolder="" />
                                            <label class="active" for="txtElonBreak">Elongation Break</label>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="input-field col m3">
                                            <asp:TextBox ID="txtPresentPer" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" PlaceHolder="" />
                                            <label class="active" for="txtPresentPer">Elongation Break Present Percentage</label>
                                        </div>
                                        <div class="input-field col m3">
                                            <asp:TextBox ID="txtMAXPer" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" PlaceHolder="" />
                                            <label class="active" for="txtMAXPer">Tenion Max Average</label>
                                        </div>
                                        <div class="input-field col m3">
                                            <asp:TextBox ID="txtPuncture" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" PlaceHolder="" />
                                            <label class="active" for="txtPuncture">Puncture Redidtance</label>
                                        </div>
                                        <div class="input-field col m3">
                                            <asp:TextBox ID="txtMoinsture" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" PlaceHolder="" />
                                            <label class="active" for="txtMoinsture">Moisture Ansorpation</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom" style="margin-top:40px;">
                            <button ID="btnReset" type="button" runat="server"  clientidmode="Static" Text="Reset" class="btn orange left" onserverclick="btnReset_Click" TabIndex="2"><i class="material-icons left">backspace</i>Clear & Add New</button>
                            <button ID="btnSave" type="button" runat="server" clientidmode="Static" Text="Save" class="btn cyan right mr-1" onserverclick="btnSave_Click" TabIndex="3"><i class="material-icons left">save</i>Save</button>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
