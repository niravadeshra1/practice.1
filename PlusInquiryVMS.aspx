<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlusInquiryVMS.aspx.cs" Inherits="StarsProject.PlusInquiryVMS" %>

<!DOCTYPE html>

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
    <form id="frmEntry" runat="server" autocomplete="off">
        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
        <div id="contentwrapper" class="contentwrapper" style="padding:20px 15px;">
            <asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="widgetbox">
                       
                        <%-- Bootstrap Modal Popup --%>
                        <div class="clearall"></div>
                        <asp:HiddenField ID="hdnpkId" runat="server" ClientIDMode="Static" />
                        <div id="myModal" style="display: block; width: 100%;">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="input-field col m4">
                                            <asp:TextBox ID="txtFirstName" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" placeholder="Enter First Name" />
                                            <label class="active" for="txtFirstName">First Name <span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>
                                        <div class="input-field col m4">
                                            <asp:TextBox ID="txtLastName" runat="server" ClientIDMode="Static" class="form-control" TabIndex="1" MaxLength="50" placeholder="Enter Last Name" />
                                            <label class="active" for="txtLastName">Last Name <span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col m4">
                                            <label class="active" for="drpIAm">I am <span class="materialize-red-text font-weight-800">*</span></label>
                                                <asp:DropDownList ID="drpIAm" runat="server" ClientIDMode="Static" TabIndex="3" class="select2-theme browser-default ml-1" Style="height: inherit;" >
                                                    <asp:ListItem Text="---Select Customer Type---" Value="" Selected="True" />
                                                    <asp:ListItem Text="Customer" Value="Customer" />
                                                    <asp:ListItem Text="Dealer" Value="Dealer" />
                                                    <asp:ListItem Text="Fabricator" Value="Fabricator" />
                                                    <asp:ListItem Text="InteriorDesigner" Value="Interior Designer" />
                                                    <asp:ListItem Text="Architect" Value="Architect" />
                                                </asp:DropDownList>
                                        </div>
                                        <div class="input-field col m4">
                                            <label class="active" for="drpLeadSource">Lead Source <span class="materialize-red-text font-weight-800">*</span></label>
                                                <asp:DropDownList ID="drpLeadSource" runat="server" ClientIDMode="Static" TabIndex="3" class="select2-theme browser-default ml-1" Style="height: inherit;" >
                                                    <asp:ListItem Text="---Select Customer Type---" Value="" Selected="True" />
                                                    <asp:ListItem Text="Instagram" Value="Instagram" />
                                                    <asp:ListItem Text="WhatsApp" Value="WhatsApp" />
                                                    <asp:ListItem Text="IndiaMart" Value="IndiaMart" />
                                                </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col m4">
                                            <label class="active" for="drpProduct"> Product<span class="materialize-red-text font-weight-800">*</span></label>
                                                <asp:DropDownList ID="drpProduct" runat="server" ClientIDMode="Static" TabIndex="3" class="select2-theme browser-default ml-1" Style="height: inherit;" >
                                                    <asp:ListItem Text="---Select Customer Type---" Value="" Selected="True" />
                                                    <asp:ListItem Text="SLIM PARTITION" Value="SLIM PARTITION" />
                                                    <asp:ListItem Text="OFFICE PARTITION" Value="OFFICE PARTITION" />
                                                    <asp:ListItem Text="OPENABLE WARDROBE" Value="OPENABLE WARDROBE" />
                                                    <asp:ListItem Text="SLIDING WARDROBE" Value="SLIDING WARDROBE" />
                                                    <asp:ListItem Text="KITCHEN SHUTTER" Value="KITCHEN SHUTTER" />
                                                    <asp:ListItem Text="OTHER" Value="OTHER" />
                                                </asp:DropDownList>
                                        </div>                                        
                                    </div>
                                    <div class="row">
                                        <div class="input-field col m4">
                                            <asp:TextBox ID="txtContactNum" runat="server" ClientIDMode="Static" class="form-control" TabIndex="4" MaxLength="50" placeholder="Enter Contact Number" />
                                            <label class="active" for="txtContactNum">Contact Number<span class="materialize-red-text font-weight-800">*</span></label>
                                        </div>
                                        <div class="input-field col m4">
                                            <asp:TextBox ID="txtCity" runat="server" ClientIDMode="Static" class="form-control" TabIndex="5" MaxLength="50" placeholder="Enter City" />
                                            <label class="active" for="txtCity">City</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col m4">
                                            <asp:TextBox ID="txtEmail" runat="server" ClientIDMode="Static" class="form-control" TabIndex="5" MaxLength="50" placeholder="Enter Email Id" />
                                            <label class="active" for="txtEmail">Email ID</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom" style="margin-top:40px;">
                            <button ID="btnReset" type="button" runat="server"  clientidmode="Static" Text="Reset" class="btn orange left" onserverclick="btnReset_Click" TabIndex="6"><i class="material-icons left">backspace</i>Clear & Add New</button>
                            <button ID="btnSave" type="button" runat="server" clientidmode="Static" Text="Save" class="btn cyan right mr-1" onserverclick="btnSave_Click" TabIndex="7"><i class="material-icons left">save</i>Save</button>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>

