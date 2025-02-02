﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApproverHikeBH.aspx.cs" Inherits="Appraisal_ApproverHikeBH" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>SmartDrive Labs</title>


    <link href="../icomoon/style.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />

    <style type="text/css">
        .dataTables_scrollBody {
            margin-top: -11px;
        }
    </style>

    <script type="text/javascript">
        // window.onload = window.parent.iframeLoaded(this);
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>

            <div class="dashboard-wrapper" style="margin-left: 0px;">

                <div class="main-container">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="page-header">
                                <div class="pull-left">
                                    <h2>Recommendation on Hike</h2>
                                </div>

                                <div class="clearfix"></div>
                            </div>

                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="widget no-margin">
                                        <div class="widget-header">
                                            <div class="title">
                                                <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>Recommendation on Hike
                 
                                            </div>
                                            <%-- <a data-toggle="modal" href="#myModal1" class="btn btn-primary pull-right">View Slab</a>--%>
                                        </div>
                                        <div class="widget-body">
                                            <asp:LinkButton ID="btn_chkall" runat="server" Text="Check All" OnClick="btn_chkall_Click" Style="color: #194893;"></asp:LinkButton>
                                            &nbsp;|&nbsp
                                            <asp:LinkButton ID="btn_unchkall" runat="server" Text="Uncheck All" OnClick="btn_unchkall_Click" Style="color: #194893;"></asp:LinkButton>
                                            <div id="dt_example" class="example_alt_pagination">
                                                <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" OnPreRender="grid_PreRender" CssClass="table table-striped table-bordered table-hover table-checkable table-responsive datatable" DataKeyNames="assessment_id" OnRowEditing="grid_RowEditing" OnRowUpdating="grid_RowUpdating">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_id" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"id") %>'></asp:Label>
                                                                <%--<%# DataBinder.Eval(Container.DataItem,"emp_fname") %>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       <asp:TemplateField HeaderStyle-Width="4%">
                                                            <ItemTemplate>
                                                                <asp:CheckBox runat="server" ID="chk_empdetails" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Appraisal Year">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lebelyear" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"APP_year") %>'></asp:Label>

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Employee Code">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblempCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"empcode") %>'></asp:Label>
                                                                <%--<%# DataBinder.Eval(Container.DataItem,"empcode") %>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Employee Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblempName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"emp_fname") %>'></asp:Label>
                                                                <%--<%# DataBinder.Eval(Container.DataItem,"emp_fname") %>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Yes">
                                                            <ItemTemplate>
                                                                <%# DataBinder.Eval(Container.DataItem,"ishike") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="OnHold">
                                                            <ItemTemplate>
                                                                <%# DataBinder.Eval(Container.DataItem,"onhold") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="No (Reason for no to be filled)">
                                                            <ItemTemplate>
                                                                <%# DataBinder.Eval(Container.DataItem,"reasonforno") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Hike(%)">
                                                            <ItemTemplate>
                                                                <%# DataBinder.Eval(Container.DataItem,"hikeInPercent") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Comments">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="quater" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="labelquert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"quater") %>'></asp:Label>

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Assessment" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_asses" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"assessment_id") %>'></asp:Label>

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <a href="#" class="btn btn-mini btn-info"
                                                                    onclick="window.open('ViewComments.aspx?id=<%#DataBinder.Eval(Container.DataItem,"assessment_id") %>','_blank','height=400px,width=600px,top=120,left=450')">Comments</a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--<asp:TemplateField>
                                                            <ItemTemplate>--%>
                                                        <%--<a href="#" class="btn btn-small btn-mini btn-primary hidden-tablet hidden-phone"
                                                                    onclick="window.open('ViewAllGoalStatus.aspx?id_2=<%#DataBinder.Eval(Container.DataItem,"assessment_id") %>','_blank','height=600,width=1000,top=10,left=200')">View</a>--%>
                                                        <asp:HyperLinkField DataNavigateUrlFields="assessment_id" DataNavigateUrlFormatString="ViewAllGoalStatus.aspx?id_2={0}" Text="View" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ControlStyle-CssClass="btn btn-mini btn-info" />
                                                        <%--</ItemTemplate>
                                                        </asp:TemplateField>--%>

                                                        <asp:TemplateField Visible="false">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkReject" runat="server" CommandName="Edit" CssClass="btn btn-mini btn-info" Text="Reject"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField Visible="false">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkApprove" runat="server" CommandName="Update" CssClass="btn btn-mini btn-info" Text="Approve"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                         
                                                    </Columns>
                                                </asp:GridView>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="modal fade" id="myModal1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title">Hike Table</h4>
                                            </div>
                                            <div class="modal-body">
                                                <iframe src="Hike_Slab.aspx" width="100%" frameborder="0" scrolling="No" height="270px"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <br />
                    <asp:Button ID="btn_approve_all" runat="server" CssClass="btn btn-primary" Text="Approve" OnClick="btn_approve_all_Click" Style="float: right; margin-right: 10px" />
                    <asp:Button ID="btn_reject_all" runat="server" CssClass="btn btn-primary" Text="Reject" OnClick="btn_reject_all_Click" Style="float: right; margin-right: 10px" />
                </div>

            </div>


        </div>
    </form>

    <script type="text/javascript" src="../js/timepicker.js"></script>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery.dataTables.js"></script>
    <script type="text/javascript">
        //Data Tables
        $(document).ready(function () {
            $('#g').dataTable({
                "sPaginationType": "full_numbers"
            });
        });
    </script>

    <%--<script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/jquery.dataTables.js" type="text/javascript"></script>

    <script src="../js/bootstrap.js"></script>
    <script src="../js/moment.js"></script>
    <!-- Custom Js -->
    <script src="../js/theming.js"></script>

    <script type="text/javascript">
        //Data Tables
        $(document).ready(function () {
            $('#grid').dataTable({
                //bFilter: false,
                //bInfo: false,
                bPaginate: false,
                sScrollY: "200px",
                sScrollCollapse: true
            });
        });
    </script>--%>
</body>
</html>




