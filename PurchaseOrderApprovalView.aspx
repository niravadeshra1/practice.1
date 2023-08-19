<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/StarsSite.Master" CodeBehind="PurchaseOrderApprovalView.aspx.cs" Inherits="StarsProject.PurchaseOrderApprovalView" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="~/myPurchaseApproval.ascx" TagPrefix="uc1" TagName="myPurchaseApproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function viewPurchaseOrder(id) {
            var pageUrl = "PurchaseOrders.aspx?mode=view&id=" + id;
            $('#ifrModulePurchase').attr('src', pageUrl);
            $find("mpe").show();
        }

        function viewPurchaseOrder(id) {
            var pageUrl = "PurchaseOrders.aspx?mode=view&id=" + id;
            $('#ifrModulePurchase').attr('src', pageUrl);
            $find("mpe").show();
        }
        function gridAction(id) {
            var SOPageUrl = '';
            SOPageUrl = 'PurchaseOrders.aspx/GeneratePurchaseOrder';
            // *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
            if (jQuery.trim(jQuery("#hdnpopupPrintHeader").val()) == 'yes') {
                swal({
                    title: "Purc.Order Header ?", text: "Are you sure? You want to print Header !", icon: 'warning', dangerMode: true,
                    buttons: { cancel: 'Dont Print', delete: 'Yes, Print' }
                }).then(function (willDelete) {
                    if (willDelete) {
                        var x = PageMethods.setPrintHeader('yes');
                        jQuery.ajax({
                            type: "POST",
                            url: SOPageUrl,
                            data: '{pkID:\'' + id + '\'}',
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                // -----------------------------------------------------------
                                jQuery.ajax({
                                    type: "POST", url: 'PurchaseOrders.aspx/GetPurchaseOrderNoForPDF', data: '{pkID:\'' + id + '\'}',
                                    contentType: "application/json; charset=utf-8", success: function (data11) {
                                        OrderNoForPDF = (data11.d).replace("/", "-");
                                        if (OrderNoForPDF != "")
                                            ShowPDFfile('PDF/' + OrderNoForPDF.toString() + '.pdf');
                                        else
                                            alert('Purchase Order PDF Not Found !')
                                    }
                                });
                            },
                            error: function (r) { alert('Error : ' + r.responseText); },
                            failure: function (r) { alert('failure'); }
                        });

                    }
                    else {
                        var x = PageMethods.setPrintHeader('no');

                        jQuery.ajax({
                            type: "POST",
                            url: SOPageUrl,
                            data: '{pkID:\'' + id + '\'}',
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                // -----------------------------------------------------------
                                jQuery.ajax({
                                    type: "POST", url: 'PurchaseOrders.aspx/GetPurchaseOrderNoForPDF', data: '{pkID:\'' + id + '\'}',
                                    contentType: "application/json; charset=utf-8", success: function (data11) {
                                        OrderNoForPDF = (data11.d).replace("/", "-");
                                        if (OrderNoForPDF != "")
                                            ShowPDFfile('PDF/' + OrderNoForPDF.toString() + '.pdf');
                                        else
                                            alert('Purchase Order PDF Not Found !')
                                    }
                                });
                            },
                            error: function (r) { alert('Error : ' + r.responseText); },
                            failure: function (r) { alert('failure'); }
                        });

                    }
                });
            }
            else {
                jQuery.ajax({
                    type: "POST",
                    url: SOPageUrl,
                    data: '{pkID:\'' + id + '\'}',
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        // -----------------------------------------------------------
                        jQuery.ajax({
                            type: "POST", url: 'PurchaseOrders.aspx/GetPurchaseOrderNoForPDF', data: '{pkID:\'' + id + '\'}',
                            contentType: "application/json; charset=utf-8", success: function (data11) {
                                OrderNoForPDF = (data11.d).replace("/", "-");
                                if (OrderNoForPDF != "")
                                    ShowPDFfile('PDF/' + OrderNoForPDF.toString() + '.pdf');
                                else
                                    alert('Purchase Order PDF Not Found !')
                            }
                        });
                    },
                    error: function (r) { alert('Error : ' + r.responseText); },
                    failure: function (r) { alert('failure'); }
                });
            }
        }
        function ShowPDFfile(repFilename) {

            var today = new Date();
            var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date + ' ' + time;

            yhooWin = window.open(repFilename + "?id=" + dateTime, "ywin", "width=1050,height=750");
            yhooWin.focus();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="srcPurcApproval" runat="server" ClientIDMode="Static" EnablePageMethods="true"></asp:ScriptManager>
    <div class="card bg-info-gradient" style="background: #17a2b8; background: -webkit-gradient(linear,left bottom,left top,color-stop(0,#17a2b8),color-stop(1,#89d8e4));">
        <div class="card-header no-border" style="padding: 5px 10px;">
            <h5>
                <i class="fa fa-th mr-1"></i><span id="spnPageHeader" runat="server" clientidmode="Static" class="text-top" style="color: white; margin-left: 15px;">Purchase Order Approval</span>
            </h5>
        </div>
    </div>
    <uc1:myPurchaseApproval runat="server" ID="myPurchaseApproval" style="width:100%;" />
    <br /><br /><br /><br />
</asp:Content>
