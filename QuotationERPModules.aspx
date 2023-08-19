<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationERPModules.aspx.cs" Inherits="StarsProject.QuotationERPModules" %>

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

    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>

    <link href="css/richtext.min.css" rel="stylesheet" />
    <script src="js/jquery.richtext.min.js"></script>

    <style type="text/css">
        #chkScope { position: relative !important; pointer-events:all !important; opacity: 100 !important; width:20px !important; height:20px !important;}
        .jqte_editor {
            height: 250px !important;
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

        /*#myTabContent {
            border-left: 1px solid navy;
            border-right: 1px solid navy;
            border-bottom: 1px solid navy;
        }*/
    </style>

    <script type="text/javascript">
        function pageLoad(sender, args) {
            $('tabs').tabs();
            // --------------------------------------------------------
            $(function () {
                $(".tabs a").click(function () {
                    $("#hdnCurrTabSpec").val($(this).attr("href").replace("#", ""));
                    retainTabPosition();
                });
            });
        }
        // --------------------------------------------------------
        function retainTabPosition() {
            var currTab = $("#hdnCurrTabSpec").val();

            $("#lnkRemark").removeClass("active");
            $("#lnkSpec").removeClass("active");
            $("#lnkPart").removeClass("active");

            $("#pnl_Remark").css("display", "none");
            $("#pnl_Spec").css("display", "none");
            $("#pnl_Part").css("display", "none");

            if (currTab == 'pnl_Remark') {
                $("#lnkRemark").addClass("active");
                $("#pnl_Remark").css("display", "block");
            }
            else if (currTab == 'pnl_Spec') {
                $("#lnkSpec").addClass("active");
                $("#pnl_Spec").css("display", "block");
            }
            else if (currTab == 'pnl_Part') {
                $("#lnkPart").addClass("active");
                $("#pnl_Part").css("display", "block");
            }
        }
    </script>

</head>
<body>
    <form id="frmERPModules" runat="server">
        <asp:ScriptManager ID="srcERPModules" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="hdnSerialKey" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnQuotationNo" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnCurrTabSpec" runat="server" ClientIDMode="Static" EnableViewState="true" Value="pnl_Remark" />

        <asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="myModal" style="display: block; width: 100%;">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row mt-2">
                            <div class="input-field col m12">
                                <div id="pnl_Part" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true">
                                    <section class="our-webcoderskull padding-lg" style="height: 320px; overflow-y: auto;" id="prodpart1">
                                        <div class="container" style="max-width: none; width: 98%; margin: 20px !important;">
                                            <table class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%">
                                                <asp:Repeater ID="rptERPModules" runat="server" ClientIDMode="Static" OnItemCommand="rptERPModules_ItemCommand">
                                                    <HeaderTemplate>
                                                        <thead>
                                                            <tr>
                                                                <th class="center-align" style="width: 15px">Order.#</th>
                                                                <th class="center-align">Module Group</th>
                                                                <th class="center-align">Module Name</th>
                                                                <th class="center-align">Scope</th>
                                                                <th class="center-align">Update</th>
                                                                <th class="center-align">Delete</th>
                                                            </tr>
                                                        </thead>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />
                                                        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" Value='<%# Eval("ProductID") %>'/>
                                                        <asp:HiddenField ID="hdnModuleOrder" runat="server" ClientIDMode="Static" Value='<%# Eval("ModuleOrder") %>' />

                                                        <tr class="blueShed">
                                                            <td class="center-align">
                                                                <asp:TextBox class="form-control text-left" Style="width: 50px" ID="edModuleOrder" runat="server" ClientIDMode="Static" TabIndex="14" Text='<%# Eval("ModuleOrder") %>' />
                                                            </td>
                                                            <td class="center-align">
                                                                <asp:TextBox class="form-control text-left" ID="edModuleHead" runat="server" ClientIDMode="Static" TabIndex="7" Text='<%# Eval("ModuleHead") %>' />
                                                            </td>
                                                            <td class="center-align">
                                                                <asp:TextBox class="form-control text-left" ID="edModuleName" runat="server" ClientIDMode="Static" TabIndex="7" Text='<%# Eval("ModuleName") %>'/>
                                                            </td>
                                                            <td class="center-align">
                                                                <asp:CheckBox id="chkScope" class="filled-in" runat="server" clientidmode="Static" TabIndex="6" Checked='<%# Eval("Scope") %>'/>
                                                            </td>
                                                            <td class="center-align">
                                                                <asp:ImageButton ID="imgBtnUpdate" runat="server" ClientIDMode="Static" ImageUrl="~/images/SaveData.png" ToolTip="Update" CommandName="Update" CommandArgument='<%# Eval("pkID") %>' Width="80" Height="40" />
                                                            </td>
                                                            <td class="center-align">
                                                                <asp:ImageButton ID="imgBtnDelete" runat="server" ClientIDMode="Static" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' Width="20" Height="20" />
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                             </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col m12">
                            <div id="divErrorMessage" class="usermsg" runat="server" clientidmode="Static"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col m12">
                            <center>
                                <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/images/SaveData.png" ToolTip="Save Specification" Width="100" Height="35" TabIndex="104" OnClick="btnSave_Click" />
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</body>
</html>
