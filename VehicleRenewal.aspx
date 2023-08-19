<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehicleRenewal.aspx.cs" Inherits="StarsProject.VehicleRenewal" %>
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
    <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='<%=ResolveUrl("~/js/plugins/jquery.colorbox-min.js") %>'></script>
    <link href="css/plugins/colorbox.css" rel="stylesheet" type="text/css" />
    <link href="plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="plugins/datatables/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.11.2/jquery-ui.min.js" />

<%--    <link href="css/Registration.css" rel="stylesheet" type="text/css" />
    <link href="css/PageReSetup.css" rel="stylesheet" type="text/css" />--%>
    <link href="css/jquery.auto-complete.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.auto-complete.min.js"></script>


    <style type="text/css">
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

        .text-input {
            position: relative;
            margin-top: 50px;
            input [type="text"];
        }

        input[type="text"] + label {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            height: 40px;
            line-height: 40px;
            color: white;
            border-radius: 3px 0 0 3px;
            padding: 0 20px;
            background: #E03616;
            transform: translateZ(0) translateX(0);
            transition: all 0.3s ease-in;
            transition-delay: 0.2s;
        }

        input[type="text"]:focus + label {
            transform: translateY(-120%) translateX(0%);
            border-radius: 3px;
            transition: all 0.1s ease-out;
        }

        input[type="text"]:focus {
            padding: 10px;
            transition: all 0.3s ease-out;
            transition-delay: 0.2s;
        }

        }

        /* =================================================================================== */
        .row.heading h2 {
            color: #fff;
            font-size: 52.52px;
            line-height: 95px;
            font-weight: 400;
            text-align: center;
            margin: 0 0 40px;
            padding-bottom: 20px;
            text-transform: uppercase;
        }

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
            padding-top: 20px;
            padding-bottom: 20px;
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
            background-color: #e8e8e8;
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

        .flip-card {
            background-color: transparent;
            width: 300px;
            height: 180px;
            margin-bottom: 15px;
            perspective: 1000px;
        }

        .flip-card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.6s;
            transform-style: preserve-3d;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        }

        .flip-card:hover .flip-card-inner {
            transform: rotateY(180deg);
        }

        .flip-card-front, .flip-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
        }

        .flip-card-front {
            background-color: white;
            color: black;
            padding-top: 10px;
            border-radius: 4px;
        }

        .flip-card-back {
            background-color: #2980b9;
            color: white;
            transform: rotateY(180deg);
            border-radius: 4px;
        }

        .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
            color: white;
            background-color: navy;
            border-color: #dee2e6 #dee2e6 #fff;
        }

        th {
            color: #e6e6f1 !important;
            background-color: #4a69d8 !important;
        }
        .nav-tabs {
            border-bottom: 1px solid #234b73;
        }
        .nav-link {
            padding: .4rem .5rem;
        }
        .table td, .table th {
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>
        <div id="myModal" style="display: block; width: 100%;">
            <div class="modal-content">
                <div class="modal-body" style="min-height: 500px; padding: 0px 5px;">
                    <table id="tblInqProductGroup" class="table table-striped table-bordered" style="font-size:12px;" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <asp:Repeater ID="rptRenewal" runat="server" OnItemDataBound="rptRenewal_ItemDataBound">
                        <HeaderTemplate>
                            <thead class="thead-dark" style="font-size:12px;">
                                <tr>
                                    <th class="center-align">Registration #</th>
                                    <th class="center-align">Form38</th>
                                    <th class="center-align">GujPermit</th>
                                    <th class="center-align">Form47</th>
                                    <th class="center-align">FitmentCerti</th>
                                    <th class="center-align">Insurance</th>
                                    <th class="center-align">FormLS2</th>
                                    <th class="center-align">Rule19</th>
                                    <th class="center-align">Rule18</th>      
                                    <th class="center-align">Rule43</th>      
                                    <th class="center-align">PUC</th>         
                                    <th class="center-align">FitnessCerti</th>
                                </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="blueShed">
                                
                                <asp:HiddenField value='<%# Eval("Form38")%>' ID="hdnForm38" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField value='<%# Eval("GujPermit")%>' ID="hdnGujPermit" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField value='<%# Eval("Form47")%>' ID="hdnForm47" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField value='<%# Eval("FitmentCerti")%>' ID="hdnFitmentCerti" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField value='<%# Eval("Insurance")%>' ID="hdnInsurance" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField value='<%# Eval("FormLS2")%>' ID="hdnFormLS2" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField value='<%# Eval("Rule19")%>' ID="hdnRule19" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField value='<%# Eval("Rule18")%>' ID="hdnRule18" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField value='<%# Eval("Rule43")%>' ID="hdnRule43" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField value='<%# Eval("PUC")%>' ID="hdnPUC" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField value='<%# Eval("FitnessCerti")%>' ID="hdnFitnessCerti" runat="server" ClientIDMode="Static" />
                                
                                <td class="center-align blue-text"><%# Eval("RegistrationNo")%></td>
                                <td id="tdForm38" runat="server" class="center-align"><%# Eval("Form38Renewdt", "{0:dd/MM/yyyy}")%></td>
                                <td id="tdGujPermit" runat="server" class="center-align"><%# Eval("GujPermitRenewdt", "{0:dd/MM/yyyy}")%></td>
                                <td id="tdForm47" runat="server" class="center-align"><%# Eval("Form47Renewdt", "{0:dd/MM/yyyy}")%></td>
                                <td id="tdFitmentCerti" runat="server" class="center-align"><%# Eval("FitmentCertiRenewdt", "{0:dd/MM/yyyy}")%></td>
                                <td id="tdInsurance" runat="server" class="center-align"><%# Eval("InsuranceRenewdt", "{0:dd/MM/yyyy}")%></td>
                                <td id="tdFormLS2" runat="server" class="center-align"><%# Eval("FormLS2Renewdt", "{0:dd/MM/yyyy}")%></td>
                                <td id="tdRule19" runat="server" class="center-align"><%# Eval("Rule19Renewdt", "{0:dd/MM/yyyy}")%></td>
                                <td id="tdRule18" runat="server" class="center-align"><%# Eval("Rule18Renewdt", "{0:dd/MM/yyyy}")%></td>      
                                <td id="tdRule43" runat="server" class="center-align"><%# Eval("Rule43Renewdt", "{0:dd/MM/yyyy}")%></td>      
                                <td id="tdPUC" runat="server" class="center-align"><%# Eval("PUCRenewdt", "{0:dd/MM/yyyy}")%></td>         
                                <td id="tdFitnessCerti" runat="server" class="center-align"><%# Eval("FitnessCertiRenewdt", "{0:dd/MM/yyyy}")%></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
