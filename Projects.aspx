
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="StarsProject.Projects" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link  href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="plugins/bootstrap/js/bootstrap.min.js"></script>
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

    <style type="text/css">
        .required:after {
            content: " *";
            color: #f00;
        }
        
    </style>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            $('.timepicker').timepicker();
        });
        // ------------------------------------------------------------------------
        //  Open Bootstrap Modal Popup 
        // ------------------------------------------------------------------------
        function validateForm() {
            var errmsg = "";
            var validflag = true;
            // ----------------------------------------
            if (jQuery("#txtStartDate").val() == "" || jQuery("#txtDueDate").val() == ""  || jQuery("#txtProjectName").val() == "") {

                if (jQuery("#txtProjectName").val() == "")
                    errmsg += "Project Name is required</br>";

                if (jQuery("#txtStartDate").val() == "")
                    errmsg += "Start Date is required</br>";

                if (jQuery("#txtDueDate").val() == "")
                    errmsg += "Due Date is required</br>";

                //if (jQuery("#txtCompletionDate").val() == "")
                //    errmsg += "Completion Date is required</br>";

                jQuery("#divErrorMessage").html(errmsg).css("color","red").show();

                validflag = false;
            }
            // ----------------------------------------
            return validflag;
        }
        function openRegion(cat) {
            var pageUrl = "ManageCity.aspx?mode=add&id=0";
            spnPageModuleHeader.innerText = "Manage Region";
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }
    </script>

</head>
<body class="loginpage">
    <form id="frmEntry" runat="server">
    <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>

    <div id="contentwrapper" class="contentwrapper">

        <%--<asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
                <div class="widgetbox">
                    <%-- Bootstrap INQUIRY INFO Modal Popup --%>
                    <div class="clearall"></div>
                    <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="hdnSerialKey" runat="server" ClientIDMode="Static" />


                    <div id="myModal" style="display:block; width:100%;">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="input-field col m">
                                        <label class="active required" for="txtProjectName">Project Name</label>
                                        <asp:TextBox ID="txtProjectName" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" MaxLength="50" placeholder=""/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col m3">
                                        <label class="active required" for="txtStartDate">Start Date</label>
                                        <asp:TextBox ID="txtStartDate" runat="server" class="form-control" ClientIDMode="Static" TabIndex="3" placeholder="" TextMode="Date" />
                                    </div>
                                    <div class="input-field col m3">
                                        <label class="active required" for="txtDueDate">Due Date</label>
                                        <asp:TextBox ID="txtDueDate" runat="server" class="form-control" ClientIDMode="Static" TabIndex="3" placeholder="" TextMode="Date" />
                                    </div>
                                    <div class="input-field col m3">
                                        <label class="active" for="txtCompletionDate">Completion Date</label>
                                        <asp:TextBox ID="txtCompletionDate" runat="server" class="form-control " TextMode="Date" ClientIDMode="Static" TabIndex="3" placeholder="" />
                                    </div>
                                </div>
                                <div id ="divAddress" runat ="server" >
                                    <div class="row" style="width:100%">
                                        <div class="input-field col m12">
                                            <asp:TextBox ID="txtAddress" runat="server" class="form-control" Placeholder="" TabIndex="34" MaxLength="100"  ClientIDMode="Static" TextMode="MultiLine"/>
                                            <label class="active" for="txtAddress">Address </label>
                                        </div>
                                    </div>
                                    <div class="row" style="width:100%">
                                        <div class="input-field col m4">
                                            <asp:TextBox ID="txtArea" runat="server" TabIndex="35" class="form-control"  ClientIDMode="Static" Placeholder="" MaxLength="100"  />
                                            <label class="active" for="txtArea">Area</label>
                                        </div>
                                        <div class="input-field col m4">
                                            <asp:DropDownList ID="drpCountry" class="select2-theme browser-default"  runat="server"  ClientIDMode="Static" TabIndex="36" AutoPostBack="true"  OnSelectedIndexChanged="drpCountry_SelectedIndexChanged"/>
                                            <label class="active" for="drpCountry">Country 
                                                <a href="javascript:openRegion('add');">
                                                    <img src="images/RegionAdd.jpg" width="20" height="20" alt="Add Country" title="Add Country" />
                                                </a>
                                            </label>
                                        </div>
                                        <div class="input-field col m4">
                                            <asp:DropDownList ID="drpState" class="select2-theme browser-default"  runat="server"  ClientIDMode="Static" TabIndex="37" AutoPostBack="true"  OnSelectedIndexChanged="drpState_SelectedIndexChanged"/>
                                            <label class="active" for="drpState">State 
                                                <a href="javascript:openRegion('add');">
                                                    <img src="images/RegionAdd.jpg" width="20" height="20" alt="Add State" title="Add State" />
                                                </a>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row" style="width:100%">
                                        <div class="input-field col m6">
                                            <asp:DropDownList ID="drpCity" class="select2-theme browser-default" runat="server"  ClientIDMode="Static" TabIndex="38" />
                                            <label class="active" for="drpCity">City 
                                                <a href="javascript:openRegion('add');">
                                                    <img src="images/RegionAdd.jpg" width="20" height="20" alt="Add City" title="Add City" />
                                                </a>
                                            </label>
                                        </div>
                                        <div class="input-field col m6">
                                            <asp:TextBox ID="txtPincode" runat="server" TabIndex="39" class="form-control"  ClientIDMode="Static" Placeholder="" MaxLength="10"/>
                                            <label class="active" for="txtPincode">Pincode</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2 badge-secondary" style="border-radius: 5px; padding: 5px;">
                                    <div class="input-field col m12">
                                        <label class="active" for="txtProjectDescription" style="color:white !important;">Project Description</label>
                                        <asp:TextBox ID="txtProjectDescription" runat="server" class="form-control" ClientIDMode="Static" TabIndex="6" TextMode="MultiLine" MaxLength="100" Rows="3" placeholder=""/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col m12">
                                        <div id="divErrorMessage" class="usermsg" runat="server" clientidmode="Static"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnSave" runat="server" ClientIDMode="Static" Text="Save" class="btn btn-primary" OnClientClick="return validateForm();" OnClick="btnSave_Click" TabIndex="10" />
                                <asp:Button ID="btnReset" runat="server" ClientIDMode="Static" Text="Reset" class="btn btn-primary" OnClick="btnReset_Click" TabIndex="10" />
                            </div>
                        </div>
                    </div>
                </div>
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
    </form>
</body>
</html>