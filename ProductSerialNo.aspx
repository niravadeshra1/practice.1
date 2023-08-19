<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductSerialNo.aspx.cs" Inherits="StarsProject.ProductSerialNo" %>
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
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/form-select2.css" />

    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>

    <link type="text/css" href="css/sumoselect.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.sumoselect.min.js"></script>

    <style type="text/css">
        .jqte_editor {
            height: 250px !important;
        }
        .select2-container--default.select2-selection--multiple,.select2-container--default.select2-selection--single,
        .select2-container--default.select2-container--focus .select2-selection--multiple {
            height: 25px;
        }

        .select2-container--default.select2-selection--single.select2-selection__rendered {
            line-height: 30px;
        }
        .clDiv70 {
            height: 50px;
            vertical-align: middle;
        }

        .imgChart {
            vertical-align: middle;
            Height: 40px;
            width: 40px;
        }

        #drpSelectDepartment {
            margin: 7px 0px;
            font-family: Verdana,Arial;
            font-size: 12px;
            vertical-align: middle;
        }

        .clTrans {
            background-color: transparent;
        }

        .autocomplete-suggestions {
            min-width: 600px !important;
        }

        .lblOther {
            font-size: 14px;
        }

        .drpOther {
            width: 100%;
            font-size: 13px;
        }

        .inputOther {
            width: 100px;
            font-size: 13px;
            text-align: right;
            height: 30px;
        }

        .inputCalc {
            width: 140px;
            text-align: right;
            height: 27px;
        }

        .active {
            font-size: 15px;
        }

        .radio-inline label {
            color: white !important;
            margin-left: 5px !important;
            margin-right: 20px !important;
        }

        /* ------------------------------------------------------- */
        ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .heading.heading-icon {
            display: block;
        }

        .padding-lg {
            display: block;
            padding-top: 5px;
            padding-bottom: 5px;
        }

        .practice-area.padding-lg {
            padding-bottom: 55px;
            padding-top: 55px;
        }

        .practice-area .inner {
            border: 1px solid #999999;
            text-align: center;
            margin-bottom: 28px;
            padding: 40px 25px;
        }

        .our-webcoderskull .cnt-block:hover {
            box-shadow: 0px 0px 10px rgba(0,0,0,0.3);
            border: 0;
        }

        .practice-area .inner h3 {
            color: #3c3c3c;
            font-size: 24px;
            font-weight: 500;
            font-family: 'Poppins', sans-serif;
            padding: 10px 0;
        }

        .practice-area .inner p {
            font-size: 14px;
            line-height: 22px;
            font-weight: 400;
        }

        .practice-area .inner img {
            display: inline-block;
        }

        .our-webcoderskull {
            /*background: url("http://www.webcoderskull.com/img/right-sider-banner.png") no-repeat center top / cover;*/
            background-color: #fbf5f5;
        }

            .our-webcoderskull .cnt-block {
                float: left;
                width: 100%;
                background: #fff;
                padding: 30px 20px;
                text-align: center;
                border: 2px solid #d5d5d5;
                margin: 0 0 28px;
            }

                .our-webcoderskull .cnt-block figure {
                    width: 80px;
                    height: 80px;
                    border-radius: 100%;
                    display: inline-block;
                    margin-bottom: 15px;
                }

                .our-webcoderskull .cnt-block img {
                    width: 80px;
                    height: 80px;
                    border-radius: 100%;
                }

                .our-webcoderskull .cnt-block h3 {
                    color: #2a2a2a;
                    font-size: 20px;
                    font-weight: 500;
                    padding: 6px 0;
                    text-transform: uppercase;
                }

                    .our-webcoderskull .cnt-block h3 a {
                        text-decoration: none;
                        color: #2a2a2a;
                    }

                        .our-webcoderskull .cnt-block h3 a:hover {
                            color: #337ab7;
                        }

                .our-webcoderskull .cnt-block p {
                    color: #2a2a2a;
                    font-size: 13px;
                    line-height: 20px;
                    font-weight: 400;
                }

                .our-webcoderskull .cnt-block .follow-us {
                    margin: 20px 0 0;
                }

                    .our-webcoderskull .cnt-block .follow-us li {
                        display: inline-block;
                        width: auto;
                        margin: 0 5px;
                    }

                        .our-webcoderskull .cnt-block .follow-us li .fa {
                            font-size: 24px;
                            color: #767676;
                        }

                            .our-webcoderskull .cnt-block .follow-us li .fa:hover {
                                color: #025a8e;
                            }

        .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
            background-color: #6cd883;
            color: Navy;
        }

        #myTabContent {
            border-left: 1px solid navy;
            border-right: 1px solid navy;
            border-bottom: 1px solid navy;
        }
    </style>

    <script type="text/javascript">
        function showcaseError(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:circle;">' + xMsg + '</ul>', displayLength: 4000 });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="srcProductSerial" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="hdnProductQuantity" runat="server" ClientIDMode="Static" />

        <asp:HiddenField ID="hdnFromPage" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnModule" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnInvoiceNo" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnProductName" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnRefNo" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnSerialKey" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnEmployeeID" runat="server" ClientIDMode="Static" />
        

        <div id="myModal" style="display: block; width: 100%;">
            <div class="modal-header">
                <div class="row" style="margin: 25px;border-bottom: 2px solid navy;">
                    <div class="col m9">
                        <h5><span class="navy-text" id="spnSerialHeader" runat="server"></span></h5>
                    </div>
                    <div class="col m3 left-align">
                        <h6 class="mt-0 blue-text">Invoice # : <span class="black-text" id="spnInvoiceNo" runat="server"></span></h6>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col m12">
                        <asp:TextBox ID="txtCopied" runat="server" TextMode="MultiLine" AutoPostBack="true" OnTextChanged="PasteToGridView" Width="400" PlaceHolder="Paste (Ctrl + V) Your Data Here ...." Style="height:30px; min-height:30px; border: none;" />
                    </div>
                </div>
            </div>
            <div class="modal-content">
                <div class="modal-body">
                    <div class="container" style="max-width: none; width: 50%; margin: 20px !important;">
                                    <ContentTemplate>
                                        <table class="stdtable" cellpadding="0" cellspacing="0" border="0" width="50%">
                                            <asp:Repeater ID="rptProductSerialNos" runat="server" ClientIDMode="Static" OnItemDataBound="rptProductSerialNos_ItemDataBound" OnItemCommand="rptProductSerialNos_ItemCommand">
                                                <HeaderTemplate>
                                                    <thead>
                                                        <tr>
                                                            <th class="center-align">Serial No</th>
                                                            <th class="center-align">Faulty Part</th>
                                                            <th class="center-align">Action</th>
                                                        </tr>
                                                    </thead>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="hdnInvoiceNo" runat="server" ClientIDMode="Static" Value='<%# Eval("InvoiceNo") %>' />
                                                    <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductID") %>' />
                                                    <asp:HiddenField ID="hdnPkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />
                                                    <tr class="blueShed mb-2">
                                                        <td class="center-align" style="width:250px;">
                                                            <asp:TextBox class="form-control text-left width-100" ID="itSerialNo" runat="server" ClientIDMode="Static" TabIndex="14" Text='<%# Eval("SerialNo") %>' AutoPostBack="true" OnTextChanged="editItem_TextChanged" ReadOnly="true" />
                                                        </td>
                                                        <td class="center-align" style="width:250px;"><%# Eval("FaultyPart") %></td>
                                                        <td class="center-align" style="width:100px;">
                                                            <asp:ImageButton CssClass="center-align" ID="ImgbtnDelete" runat="server" ClientIDMode="Static" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' Width="20" Height="20" TabIndex="76" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <tr class="mb-2">
                                                        <td class="center-align" style="width:250px;">
                                                            <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />
                                                            <asp:HiddenField ID="hdnInvoiceNo" runat="server" ClientIDMode="Static" />
                                                            <asp:HiddenField ID="hdnPkID" runat="server" ClientIDMode="Static" />
                                                            <asp:DropDownList class="select2-size-sm browser-default" ID="drpSerialNo" runat="server" ClientIDMode="Static" TabIndex="47" />
                                                            <asp:TextBox  CssClass="form-control width-100" ID="txtSerialNo" runat="server" ClientIDMode="Static" TabIndex="47" />
                                                        </td>
                                                        <td class="center-align" style="width:250px;">
                                                            <asp:DropDownList ID="drpFaulty" runat="server" CssClass="select2-size-sm browser-default">
                                                                <asp:ListItem Text="No" Value="0" />
                                                                <asp:ListItem Text="Yes" Value="1" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="center-align" style="width:100px;">
                                                            <asp:ImageButton ID="imgBtnSave" runat="server" ClientIDMode="Static" ImageUrl="~/images/expand.png" ToolTip="Add Item" CommandName="Save" CommandArgument='0' Width="20" Height="20" TabIndex="25" />
                                                        </td>
                                                    </tr>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </ContentTemplate>
                            </div>
                </div>

                <div class="row">
                    <div class="input-field col m12">
                        <div id="divErrorMessage" class="usermsg" runat="server" clientidmode="Static"></div>
                    </div>
                </div>
                <div class="row hide">
                    <div class="input-field col m12">
                        <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/images/SaveData.png" ToolTip="Save Specification" Width="100" Height="35" TabIndex="104" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
        
        <script type="text/javascript">
            function bindDDLSerialNo(selector) {
                if ($(selector).val().length >= 1) {
                    jQuery.ajax({
                        type: "POST",
                        url: "InquiryInfo.aspx/FilterSerialNo",
                        data: '{pProductName:\'' + $(selector).val() + '\'}',
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
    </form>
     <script src="app-assets/vendors/select2/select2.full.min.js"></script>
    <script src="app-assets/js/scripts/form-select2.js"></script>
</body>
</html>
