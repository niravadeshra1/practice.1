<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductGroupM_Tech.aspx.cs" Inherits="StarsProject.ProductGroupM_Tech" %>

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
        /*.clDiv70 { height:50px; vertical-align:middle; }
        .imgChart { vertical-align:middle; Height:40px; width:40px }
        #drpSelectDepartment { margin:7px 0px; font-family: Verdana,Arial; font-size:12px; vertical-align:middle;}
        .clTrans { background-color: transparent; }*/

    </style>
    <style type="text/css">
        .required:after {
            content: " *";
            color: #f00;
        }
        
              /* ---------------------------------------------------------- */
        .checkbox-container {
	        display: inline-block;
	        position: relative;
        }

        .checkbox-container label {
	        background-color: lightgray;
	        border: 1px solid #fff;
	        border-radius: 20px;
	        display: inline-block;
	        position: relative;
	        transition: all 0.3s ease-out;
	        width: 45px;
	        height: 25px;
	        z-index: 2;
        }

        .checkbox-container label::after {
	        content: ' ';
	        background-color: red;
	        border-radius: 50%;
	        position: absolute;
	        top: 1.5px;
	        left: 1px;
	        transform: translateX(0);
	        transition: transform 0.3s linear;
	        width: 20px;
	        height: 20px;
	        z-index: 3;
        }

        .checkbox-container input {
	        visibility: hidden;
	        position: absolute;
	        z-index: 2;
        }

        /*.checkbox-container input:checked + label + .active-circle {
	        transform: translate(-50%, -50%) scale(15);
        }*/

        .checkbox-container input:checked + label::after {
	        transform: translateX(calc(100% + 0.5px));
            background-color:forestgreen;
        }
        /*---------------------------------------------------------------*/ 
         
    </style>
    <script type="text/javascript">
        // ------------------------------------------------------------------------
        //  Open Bootstrap Modal Popup 
        // ------------------------------------------------------------------------
        function validateForm() {
            var errmsg = "";
            var validflag = true;
            // ----------------------------------------
            if (jQuery("#txtProductGroupName").val() == "") {

                if (jQuery("#txtProductGroupName").val() == "")
                    errmsg += "Product Group Name is required</br>";

                jQuery("#divErrorMessage").html(errmsg).show();

                validflag = false;
            }
            // ----------------------------------------
            if (validflag == true) {
                btnCloseDialog();
                
            }
            return validflag;
        }
        // -------------------------------------------------------
        function openFormContainerNew() {
            clearFormData();
            // ------------------------------------------
            jQuery(".usermsg").empty();
            jQuery('#myModal').modal({ "show": true });
        }

        function openFormContainer() {
            jQuery('#myModal').modal({ "show": true });
        }

        function btnCloseDialog() {
            jQuery('#myModal').modal('hide'); 
            jQuery('#myModal .modal-backdrop').remove();
        };

        function clearFormData() {
            jQuery(".usermsg").empty();
            jQuery('#form1').find('input:text, input:password, input:file, select, textarea').val('');
            jQuery("#hdnpkID").val('');
        }

        function retainTabPosition() {

            var currTab = $("#hdnCurrTab").val();
            $("#lnkTechPara").removeClass("active");
            $("#lnkSimpleSpec").removeClass("active");
            $("#lnkCongImageAtt").removeClass("active");
            $("#lnkCutImageAtt").removeClass("active");
            $("#lnkConImageAtt").removeClass("active");

            $("#pnl_techpara").css("display", "none");
            $("#pnl_simplespec").css("display", "none");
            $("#pnl_congimageatt").css("display", "none");
            $("#pnl_cutimageatt").css("display", "none");
            $("#pnl_conimageatt").css("display", "none");

            if (currTab == 'pnl_techpara') {
                $("#lnkTechPara").addClass("active");
                $("#pnl_techpara").css("display", "block");
            }
            else if (currTab == 'pnl_simplespec') {
                $("#lnkSimpleSpec").addClass("active");
                $("#pnl_simplespec").css("display", "block");
            }
            else if (currTab == 'pnl_congimageatt') {
                $("#lnkCongImageAtt").addClass("active");
                $("#pnl_congimageatt").css("display", "block");
            }
            else if (currTab == 'pnl_cutimageatt') {
                $("#lnkCutImageAtt").addClass("active");
                $("#pnl_cutimageatt").css("display", "block");
            }
            else if (currTab == 'pnl_conimageatt') {
                $("#lnkConImageAtt").addClass("active");
                $("#pnl_conimageatt").css("display", "block");
            }
        }

        function showErrorPopup(xMsg) {
            M.toast({ html: '<ul id="ulToast" style="list-style:none;">' + xMsg + '</ul>', displayLength: 4000 });
        }
    </script>
