﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="candidateprofile.aspx.cs" Inherits="recruitment_candidateprofile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" id="Head1">
    <meta charset="utf-8">
    <title>SmartDrive Labs</title>

    <script src="../js/html5-trunk.js"></script>
    <link href="../icomoon/style.css" rel="stylesheet" />
    <!--[if lte IE 7]>
    <script src="../css/icomoon-font/lte-ie7.js"></script>
    <![endif]-->

    <!-- NVD graphs css -->
    <link href="../css/nvd-charts.css" rel="stylesheet" />

    <!-- Bootstrap css -->
    <link href="../css/main.css" rel="stylesheet" />

    <!-- fullcalendar css -->
    <link href='../css/fullcalendar/fullcalendar.css' rel='stylesheet' />
    <link href='../css/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
    <%--<button onclick="goBack()">Go Back</button>--%>



</head>
<body>
    <form id="myForm" runat="server" class="form-horizontal no-margin">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="dashboard-wrapper" style="margin-left: 0px;">
            <div class="main-container">
                <div class="page-header">
                    <div class="pull-left">
                        <h2>Candidate Detail</h2>
                    </div>

                    <div class="clearfix"></div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-header">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>View                                    
                                </div>
                            </div>
                            <div class="widget-body">
                                <table class="table table-condensed table-striped  table-bordered pull-left">
                                    <tbody>
                                        <tr>
                                            <th class="span3">Candidate Name 
                                            </th>
                                            <td class="span4">
                                                <asp:Label ID="txt_candidateName" runat="server"></asp:Label>
                                            </td>
                                            <th class="span3">Date Of Birth 
                                            </th>
                                            <td class="span4">
                                                <asp:Label ID="lbldob" runat="server"></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <th class="span3">Gender
                                            </th>
                                            <td class="span4">
                                                <asp:Label ID="txt_gender" runat="server"></asp:Label>
                                            </td>
                                            <th class="span3">Designation 
                                            </th>
                                            <td class="span4">
                                                <asp:Label ID="lbldesignation" runat="server"></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <th class="span3">Applied Date 
                                            </th>
                                            <td class="span4">
                                                <asp:Label ID="txtapplieddate" runat="server" Format="dd MMM yyyy"></asp:Label>
                                            </td>
                                            <th class="span3">Referred By 
                                            </th>
                                            <td class="span4">
                                                <asp:Label ID="lblreferedby" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Mobile No. 
                                            </th>
                                            <td>
                                                <asp:Label ID="txt_mobile" runat="server"></asp:Label>
                                            </td>
                                            <th>Skills 
                                            </th>
                                            <td>
                                                <asp:Label runat="server" ID="txt_skills"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Email 
                                            </th>
                                            <td>
                                                <asp:Label ID="txt_email" runat="server"></asp:Label>
                                            </td>
                                            <th>Qualifications 
                                            </th>
                                            <td>
                                                <asp:Label ID="txt_Qualifications" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Alternate Phone No. 
                                            </th>
                                            <td>
                                                <asp:Label ID="txt_phoneno" runat="server"></asp:Label>
                                            </td>

                                            <th>Experience (in years) 
                                            </th>
                                            <td>
                                                <asp:Label ID="txt_experience" runat="server"></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <th>Expected Salary 
                                            </th>
                                            <td>
                                                <asp:Label ID="lblexpectedsalary" runat="server"></asp:Label>
                                            </td>
                                            <th>Passport No. 
                                                                      
                                            </th>
                                            <td>
                                                <asp:Label ID="lblpassportno" runat="server"> </asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Achievements 
                                            </th>
                                            <td>
                                                <asp:Label ID="lblachievements" runat="server"></asp:Label>
                                            </td>
                                            <th>Passport Validity</th>
                                            <td>
                                                <asp:Label ID="lblpassportvalidity" runat="server"></asp:Label>
                                            </td>
                                            <%--<th>Join Status 
                                            </th>
                                            <td>
                                                <asp:Label ID="txt_joinstatus" runat="server"> </asp:Label>&nbsp;Days
                                            </td>--%>

                                        </tr>

                                        <tr>
                                            <th>Address</th>
                                            <td>
                                                <asp:Label ID="lbladdress" runat="server"></asp:Label>
                                            </td>
                                            <th>Notes</th>
                                            <td>
                                                <asp:Label ID="lblnotes" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Resume Uploads</th>
                                            <td>
                                                <asp:Label ID="txt_resumeuploads" runat="server"></asp:Label>
                                            </td>
                                            <th>Join Status 
                                            </th>
                                            <td>
                                                <asp:Label ID="txt_joinstatus" runat="server"> </asp:Label>&nbsp;Days
                                            </td>
                                            <%--<th>Passport Validity</th>
                                            <td>
                                                <asp:Label ID="lblpassportvalidity" runat="server"></asp:Label>
                                            </td>--%>
                                        </tr>
                                    </tbody>

                                </table>
                                <table><tr><td><br /></td></tr></table>
                                <div class="form-actions no-margin">
                                    <a href="javascript:history.go(-1)" class="btn btn-info" style="margin-left:800px" title="Back to previous page">Back</a>
                                </div>
                            </div>
                            <div class="clearfix"></div>                          
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
