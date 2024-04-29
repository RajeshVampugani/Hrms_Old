﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="r_viewRequistionStatus.aspx.cs" Inherits="recruitment_r_viewRequistionStatus" %>

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

</head>
<body>
    <form id="myForm" runat="server" class="form-horizontal no-margin">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="dashboard-wrapper" style="margin-left: 0px;">
            <div class="main-container">
                <div class="page-header">
                    <div class="pull-left">
                        <%--<h2>RECRUITMENT REQUISITION FORM - DETAILS</h2>--%>
                        <h2>Recruitment Requisition Form</h2>
                    </div>

                    <div class="clearfix"></div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-header" style="border-bottom: none;">
                                <div class="title">
                                    <%--<span class="fs1" aria-hidden="true" data-icon="&#xe14c;"></span>View Status - Requisition Form--%>
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14c;"></span>View
                                </div>
                                <span id="Span1" runat="server" class="txt-red" enableviewstate="false"></span>
                            </div>
                            <div class="widget-body">
                                <table class="table table-condensed table-striped table-bordered no-margin">
                                    <tbody>
                                        <tr>
                                            <th>RRF Code</th>
                                            <td>
                                                <asp:Label ID="lbl_rrfcode" runat="server"></asp:Label>
                                            </td>
                                            <th>Requested By</th>
                                            <td>
                                                <asp:Label ID="lbl_requestedby" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr style="display:none;">
                                            <th>Department</th>
                                            <td>
                                                <asp:Label ID="lbl_dept" runat="server"></asp:Label>
                                            </td>
                                            <th>Designation</th>
                                            <td>
                                                <asp:Label ID="lbl_designation" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-header" style="border-bottom: none;">
                                <div class="title">
                                    <%--<span class="fs1" aria-hidden="true" data-icon="&#xe14c;"></span>Requisition Form Details--%>
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14c;"></span>Requisition Form
                                </div>
                                <span id="Span2" runat="server" class="txt-red" enableviewstate="false"></span>
                            </div>
                            <div class="widget-body">
                                <table class="table table-condensed table-striped table-bordered no-margin">
                                    <tbody>
                                        <tr>
                                            <th class="span3">Total No of Posts</th>
                                            <td class="span4">
                                                <asp:Label ID="lbl_Posts" runat="server"></asp:Label>
                                            </td>
                                            <th class="span3">Request Type</th>
                                            <td class="span4">
                                                <asp:Label ID="lbl_requestType" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>Vacancy Type</th>
                                            <td>
                                                <asp:Label ID="lbl_vacancyType" runat="server"></asp:Label>
                                            </td>
                                            <th>Expected CTC</th>
                                            <td>
                                                <asp:Label ID="lbl_incentive" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr id="Tr1" runat="server" visible="false">
                                            <th>Temporary(in days)</th>
                                            <td>
                                                <asp:Label ID="lbl_temparary" runat="server"></asp:Label>
                                            </td>

                                            <th>Working Hours</th>
                                            <td>
                                                <asp:Label ID="lbl_workinghours" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                      
                                        <tr>
                                            <th>Reasons of Request</th>
                                            <td>
                                                <asp:Label ID="lbl_reasons" runat="server"></asp:Label>
                                            </td>
                                              <th>Location</th>
                                            <td>
                                                <asp:Label ID="lbl_location" runat="server"></asp:Label>
                                            </td>
                                            
                                        </tr>

                                        <tr>
                                            <th>Shift Hours</th>
                                            <td>
                                                <asp:Label ID="lbl_shifthours" runat="server"></asp:Label>
                                            </td>
                                          <th>Department Type</th>
                                            <td>
                                                <asp:Label ID="lbl_costcenter" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                          <tr>
                                            <th>Department</th>
                                            <td>
                                                <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                                            </td>

                                            <th>Designation</th>
                                            <td>
                                                <asp:Label ID="lblDesignation" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr id="Tr2" runat="server" visible="false">
                                            <th>Gross Salary</th>
                                            <td>
                                                <asp:Label ID="lbl_grosssalary" runat="server"></asp:Label>
                                            </td>
                                            <th>TCTC</th>
                                            <td>
                                                <asp:Label ID="lbl_tctc" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>Skills</th>
                                            <td>
                                                <asp:Label ID="lbl_skills" runat="server"></asp:Label>
                                            </td>

                                            <th>Job Description</th>

                                            <td>
                                                <asp:Label ID="lbl_jobdesc" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>Experience (In Months)</th>
                                            <td>
                                                <asp:Label ID="lbl_Exp" runat="server"></asp:Label>
                                            </td>
                                            <th>Educational Qualification</th>

                                            <td>
                                                <asp:Label ID="lbl_edu" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                         <tr>
                                            <th>Industries Prefered</th>
                                            <td>
                                                <asp:Label ID="lbl_industries" runat="server"></asp:Label>
                                            </td>

                                            <th>Additional Qualification</th>
                                            <td>
                                                <asp:Label ID="lblQualifiers" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-header">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14a;">Hold Logs</span>
                                </div>
                            </div>
                            <div class="widget-body">
                                <div id="dt_example" class="example_alt_pagination">
                                    <asp:GridView ID="grdrrfholddetails" runat="server" AutoGenerateColumns="False" AllowSorting="True"
                                        EmptyDataText="No data Found" CssClass="table table-condensed table-striped  table-bordered pull-left">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Hold Date & Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblholddate" runat="server" Text='<%#Eval("holddate")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Comments">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcomments" runat="server" Text='<%#Eval("comments")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Hold By">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblholdby" runat="server" Text='<%#Eval("createdby")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Active Date & Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblactivedate" runat="server" Text='<%#Eval("activedate")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Active By">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblactiveby" runat="server" Text='<%#Eval("updatedby")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="Div1" class="row-fluid" runat="server">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-header">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>Previous Comments
                                </div>
                            </div>
                            <div class="widget-body">
                                <div id="Div3" class="example_alt_pagination">
                                    <asp:GridView ID="Gridcomments" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-checkable table-responsive datatable"
                                        EmptyDataText="No Data Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Employee Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcode" runat="server" Text='<%#Eval("approvercode")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("empname")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Comments">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcomments" runat="server" Text='<%#Eval("comments")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldate" runat="server" Text='<%#Eval("cretaeddate")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-header" style="border-bottom: none;">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14c;"></span>Requisition Form Approval Details
                                </div>
                                <span id="Span3" runat="server" class="txt-red" enableviewstate="false"></span>
                            </div>
                            <div class="widget-body">
                                <asp:GridView ID="grdapprovers" runat="server" AutoGenerateColumns="False" 
                                        EmptyDataText="No data Found" CssClass="table table-striped table-bordered table-hover table-checkable table-responsive datatable">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Employee Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblempcode" runat="server" Text='<%#Eval("ApproverCode")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblempname" runat="server" Text='<%#Eval("ApproverName")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Level">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbllevels" runat="server" Text='<%#Eval("Approvelevel")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Role">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrole" runat="server" Text='<%#Eval("ApproverRole")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrole" runat="server" Text='<%#Eval("ApproverStatus")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                            </div>
                        </div>
                        <div class="form-actions no-margin">
                            <asp:Button ID="btn_back" runat="server" Text="Back" CssClass="btn btn-info" OnClick="btn_back_Click" style="margin-left:600px" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

