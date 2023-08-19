<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterMenu.aspx.cs" Inherits="StarsProject.MasterMenu" %>

<%@ Register Assembly='AjaxControlToolkit' Namespace='AjaxControlToolkit' TagPrefix='cc1' %>
<!DOCTYPE html>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head runat='server'>
    <title></title>
    <link rel='stylesheet' type='text/css' href='app-assets/vendors/vendors.min.css' />
    <link rel='stylesheet' type='text/css' href='app-assets/vendors/flag-icon/css/flag-icon.min.css' />
    <link rel='stylesheet' type='text/css' href='app-assets/css/pages/form-select2.min.css' />
    <link rel='stylesheet' type='text/css' href='app-assets/css/themes/vertical-modern-menu-template/materialize.css' />
    <link rel='stylesheet' type='text/css' href='app-assets/css/themes/vertical-modern-menu-template/style.css' />
    <link rel='stylesheet' type='text/css' href='app-assets/css/custom/custom.css' />
    <script type='text/javascript' src='<%=ResolveUrl("js/plugins/jquery-1.7.min.js") %>'></script>
    <script type='text/javascript' src='app-assets/js/vendors.min.js'></script>
    <script type='text/javascript' src='plugins/daterangepicker/moment.js'></script>
    <link rel='stylesheet' href='app-assets/vendors/select2/select2.min.css' type='text/css' />
    <link rel='stylesheet' href='app-assets/vendors/select2/select2-materialize.css' type='text/css' />
    <link href='css/jquery.auto-complete.css' rel='stylesheet' />
    <script type='text/javascript' src='js/jquery.auto-complete.min.js'></script>
    <script type='text/javascript' src='js/dataValidation.js'></script>
    <script type='text/javascript' src='js/myGeneric.js'></script>
    <script type='text/javascript'>
        $(document).ready(function () {
            //$('.datepicker').datepicker({ format: 'dd/mm/yyyy' });
            //$('.timepicker').timepicker();
        });
        /*---------------------------------------------------------*/
        function showcaseError(xMsg) {
            M.toast({ html: "<ul id='ulToast' style='list-style:circle;'>" + xMsg + "</ul>", displayLength: 4000 });
        }

        function showcaseMessage(xText, xIcon) {
            xText = (xText == '') ? 'Action Performed !' : xText;
            xIcon = (xIcon == '') ? 'Info' : xIcon;
            swal({ title: 'Message', text: xText, icon: xIcon });
        }

        function showErrorMessage(strMess) {
            jQuery.confirm({ title: 'Data Validation', content: 'Are you sure, You want to delete record !', type: 'red', typeAnimated: true });
        }

        function showErrorPopup(xMsg) {
            M.toast({ html: "<ul id='ulToast' style='list-style:none;'>" + xMsg + "</ul>", displayLength: 4000 });
        }
    </script>
    <style type='text/css'>
        .stdtable thead th {
            font-size: 16px !important;
            font-weight: bold;
        }

        .stdtable tr td {
            font-size: 16px !important;
            color: black !important;
        }

        .form-control {
            font-size: 12px !important;
        }

        .chkReminder {
            position: relative !important;
            pointer-events: all !important;
            opacity: 100 !important;
            width: 20px !important;
            height: 20px !important;
            top: 3px;
        }
    </style>
