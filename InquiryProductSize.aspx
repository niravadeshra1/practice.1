<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InquiryProductSize.aspx.cs" Inherits="StarsProject.InquiryProductSize" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/custom/custom.css" />

    <script type="text/javascript" src='<%=ResolveUrl("js/plugins/jquery-1.7.min.js") %>'></script>
    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>
    <script type="text/javascript" src="app-assets/js/plugins.js"></script>
    <link rel="stylesheet" href="app-assets/vendors/select2/select2.min.css" type="text/css" />
    <link rel="stylesheet" href="app-assets/vendors/select2/select2-materialize.css" type="text/css" />

    <script type="text/javascript" src="app-assets/vendors/select2/select2.full.min.js"></script>
    <%--    <script type="text/javascript" src="app-assets/js/scripts/form-select2.js"></script>--%>

    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>
    <script type="text/javascript">
        function showcaseError(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:circle;">' + xMsg + '</ul>', displayLength: 4000 });
        }
    </script>
    <style>
        .autocomplete-suggestions {
            min-width: 600px !important;
        }

        [type='checkbox']:not(:checked), [type='checkbox']:checked { 
            position:relative !important; 
            opacity:100;
            pointer-events:all;
        }
    </style>
</head>
<body>
    <form id="frmOutwardAssembly" runat="server" autocomplete="off">

        <asp:HiddenField ID="hdnInquiryNo" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />

        <div id="myModal" style="display: block; width: 100%;">
            <div class="modal-content">
                <div class="modal-body">
                    <table id="tblReelNo" class="stdtable" cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                        <asp:Repeater ID="rptInquirySize" runat="server" ClientIDMode="Static">
                            <HeaderTemplate>
                                <thead>
                                    <tr>
                                        <th class="center-align" style="width:5%;">Select</th>
                                        <th class="center-align" style="width: 10%; color: white;">Size List</th>
                                        <%--<th class="center-align" style="width: 5%;"">Action</th>--%>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <asp:HiddenField ID="edSizeID" runat="server" ClientIDMode="Static" Value='<%#Eval("pkID") %>' />
                                    <td class="center-align">
                                        <asp:CheckBox CssClass="chkToCompare" ID="chkSelectCust" runat="server" ClientIDMode="Static" />
                                    </td>
                                    <td class="right-align">
                                        <asp:TextBox ID="edSizeName" runat="server" class="form-control" ClientIDMode="Static" TabIndex="101" MaxLength="250" Text='<%#Eval("SizeName") %>' ReadOnly="true"/>
                                    </td>
                                    <%--<td class="center-align">
                                        <asp:ImageButton ID="imgBtnDel" runat="server" ClientIDMode="Static" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' Width="20" Height="20" />
                                    </td>--%>
                                </tr>
                            </ItemTemplate>
<%--                                    <FooterTemplate>
                                <tr>
                                    <td class="center-align">
                                        <asp:DropDownList ID="drpSize" runat="server" ClientIDMode="Static" />
                                    </td>
                                    <td class="center">
                                        <asp:ImageButton ID="imgBtnSave" runat="server" ClientIDMode="Static" ImageUrl="~/images/Buttons/bt-add.png" Width="70" Height="30" CommandName="Save" CommandArgument='0' TabIndex="43"/>
                                    </td>
                                </tr>
                            </FooterTemplate>--%>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="input-field col m12">
                <div id="divErrorMessage" class="usermsg" runat="server" clientidmode="Static"></div>
            </div>
        </div>
        <div class="row">
            <asp:Button CssClass="btn btn-success" ID="btnSaveSize" runat="server" ClientIDMode="Static" Text="Save Selection" OnClick="btnSaveSize_Click"></asp:Button>
        </div>
    </form>
</body>
</html>

