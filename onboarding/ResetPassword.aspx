<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword"
    Title="SmartDrive Labs Technologies India Pvt. Ltd. : Reset Password View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <meta charset="utf-8">
    <title>StartUp Admin</title>
    <meta name="author" content="Srinu Basava">
    <meta content="width=device-width, initial-scale=1.0, user-scalable=no" name="viewport">
    <meta name="description" content="StartUp Admin UI">
    <meta name="keywords" content="StartUp Admin UI, Admin UI, Admin Dashboard, Srinu Basava, Best admin UI, Best backend UI, Best Dashboard, Responsive admin UI, Responsive dashboard, Responsive Backend, Mobile admin, Mobile Backend, Mobile Dashboard">
    <script src="../js/html5-trunk.js"></script>
    <link href="../icomoon/style.css" rel="stylesheet">
    <!--[if lte IE 7]>
    <script src="css/icomoon-font/lte-ie7.js"></script>
    <![endif]-->
    <link href="../css/blue1.css" rel="stylesheet" />
    <link href="../css/blue1.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
    <script type="text/javascript">
        function Validate() {
            var password = document.getElementById('<%=txt_password.ClientID %>');
            var cpassword = document.getElementById('<%=txt_cpassword.ClientID%>');
            if (password.value == "") {
                alert("Please Enter Password");
                return false;
            }
            if (password.value.length < 8) {
                alert("Password Should be minimum 8 characters!");
                password.focus();
                return false;
            }
            var re = /^[a-zA-Z0-9'@&#.\s]{7,}$/;
            if (!re.test(password.value)) {
                alert("Password Should be a combination of  alpha numeric and a special character!");
                password.focus();
                return false;
            }
            if (cpassword.value == "") {
                alert("Please Enter Confirmed Password");
                cpassword.focus();
                return false;
            }
            if (password.value != cpassword.value) {
                alert("The Password entered does not match the confirmed password!.");
                return false;
            }
            return true;
        }
    </script>
     <style type="text/css">
        .star:before
        {
            color: red !important;
            content: "*";
        }
    </style>
    <script src="../js/validatepassword.js"></script>
</head>
<body>
    <form id="myForm" runat="server" class="form-horizontal no-margin">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="dashboard-wrapper" style="margin-left: 0px;">
            <div class="main-container">

                <div class="page-header">
                    <div class="pull-left">
                        <h2>Create Password</h2>
                    </div>

                    <div class="clearfix"></div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-header">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe023;"></span>Reset
                                </div>
                            </div>
                            <div class="widget-body">
                                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                                    <tbody>
                                        <tr>
                                            <td height="5"></td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="width:50%">
                                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td class="frm-lft-clr123 border-bottom" style="width:40%;text-align:justify" valign="top">Employee Code
                                                            </td>
                                                            <td class="frm-rght-clr123 border-bottom" style="width:60%">
                                                                <asp:Label ID="lblcode" runat="server" Text="Label"></asp:Label>&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="frm-lft-clr123 border-bottom" style="width:40%;text-align:justify" valign="top">Employee Name
                                                            </td>
                                                            <td class="frm-rght-clr123 border-bottom" style="width:60%">
                                                                <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="frm-lft-clr123 border-bottom" style="width:40%;text-align:justify">New Password&nbsp;<span class="star"></span>
                                                            </td>
                                                            <td class="frm-rght-clr123 border-bottom" style="width:60%">
                                                                <asp:TextBox ID="txt_password" runat="server" TextMode="Password"
                                                                    CssClass="span11"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="txt_password"
                                                                    Display="Dynamic" ErrorMessage='<img src="../images/error1.gif" alt="" />' ToolTip="Enter New Password"
                                                                    ValidationGroup="v" Width="6px" SetFocusOnError="True"><img src="../images/error1.gif" alt="" /></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="frm-lft-clr123 border-bottom" style="width:40%;text-align:justify" valign="top">Confirm Password&nbsp;<span class="star"></span>
                                                            </td>
                                                            <td class="frm-rght-clr123 border-bottom" style="width:60%">
                                                                <asp:TextBox ID="txt_cpassword" runat="server" TextMode="Password"
                                                                    CssClass="span11"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_cpassword"
                                                                    Display="Dynamic" ErrorMessage='<img src="../images/error1.gif" alt="" />' ToolTip="Enter Confirm Password"
                                                                    ValidationGroup="v" Width="6px" SetFocusOnError="True"><img src="../images/error1.gif" alt="" /></asp:RequiredFieldValidator>
                                                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txt_password" ValidationGroup="v"
                                                                    ControlToValidate="txt_cpassword" ErrorMessage='<img src="../images/error1.gif" alt="" />' ToolTip="Password did not match"
                                                                    Display="Dynamic" SetFocusOnError="true"></asp:CompareValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" height="20" valign="bottom"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="form-actions no-margin">
                                    <asp:Button ID="btnsv" OnClick="btnsv_Click" runat="server" Text="Reset" CssClass="btn btn-primary" ValidationGroup="v" style="margin-left:140px"></asp:Button>&nbsp;&nbsp;
                                    <asp:Button runat="server" ID="Button1" OnClick="Button1_Click" Text="Back" CssClass="btn btn-primary"></asp:Button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <asp:Label ID="lbl_msg" runat="server" EnableViewState="False"></asp:Label>



            </div>
        </div>

    </form>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/moment.js"></script>

    <!-- Easy Pie Chart JS -->
    <script src="../js/pie-charts/jquery.easy-pie-chart.js"></script>

    <!-- Tiny scrollbar js -->
    <script src="../js/tiny-scrollbar.js"></script>

    <!-- Custom Js -->
    <script src="../js/wizard/bwizard.js"></script>

    <!-- Custom Js -->
    <script src="../js/theming.js"></script>
    <script src="../js/custom.js"></script>
    <script type="text/javascript">
        //Data Tables
        $(document).ready(function () {
            $('#empgrid').dataTable({
                "sPaginationType": "full_numbers"
            });
        });
    </script>
    <script type="text/javascript">
        $("#wizard").bwizard();
    </script>

    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '../../www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-41161221-1', 'srinu.html');
        ga('send', 'pageview');

    </script>
</body>
</html>