</head>
<body class="loginpage">
    <form id="frmEntry" runat="server">
    <asp:ScriptManager ID="srcUser" runat="server"></asp:ScriptManager>

    <div id="contentwrapper" class="contentwrapper">
    
        <asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="widgetbox">
            <asp:HiddenField ID="hdnpkID" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hdnOrderWiseSpecs" runat="server" ClientIDMode="Static" EnableViewState="true"/>
            <asp:HiddenField ID="hdnCurrTab" runat="server" ClientIDMode="Static" EnableViewState="true" Value="pnl_techpara" />
            <div id="myModal" style="display:block; width:100%;">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row" style="margin-top:50px;">
                            <div class="input-field col m8">
                                <label class="active required" for="txtProductGroupName">Product Group Name</label>
                                <asp:TextBox ID="txtProductGroupName" runat="server" placeholder=" " class="form-control" ClientIDMode="Static" TabIndex="1" />
                            </div>
                            <div class="input-field col m2">
                                <div class="form-check p-0">
                                    <label class="form-check-label input-field" style="color:black;font-size:25px;" for="chkActive">Active Status :  </label>
                                    <div class="checkbox-container yellow">
                                        <asp:CheckBox ID="chkActive" runat="server" ClientIDMode="Static" TabIndex="2" />
                                        <label for="chkActive"></label>
                                        <div class="active-circle"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col m12">
                                        <ul id="myTab" class="tabs" runat="server" clientidmode="Static" enableviewstate="true" style="background-color: antiquewhite;">
                                            <li class="tab col p-0"><a id="lnkTechPara" class="left active" href="#pnl_techpara" tabindex="12">Technical Parameters</a></li>
                                            <li class="tab col p-0"><a id="lnkSimpleSpec" class="left" href="#pnl_simplespec" tabindex="45">Simple Specifications</a></li>
                                            <li class="tab col p-0"><a id="lnkCongImageAtt" class="left" href="#pnl_congimageatt" tabindex="48">Congigration Image Attachments</a></li>
                                            <li class="tab col p-0"><a id="lnkCutImageAtt" class="left" href="#pnl_cutimageatt" tabindex="48">Cutting Image Attachments</a></li>
                                            <li class="tab col p-0"><a id="lnkConImageAtt" class="left" href="#pnl_conimageatt" tabindex="48">Consumable Image Attachments</a></li>
                                        </ul>
                                    </div>
                                    <div id="pnl_techpara" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true">
                                        <section class="our-webcoderskull padding-lg" style="height: 320px; overflow-y: auto;" id="prodsec1">
                                            <div class="container" style="max-width: none; width: 98%; margin: 20px !important;">
                                                <table class="stdtable" cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <asp:Repeater ID="rptProductSpecs" runat="server" ClientIDMode="Static" OnItemCommand="rptProductSpecs_ItemCommand">
                                                        <HeaderTemplate>
                                                            <thead>
                                                                <tr>
                                                                    <th class="text-center width-10">Order.#</th>
                                                                    <th class="text-center width-20">Group Description</th>
                                                                    <th class="text-center width-20">Head</th>
                                                                    <th class="text-center width-20">Specification</th>
                                                                    <th class="text-center width-20">Material Remarks</th>
                                                                    <th class="text-center width-10">Action</th>
                                                                </tr>
                                                            </thead>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr class="blueShed">
                                                                <asp:HiddenField id="edpkID" runat="server" ClientIDMode="Static" Value='<%# Eval("pkID") %>' />
                                                                <td class="text-center width-10">
                                                                    <asp:TextBox class="form-control text-left" Style="width: 50px" ID="newOrder" runat="server" ClientIDMode="Static" TabIndex="14" Text='<%# Eval("itemOrder") %>' />
                                                                </td>
                                                                <td class="text-left width-20">
                                                                    <asp:TextBox class="form-control text-left" ID="newGroupHead" runat="server" ClientIDMode="Static" TabIndex="7" Text='<%# Eval("GroupHead") %>' AutoPostBack ="true" OnTextChanged="newGroupHead_TextChanged" />
                                                                </td>
                                                                <td class="text-left width-20">
                                                                    <asp:TextBox class="form-control text-left" ID="newMaterialHead" runat="server" ClientIDMode="Static" TabIndex="7" Text='<%# Eval("MaterialHead") %>' AutoPostBack ="true" OnTextChanged="newGroupHead_TextChanged" />
                                                                </td>
                                                                <td class="text-left width-20">
                                                                    <asp:TextBox class="form-control text-left" ID="newMaterialSpec" runat="server" ClientIDMode="Static" TabIndex="7" Text='<%# Eval("MaterialSpec") %>' AutoPostBack ="true" OnTextChanged="newGroupHead_TextChanged" />
                                                                </td>
                                                                <td class="text-left width-20">
                                                                    <asp:TextBox class="form-control text-left" ID="newMaterialRemarks" runat="server" ClientIDMode="Static" TabIndex="7" Text='<%# Eval("MaterialRemarks") %>' AutoPostBack ="true" OnTextChanged="newGroupHead_TextChanged" />
                                                                </td>
                                                                <td class="center-align width-10">
                                                                    <asp:ImageButton ID="ImgbtnDelete" runat="server" ClientIDMode="Static" ImageUrl="~/images/delete.png" ToolTip="Delete" CommandName="Delete" CommandArgument='<%# Eval("pkID") %>' Width="20" Height="20" />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr class="blueShed">
                                                                <td class="text-center width-10">
                                                                    <asp:TextBox class="form-control text-left" Style="width: 50px" ID="txtOrder" runat="server" ClientIDMode="Static" TabIndex="14" />
                                                                </td>
                                                                <td class="text-left width-20">
                                                                    <asp:TextBox class="form-control text-left" ID="txtGroupHead" runat="server" ClientIDMode="Static" TabIndex="7"  />
                                                                </td>
                                                                <td class="text-left width-20">
                                                                    <asp:TextBox class="form-control text-left" ID="txtMaterialHead" runat="server" ClientIDMode="Static" TabIndex="7"  />
                                                                </td>
                                                                <td class="text-left width-20">
                                                                    <asp:TextBox class="form-control text-left" ID="txtMaterialSpec" runat="server" ClientIDMode="Static" TabIndex="7"  />
                                                                </td>
                                                                <td class="text-left width-20">
                                                                    <asp:TextBox class="form-control text-left" ID="txtMaterialRemarks" runat="server" ClientIDMode="Static" TabIndex="7"  />
                                                                </td>
                                                                <td class="center-align width-10">
                                                                    <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="~/images/buttons/bt-add2.png" ToolTip="Add Item" CommandName="Save" CommandArgument='0' Width="110" Height="30" />
                                                                </td>
                                                            </tr>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </div>
                                        </section>
                                    </div>
                                    <div id="pnl_simplespec" class="col m12 mt-1" runat="server" clientidmode="Static" enableviewstate="true">
                                        <div class="input-field col m4">
                                            <label for="txtSimpleSpecs">Simple Specification</label>
                                            <asp:TextBox ID="txtSimpleSpecs" runat="server" placeholder="" class="form-control" ClientIDMode="Static" TextMode="MultiLine" Height="250px" TabIndex="1" />
                                        </div>
                                        <div class="input-field col m4">
                                            <label for="txtAppIndustries">Applicable Industries</label>
                                            <asp:TextBox ID="txtAppIndustries" runat="server" placeholder="" class="form-control" ClientIDMode="Static" TextMode="MultiLine" Height="250px" TabIndex="1" />
                                        </div>
                                        <div class="input-field col m4">
                                            <label for="txtCategoryFt">Category Features</label>
                                            <asp:TextBox ID="txtCategoryFt" runat="server" placeholder="" class="form-control" ClientIDMode="Static" TextMode="MultiLine" Height="250px" TabIndex="1" />
                                        </div>
                                    </div>
                                    <div id="pnl_congimageatt" class="row" runat="server" clientidmode="Static" enableviewstate="true">
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                <div class="row">
                                                    <div class="col s12">
                                                        <div class="section app-file-manager-wrapper no-margin  border-none">
                                                        <div class="app-file-overlay"></div>
                                                            <div class="app-file-area" style="height:400px; overflow-y:auto;">
                                                                <div class="app-file-header">
                                                                    <div class="row">
                                                                        <div class="input-field col m12 add-new-file mt-0">
                                                                            <div class="col m12">
                                                                                <label class="active" style="font-size:20px;color:black" for="FileUpload2">Upload Configration Image Gallery</label>
                                                                            </div>
                                                                            <div class="col m12">
                                                                                <asp:FileUpload ID="uploadImgGallerycong" multiple="multiple" runat="server" ClientIDMode="Static" CssClass="Cntrl1" onchange="this.form.submit()" ToolTip="Select Only PDF File" /> 
                                                                                <asp:Button ID="btnUpload3" CssClass="hide" runat="server" Text="Upload" TabIndex="45" onclick="btnUpload3_Click" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="app-file-content">
                                                                    <div class="app-file-sidebar-content row">
                                                                        <div class="col m12 app-file-files">
                                                                            <asp:Repeater ID="rptProductImages" runat="server" ClientIDMode="Static" OnItemCommand="rptProductImages_ItemCommand">
                                                                            <ItemTemplate>
                                                                                <div class="col m4">
                                                                                    <div class="card box-shadow-none mb-1 app-file-info">
                                                                                        <div class="row col m12 p-0">
                                                                                            <div class="col m6 p-0 left-align">
                                                                                                <asp:LinkButton ID="ImgBtnDelete" runat="server" CommandName="Delete" TabIndex="47" CommandArgument='<%# Eval("pkID") %>'>
                                                                                                <i class="material-icons delete" style="padding: 5px 0px 0px 20px;">delete_outline</i>
                                                                                                </asp:LinkButton>
                                                                                            </div>
                                                                                            <div class="col m6 p-0 right-align">
                                                                                                <a id="lnkViewFile">
                                                                                                    <i class="material-icons" style="padding: 5px 0px 0px 20px;">find_in_page</i>
                                                                                                </a>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="card-content" style="background-color:beige; padding: 10px;border-radius: 4px;border: 1px solid silver">
                                                                                        <div class="app-file-content-logo grey lighten-4" style="height:100px">
                                                                                                            
                                                                                            <div class="row fonticon p2" style="background:url('<%# "productimages/" + Eval("Name").ToString() %>') no-repeat top center; background-size:cover; width: 150px; height: 98px; margin-left: 10px;">

                                                                                            </div>
                                                                                            <%--<img class="recent-file" src='<%# "productimages/" + Eval("Name").ToString() %>' height="38" width="30" alt="Card image cap" style="display: block; margin: 5px auto;">--%>
                                                                                        </div>
                                                                                        <div class="app-file-details" style="background-color:silver;border-radius: 8px; padding-left: 10px;">
                                                                                            <div class="app-file-name font-weight-700">
                                                                                                <p style="display: block;width: 180px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><%# Eval("Name").ToString() %></p>
                                                                                            </div>
                                                                                                        
                                                                                        </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </ItemTemplate>
                                                                            </asp:Repeater>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                 </div>

                                                </ContentTemplate>

                                            </asp:UpdatePanel>
                                        </div>
                                    <div id="pnl_cutimageatt" class="row" runat="server" clientidmode="Static" enableviewstate="true">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                <div class="row">
                                                    <div class="col s12">
                                                        <div class="section app-file-manager-wrapper no-margin  border-none">
                                                        <div class="app-file-overlay"></div>
                                                            <div class="app-file-area" style="height:400px; overflow-y:auto;">
                                                                <div class="app-file-header">
                                                                    <div class="row">
                                                                        <div class="input-field col m12 add-new-file mt-0">
                                                                            <div class="col m12">
                                                                                <label class="active" style="font-size:20px;color:black" for="FileUpload2">Upload Cutting Image Gallery</label>
                                                                            </div>
                                                                            <div class="col m12">
                                                                                <asp:FileUpload ID="uploadImgGallerycut" multiple="multiple" runat="server" ClientIDMode="Static" CssClass="Cntrl1" onchange="this.form.submit()" ToolTip="Select Only PDF File" /> 
                                                                                <asp:Button ID="Button1" CssClass="hide" runat="server" Text="Upload" TabIndex="45" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="app-file-content">
                                                                    <div class="app-file-sidebar-content row">
                                                                        <div class="col m12 app-file-files">
                                                                            <asp:Repeater ID="rptCutImages" runat="server" ClientIDMode="Static" OnItemCommand="rptCutImages_ItemCommand">
                                                                            <ItemTemplate>
                                                                                <div class="col m4">
                                                                                    <div class="card box-shadow-none mb-1 app-file-info">
                                                                                        <div class="row col m12 p-0">
                                                                                            <div class="col m6 p-0 left-align">
                                                                                                <asp:LinkButton ID="ImgBtnDelete" runat="server" CommandName="Delete" TabIndex="47" CommandArgument='<%# Eval("pkID") %>'>
                                                                                                <i class="material-icons delete" style="padding: 5px 0px 0px 20px;">delete_outline</i>
                                                                                                </asp:LinkButton>
                                                                                            </div>
                                                                                            <div class="col m6 p-0 right-align">
                                                                                                <a id="lnkViewFile">
                                                                                                    <i class="material-icons" style="padding: 5px 0px 0px 20px;">find_in_page</i>
                                                                                                </a>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="card-content" style="background-color:beige; padding: 10px;border-radius: 4px;border: 1px solid silver">
                                                                                        <div class="app-file-content-logo grey lighten-4" style="height:100px">
                                                                                                            
                                                                                            <div class="row fonticon p2" style="background:url('<%# "productimages/" + Eval("Name").ToString() %>') no-repeat top center; background-size:cover; width: 150px; height: 98px; margin-left: 10px;">

                                                                                            </div>
                                                                                            <%--<img class="recent-file" src='<%# "productimages/" + Eval("Name").ToString() %>' height="38" width="30" alt="Card image cap" style="display: block; margin: 5px auto;">--%>
                                                                                        </div>
                                                                                        <div class="app-file-details" style="background-color:silver;border-radius: 8px; padding-left: 10px;">
                                                                                            <div class="app-file-name font-weight-700">
                                                                                                <p style="display: block;width: 180px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><%# Eval("Name").ToString() %></p>
                                                                                            </div>
                                                                                                        
                                                                                        </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </ItemTemplate>
                                                                            </asp:Repeater>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                 </div>

                                                </ContentTemplate>

                                            </asp:UpdatePanel>
                                        </div>
                                    <div id="pnl_conimageatt" class="row" runat="server" clientidmode="Static" enableviewstate="true">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                <div class="row">
                                                    <div class="col s12">
                                                        <div class="section app-file-manager-wrapper no-margin  border-none">
                                                        <div class="app-file-overlay"></div>
                                                            <div class="app-file-area" style="height:400px; overflow-y:auto;">
                                                                <div class="app-file-header">
                                                                    <div class="row">
                                                                        <div class="input-field col m12 add-new-file mt-0">
                                                                            <div class="col m12">
                                                                                <label class="active" style="font-size:20px;color:black" for="FileUpload2">Upload Consumable Image Gallery</label>
                                                                            </div>
                                                                            <div class="col m12">
                                                                                <asp:FileUpload ID="uploadImgGallerycon" multiple="multiple" runat="server" ClientIDMode="Static" CssClass="Cntrl1" onchange="this.form.submit()" ToolTip="Select Only PDF File" /> 
                                                                                <asp:Button ID="Button2" CssClass="hide" runat="server" Text="Upload" TabIndex="45" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="app-file-content">
                                                                    <div class="app-file-sidebar-content row">
                                                                        <div class="col m12 app-file-files">
                                                                            <asp:Repeater ID="rpt_conImages" runat="server" ClientIDMode="Static" OnItemCommand="rpt_conImages_ItemCommand">
                                                                            <ItemTemplate>
                                                                                <div class="col m4">
                                                                                    <div class="card box-shadow-none mb-1 app-file-info">
                                                                                        <div class="row col m12 p-0">
                                                                                            <div class="col m6 p-0 left-align">
                                                                                                <asp:LinkButton ID="ImgBtnDelete" runat="server" CommandName="Delete" TabIndex="47" CommandArgument='<%# Eval("pkID") %>'>
                                                                                                <i class="material-icons delete" style="padding: 5px 0px 0px 20px;">delete_outline</i>
                                                                                                </asp:LinkButton>
                                                                                            </div>
                                                                                            <div class="col m6 p-0 right-align">
                                                                                                <a id="lnkViewFile">
                                                                                                    <i class="material-icons" style="padding: 5px 0px 0px 20px;">find_in_page</i>
                                                                                                </a>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="card-content" style="background-color:beige; padding: 10px;border-radius: 4px;border: 1px solid silver">
                                                                                        <div class="app-file-content-logo grey lighten-4" style="height:100px">
                                                                                                            
                                                                                            <div class="row fonticon p2" style="background:url('<%# "productimages/" + Eval("Name").ToString() %>') no-repeat top center; background-size:cover; width: 150px; height: 98px; margin-left: 10px;">

                                                                                            </div>
                                                                                            <%--<img class="recent-file" src='<%# "productimages/" + Eval("Name").ToString() %>' height="38" width="30" alt="Card image cap" style="display: block; margin: 5px auto;">--%>
                                                                                        </div>
                                                                                        <div class="app-file-details" style="background-color:silver;border-radius: 8px; padding-left: 10px;">
                                                                                            <div class="app-file-name font-weight-700">
                                                                                                <p style="display: block;width: 180px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><%# Eval("Name").ToString() %></p>
                                                                                            </div>
                                                                                                        
                                                                                        </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </ItemTemplate>
                                                                            </asp:Repeater>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                 </div>

                                                </ContentTemplate>

                                            </asp:UpdatePanel>
                                        </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="row">
                            <div class="input-field col m12">
                                <div id="divErrorMessage" class="usermsg" runat="server" clientidmode="Static"></div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSave" runat="server" ClientIDMode="Static" Text="Save" class="btn btn-primary" OnClientClick="return validateForm();" OnClick="btnSave_Click" TabIndex="3" />
                        <asp:Button ID="btnReset" runat="server" ClientIDMode="Static" Text="Reset" class="btn btn-primary" OnClick="btnReset_Click" TabIndex="4" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>