<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationAssemblyRadiant.aspx.cs" Inherits="StarsProject.QuotationAssemblyRadiant" %>

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
    </style>
</head>
<body>
    <form id="frmOutwardAssembly" runat="server" autocomplete="off">

        <asp:HiddenField ID="hdnQuotationNo" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnFinishProductID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnOthRef1" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnOthRef2" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnOthRef3" runat="server" ClientIDMode="Static" />

        <asp:HiddenField ID="hdnUnitWidth" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnUnitHeight" runat="server" ClientIDMode="Static" />

        <div id="myModal" style="display: block; width: 100%;">
            <div class="modal-content">
                <div class="float-left mr-2 mb-2" style="width:600px; padding-top:8px;">
                    <span id="spnOthRef" runat="server" class="mt-1 float-left badge gradient-45deg-yellow-green black-text gradient-shadow" style="font-size: 18px; border-radius: 5px;border-radius: 5px; padding: 5px; height: auto; width: 100%;">Location : </span>
                </div>
                <div class="float-right mr-2 mb-2" style="width:600px; padding-top:8px;">
                    <span id="spnAssemblyAmount" runat="server" class="mt-1 float-left badge gradient-45deg-yellow-green black-text gradient-shadow" style="font-size: 18px; border-radius: 5px;border-radius: 5px; padding: 5px; height: auto; width: 100%;">Total Assembly Cost : </span>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col m12">
                            <table id="tblQuotationAssembly" class="stdtable" cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                <asp:Repeater ID="rptQuotationAssembly" runat="server" ClientIDMode="Static" OnItemCommand="rptQuotationAssembly_ItemCommand" >
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th style="width:40%">Product Name <span class="materialize-red-text font-weight-800">*</span></th>
                                                <th class="center-align" style="width:13%">Unit<span class="materialize-red-text font-weight-800">*</span></th>
                                                <th class="center-align" style="width:13%">Quantity <span class="materialize-red-text font-weight-800">*</span></th>
                                                <th class="center-align" style="width:13%">Rate <span class="materialize-red-text font-weight-800">*</span></th>
                                                <th class="center-align" style="width:13%">Amount <span class="materialize-red-text font-weight-800">*</span></th>
                                                <th class="center-align" style="width:8%">Action</th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <asp:HiddenField ID="edpkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />
                                            <asp:HiddenField ID="edFinishProductID" runat="server" ClientIDMode="Static" Value='<%# Eval("FinishProductID") %>' />
                                            <asp:HiddenField ID="edProductID" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductID") %>' />
                                            <td class="text-left" style="width: 40%;">
                                                <%# Eval("ProductName") %>
                                                <asp:HiddenField ID="edProductName" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductName") %>' />
                                            </td>
                                            <td class="center-align" style="width: 13%;">
                                                <asp:TextBox ID="edUnit" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Unit") %>' Style="width: 100%;text-align:center;" AutoPostBack="true" OnTextChanged="editItem_TextChanged"/>
                                            </td>
                                            <td class="center-align" style="width: 13%;">
                                                <asp:TextBox ID="edQuantity" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Quantity") %>' Style="width: 100%;text-align:center;" AutoPostBack="true" OnTextChanged="editItem_TextChanged"/>
                                            </td>
                                            <td class="center-align" style="width: 13%;">
                                                <asp:TextBox ID="edRate" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Rate") %>' Style="width: 100%;text-align:center;" AutoPostBack="true" OnTextChanged="editItem_TextChanged"/>
                                            </td>
                                            <td class="center-align" style="width: 13%;">
                                                <asp:TextBox ID="edAmount" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Amount") %>' Style="width: 100%;text-align:right;color:black;" ReadOnly="true"/>
                                            </td>
                                            <td class="center-align" style="width: 8%;">
                                                <asp:ImageButton ID="ImgbtnDelete" runat="server" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' Width="20" Height="20" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <tr style="background-color: #dde8f3;">
                                            <td class="left-align" style="width: 40%;">
                                                <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />
                                                <asp:TextBox ID="txtProductName" runat="server" ClientIDMode="Static" class="form-control" onKeyup="bindDDLProductTo('#txtProductName')" AutoPostBack="true" OnTextChanged="txtProductName_TextChanged" TabIndex="22" Width="100%"/>
                                            </td>
                                            <td class="center-align" style="width: 13%;">
                                                <asp:TextBox ID="txtUnit" runat="server" ClientIDMode="Static" Width="100%" style="text-align:center;" TabIndex="50"/>
                                            </td>
                                            <td class="center-align" style="width: 13%;">
                                                <asp:TextBox ID="txtQuantity" runat="server" ClientIDMode="Static" CssClass="form-control onlyDecimal" style="text-align:center;" Width="100%" TabIndex="52" />
                                            </td>
                                            <td class="center-align" style="width: 13%;">
                                                <asp:TextBox ID="txtRate" runat="server" ClientIDMode="Static" CssClass="form-control onlyDecimal" Width="100%" style="text-align:center;" TabIndex="52" />
                                            </td>
                                            <td class="center-align" style="width: 13%;">
                                                <asp:TextBox ID="txtAmount" runat="server" ClientIDMode="Static" CssClass="form-control onlyDecimal" Width="100%" style="text-align:right;color:black;" TabIndex="52" ReadOnly="true" />
                                            </td>
                                            <td class="center-align" style="width: 8%;">
                                                <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="~/images/Buttons/bt-Add.png" ToolTip="Add Item" CommandName="Save" CommandArgument='0' Width="150" Height="40" TabIndex="61" />
                                            </td>
                                        </tr>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
                    <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom hide" style="margin-top: 10px;">
                        <button id="btnSaveAssembly" type="button" runat="server" clientidmode="Static" text="Save" class="btn cyan right mr-1" onserverclick="btnSaveAssembly_Click" tabindex="63"><i class="material-icons left">save</i>Save</button>
                    </div>
                </div>
                <script type="text/javascript">
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
                </script>
            </div>
        </div>
    </form>
</body>
</html>
