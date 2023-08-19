<%@ Page Language="C#" MasterPageFile="~/StarsSite.Master" AutoEventWireup="true" CodeBehind="ManageConstant.aspx.cs" Inherits="StarsProject.ManageConstant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/animate-css/animate.css" />

    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/quill/quill.snow.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/app-sidebar.css" />

    <link rel="stylesheet" type="text/css" href="app-assets/vendors/data-tables/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/data-tables/extensions/responsive/css/responsive.dataTables.min.css" />
    
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="app-assets/js/vendors.min.js"></script>
    <script type="text/javascript" src="app-assets/vendors/sortable/jquery-sortable-min.js"></script>
    <script type="text/javascript" src="app-assets/vendors/quill/quill.min.js"></script>
    <script type="text/javascript" src="app-assets/js/plugins.js"></script>

    <script src="app-assets/vendors/data-tables/js/jquery.dataTables.min.js"></script>
    <script src="app-assets/vendors/data-tables/extensions/responsive/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>

    <script type="text/javascript">
        function openPayslip(id) {
            var m1, y1;
            m1 = jQuery("#drpSummaryMonth").val();
            y1 = jQuery("#drpSummaryYear").val();
            // -------------------------------------------
            if (id == 0)
                jQuery.colorbox({
                    width: "90%", height: "90%", iframe: true, href: "DailyActivityView.aspx?mode=add&month=" + m1 + "&year=" + y1 + "&id=" + id, onClosed: function () {
                        location.reload();

                    }
                });
            else
                jQuery.colorbox({
                    width: "90%", height: "90%", iframe: true, href: "DailyActivityView.aspx?mode=edit&id=" + id, onClosed: function () {
                        location.reload();
                    }
                });
        }
    </script>

    <style type="text/css">
        .contact-list li span { margin-right:20px; } 
        .summLeftTitle {
            margin-left: -1.8rem;
            padding-left: 1.8rem;
            border-top-right-radius: 2rem;
            border-bottom-right-radius: 2rem;
            background-color: #3f51b5;
            box-shadow: 0 0 8px 0 #3f51b5;
            color: white;
            line-height:35px;
        }

        .selActive {
            margin-left: -1.8rem;
            padding-left: 1.8rem;
            border-bottom:2px ridge silver;
            height:60px; 
            padding-top:3px;
        }
 
        .dataTables_filter input[type=search]:not(.browser-default) {
            width: 180px !important;
            height: 1.5rem;
            margin: 0 0 15px 5px;
            border: 1px solid silver;
            border-radius: 10px;
            padding: 0px 3px 0px 10px;
        }

        .dataTables_filter label {
            color: red;
            font-weight: bold;
            text-align: left !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
            color: #fff !important;
            border: 1px solid #3f51b5;
            border-radius: 6px;
            background: #3f51b5;
            box-shadow: 0 0 8px 0 #3f51b5;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button, #main .section-data-tables .dataTables_wrapper #page-length-option_paginate .paginate_button {
            margin-top: .25rem;
            padding: .25em .65em;
        }

        .select-wrapper input.select-dropdown {
            height: 1.5rem !important;
            margin: 0 0px 0px 5px !important;
            border: 1px solid silver;
            border-radius: 8px;
            padding: 0px 0px 0px 5px;
            width: 80px;
        }

        #tblView_length label {
            display: inline-flex !important;
            text-transform: capitalize;
        }

        #tblView_length .select-wrapper {
            margin-right: 7px !important;
        }

        #contact-sidenav li a { color:black;}
        #contact-sidenav li small { color:blue;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col s12">
            <div class="card">
                <h5 style="padding:5px; line-height:35px; margin: 0.42rem 0 .556rem 0; background: #17a2b8; background: -webkit-gradient(linear,left bottom,left top,color-stop(0,#17a2b8),color-stop(1,#89d8e4));">
                    <i id="pageIcon" class="fa fa-th mr-1"></i><span class="text-top" style="color: white; margin-left: 10px;">Application Constants</span>
                </h5>
            </div>
        </div>
    </div>
    <div id="contentwrapper" class="contentwrapper">
        <div class="row">
            <div class="col m3">
                <ul class="contact-list display-grid">
                    <li class="summLeftTitle">Application Settings</li>
                    <%--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*---%>
                    <li class="selActive">
                        <i class="purple-text material-icons">star_border</i>
                        <a href="javascript:GetDailySummary('DueSalesOrder', 'Todays Due - Material Dispatch');" class="text-sub">Manage Constant</a>
                    </li>
                    <li class="selActive">
                        <i class="amber-text material-icons">star_border</i>
                        <a href="javascript:GetDailySummary('DuePurchaseOurder', 'Todays Due - Material Purchase');" class="text-sub">Manage Module</a>
                    </li>
                </ul>
            </div>
            <div class="col m9">
                <table id="tblInqProductGroup" class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <asp:Repeater ID="rptDailyActivity" runat="server" ClientIDMode="Static" OnItemCommand="rptDailyActivity_ItemCommand" OnItemDataBound="rptDailyActivity_ItemDataBound">
                        <HeaderTemplate>
                            <thead>
                                <tr style="background-color: darkslateblue;">
                                    <th class="left-align" style="width: 20%; color: white;">Category</th>
                                    <th class="left-align" style="width: 20%; color: white;">Constant Head</th>
                                    <th class="center-align hide" style="width: 20%; color: white;">Constant Value</th>
                                    <th class="center-align" style="width: 10%; color: white;">Constant Style</th>
                                    <th class="center-align" style="width: 10%; color: white;">Display Order</th>
                                    <th class="center-align" style="width: 10%; color: white;" colspan="2">Action</th>
                                </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="blueShed">
                                <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" Value='<%#Eval("pkID") %>' />
                                <asp:HiddenField ID="hdnCompanyID" runat="server" ClientIDMode="Static" Value='<%#Eval("CompanyID") %>' />
                                <asp:HiddenField ID="hdnConstantStyle" runat="server" ClientIDMode="Static" Value='<%#Eval("ConstantStyle") %>' />
                                <asp:HiddenField ID="hdnConstantValue" runat="server" ClientIDMode="Static" Value='<%#Eval("ConstantValue") %>' />
  
                                <%----------------------------------------------------------------%>
                                <td class="left-align">
                                    <asp:Label ID="txtCategory" runat="server" class="form-control black-text" ClientIDMode="Static" TabIndex="1" Text='<%#Eval("Category") %>' />
                                </td>
                                <td class="left-align">
                                    <asp:Label ID="txtConstantHead" runat="server" class="form-control blue-text" ClientIDMode="Static" TabIndex="1" Text='<%#Eval("ConstantHead") %>' />
                                </td>
                                <td class="center-align hide">
                                    <asp:TextBox ID="txtConstantValue" runat="server" class="form-control" ClientIDMode="Static" TabIndex="1" Text='<%#Eval("ConstantValue") %>'  style="width:100px;"/>
                                </td>
                                <td class="center-align" >
                                    <div id="divSwitch" class="switch" runat="server" clientidmode="static" style="padding: 0px 10px 0px 10px; vertical-align: top;">
                                        <label>
                                            <asp:CheckBox ID="ctrlSwitch" runat="server" ClientIDMode="Static" Checked="true" TabIndex="8" />
                                            <span class="lever" style="margin: 10px 20px;"></span>
                                        </label>
                                    </div>                                    
                                    <div id="divText" runat="server" clientidmode="static" style="padding: 0px 5px 0px 5px; vertical-align: top;">
                                        <asp:TextBox ID="ctrlText" runat="server" class="form-control" ClientIDMode="Static" TabIndex="1" MaxLength="250" />
                                    </div>
                                    <div id="divDrop" runat="server" clientidmode="static" style="padding: 0px 5px 0px 5px; vertical-align: top;">
                                        <asp:DropDownList ID="ctrlDrop" runat="server" ClientIDMode="Static" class="select2-theme browser-default"></asp:DropDownList>
                                    </div>
                                </td>
                                <td class="center-align">
                                    <asp:TextBox ID="txtDisplayOrder" runat="server" class="form-control" ClientIDMode="Static" TabIndex="1" Text='<%#Eval("DisplayOrder") %>' style="width:60px;" />
                                </td>
                                <td class="center-align">
                                    <asp:ImageButton ID="ImgbtnSave" runat="server" ImageUrl="~/images/expand.png" ToolTip="Save" Width="20" Height="20" TabIndex="1" CommandName="Save" CommandArgument='<%# Eval("pkID") %>' />
                                </td> 
                                <td class="center-align">
                                    <asp:ImageButton ID="ImgbtnDelete" runat="server" ImageUrl="~/images/delete.png" ToolTip="Delete" Width="20" Height="20" TabIndex="1" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            <tr style="background-color: #dde8f3;">

                                <td class="left-align">
                                    <asp:TextBox ID="txtCategory1" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" MaxLength="250"/>
                                </td>
                                <td class="left-align">
                                    <asp:TextBox ID="txtConstantHead1" runat="server" class="form-control" ClientIDMode="Static" TabIndex="4" />
                                </td>
                                <td class="center-align hide">
                                    <asp:TextBox ID="txtConstantValue1" runat="server" class="form-control" ClientIDMode="Static" TabIndex="5" style="width:100px;"/>
                                </td>
                                <td class="center-align">
                                    <asp:TextBox ID="txtConstantStyle1" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" MaxLength="250" />
                                </td>
                                <td class="center-align">
                                    <asp:TextBox ID="txtDisplayOrder1" runat="server" class="form-control" ClientIDMode="Static" TabIndex="6" style="width:60px;"/>
                                </td>
                                <td class="center-align" colspan="2">
                                    <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="~/images/SaveData.png" ToolTip="Add Item" CommandName="Add" CommandArgument='0' Width="60" Height="20" TabIndex="7" />
                                </td>
                            </tr>
                        </FooterTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="input-field col m12">
                <div id="divErrorMessage" class="usermsg" runat="server" clientidmode="Static"></div>
            </div>
        </div>
    </div>
    <%--    </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
