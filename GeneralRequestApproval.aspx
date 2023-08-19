<%@ Page Title="" Language="C#" MasterPageFile="~/StarsSite.Master" AutoEventWireup="true" CodeBehind="GeneralRequestApproval.aspx.cs" Inherits="StarsProject.GeneralRequestApproval" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .select-wrapper input.select-dropdown {
            height: 2rem !important; 
            width: 200px; 
            border: 2px solid navy !important; 
            background-color: antiquewhite !important;
            margin:10px 40px 0px 0px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="srcUser" runat="server" ClientIDMode="Static" EnablePageMethods="true"></asp:ScriptManager>

    <div class="modal-body float-right" id="divApprovalStatus" runat="server" clientidmode="Static">
        <div class="form-row">
            <asp:DropDownList ID="drpApprovalStatus" runat="server" ClientIDMode="Static" Class="form-control" TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="drpApprovalStatus_SelectedIndexChanged">
                <%--<asp:ListItem Text="-- All --" Value="" />--%>
                <asp:ListItem Text="Pending" Value="Pending" />
                <asp:ListItem Text="Approved" Value="Approved" />
            </asp:DropDownList>
        </div>
    </div>
    <div class="card bg-info-gradient" style="background: #17a2b8; background: -webkit-gradient(linear,left bottom,left top,color-stop(0,#17a2b8),color-stop(1,#89d8e4));">
        <div class="card-header no-border" style="padding: 5px 10px;">
            <h5>
                <i class="fa fa-th mr-1"></i><span id="spnPageHeader" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Manage Request Approval</span>
            </h5>
        </div>
    </div>
    <div class="row">
        <div class="col m12">
        <table id="tblInqProductGroup" class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%">
            <asp:Repeater ID="rptApproval" runat="server" OnItemDataBound="rptApproval_ItemDataBound">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th class="center-align">Request #</th>
                            <th class="center-align">Request Date</th>
                            <th class="left-align">Request Type</th>
                            <th class="center-align">Initiated By</th>
                            <th class="center-align">Approval Status</th>
                        </tr>
                    </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="blueShed">
                        <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" Value='<%#Eval("pkID") %>' />
                        <asp:HiddenField ID="hdnApprovalStatus" runat="server" ClientIDMode="Static" Value='<%#Eval("ApprovalStatus") %>' />
                        <asp:HiddenField ID="hdnCreatedBy" runat="server" ClientIDMode="Static" Value='<%#Eval("CreatedBy") %>' />
                        <td class="center-align">
                            <a href="javascript:viewSalesOrder(<%# Eval("pkID")%>);"><%# Eval("pkID") %></a>
                        </td>
                        <td class="center-align"><%# Eval("RequestDate", "{0:dd/MM/yyyy}") %></td>
                        <td class="left-align"> <%# Eval("RequestType") %></td>
                        <td class="center-align"> <%# Eval("CreatedEmployee") %></td>
                        <td class="center-align">
                            <asp:DropDownList ID="drpApprovalStatus" runat="server" ClientIDMode="Static" class="select2-theme browser-default" TabIndex="1" Style="height: 1.70rem; margin: 0px; padding: 0px 0px 0px 10px;">
                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Approved" Value="Approved" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        </div>
    </div>
    <div class="row">
        <div class="col m12 mt-2">
            <asp:Button ID="btnApproveReject" runat="server" ClientIDMode="Static" class="btn btn-primary float-right" Text="Submit Status" OnClick="btnApproveReject_Click" />
        </div>
    </div>
</asp:Content>
