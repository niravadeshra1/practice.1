<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovementOutwardAssembly.aspx.cs" Inherits="StarsProject.MovementOutwardAssembly" %>
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

    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>
    <style type="text/css">
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
        function showcaseError(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:circle;">' + xMsg + '</ul>', displayLength: 4000 });
        }

        function openProductSerialNo(pProdID,parentID) {
            document.getElementById('spnModuleHeader').innerText = "FillUp Product Serial No";
            var t11 = jQuery("#hdnOutwardNo").val();
            var pageUrl = "ProductSerialNo.aspx?FromPage=mmout&Module=mmout&InvoiceNo=" + parentID + "&ProductID=" + pProdID + "&RefNo=" + parentID;
            $('#ifrModule').attr('src', pageUrl);
            $find("mpe").show();
        }


    </script>
</head>
<body>
    <form id="frmOutwardAssembly" runat="server" autocomplete="off">
        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="hdnOutwardNo" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnRefNo" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnFinishProductID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnProductWithSerialNo" runat="server" ClientIDMode="Static" />

        <div id="myModal" style="display: block; width: 100%;">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col m12">
                            <table id="tblOutwardDetail" class="stdtable" cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                <asp:Repeater ID="rptOutwardDetailAssembly" runat="server" ClientIDMode="Static" OnItemCommand="rptOutwardDetailAssembly_ItemCommand" OnItemDataBound="rptOutwardDetailAssembly_ItemDataBound">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>Product Name <span class="materialize-red-text font-weight-800">*</span></th>
                                                <th class="center-align">Quantity <span class="materialize-red-text font-weight-800">*</span></th>
                                                <th class="center-align">Unit<span class="materialize-red-text font-weight-800">*</span></th>
                                                <th class="center-align">Action</th>
                                                <% if (hdnProductWithSerialNo.Value.ToLower() == "yes")
                                                    { %>
                                                <th class="center-align">Serial No</th>
                                                <%} %>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <asp:HiddenField ID="edSerialNoFlag" runat="server" ClientIDMode="Static" Value='<%# Eval("SerialNoFlag") %>' />
                                            <asp:HiddenField ID="edpkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />
                                            <asp:HiddenField ID="edProductID" runat="server" ClientIDMode="Static" Value='<%# Eval("FinishProductID") %>' />
                                            <asp:HiddenField ID="edAssemblyID" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductID") %>' />
                                            
                                            <td class="center-align">
                                                <%# Eval("ProductName") %>
                                                <asp:HiddenField ID="edProductName" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductName") %>' />
                                                
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="edQuantity" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Quantity") %>' Style="width: 80px; text-align: center;" AutoPostBack="true" OnTextChanged="editItem_TextChanged" />
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="edUnit" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Unit") %>' Style="width: 80px; text-align: center;" />
                                            </td>
                                            <td class="center-align">
                                                <asp:ImageButton ID="ImgbtnDelete" runat="server" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' Width="20" Height="20" />
                                            </td>
                                            <% if (hdnProductWithSerialNo.Value.ToLower() == "yes") { %>
                                                <td id="lnkSerial" runat="server" clientidmode="static" class="center-align" style="display:inherit !important;padding:0px;">
                                                    <a href="javascript:openProductSerialNo('<%# Eval("ProductID") %>','<%# Eval("ParentID") %>');" style="background-color:blue;color:white;font-size:medium;padding:5px;border-radius:10px;margin-top:10px;" tabindex="19"><small>Serial No</small></a>
                                                </td>
                                            <%} %>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <tr style="background-color: #dde8f3;">
                                            <td>
                                                <asp:HiddenField ID="hdnProductID_Grid" runat="server" ClientIDMode="Static" />
                                                <asp:TextBox ID="txtProductName" runat="server" ClientIDMode="Static" class="form-control" onKeyup="bindDDLProductTo('#txtProductName')" AutoPostBack="true" OnTextChanged="txtProductName_TextChanged" TabIndex="21" Width="100%" />
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="txtQuantity" runat="server" ClientIDMode="Static" CssClass="form-control" Width="80" TabIndex="52"  />
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="txtUnit" runat="server" ClientIDMode="Static" Width="80" TabIndex="50"/>
                                            </td>
                                            <td class="center-align">
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

                function bindDDLProductTo(selector) {
                    if ($(selector).val().length >= 3) {
                        jQuery.ajax({
                            type: "POST",
                            url: "InquiryInfo.aspx/FilterProduct",
                            data: '{pProductName:\'' + $(selector).val() + '\', pSearchModule:\'ProductSearchTypeAll\'}',
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
                                        $("#hdnProductID_Grid").val(item.data('langname'));
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
                            $("#hdnProductID_Grid").val('');
                        }
                    }
                }
            </script>
        </div>
    </form>
</body>
</html>
