﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateEmployeeDetails.aspx.cs" Inherits="admin_CreateEmployeeDetails" Title="SmartDrive Labs Technologies India Pvt. Ltd. : Employee Master View" %>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>SmartDrive Labs</title>
    <%--   <script src="../js/html5-trunk.js" type="text/javascript"></script>--%>
    <link href="../icomoon/style.css" rel="stylesheet" />
    <style type="text/css">
        .star:before {
            color: red !important;
            content: "*";
            font: bold;
        }

        .auto-style2 {
            font-style: normal;
            font-variant: normal;
            font-weight: bold;
            font-size: 11px;
            line-height: normal;
            font-family: verdana, Helvetica, sans-serif;
            color: #555;
            width: 35%;
            border-left: 1px solid #d9d9d9;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top: 1px solid #d9d9d9;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding: 9px;
            background: #fafafa;
        }
    </style>
    <!--[if lte IE 7]>
    <script src="css/icomoon-font/lte-ie7.js"></script>
    <![endif]-->

    <link href="../css/main.css" rel="stylesheet" />
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <link href="../css/blue1.css" rel="stylesheet" />
    <!-- Custom Js -->
    <script src="../js/wizard/bwizard.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/validatepassword.js"></script>
    <script src="../admin/js/popup.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#wizard").bwizard();
        });
    </script>
    <script type="text/javascript" src="../js/JavaScriptValidations.js"></script>
</head>
<body>
    <form id="myForm" runat="server" class="form-horizontal no-margin">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>.

        <div class="dashboard-wrapper" style="margin-left: 0px;">
            <div class="main-container">

                <div class="page-header">
                    <div class="pull-left">
                        <h2>Employee Details</h2>
                    </div>

                    <div class="clearfix"></div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-header" style="">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe023;"></span>Create
                                </div>
                            </div>
                            <div class="widget-body">
                                <fieldset>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="2" width="100%">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="50%" valign="top">
                                                            <asp:UpdatePanel ID="kk" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="kk"
                                                                        DisplayAfter="1">
                                                                        <ProgressTemplate>
                                                                            <div class="modal-backdrop fade in">
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td align="center" valign="top">
                                                                                            <img src="../img/loading.gif" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <%--<tr>
                                                                                                <td valign="bottom" align="center" class="txt01" height="23">Please Wait...
                                                                                                </td>
                                                                                            </tr>--%>
                                                                                </table>
                                                                            </div>
                                                                        </ProgressTemplate>
                                                                    </asp:UpdateProgress>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td colspan="2" class="txt02"><b>Employee Information</b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="5px"></td>
                                                                        </tr>
                                                                    </table>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                     

                                                                        <asp:HiddenField ID="HiddenTodayDate" runat="server" />
                                                                        <tr style="height: 50px">
                                                                            <td class="frm-lft-clr123" width="48%">Employee Name<span class="star"></span>
                                                                            </td>
                                                                            <td class="frm-rght-clr123" width="52%">
                                                                                <asp:TextBox ID="tbname" runat="server" placeholder="Max 50 Char" CssClass="span11" MaxLength="50" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbname"
                                                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Employee Name Required" ValidationGroup="e"
                                                                                    Width="6px"><img  src="../img/error1.gif" alt="" /></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                           <tr>
                                                                                        <td class="frm-lft-clr123" width="47%">Employee Code<span class="star"></span>
                                                                                        </td>
                                                                                        <td class="frm-rght-clr123" width="53%">
                                                                                            <asp:TextBox ID="tbempcode" runat="server" CssClass="span11" placeholder="Max 50 Char" MaxLength="50"></asp:TextBox>
                                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbempcode"
                                                                                                Display="Dynamic" SetFocusOnError="True" ToolTip="Employee Code Required" ValidationGroup="e"
                                                                                                Width="6px"><img src="../img/error1.gif" alt="" /></asp:RequiredFieldValidator>
                                                                                            <asp:HiddenField ID="hdnpassword" runat="server" />
                                                                                        </td>
                                                                                    </tr>
                                                                        <tr style="height: 50px">
                                                                    <td width="47%" class="frm-lft-clr123 border-bottom">Employee No.<span class="star"></span>
                                                                    </td>
                                                                    <td width="53%" class="frm-rght-clr123 border-bottom">
                                                                        <asp:TextBox ID="tbempno" runat="server" CssClass="span11" placeholder="Max 50 Char" MaxLength="50"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbempno"
                                                                            Display="Dynamic" SetFocusOnError="True" ToolTip="Employee No. Required" ValidationGroup="e"
                                                                            Width="6px"><img src="../img/error1.gif" alt="" /></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                         <tr style="height: 50px">
                                                                    <td width="47%" class="frm-lft-clr123 border-bottom">Upload Document
                                                                    </td>
                                                                    <td width="53%" class="frm-rght-clr123 border-bottom">
                                                                        <asp:Label ID="labeldoc" runat="server"></asp:Label>
                                                                          <asp:FileUpload ID="empdoc" runat="server" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                                                ControlToValidate="empdoc" ValidationGroup="b" CssClass="txt-red"></asp:RegularExpressionValidator>
                                                                    
                                                                       
                                                                    </td>

                                                                </tr>
                                                                        <tr>
                                                                              <td><asp:Button ID="btnsubmit" runat="server" Text="SUBMIT" OnClick="btnsubmit_Click1" /></td>
                                                        
                                                                        </tr>
                                 
                                                                       
                                                                    </table>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                      
                                                            <%--<table width="99%" border="0" align="right" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td height="18px"></td>
                                                                </tr>
                                                                <tr style="height: 50px">
                                                                    <td colspan="2">
                                                                        <asp:UpdatePanel ID="upempcode" runat="server">
                                                                            <ContentTemplate>
                                                                                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="upempcode"
                                                                                    DisplayAfter="1">
                                                                                    <ProgressTemplate>
                                                                                        <div class="modal-backdrop fade in">
                                                                                            <table width="100%">
                                                                                                <tr>
                                                                                                    <td align="center" valign="top">
                                                                                                        <img src="../img/loading.gif" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td valign="bottom" align="center" class="txt01" height="23">Please Wait...
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </div>
                                                                                    </ProgressTemplate>
                                                                                </asp:UpdateProgress>
                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" align="right">
                                                                                 
                                                                                </table>
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                    </td>
                                                                </tr>


                                                                
                                                               

                                                                <tr>
                                                                    <td height="5" colspan="2"></td>
                                                                </tr>
                                                            </table>--%>
    </form>
</body>
</html>