</head>
<body class='loginpage'>
    <form id='frmMasterMenu' runat='server'>
        <asp:ScriptManager ID='srcMasterMenu' runat='server'></asp:ScriptManager>
        <div id='contentwrapper' class='contentwrapper' style='padding: 20px 15px;'>
            <div class='widgetbox'>
                <div class='clearall'></div>
                <asp:HiddenField ID='hdnpkID' runat='server' ClientIDMode='Static' />
                <asp:HiddenField ID='hdnCustomerID' runat='server' ClientIDMode='Static' />
                <asp:HiddenField ID='hdnSerialKey' runat='server' ClientIDMode='Static' />
                <div id='myModal' style='display: block; width: 100%;'>
                    <div class='modal-content'>
                        <div class='modal-body'>
                            <div class="row">
                                <div class="col m6">
                                    <div class='row'>
                                        <div class='input-field col m3'>
                                            <label class='active' for='txtMenuName'>MenuName</label>
                                            <asp:TextBox ID='txtMenuName' runat='server' ClientIDMode='Static' class='form-control' TabIndex='1' MaxLength='50' placeholder='' />
                                        </div>
                                        <div class='input-field col m3'>
                                            <label class='active' for='txtMenuText'>MenuText</label>
                                            <asp:TextBox ID='txtMenuText' runat='server' ClientIDMode='Static' class='form-control' TabIndex='1' MaxLength='50' placeholder='' />
                                        </div>
                                        <div class='input-field col m3'>
                                            <label class='active' for='txtparentID'>parentID</label>
                                            <asp:TextBox ID='txtparentID' runat='server' ClientIDMode='Static' class='form-control' TabIndex='1' MaxLength='50' placeholder='' />
                                        </div>
                                        <div class='input-field col m3'>
                                            <label class='active' for='drpActiveStatus'>ActiveStatus</label>
                                            <asp:DropDownList ID="drpActiveStatus" runat="server" class="select2-theme browser-default" ClientIDMode="Static" TabIndex="3">
                                                <asp:ListItem Text="True" Value="True" Selected="True" />
                                                <asp:ListItem Text="False" Value="False" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class='row'>
                                        <div class='input-field col m12'>
                                            <label class='active' for='txtMenuURL'>MenuURL</label>
                                            <asp:TextBox ID='txtMenuURL' runat='server' ClientIDMode='Static' class='form-control' TabIndex='1' MaxLength='50' placeholder='' />
                                        </div>
                                    </div>
                                    <div class='row'>
                                        <div class='input-field col m1'>
                                            <label class='active' for='txtMenuOrder'>MenuOrder</label>
                                            <asp:TextBox ID='txtMenuOrder' runat='server' ClientIDMode='Static' class='form-control' TabIndex='1' MaxLength='50' placeholder='' />
                                        </div>
                                        <div class='input-field col m3'>
                                            <label class='active' for='txtMenuImage'>MenuImage</label>
                                            <asp:TextBox ID='txtMenuImage' runat='server' ClientIDMode='Static' class='form-control' TabIndex='1' MaxLength='50' placeholder='' />
                                        </div>
                                        <div class='input-field col m2'>
                                            <label class='active' for='txtMenuImageHeight'>MenuImageHeight</label>
                                            <asp:TextBox ID='txtMenuImageHeight' runat='server' ClientIDMode='Static' class='form-control' TabIndex='1' MaxLength='50' placeholder='' />
                                        </div>
                                        <div class='input-field col m2'>
                                            <label class='active' for='txtMenuImageWidth'>MenuImageWidth</label>
                                            <asp:TextBox ID='txtMenuImageWidth' runat='server' ClientIDMode='Static' class='form-control' TabIndex='1' MaxLength='50' placeholder='' />
                                        </div>
                                        <div class='input-field col m2'>
                                            <label class='active' for='txtpanelID'>panelID</label>
                                            <asp:TextBox ID='txtpanelID' runat='server' ClientIDMode='Static' class='form-control' TabIndex='1' MaxLength='50' placeholder='' />
                                        </div>
                                    </div>
                                </div>
                                <div class="col m6">
                                    <table id="tblInqProductGroup" class="table table-striped table-bordered" cellpadding="0" cellspacing="0" border="0" width="100%" style="min-height:400px; overflow-y:auto;">
                                        <asp:Repeater ID="rptMenu" runat="server" OnItemCommand="rptMenu_ItemCommand">
                                            <HeaderTemplate>
                                                <thead class="thead-dark" style="font-size:12px;">
                                                    <tr>
                                                        <th class="center-align">Action</th>
                                                        <th class="center-align">Menu Title</th>
                                                        <th class="center-align">Menu URL</th>
                                                    </tr>
                                                </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="blueShed">
                                                    <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" Value='<%#Eval("pkID") %>' />
                                                    <td class="text-center">
                                                        <asp:Button ID="btnLoad" runat="server" ClientIDMode="Static" Text="Load Data" CommandName="Load" CommandArgument='<%#Eval("pkID") %>' />
                                                    </td>
                                                    <td class="text-center"><%# Eval("MenuText") %></td>
                                                    <td class="text-center"><%# Eval("MenuUrl") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class='row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom' style='margin-top: 10px;'>
                <button id='btnReset' type='button' runat='server' clientidmode='Static' text='Reset' class='btn orange left' onserverclick='btnReset_Click' tabindex='47'><i class='material-icons left'>backspace</i>Clear & Add New</button>
                <button id='btnSave' type='button' runat='server' clientidmode='Static' text='Save' class='btn cyan right mr-1' onserverclick='btnSave_Click' tabindex='48'><i class='material-icons left'>save</i>Save</button>
            </div>
        </div>
    </form>
</body>
</html>
