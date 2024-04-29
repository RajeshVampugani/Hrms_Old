﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Event Master.aspx.cs" Inherits="InformationCenter_Event_Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Controls/Uploader.ascx" TagName="File_Uploader" TagPrefix="File_Uploader" %>
<!DOCTYPE html>
<html class="lt-ie9 lt-ie8 lt-ie7" lang="en">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <title>SmartDrive Labs</title>

    <script src="../js/html5-trunk.js"></script>
    <link href="../icomoon/style.css" rel="stylesheet">
    <!--[if lte IE 7]>
    <script src="../css/icomoon-font/lte-ie7.js"></script>
    <![endif]-->

    <!-- NVD graphs css -->
    <link href="../css@vd-charts.css" rel="stylesheet">

    <!-- Bootstrap css -->
    <link href="../css/main.css" rel="stylesheet" />

    <!-- fullcalendar css -->
    <link href='../css/fullcalendar/fullcalendar.css' rel='stylesheet' />
    <link href='../css/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
    <style type="text/css">
        .star:before {
            color: red !important;
            content: " *";
        }
    </style>
</head>
<body>
    <form id="myForm" runat="server" class="form-horizontal no-margin">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="dashboard-wrapper" style="margin-left: 0px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="main-container">
                        <div class="page-header">
                            <div class="pull-left">
                                <h2>Event Master</h2>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                        <div class="row-fluid">

                            <div class="widget">

                                <div class="widget-header">
                                    <div class="title">
                                        <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>
                                        <asp:Label ID="lblhead" runat="server" Text="Create"></asp:Label>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <fieldset>

                                        <div class="control-group">
                                            <label class="control-label">Type<span class="star"></span></label>
                                            <div class="controls">
                                                <asp:DropDownList ToolTip="Select Type" ID="ddlcategory" runat="server" CssClass="span4">
                                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="General"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Employee"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ToolTip="Select Type" InitialValue="0" ControlToValidate="ddlcategory" ErrorMessage="Select Type" runat="server" ValidationGroup="v" ForeColor="Red"><img src="../images/error1.gif" alt="Select Type" /></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="control-label">Status<span class="star"></span></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlrunstatusg" runat="server" CssClass="span4" ToolTip="Select Status">
                                                    <asp:ListItem Value="0" Text="--Select Type--"></asp:ListItem>
                                                    <asp:ListItem Value="1">Running</asp:ListItem>
                                                    <asp:ListItem Value="2">Stop</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" ToolTip="Select Status" ControlToValidate="ddlrunstatusg" ErrorMessage="Select Type" runat="server" ValidationGroup="v" ForeColor="Red"><img src="../images/error1.gif" alt="Select Type" /></asp:RequiredFieldValidator>
                                            </div>
                                        </div>


                                        <div class="control-group">
                                            <label class="control-label">Priorty<span class="star"></span></label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddlpriorityg" runat="server" CssClass="span4" ToolTip="Select Priorty">
                                                    <asp:ListItem Value="0" Text="--Select Type--"></asp:ListItem>
                                                    <asp:ListItem Value="1">Low</asp:ListItem>
                                                    <asp:ListItem Value="2">Medium</asp:ListItem>
                                                    <asp:ListItem Value="3">High</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" ToolTip="Select Priorty" ControlToValidate="ddlpriorityg" ErrorMessage="Select Type" runat="server" ValidationGroup="v" ForeColor="Red"><img src="../images/error1.gif" alt="Select Type" /></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="control-label">Heading<span class="star"></span></label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtheading" size="40" CssClass="span4" runat="server" ToolTip="Enter Heading" onkeypress="return isKey(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtheading" ToolTip="Enter Heading" ErrorMessage=" Enter Heading" runat="server" ValidationGroup="v" ForeColor="Red"><img src="../images/error1.gif" alt="Enter Heading" /></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">From Date<span class="star"></span></label>
                                            <div class="controls">
                                                <asp:TextBox ID="txt_edate" ToolTip="Enter from Date" runat="server" CssClass="span4"
                                                    onkeypress="return isNumber()"></asp:TextBox>
                                                &#160;<asp:Image ID="Image4" runat="server"
                                                    ImageUrl="~/img/clndr.gif" placeholder="Select From Date" />
                                                <cc1:CalendarExtender Format="dd-MMM-yyyy"
                                                    ID="CalendarExtender4" runat="server" PopupButtonID="Image4" TargetControlID="txt_edate"
                                                    Enabled="True">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ToolTip="Enter from date" ControlToValidate="txt_edate" ErrorMessage="Select Date " runat="server" ValidationGroup="v" ForeColor="Red"><img src="../images/error1.gif" alt="Select From Date" /></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Description</label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtdescription" CssClass="span4" runat="server" ToolTip="Enter Description" TextMode="MultiLine" onkeypress="return isKey(event);"></asp:TextBox>
                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ControlToValidate="txtdescription" ErrorMessage="Enter Description " runat="server"  ValidationGroup="v" ToolTip="Enter Description" ForeColor="Red"><img src="../images/error1.gif" alt="Enter Description" /></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>


                                        <div class="form-actions no-margin">
                                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" ValidationGroup="v" />
                                            <asp:Button ID="btnreset" runat="server" CssClass="btn btn-primary" Text="Reset" OnClick="btnclear_Click" />
                                        </div>

                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        <span id="message" runat="server" class="txt-red" enableviewstate="false"></span>
                        <div class="row-fluid">

                            <div class="widget" id="grid" runat="server">

                                <div class="widget-header">
                                    <div class="title">
                                        <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>View              
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-content">
                                        <asp:GridView ID="eventsdetails" runat="server" Width="100%" AutoGenerateColumns="False"
                                            DataKeyNames="id" BorderWidth="0px" CellPadding="4" OnRowDataBound="eventsdetails_RowDataBound"
                                            OnPageIndexChanging="eventsdetails_PageIndexChanging" OnRowDeleting="eventsdetails_RowDeleting"
                                            OnRowCancelingEdit="eventsdetails_RowCancelingEdit" OnRowEditing="eventsdetails_RowEditing"
                                            OnRowUpdating="eventsdetails_RowUpdating" ToolTip="News Details" AllowPaging="True"
                                            CssClass="table table-hover table-striped table-bordered table-highlight-head">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Category">
                                                    <ItemTemplate>
                                                        <asp:Label ID="l1" runat="server" Text='<%# Eval("category").ToString()=="1"?"General":"Employee" %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Heading">
                                                    <ItemTemplate>
                                                        <%#DataBinder.Eval(Container.DataItem, "heading")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <%#DataBinder.Eval(Container.DataItem, "description")%>
                                                    </ItemTemplate>

                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="l2" runat="server" Text='<%# Eval("run_status").ToString()=="1"?"Running":"Stop" %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Priority">
                                                    <ItemTemplate>
                                                        <asp:Label ID="l3" runat="server" Text='<%# Eval("priority").ToString()=="1"?"Low":Eval("priority").ToString()=="2"?"Medium":"High" %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <%--  <asp:TemplateField HeaderText="Updated Date">
                                                <ItemTemplate>
                                                      <%#DataBinder.Eval(Container.DataItem, "posteddate")%>
                                                </ItemTemplate>
                                              
                                            </asp:TemplateField>--%>


                                                <%-- <EditItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnedit" runat="server" CausesValidation="false" OnClientClick="return confirm('Are you sure to update this entry?')"
                                                        CommandName="Update"  Text="Update" ToolTip="Update" CssClass="btn btn-primary btn-small hidden-phone" />
                                                    |
                                            <asp:LinkButton ID="lnkbtndelete" runat="server" CausesValidation="false" CommandName="Cancel"
                                                Text="Cancel" ToolTip="Cancel" CssClass="btn btn-primary btn-small hidden-phone" />
                                                </EditItemTemplate>--%>

                                                <%-- </asp:TemplateField>

                                            <asp:TemplateField>--%>
                                                <%-- <ItemStyle Width="11%" VerticalAlign="Top" CssClass="frm-rght-clr1234" CssClass="btn btn-primary btn-small hidden-phone"  CssClass="link05"   CssClass="link05"/>
                                            <HeaderStyle CssClass="frm-lft-clr123" />--%>
                                                <asp:TemplateField HeaderText="Edit" HeaderStyle-Width="10%">
                                                    <ItemTemplate>

                                                        <asp:LinkButton ID="lnkbtnedit" runat="server" CausesValidation="false" CommandName="Edit"
                                                            Text="&lt;img src='images/edit.png'/&gt;" ToolTip="Edit" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderText="Delete" HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkbtndelete" runat="server" CausesValidation="false" OnClientClick="return confirm('Are you sure to delete this entry?')"
                                                            CommandName="Delete" CssClass="link05" Text="&lt;img src='images/delete.png'/&gt;" ToolTip="Delete" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <%--<HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" CssClass="frm-lft-clr123"></HeaderStyle>--%>
                                            <FooterStyle CssClass="frm-lft-clr123" />
                                            <EmptyDataRowStyle CssClass="head" HorizontalAlign="Left" />
                                            <PagerStyle CssClass="frm-lft-clr123" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </form>
</body>

</html>
