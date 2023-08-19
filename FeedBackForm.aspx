<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedBackForm.aspx.cs" Inherits="StarsProject.FeedBackForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <script type="text/javascript" src="app-assets/js/scripts/advance-ui-modals.js"></script>
    <style type="text/css">
        .radiobuttonlist label{
            color:black;
            font-size:20px;
        }
        .radiobuttonlist td{
            position:inherit;

        }
        [type='radio']:not(:checked), [type='radio']:checked {
            position:relative !important;
            pointer-events: all !important;
            opacity:1;
            width: 20px;
            height: 20px;
        }
    </style>
    <script type="text/javascript">
    function pageLoad() {
            $find('RatingBehavior1').add_endClientCallback(function (sender, e) {
            });
        }
        function showErrorPopup(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:none;">' + xMsg + '</ul>', displayLength: 4000 });
        }
        
    </script>
</head>
<body class="loginpage">
    <form id="frmQuotation" runat="server" autocomplete="off">
        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
        <div id="contentwrapper" class="contentwrapper" >
            <div class="widgetbox" >
                <div class="clearall"></div>
                <asp:HiddenField ID="hdnVisitID" runat="server" ClientIDMode="Static"/>
                <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static"/>
                <asp:HiddenField ID="hdnRating" runat="server" ClientIDMode="Static" />
                <div id="myModal" style="display: block; width: 100%; overflow-x: hidden;" >
                    <div class="modal-content" >
                        <div class="modal-body col m12" >
                            <div class="row">
                                <div class="col m12">
                                    <div class="row">
                                        <div class="col s12">
                                            <div class="card">
                                                <h5 style="padding:5px; line-height:35px; margin: 0.42rem 0 .556rem 0; background: #17a2b8; background: -webkit-gradient(linear,left bottom,left top,color-stop(0,#17a2b8),color-stop(1,#89d8e4));">
                                                    <i id="pageIcon" class="fa fa-th mr-1"></i><span class="text-top" style="color: white; margin-left: 10px;">Feedback Questions</span>
                                                </h5>   
                                            </div>
                                        </div>
                                        <%--<div class="col s12">
                                            <input id="input-id" type="text" class="rating" data-size="lg" >
                                        </div>--%>
                                    </div>
                                    <div class="row">
                                        <div class="col s12">
                                        <table id="tblInqProductGroup" class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%">
                                            <asp:Repeater ID="rptFeedBackQues" runat="server" ClientIDMode="Static" OnItemCommand="rptFeedBackQues_ItemCommand" OnItemDataBound="rptFeedBackQues_ItemDataBound">
                                                <HeaderTemplate>
                                                    <thead>
                                                        <tr style="background-color: darkslateblue;">
                                                            <th class="left-align" style="width: 40%; color: white;">Questions</th>
                                                            <th class="center-align" style="width: 30%; color: white;">Rating</th>
                                                            <th class="center-align" style="width: 20%; color: white;">Answers</th>
                                                            <th class="center-align" style="width: 10%; color: white;" colspan="2">Action</th>
                                                        </tr>
                                                    </thead>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr class="blueShed" >
                                                        <asp:HiddenField ID="edpkID" runat="server" ClientIDMode="Static" Value='<%#Eval("pkID") %>' />
                                                        <asp:HiddenField ID="edQuestion" runat="server" ClientIDMode="Static" Value='<%#Eval("Question") %>' />
                                                        <asp:HiddenField ID="edAnsType" runat="server" ClientIDMode="Static" Value='<%#Eval("AnsType") %>' />
                                                        <asp:HiddenField ID="edAnswer" runat="server" ClientIDMode="Static" Value='<%#Eval("Answer") %>' />
                                                        <asp:HiddenField ID="edRating" runat="server" ClientIDMode="Static" Value='<%#Eval("Rating") %>' />
  
                                                        <%----------------------------------------------------------------%>
                                                        <td class="left-align" style="width: 40%;font-size:20px;" >
                                                            <%#Eval("Question") %>
                                                        </td>
                                                        <td class="center-align" style="width: 30%;font-size:20px;">
                                                            <div>
                                                              <asp:RadioButtonList ID="edRate" runat="server" Visible="true" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="radiobuttonlist" TextAlign="Right" AutoPostBack="true" OnSelectedIndexChanged="editItem_TextChanged" >
                                                                <asp:ListItem Value="Poor"> Poor </asp:ListItem>
                                                                <asp:ListItem Value="Average"> Average </asp:ListItem>
                                                                <asp:ListItem Value="Fair"> Fair </asp:ListItem>
                                                                <asp:ListItem Value="Good"> Good </asp:ListItem>
                                                                <asp:ListItem Value="Excellent"> Excellent </asp:ListItem>
                                                              </asp:RadioButtonList>   
                                                            </div>
                                                        </td>
                                                        <td class="center-align" style="width: 20%;" >
                                                            <div id="divSwitch" class="switch" runat="server" clientidmode="static" style="padding: 0px 10px 0px 10px; vertical-align: top;">
                                                                <label>
                                                                    <asp:CheckBox ID="ctrlSwitch" runat="server" ClientIDMode="Static" Checked="true" TabIndex="8" AutoPostBack="true" OnCheckedChanged="editItem_TextChanged"/>
                                                                    <span class="lever" style="margin: 10px 20px;"></span>
                                                                </label>
                                                            </div>                                    
                                                            <div id="divText" runat="server" clientidmode="static" style="padding: 0px 5px 0px 5px; vertical-align: top;;font-size:20px;">
                                                                <asp:TextBox ID="ctrlText" runat="server" class="form-control" ClientIDMode="Static" TabIndex="1" MaxLength="250" AutoPostBack="true" OnTextChanged="editItem_TextChanged"/>
                                                            </div>
                                                            <div id="divDrop" runat="server" clientidmode="static" style="padding: 0px 5px 0px 5px; vertical-align: top;">
                                                                <asp:DropDownList ID="ctrlDrop" runat="server" ClientIDMode="Static" class="select2-theme browser-default" AutoPostBack="true" OnSelectedIndexChanged="editItem_TextChanged"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td class="center-align" style="width: 10%;">
                                                            <asp:ImageButton ID="ImgbtnDelete" runat="server" ImageUrl="~/images/delete.png" ToolTip="Delete" Width="20" Height="20" TabIndex="1" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <tr style="background-color: #dde8f3;font-size:20px;display:none">
                                                        
                                                        <td class="left-align" style="width: 40%;font-size:20px;">
                                                            <asp:TextBox ID="txtQuestion" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" MaxLength="250"/>
                                                        </td>
                                                        <td class="center-align" style="width: 30%;font-size:20px;">
                                                           <asp:RadioButtonList ID="ftrRate" runat="server" class="form-control" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="radiobuttonlist" TextAlign="Right" >
                                                                <asp:ListItem Value="Poor"> Poor </asp:ListItem>
                                                                <asp:ListItem Value="Average"> Average </asp:ListItem>
                                                                <asp:ListItem Value="Fair"> Fair </asp:ListItem>
                                                                <asp:ListItem Value="Good"> Good </asp:ListItem>
                                                                <asp:ListItem Value="Excellent"> Excellent </asp:ListItem>
                                                           </asp:RadioButtonList> 
                                                        </td>
                                                        <td class="left-align" style="width: 20%;font-size:20px;">
                                                            <asp:TextBox ID="txtAns" runat="server" class="form-control" ClientIDMode="Static" TabIndex="2" MaxLength="250"/>
                                                        </td>
                                                        <td class="center-align" style="width: 10%;">
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
                                    <div class="row padding-1 gradient-45deg-blue-grey-blue-grey vertical-align-bottom" style="margin-top: 10px;">
                                        <div class="col m12">
                                            <button type="button" id="btnSave" runat="server" clientidmode="Static" class="btn cyan right mr-1" onserverclick="btnSave_ServerClick" tabindex="61"><i class="material-icons left">save</i>Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

