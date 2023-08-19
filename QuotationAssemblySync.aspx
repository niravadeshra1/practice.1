<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationAssemblySync.aspx.cs" Inherits="StarsProject.QuotationAssemblySync" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
        .open-pop-up {
            background-color:darkblue;
            color:white;
            border-radius:10px;
            padding-right:10px;
            padding-left:10px;
            font-size:15px;
        }
    </style>
        <script type="text/javascript">
            function openAssembly(pProdID,pSubProdID) {
                var t11;
                t11 = jQuery("#txtQuotationNo").val();
                var pageUrl = "QuotationSubAssemblySync.aspx?QuotationNo=" + t11 + "&FinishProductID=" + pProdID + "&SubFinishProductID=" + pSubProdID;
                $('#ifrModule').attr('src', pageUrl);
                $find("mpe").show();
            }
        </script>
</head>
<body>
    <form id="frmOutwardAssembly" runat="server" autocomplete="off">
         <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="hdnQuotationNo" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnFinishProductID" runat="server" ClientIDMode="Static" />

        <div id="myModal" style="display: block; width: 100%;">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col m12">
                            <table id="tblQuotationAssembly" class="stdtable" cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                <asp:Repeater ID="rptQuotationAssembly" runat="server" ClientIDMode="Static" OnItemCommand="rptQuotationAssembly_ItemCommand" >
                                    <HeaderTemplate>
                                        <thead>
                                            <%--<tr >
                                                <th id="trLable" colspan="10" style="font-size:30px;color:darkblue;" runat="server"></th>
                                            </tr>--%>
                                            <tr>
                                                <th>Product Name <span class="materialize-red-text font-weight-800">*</span></th>
                                                <th class="center-align">Cat No</th>
                                                <th class="center-align">Rating</th>
                                                <th class="center-align">Feeder Quantity</th>
                                                <th class="center-align">Unit Quantity</th>
                                                <th class="center-align">Quantity</th>
                                                <th class="center-align">Rate</th>
                                                <th class="center-align">Amount</th>
                                                <th class="center-align">Action</th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <asp:HiddenField ID="edpkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />
                                            <asp:HiddenField ID="edFinishProductID" runat="server" ClientIDMode="Static" Value='<%# Eval("FinishProductID") %>' />
                                            <asp:HiddenField ID="edProductID" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductID") %>' />
                                            <td class="text-left width-20" >
                                                <%# Eval("ProductName") %>
                                                <br><a id="lnkAssembly1" class="open-pop-up" href="javascript:openAssembly('<%# hdnFinishProductID.Value %>','<%# Eval("ProductID") %>');" tabindex="19"><small>Sub Assembly</small></a>
                                                <asp:HiddenField ID="edProductName" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductName") %>' />
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="edCatNo" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("CatNo") %>' Style="width: 80px; text-align: right;" AutoPostBack="true" OnTextChanged="editItem_TextChanged"/>
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="edRating" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Rating") %>' Style="width: 80px; text-align: right;" AutoPostBack="true" OnTextChanged="editItem_TextChanged"/>
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="edFeederQuantity" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("FeederQuantity") %>' Style="width: 80px; text-align: right;" AutoPostBack="true" OnTextChanged="editItem_TextChanged"/>
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="edUnitQuantity" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("UnitQuantity") %>' Style="width: 80px; text-align: right;" AutoPostBack="true" OnTextChanged="editItem_TextChanged"/>
                                            </td>
                                            <td class="center-align">
                                                <asp:Label ID="edQuantity" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Quantity") %>'  />
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="edRate" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Rate") %>' Style="width: 80px; text-align: right;" AutoPostBack="true" OnTextChanged="editItem_TextChanged"/>
                                            </td>
                                            <td class="center-align">
                                                <asp:Label ID="edAmount" MaxLength="15" runat="server" ClientIDMode="Static" Text='<%# Eval("Amount") %>' />
                                            </td>
                                            <td class="center-align">
                                                <asp:ImageButton ID="ImgbtnDelete" runat="server" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' Width="20" Height="20" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <tr style="background-color: #dde8f3;">
                                           <td class="left-align" style="width: 20%;">
                                                <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />
                                                <asp:TextBox ID="txtProductName" runat="server" ClientIDMode="Static" class="form-control" onKeyup="bindDDLProductTo('#txtProductName')" AutoPostBack="true" OnTextChanged="txtProductName_TextChanged" TabIndex="22" Width="95%" />
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="txtCatNo" MaxLength="15" runat="server" ClientIDMode="Static" Style="width: 80px; text-align: right;" />
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="txtRating" MaxLength="15" runat="server" ClientIDMode="Static" Style="width: 80px; text-align: right;" />
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="txtFeederQuantity" MaxLength="15" runat="server" ClientIDMode="Static" Style="width: 80px; text-align: right;" AutoPostBack="true" OnTextChanged="newFeederQuantity_TextChanged" />
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="txtUnitQuantity" MaxLength="15" runat="server" ClientIDMode="Static" Style="width: 80px; text-align: right;" AutoPostBack="true" OnTextChanged="newFeederQuantity_TextChanged"/>
                                            </td>
                                            <td class="center-align">
                                                <asp:Label ID="txtQuantity" MaxLength="15" runat="server" ClientIDMode="Static" />
                                            </td>
                                            <td class="center-align">
                                                <asp:TextBox ID="txtRate" MaxLength="15" runat="server" ClientIDMode="Static" Style="width: 80px; text-align: right;" AutoPostBack="true" OnTextChanged="newFeederQuantity_TextChanged"/>
                                            </td>
                                            <td class="center-align">
                                                <asp:Label ID="txtAmount" MaxLength="15" runat="server" ClientIDMode="Static" />
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
                    <%-- PopUp Modal Box to Open Window --%>
                <asp:Button ID="Button1" CssClass="hide" runat="server" Text="Fill Form in Popup" />
                <cc1:ModalPopupExtender ID="myModalPopup" BehaviorID="mpe" runat="server" ClientIDMode="Static" PopupControlID="Panl1" TargetControlID="Button1" CancelControlID="Button2" BackgroundCssClass="Background">
                </cc1:ModalPopupExtender>
                <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" Style="display: none; border-radius: 10px; padding-right: 10px !important;">
                    <div id="myModal123">
                        <div class="modal-header position-sticky gradient-45deg-light-blue-indigo m-0" style="margin-bottom: 10px !important;">
                            <h5 class=" z-depth-5" style="font-size: 2rem !important; font-weight: 800; line-height: 50px; margin: 0; text-align: left; padding-left: 15px;">
                                <i class="material-icons prefix">ac_unit</i>
                                <span id="spnModuleHeader" runat="server" clientidmode="static">Manage Sub-Assembly</span>
                                <asp:Button CssClass="btnTopRightCorner float-right" ID="Button2" runat="server" Text="" />
                            </h5>
                        </div>
                    </div>
                    <iframe id="ifrModule" src="about:blank" runat="server" clientidmode="static" scrolling="auto" style="border: 1px solid silver; background-color: transparent; width: 100%; height: 90%; padding: 5px;"></iframe>
                    <br />
                </asp:Panel>
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
                </script>
            </div>
        </div>
    </form>
</body>
</html>
