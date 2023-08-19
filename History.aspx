<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="StarsProject.History" %>

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
        tr {
            font-size:20px;
            color:black;
        }
    </style>
</head>
<body>
    <form id="frmOutwardAssembly" runat="server" autocomplete="off">

        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnCustomerID" runat="server" ClientIDMode="Static" />

        <div id="myModal" style="display: block; width: 100%;" >
            <div class="modal-content" >
                <div class="modal-body">
                    <div class="row">
                        <div class="col m12">
                            <table id="tblHistory" class="stdtable" cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                <asp:Repeater ID="rptHistory" runat="server" ClientIDMode="Static">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th class="center-align">Party Name </th>
                                                <th class="center-align">Quotation No</th>
                                                <th class="center-align">Quotation Date</th>
                                                <th class="center-align">Quantity</th>
                                                <th class="center-align">Rate</th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="center-align"><%# Eval("CustomerName") %></td>
                                            <td class="center-align"><%# Eval("BillNo") %></td>
                                            <td class="center-align"><%# Eval("VoucherDate") %></td>
                                            <td class="center-align"><%# Eval("Quantity") %></td>
                                            <td class="center-align"><%# Eval("Rate") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <div id="errorDiv" runat="server" class="col m12" visible="false">
                            <Center><h1  >Data Not Found</h1></Center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
