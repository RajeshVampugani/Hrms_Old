﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductInformationView.aspx.cs" Inherits="InformationCenter_ProductInformationView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Controls/Uploader.ascx" TagName="File_Uploader" TagPrefix="File_Uploader" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>MacTay</title>
    <style type="text/css">
        .star:before {
            color: red !important;
            content: " *";
        }
    </style>

    <script src="../js/html5-trunk.js"></script>
    <link href="../icomoon/style.css" rel="stylesheet" />
    <!--[if lte IE 7]>
    <script src="../css/icomoon-font/lte-ie7.js"></script>
    <![endif]-->

    <!-- NVD graphs css -->
    <link href="../css@vd-charts.css" rel="stylesheet" />

    <!-- Bootstrap css -->
    <link href="../css/main.css" rel="stylesheet" />

    <!-- fullcalendar css -->
    <link href='../css/fullcalendar/fullcalendar.css' rel='stylesheet' />
    <link href='../css/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
</head>
<body>
    <%--<form id="myForm" runat="server" class="form-horizontal no-margin">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="dashboard-wrapper" style="margin-left: 0px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>

                    <div class="main-container">
                        <div class="page-header">
                            <div class="pull-left">
                                <h2>Service Information</h2>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="row-fluid">
                            <div class="widget">
                                <div class="widget-header" runat="server" visible="false">
                                    <div class="title">
                                        <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>Search              
                                    </div>
                                </div>
                                <div class="widget-body">
                                    <fieldset>
                                        <div class="control-group">
                                            <asp:TextBox ID="txtsearch" CssClass="blue1" Text="" runat="server"
                                                MaxLength="150" Width="241px" placeHolder="Search Product Information" Visible="false"></asp:TextBox>
                                            <asp:Button ID="btnsubmit" runat="server" Visible="false" CssClass="btn btn-primary" Text="Search" OnClick="btnsearch_Click" ValidationGroup="c" />
                                        </div>



                                    </fieldset>

                                </div>
                            </div>
                        </div>
                        <span id="message" runat="server" class="txt-red" enableviewstate="false"></span>
                        <div class="row-fluid">

                            <div class="span12">
                                <div id="dt_example" class="example_alt_pagination">
                                <div class="widget no-margin">
                                    <div class="widget-header">
                                        <div class="title">
                                            <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>View               
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        
                                            <asp:GridView ID="griddetails" runat="server" AutoGenerateColumns="False" 
                                             ShowHeader="true" Width="100%"
                                                EmptyDataText="No product information has been posted" ToolTip="Product Information Posted"
                                                AllowPaging="True" DataKeyNames="id"
                                                CssClass="table table-hover table-striped table-bordered table-highlight-head" OnPreRender="griddetails_PreRender">
                                                <Columns>

                                                    <asp:BoundField DataField="subject" HeaderText="Subjet" HeaderStyle-Width="20%"></asp:BoundField>
                                                    <asp:BoundField DataField="description" HeaderText="Description" HeaderStyle-Width="40%"></asp:BoundField>

                                                    <asp:BoundField DataField="postedby" HeaderText="Posted By" HeaderStyle-Width="10%"></asp:BoundField>
                                                    <asp:BoundField DataField="posteddate" HeaderText="Posted Date" HeaderStyle-Width="10%"></asp:BoundField>


                                                    <asp:TemplateField>
                                                        <ItemTemplate>

                                                            <a href="upload/productinformation/<%#DataBinder.Eval(Container.DataItem,"upload")%>"
                                                                target="_blank">Download Service Information</a>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                      
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnsubmit" />
                </Triggers>

            </asp:UpdatePanel>

        </div>
    </form>--%>

      <form id="myForm" runat="server" class="form-horizontal no-margin">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="dashboard-wrapper" style="margin-left: 0px;">
            <div class="main-container">

                <div class="page-header">
                    <div class="pull-left">
                        <h2>Service Information</h2>
                    </div>
                  
                    <div class="clearfix"></div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget no-margin">
                            <div class="widget-header">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>View
                 
                                </div>
                            </div>
                            <div class="widget-body">
                                <div id="dt_example" class="example_alt_pagination">
                                    <asp:GridView ID="griddetails" runat="server" AutoGenerateColumns="False" 
                                             ShowHeader="true" Width="100%"
                                                EmptyDataText="No product information has been posted" ToolTip="Product Information Posted"
                                                DataKeyNames="id"
                                                CssClass="table table-hover table-striped table-bordered table-highlight-head" OnPreRender="griddetails_PreRender">
                                                <Columns>

                                                    <asp:BoundField DataField="subject" HeaderText="Subject" HeaderStyle-Width="20%"></asp:BoundField>
                                                    <asp:BoundField DataField="description" HeaderText="Description" HeaderStyle-Width="40%"></asp:BoundField>

                                                    <asp:BoundField DataField="postedby" HeaderText="Posted By" HeaderStyle-Width="10%"></asp:BoundField>
                                                    <asp:BoundField DataField="posteddate" HeaderText="Posted Date" HeaderStyle-Width="10%"></asp:BoundField>


                                                    <asp:TemplateField>
                                                        <ItemTemplate>

                                                            <a href="upload/productinformation/<%#DataBinder.Eval(Container.DataItem,"upload")%>"
                                                                target="_blank">Download Service Information</a>

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
                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT tbl_internate_departmentdetails.departmentid, tbl_internate_departmentdetails.department_name,tbl_internate_departmentdetails.department_code, tbl_internate_departmentdetails.estt_date, tbl_intranet_branch_detail.branch_name FROM tbl_intranet_branch_detail INNER JOIN tbl_internate_departmentdetails ON tbl_intranet_branch_detail.Branch_Id = tbl_internate_departmentdetails.branchid"
                    DeleteCommand="DELETE FROM tbl_internate_departmentdetails WHERE departmentid = @departmentid" ProviderName="System.Data.SqlClient" ConnectionString="<%$ ConnectionStrings:intranetConnectionString %>"></asp:SqlDataSource>--%>

            </div>
            <span id="message" runat="server"></span>
        </div>



        <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/moment.js"></script>

        <!-- Data tables JS -->

        <script src="../js/jquery.dataTables.js"></script>

        <!-- Sparkline Chart JS -->
        <script src="../js/sparkline.js"></script>

        <!-- Easy Pie Chart JS -->
        <script src="../js/pie-charts/jquery.easy-pie-chart.js"></script>

        <!-- Tiny scrollbar js -->
        <script src="../js/tiny-scrollbar.js"></script>

        <!-- Custom Js -->
        <script src="../js/theming.js"></script>
        <script src="../js/custom.js"></script>

        <script type="text/javascript">
            //Data Tables
            $(document).ready(function () {
                $('#Grid_Emp').dataTable({
                    "sPaginationType": "full_numbers"
                });
            });
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



    </form>

    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/jquery.dataTables.js" type="text/javascript"></script>
    <script type="text/javascript">
        //Data Tables
        $(document).ready(function () {
            $('#griddetails').dataTable({
                "sPaginationType": "full_numbers"
            });
        });
    </script>
</body>
</html>
