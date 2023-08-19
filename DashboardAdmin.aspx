<%@ Page Title="" Language="C#" MasterPageFile="~/StarsSite.Master" AutoEventWireup="true" CodeBehind="DashboardAdmin.aspx.cs" Inherits="StarsProject.DashboardAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/jkanban/jkanban.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/materialize.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/themes/vertical-modern-menu-template/style.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/pages/app-kanban.css">
    
    <style type="text/css">
        #chkBoard { position: absolute !important; pointer-events:all !important; opacity: 100 !important; width:20px !important; height:20px !important;}

        .card-title {
            color: #1e90ff;
        }

        .mydropdowncontent {
            width: 230px !important;
            height: auto !important;
        }

        .mydropdowncontent li {
            min-height: auto;
            padding: 0px;
        }

        .mydropdowncontent li > a {
            min-height: auto;
            padding: 2px;
            font-size: 12px;
            color: navy;
            padding: 3px 5px;
            background-color: #f3ebeb;
        }

        .dataTables_filter, .dataTables_info, .dataTables_length {
            display: none;
        }

        table.dataTable thead th, table.dataTable thead td, {
            padding: 5px 5px;
            font-size: 12px;
        }

        table.dataTable tbody th, table.dataTable tbody td {
            padding: 5px 5px;
            font-size: 11px;
        }

        .myDropDownClass {
            background-color: #fff6e1;
            color: navy;
            font-size: medium;
            width: 150px;
            height: 30px !important;
            border: 1px solid black;
            margin-top: 1px;
            padding: 1px 5px;
            border: none;
            border-radius: 5px;
        }

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

        .titleHead {
            font-weight: 800;
            margin-left: 10px;
        }

        .cardRound {
            box-shadow: black -6px 8px 6px -6px !important;
            border-radius: 8px 8px 0px 0px !important;
        }

        .h5Round {
            border-radius: 8px 8px 0px 0px;
            margin-bottom: 5px;
            padding: 5px;
            line-height: 35px;
            background: linear-gradient(45deg, #303f9f, #7b1fa2) !important;
            color: white !important;
        }

        .h5RoundHead {
            border-radius: 0px 0px 0px 0px;
            margin-bottom: 5px;
            padding: 5px;
            line-height: 35px;
            background: linear-gradient(45deg, silver, #7f88ec6e);
        }
    </style>

    <script type="text/javascript">
        

        $(document).ready(function () {

            //$(document).on("click", ".delete-kanban-item", function () {
            //    $delete_item = kanban_curr_item_id;
            //    // console.log($delete_item);
            //    addEventListener("click", function () {
            //        KanbanExample.removeElement($delete_item);
            //    });
            //});

            // Kanban board dropdown
            // ---------------------
            //var kanban_dropdown = document.createElement("div");
            //kanban_dropdown.setAttribute("class", "dropdown");
            //dropdownKanban();
            //function dropdownKanban() {
            //    kanban_dropdown.innerHTML =
            //        '<a class="dropdown-trigger" href="#" data-target="" > <i class="material-icons white-text">more_vert</i></a>' +
            //        '<ul id="" class="dropdown-content">' +
            //        '<li><a href="#!"><i class="material-icons">link</i><span class="menu-item">Copy Link</span></a></li>' +
            //        '<li class="kanban-delete"><a href="#!"><i class="material-icons">delete</i><span class="menu-item">Delete</span></a></li>' +
            //        '</ul>';
            //    if (!$(".kanban-board-header div").hasClass("dropdown")) {
            //        $(".kanban-board-header").append(kanban_dropdown);
            //    }
            //}



            //// Delete Kanban Item
            //// -------------------
            //$(document).on("click", ".delete-kanban-item", function () {
            //    $delete_item = kanban_curr_item_id;
            //    // console.log($delete_item);
            //    addEventListener("click", function () {
            //        KanbanExample.removeElement($delete_item);
            //    });
            //});

            // Kanban Quill Editor
            // -------------------
            //var composeMailEditor = new Quill(".snow-container .compose-editor", {
            //    modules: {
            //        toolbar: ".compose-quill-toolbar"
            //    },
            //    placeholder: "Write a Comment... ",
            //    theme: "snow"
            //});

            // Making Title of Board editable
            // ------------------------------
            //$(document).on("mouseenter", ".kanban-title-board", function () {
            //    $(this).attr("contenteditable", "true");
            //    $(this).addClass("line-ellipsis");
            //});
            // Perfect Scrollbar - card-content on kanban-sidebar
            //if ($(".kanban-sidebar").length > 0) {
            //    var ps_sidebar = new PerfectScrollbar(".kanban-sidebar", {
            //        theme: "dark",
            //        wheelPropagation: false
            //    });
            //}
            // set unique id on all dropdown trigger
            //for (var i = 1; i <= $(".kanban-board").length; i++) {
            //    $(".kanban-board[data-id='" + i + "']").find(".kanban-board-header .dropdown-trigger").attr("data-target", i);
            //    $(".kanban-board[data-id='" + i + "']").find("ul").attr("id", i);
            //}
            // materialise dropdown initialize
            //$('.dropdown-trigger').dropdown({
            //    constrainWidth: false
            //});
            
            $(".recorder").on("click", function (event) {
                debugger;
                //alert("You've clicked: " + event.target.nodeName + ", id: " + event.target.id);
                setRecording(event.target.id)
                $("#kanban-app").html("");
                $("#divTaskSummary").html("");
                __doPostBack('', '');
                return true;
            });

            $(".viewtask").on("click", function (event) {
                debugger;
                //alert("You've clicked VIEW Task : " + event.target.nodeName + ", id: " + event.target.id);
                showMyTask(event.target.id)
                // ---------------------------------------
                //$("#kanban-app").html("");
                //$("#divTaskSummary").html("");
                
                //__doPostBack('', '');
                return false;
            });
        });

        // Kanban-overlay and sidebar hide
        // --------------------------------------------
        $(".kanban-sidebar .delete-kanban-item, .kanban-sidebar .close-icon, .kanban-sidebar .update-kanban-item, .kanban-overlay").
            on("click", function () {
                $(".kanban-overlay").removeClass("show");
                $(".kanban-sidebar").removeClass("show");
            });

        function loadMyTaskBoard()
        {
            var kanban_board_data = JSON.parse($("#hdnJsonData").val());
            
            // ----------------------------------------------
            var kanban_curr_el, kanban_curr_item_id, kanban_item_title, kanban_data, kanban_item, kanban_users, kanban_curr_item_date;
            var board_item_id, board_item_el;
            // ---------------------------------------------------------------------------------
            // Kanban Board
            // ---------------------------------------------------------------------------------
            var KanbanExample = new jKanban({
                element: "#kanban-app", // selector of the kanban container
                widthBoard: '300px',
                click: function (el) {
                    // kanban-overlay and sidebar display block on click of kanban-item
                    //$(".kanban-overlay").addClass("show");
                    //$(".kanban-sidebar").addClass("show");

                    // Set el to var kanban_curr_el, use this variable when updating title
                    kanban_curr_el = el;

                    // Extract  the kan ban item & id and set it to respective vars
                    kanban_item_title = $(el).contents()[0].data;
                    kanban_curr_item_id = $(el).attr("data-eid");
                    // set edit title
                    $(".edit-kanban-item .edit-kanban-item-title").val(kanban_item_title);
                    //alert(kanban_curr_item_id)
                    //alert(el)
                    //alert($(el).contents()[0].data)
                    //var tmpVal = $(el).contents()[0].data;
                    //showMyTask('edit', kanban_curr_item_id);

                },

                //buttonClick: function (el, boardId) {
                // -------------------------------------------------------------
                // Section : Create a form to add add new element
                // -------------------------------------------------------------
                //var formItem = document.createElement("form");
                //formItem.setAttribute("class", "itemform");
                //formItem.innerHTML =
                //    '<div class="input-field">' +
                //    '<textarea class="materialize-textarea add-new-item" rows="2" autofocus required></textarea>' +
                //    "</div>" +
                //    '<div class="input-field display-flex">' +
                //    '<button type="submit" class="btn-floating btn-small mr-2"><i class="material-icons">add</i></button>' +
                //    '<button type="button" id="CancelBtn" class="btn-floating btn-small"><i class="material-icons">clear</i></button>' +
                //    "</div>";

                // -------------------------------------------------------------
                // Section : Add new item on submit click
                // -------------------------------------------------------------
                //KanbanExample.addForm(boardId, formItem);
                //formItem.addEventListener("submit", function (e) {
                //    e.preventDefault();
                //    var text = e.target[0].value;
                //    KanbanExample.addElement(boardId, {
                //        title: text
                //    });
                //    formItem.parentNode.removeChild(formItem);
                //});
                //$(document).on("click", "#CancelBtn", function () {
                //    $(this).closest(formItem).remove();
                //})
                //},
                //addItemButton: true, // add a button to board for easy item creation
                boards: kanban_board_data // data passed from defined variable
            });
            // *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
            // Kanban board loop
            // *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
            for (kanban_data in kanban_board_data) {
                // Kanban board items loop
                for (kanban_item in kanban_board_data[kanban_data].item) {

                    var board_item_details = kanban_board_data[kanban_data].item[kanban_item]; // set item details
                    board_item_id = $(board_item_details).attr("id"); // set 'id' attribute of kanban-item

                    (board_item_el = KanbanExample.findElement(board_item_id)), // find element of kanban-item by ID
                        (board_item_users = board_item_dueDate = board_item_comment = board_item_customer = board_item_attachment = board_item_image = board_item_badge =
                            " ");

                    // check if users are defined or not and loop it for getting value from user's array
                    if (typeof $(board_item_el).attr("data-users") !== "undefined") {
                        for (kanban_users in kanban_board_data[kanban_data].item[kanban_item].users) {
                            board_item_users +=
                                '<img class="circle" src=" ' +
                                kanban_board_data[kanban_data].item[kanban_item].users[kanban_users] +
                                '" alt="Avatar" height="24" width="24">';
                        }
                    }
                    // check if dueDate is defined or not
                    if (typeof $(board_item_el).attr("data-dueDate") !== "undefined") {
                        board_item_dueDate =
                            //'<a id="' + board_item_id + '" class="viewtask" style="color: red;" href="#">' +
                            '<div id="' + board_item_id + '"class="kanban-due-date left mb-5 lighten-5 gradient-45deg-yellow-green black-text gradient-shadow viewtask" style="width:100%;"' + $(board_item_el).attr("data-border") + '">' +
                            $(board_item_el).attr("data-dueDate") +
                            "</div><br />";
                            //"</a>";
                    }
                    if (typeof $(board_item_el).attr("data-customer") !== "undefined" && typeof $(board_item_el).attr("data-customer") !== "") {
                        
                        board_item_customer =
                            '<a id="' + board_item_id + '" class="recorder" style="color: red;" href="#">' +
                            '<div class="center mb-5 gradient-45deg-yellow-green black-text gradient-shadow recorder"' + $(board_item_el).attr("data-border") + '"><span class="' + $(board_item_el).attr("data-border") + '-text center"> ' +
                            $(board_item_el).attr("data-customer") +
                            "</span>" +
                            "</div>" +
                            "</a>";
                    }
                    if (typeof $(board_item_el).attr("data-ownership") !== "undefined" && typeof $(board_item_el).attr("data-ownership") !== "") {

                        board_item_ownership =
                            '<a id="' + board_item_id + '" class="recorder" style="color: white;" href="#">' +
                            '<div class="center mb-5 pb-2 blue white-text"' + $(board_item_el).attr("data-border") + '">' +
                            $(board_item_el).attr("data-ownership") +
                            "</div>" +
                            "</a>";
                    }
                    // -------------------------------------------------------------------------------------
                    //if (typeof $(board_item_el).attr("data-activetask") !== "undefined" && typeof $(board_item_el).attr("data-activetask") !== "") {

                    //    board_item_activetask =
                    //        '<div class="center mb-5 gradient-45deg-yellow-green black-text gradient-shadow' + $(board_item_el).attr("data-border") + '"><span class="' + $(board_item_el).attr("data-border") + '-text center"> ' +
                    //        "<a id='" + board_item_id + "' class='recorder' style='color: red;' href='javascript:setRecording(" + board_item_id + ");'>" + $(board_item_el).attr("data-activetask") + "</a>" +
                    //        "</span>" +
                    //        "</div>";
                    //}
                    
                    if ($(board_item_el).attr("data-activetask") == "start")
                    {
                        board_item_activetask =
                            //'<a id="' + board_item_id + '" class="recorder" style="color: red;" href="javascript:setRecording(' + board_item_id + ');">' +
                            //'<div class="center mb-5 gradient-45deg-yellow-green black-text gradient-shadow' + $(board_item_el).attr("data-border") + '">' +
                            '<img id="' + board_item_id + '"class="right recorder responsive-img border-radius-4" src="images/playrecord.png" width="20" height="20" alt=""></img>';
                            //"</div>" +
                            //"</a>";
                    }
                    else if ($(board_item_el).attr("data-activetask") == "stop") {
                        board_item_activetask =
                            //'<a id="' + board_item_id + '" class="recorder" style="color: red;" href="javascript:setRecording(' + board_item_id + ');">' +
                            //'<div class="center mb-5 gradient-45deg-yellow-green black-text gradient-shadow' + $(board_item_el).attr("data-border") + '">' +
                            '<img id="' + board_item_id + '"class="right recorder responsive-img border-radius-4" src="images/stoprecord.png" width="20" height="20" alt="" /></img>';
                            //"</div>" +
                            //"</a>";
                    }
                    else {
                        board_item_activetask = '';
                    }
                    
                    // check if comment is defined or not
                    //if (typeof $(board_item_el).attr("data-comment") !== "undefined") {
                    //    board_item_comment =
                    //        '<div class="kanban-comment display-flex">' +
                    //        '<i class="material-icons font-size-small">chat_bubble_outline </i>' +
                    //        '<span class="font-size-small">' +
                    //        $(board_item_el).attr("data-comment") +
                    //        "</span>" +
                    //        "</div>";
                    //}
                    // check if attachment is defined or not
                    //if (typeof $(board_item_el).attr("data-attachment") !== "undefined") {
                    //    board_item_attachment =
                    //        '<div class="kanban-attachment display-flex">' +
                    //        '<i class="font-size-small material-icons">attach_file</i>' +
                    //        '<span class="font-size-small">' +
                    //        $(board_item_el).attr("data-attachment") +
                    //        "</span>" +
                    //        "</div>";
                    //}
                    // check if Image is defined or not
                    //if (typeof $(board_item_el).attr("data-image") !== "undefined") {
                    //    board_item_image =
                    //        '<div class="kanban-image mb-1">' +
                    //        '<img class="responsive-img border-radius-4" src=" ' +
                    //        kanban_board_data[kanban_data].item[kanban_item].image +
                    //        '" alt="kanban-image">';
                    //    ("</div>");
                    //}
                    // check if Badge is defined or not
                    //if (typeof $(board_item_el).attr("data-badgeContent") !== "undefined") {
                    //    board_item_badge =
                    //        '<div class="kanban-badge circle lighten-4 ' +
                    //        kanban_board_data[kanban_data].item[kanban_item].badgeColor +
                    //        '">' +
                    //        '<span class="' + kanban_board_data[kanban_data].item[kanban_item].badgeColor + '-text">' +
                    //        kanban_board_data[kanban_data].item[kanban_item].badgeContent +
                    //        "</span>";
                    //    ("</div>");
                    //}
                    
                    // add custom 'kanban-footer'
                    // --------------------------------------------------------------------
                    // Setion : Loading Layout Content
                    // --------------------------------------------------------------------
                    if (
                        typeof (
                            $(board_item_el).attr("data-dueDate") ||
                            $(board_item_el).attr("data-customer") ||
                            $(board_item_el).attr("data-activetask") ||
                            $(board_item_el).attr("data-comment") ||
                            $(board_item_el).attr("data-users") ||
                            $(board_item_el).attr("data-ownership") ||
                            $(board_item_el).attr("data-attachment")
                        ) !== "undefined"
                                        ) {
                        $(board_item_el).append(
                            '<div class="kanban-footer mt-3">' +
                            board_item_dueDate +
                            board_item_ownership +
                            board_item_customer +
                            board_item_activetask +
                            //'<div class="kanban-footer-left left display-flex pt-1">' +
                            //board_item_comment +
                            //board_item_attachment +
                            //"</div>" +
                            //'<div class="kanban-footer-right right">' +
                            //'<div class="kanban-users">' +
                            //board_item_badge +
                            //board_item_users +
                            //"</div>" +
                            //"</div>" +
                            "</div>"
                        );
                    }
                    // add Image prepend to 'kanban-Item'
                    //if (typeof $(board_item_el).attr("data-activetask") !== "undefined") {
                    //    $(board_item_el).prepend(board_item_activetask);
                    //}
                    //$(board_item_el).append('<div class="kanban-footer mt-3">');

                    //if (typeof ($(board_item_el).attr("data-dueDate")) !== "undefined")
                    //    $(board_item_el).append(board_item_dueDate);

                    //if (typeof ($(board_item_el).attr("data-customer")) !== "undefined")
                    //    $(board_item_el).append(board_item_customer);

                    ////if (typeof ($(board_item_el).attr("data-activetask")) !== "undefined")
                    ////    $(board_item_el).append(board_item_activetask);

                    //$(board_item_el).append('</div>');

                    ////alert($(board_item_el).attr("board_item_activetask"))
                    //if (typeof $(board_item_el).attr("data-activetask") !== "undefined" && $(board_item_el).attr("data-activetask") !== "") {
                    //    $(board_item_el).prepend(board_item_activetask);
                    //}
                }
            }
        }

        //kanban_board_data.map(function (obj) {
        //    $(".kanban-board[data-id='" + obj.id + "']").find(".kanban-board-header").addClass(obj.headerBg)
        //})

        // --------------------------------------------------------------------------------
        // Open Task
        // --------------------------------------------------------------------------------
        function showMyTask(id)
        {
            Sys.UI.DomElement.getElementById('<%= spnModuleHeader.ClientID%>').innerHTML = "Manage To-DO Task";
            var pageUrl = "ToDO.aspx?mode=edit&id=" + id;
            $('#ifrModuleAdmin').attr('src', pageUrl);
            $find("mpe").show();
        }
        // --------------------------------------------------------------------------------
        // Record Task
        // --------------------------------------------------------------------------------
        function setRecording(myid)
        {
            var dataurl = '/Services/NagrikService.asmx/setToDOTimeStamp?pTaskID=' + myid;
            
            jQuery.ajax({
                url: dataurl,
                type: "get",
                success: function (data) {
                    if (data != null) {
                        var resultdata = JSON.parse(data.getElementsByTagName("string")[0].innerHTML);
                        // ----------------------------------------------
                        table = $('#tblAnalysis').DataTable({ data: resultdata });
                    }
                },
                error: function (r) {
                    alert('Error : ' + r.responseText);
                },
                failure: function (r) {
                    alert('failure');
                }
            });
        }

        
        // -----------------------------------------------------------------
        // Add new kanban board
        // -----------------------------------------------------------------
        function addTaskBoard() {

            //var addBoardDefault = document.getElementById("add-kanban");
            var i = 1;

            //addBoardDefault.addEventListener("click", function () {
                KanbanExample.addBoards([
                    {
                        id: "kanban-" + i, // generate random id for each new kanban
                        title: "Default Title"
                    }
                ]);
                var kanbanNewBoard = KanbanExample.findBoard("kanban-" + i)
                if (kanbanNewBoard) {
                    var kanban_dropdown = document.createElement("div");
                    kanban_dropdown.setAttribute("class", "dropdown");
                    kanbanNewBoardData = '<div class="dropdown">' +
                        '<a class="dropdown-trigger" href="#" data-target="kan' + i + '" > <i class="material-icons white-text">more_vert</i></a>' +
                        '<ul id="kan' + i + '" class="dropdown-content">' +
                        '<li><a href="#!"><i class="material-icons">link</i><span class="menu-item">Copy Link</span></a></li>' +
                        '<li class="kanban-delete"><a href="#!"><i class="material-icons">delete</i><span class="menu-item">Delete</span></a></li>' +
                        '</ul></div>';
                    var kanbanNewDropdown = $(kanbanNewBoard).find("header");
                    $(kanbanNewDropdown).append(kanbanNewBoardData);
                    $(".dropdown-trigger").dropdown({
                        constrainWidth: false
                    });
                }
                i++;
            //});
        }

        // --------------------------------------------------------------------------------
        // Delete kanban board
        // --------------------------------------------------------------------------------
        function delTaskBoard() {

            //$(document).on("click", ".kanban-delete", function (e) {
                var $id = $(this)
                    .closest(".kanban-board")
                    .attr("data-id");
                addEventListener("click", function () {
                    KanbanExample.removeBoard($id);
                });
            //});
        }
        
        // -----------------------------------------------------------------
        $(window).on('resize', function () {
            // sidebar display none on screen resize
            $(".kanban-sidebar").removeClass("show");
            $(".kanban-overlay").removeClass("show");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scmAdmin" runat="server" EnablePartialRendering="true" CompositeScript-ScriptMode="Inherit"></asp:ScriptManager>
<%--    <asp:UpdatePanel ID="upUserPanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>--%>
    <asp:HiddenField ID="hdnJsonData" runat="server" ClientIDMode="Static" />
    <div id="divLeads" style="background: linear-gradient(45deg, silver, #f9e3b1); margin-bottom: 10px; padding-left: 10px; padding-right: 10px;">
        <asp:Button ID="Button1" CssClass="hide" runat="server" Text="Fill Form in Popup" />
        <div class="content-wrapper-before gradient-45deg-indigo-purple"></div>
        <div class="row">
            <div class="col m12">
                <div class="card user-statistics-card mb-0 mt-1">
                    <div class="card-content p-0 h5RoundHead" style="min-height: 45px; margin-bottom: 15px; padding: 6px 0px 6px 0px !important;">
                        <asp:Label CssClass="float-left white-text ml-1 mr-2" ID="lblDailyTitle" runat="server" ClientIDMode="Static" style="font-size:24px;">Filter Dashboard : </asp:Label>
                        <asp:DropDownList ID="drpSummaryMonth" runat="server" ClientIDMode="Static" class="select2-theme browser-default mr-2 float-left myDropDownClass" AutoPostBack="true" OnSelectedIndexChanged="drpSummaryMonthYear_SelectedIndexChanged"></asp:DropDownList>
                        <asp:DropDownList ID="drpSummaryYear" runat="server" ClientIDMode="Static" class="select2-theme browser-default mr-2 float-left myDropDownClass" AutoPostBack="true" OnSelectedIndexChanged="drpSummaryMonthYear_SelectedIndexChanged"></asp:DropDownList>
                        <a class="material-icons background-round gradient-45deg-red-pink white-text float-right p-0 adddialog" data-position="center" data-tooltip="Add New ToDO" href="javascript:showMyTask('add', 0);" style="margin:0px 20px 8px 8px;"><i class="material-icons" style="font-size: 20px; padding: 5px;">add</i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="pl-0" id="main">
            <div class="row">
                <div class="content-wrapper-before gradient-45deg-indigo-purple"></div>
                <div class="col m2">
                    <h5 class="h5Round"><span id="spnPageHeader" runat="server" clientidmode="Static" class="titleHead text-top">Task Summary&nbsp;</span></h5>
                    <div id="divTaskSummary" runat="server" style="width: 100%; min-height: 550px; max-height: 350px; padding: 2px 10px 0px 10px; overflow-x: hidden; overflow-y: auto; background-color: aliceblue;">
                    </div>
                </div>
                <div class="col m10">
                    <div class="container" >
                        <!-- Basic Kanban App -->
                        <section id="kanban-wrapper" class="section">
                            <div class="kanban-overlay"></div>
                            <div class="row">
                                <!-- kanban container -->
                                <div class="col m12">
                                    <div id="kanban-app" style="width:1400px; height: 700px; overflow-x: auto;"></div>
                                </div>
                            </div>

                            <!-- User new mail right area -->
                            <div class="kanban-sidebar">
                                <div class="card quill-wrapper">
                                    <div class="card-content pt-0">
                                        <div class="card-header display-flex pb-2">
                                            <h3 class="card-title">UI Design</h3>
                                            <div class="close close-icon">
                                                <i class="material-icons">close</i>
                                            </div>
                                        </div>
                                        <div class="divider"></div>
                                        <!-- form start -->
                                        <div class="card-action pl-0 pr-0">
                                            <button type="reset" class="btn-small waves-effect waves-light delete-kanban-item mr-1">
                                                <span>Delete</span>
                                            </button>
                                            <button class="btn-small blue waves-effect waves-light update-kanban-item">
                                                <span>Save</span>
                                            </button>
                                        </div>
                                        <!-- form start end-->
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!--/ Sample Project kanban -->
                    </div>
                    <div class="content-overlay"></div>
                </div>
            </div>
        </div>
        <div class="clearall"></div>

    </div>
    <br />
    <br />
    <cc1:ModalPopupExtender ID="myModalPopup" BehaviorID="mpe" runat="server" ClientIDMode="Static" PopupControlID="Panl1" TargetControlID="Button1" CancelControlID="Button2" BackgroundCssClass="Background">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panl1" runat="server" ClientIDMode="Static" CssClass="Popup" align="center" Style="display: none; border-radius: 10px; padding-right: 10px !important;">
        <div id="myModal">
            <div class="modal-header position-sticky gradient-45deg-light-blue-indigo m-0" style="margin-bottom: 10px !important;">
                <h5 class=" z-depth-5" style="font-size: 2rem !important; font-weight: 800; line-height: 50px; margin: 0; text-align: left; padding-left: 15px;">
                    <i class="material-icons prefix">ac_unit</i>
                    <span id="spnModuleHeader" runat="server" clientidmode="static">Manage Module.</span>
                    <asp:Button CssClass="btnTopRightCorner float-right" ID="Button2" runat="server" ClientIDMode="Static" Text="" />
                </h5>
            </div>
        </div>
        <iframe id="ifrModuleAdmin" src="about:blank" runat="server" clientidmode="static" scrolling="auto" style="border: 1px solid silver; background-color: transparent; width: 100%; height: 85%; padding: 5px;"></iframe>
        <br />
    </asp:Panel>

    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>

    <script type="text/javascript">
        $(document).ready(function () {

            $('.btnTopRightCorner').on("click", function () {
                $("#kanban-app").html("");
                $("#divTaskSummary").html("");

                __doPostBack('', '');
            });
        });
    </script>
    <script src="app-assets/js/vendors.min.js"></script>
    <script src="app-assets/vendors/jkanban/jkanban.min.js"></script>
    <script src="app-assets/vendors/quill/quill.min.js"></script>
    <script src="app-assets/js/plugins.js"></script>
    <script src="app-assets/js/search.js"></script>
    <script src="app-assets/js/custom/custom-script.js"></script>
    <script src="app-assets/js/scripts/customizer.js"></script>
</asp:Content>
