﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApproveTravelExceptionByManagement.aspx.cs" Inherits="Travel_ApproveTravelExceptionByManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<!--[if lt IE 7]>
    <html class="lt-ie9 lt-ie8 lt-ie7" lang="en">
  <![endif]-->

<!--[if IE 7]>
    <html class="lt-ie9 lt-ie8" lang="en">
  <![endif]-->

<!--[if IE 8]>
    <html class="lt-ie9" lang="en">
  <![endif]-->

<!--[if gt IE 8]>
    <!-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <title>SmartDrive Labs</title>
    <script src="../js/html5-trunk.js"></script>
    <link href="../icomoon/style.css" rel="stylesheet">
    <!--[if lte IE 7]>
    <script src="../css/icomoon-font/lte-ie7.js"></script>
    <![endif]-->

    <!-- NVD graphs css -->
    <link href="../css/nvd-charts.css" rel="stylesheet" />

    <!-- Bootstrap css -->
    <link href="../css/main.css" rel="stylesheet" />
    <link href="../css/blue1.css" rel="stylesheet" />
    <!-- fullcalendar css -->
    <link href='../css/fullcalendar/fullcalendar.css' rel='stylesheet' />
    <link href='../css/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />

</head>
<body>

    <form id="myForm" runat="server" class="form-horizontal no-margin">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="dashboard-wrapper" style="margin-left: 0px;">
            <%--<asp:UpdatePanel ID="updatepanel1" runat="server">
                <ContentTemplate>--%>
            <div class="main-container">

                <div class="page-header">
                    <div class="pull-left">
                        <h2>Travel Form</h2>
                    </div>
                  
                    <div class="clearfix"></div>
                </div>

                <div class="row-fluid">
                    <div class="span4">
                        <div class="widget">
                            <div class="widget-header" style="border-bottom: none;">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe023;"></span>
                                    <span id="Span4" runat="server" class="txt-red" enableviewstate="false"></span>
                                    <asp:Label ID="Label4" runat="server" Text="Employee Details"></asp:Label>
                                </div>
                            </div>
                            <div class="widget-body">
                                <fieldset>
                                    <table style="width: 100%">

                                        <tr>
                                            <td class="frm-lft-clr123" style="width: 40%">Employee Code

                                            </td>
                                            <td class="frm-rght-clr123" style="width: 60%">
                                                <asp:Label ID="lblempcode" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="frm-lft-clr123">Employee Name
                                            </td>
                                            <td class="frm-rght-clr123">
                                                <asp:Label ID="lblempname" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="frm-lft-clr123">Grade
                                            </td>
                                            <td class="frm-rght-clr123">
                                                <asp:Label ID="lblgrade" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="frm-lft-clr123 border-bottom">Designation
                                            </td>
                                            <td class="frm-rght-clr123 border-bottom">
                                                <asp:Label ID="lbldesingantion" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="frm-lft-clr123" style="width: 40%">Location
                                            </td>
                                            <td class="frm-rght-clr123" style="width: 60%">
                                                <asp:Label ID="lbllocation" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="frm-lft-clr123">Department
                                            </td>
                                            <td class="frm-rght-clr123">
                                                <asp:Label ID="lbldept" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="frm-lft-clr123 border-bottom">Reporting Manager
                                            </td>
                                            <td class="frm-rght-clr123 border-bottom">
                                                <asp:Label ID="lblmgr" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="frm-lft-clr123" style="width: 40%">Cost Center
                                            </td>
                                            <td class="frm-rght-clr123" style="width: 60%">
                                                <asp:Label ID="lblcostcenter" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="frm-lft-clr123">Bank Name
                                            </td>
                                            <td class="frm-rght-clr123">
                                                <asp:Label ID="lblbank" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-lft-clr123 border-bottom">Bank Account No.
                                            </td>
                                            <td class="frm-rght-clr123 border-bottom">
                                                <asp:Label ID="lblbank_ac_no" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-lft-clr123 border-bottom">ACCPAC Code
                                            </td>
                                            <td class="frm-rght-clr123 border-bottom">
                                                <asp:Label ID="lblaccpac" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                    </table>

                                </fieldset>
                            </div>
                        </div>
                    </div>

                    <div class="span8">
                        <div class="widget">
                            <div class="widget-header" style="border-bottom: none;">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe023;"></span>
                                    <span id="Span1" runat="server" class="txt-red" enableviewstate="false"></span>
                                    <asp:Label ID="Label1" runat="server" Text="Travel Details"></asp:Label>
                                </div>
                            </div>
                            <div class="widget-body">
                                <fieldset>

                                    <table style="width: 100%">
                                        <tr style="height: 40px;">
                                            <td class="frm-lft-clr123" style="width: 20%">Travel Code
                                            </td>
                                            <td class="frm-rght-clr123" style="width: 80%">
                                                <asp:Label ID="lblAcCode" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-lft-clr123 border-bottom" style="width: 20%">Travel Purpose
                                            </td>
                                            <td class="frm-rght-clr123 border-bottom" style="width: 80%">
                                                <asp:TextBox ID="txt_travelpurpose" Enabled="false" TextMode="MultiLine" runat="server" CssClass="blue1" Width="60%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txt_travelpurpose"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Enter Travel Purpose" ValidationGroup="travel"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                                <div class=" no-margin" style="float: right; display: none;">
                                                    <asp:Button ID="btnEditTravel" runat="server" CssClass="btn btn-primary"
                                                        Text="Edit" OnClick="btnEditTravel_Click" />
                                                    <asp:Button ID="btnupdateTravel" runat="server" CssClass="btn btn-warning" ValidationGroup="travel" Visible="false"
                                                        Text="Update" OnClick="btnupdateTravel_Click" />
                                                    <asp:Button ID="btnTravelCancel" runat="server" CssClass="btn" Visible="false"
                                                        Text="Cancel" OnClick="btnTravelCancel_Click" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                </fieldset>
                            </div>
                        </div>
                    </div>

                    <div class="span8">
                        <div class="widget">
                            <div class="widget-header" style="border-bottom: none;">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe023;"></span>
                                    <span id="Span2" runat="server" class="txt-red" enableviewstate="false"></span>
                                    <asp:Label ID="Label2" runat="server" Text="Miscellaneous Allowance"></asp:Label>
                                </div>
                                <asp:Button ID="btnAddAdvance" runat="server" CssClass="btn btn-info pull-right" ValidationGroup="allo"
                                    Text="Add" OnClick="btnAddAdvance_Click" />
                            </div>

                            <div class="widget-body">
                                <fieldset>

                                    <table style="width: 100%" id="tblAllowance" runat="server" visible="false">

                                        <tr style="height: 40px">

                                            <td class="frm-lft-clr123  border-bottom" style="width: 12%">Description
                                            </td>
                                            <td class="frm-rght-clr123 border-bottom" style="width: 30%">
                                                <asp:TextBox ID="txtAdvanceDesc" TextMode="MultiLine" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAdvanceDesc"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Enter Description" ValidationGroup="allo"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                            </td>

                                            <td class="frm-lft-clr123 border-bottom" style="width: 12%">Currency
                                            </td>
                                            <td class="frm-rght-clr123 border-bottom" style="width: 14%">
                                                <asp:DropDownList ID="ddlCurrecny" runat="server" CssClass="blue1" Width="80%">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCurrecny"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Select Currency" ValidationGroup="allo" InitialValue="0"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                            </td>

                                            <td class="frm-lft-clr123 border-bottom" style="width: 12%">Amount
                                            </td>
                                            <td class="frm-rght-clr123 border-bottom" style="width: 20%">
                                                <asp:TextBox ID="txtAdvanceAmount" runat="server" CssClass="blue1" Width="80%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAdvanceAmount"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Enter Amount" ValidationGroup="allo"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator16" ControlToValidate="txtAdvanceAmount"
                                                    ValidationGroup="allo" runat="server" ValidationExpression="^\d+(\.\d{1,2})?$" ToolTip="Enter only decimals upto 2 places"
                                                    ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RegularExpressionValidator>
                                                <asp:HiddenField ID="hfAllownaceID" runat="server" />
                                            </td>

                                        </tr>

                                        <tr>
                                            <td colspan="6" height="5px"></td>
                                        </tr>

                                        <tr>
                                            <td colspan="6" align="right">
                                                <asp:Button ID="btnAllowaceSave" runat="server" Text="Save" OnClick="btnAllowaceSave_Click" />
                                                <asp:Button ID="btnAllowaceCancel" runat="server" CssClass="btn" Text="Cancel" OnClick="btnAllowaceCancel_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6" height="5px"></td>
                                        </tr>
                                    </table>

                                    <div class=" no-margin" style="float: right">
                                    </div>

                                    <div style="height: 40px; float: right"></div>

                                    <div id="dt_example" class="example_alt_pagination">
                                        <asp:GridView ID="grid_Advance" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped  table-bordered pull-left"
                                            EmptyDataText="No Data Exists" OnRowDeleting="grid_Advance_RowDeleting" OnPreRender="grid_Advance_PreRender" DataKeyNames="id" OnRowEditing="grid_Advance_RowEditing">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("advance_desc")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Currency">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCurrency" runat="server" Text='<%#Eval("currencycode")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("amount")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:LinkButton
                                                            ID="lbtnEdit" runat="server" CommandName="Edit" CssClass="link05" Text="Edit" OnClientClick="return confirm('Are you sure to Edit this entry?')"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:LinkButton
                                                            ID="LinkButton1" runat="server" CommandName="Delete" CssClass="link04" Text="Delete" OnClientClick="return confirm('Are you sure to Delete this entry?')"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <div class="clearfix"></div>
                                    </div>

                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-header" style="border-bottom: none;">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe023;"></span>
                                    <span id="Span3" runat="server" class="txt-red" enableviewstate="false"></span>
                                    <asp:Label ID="Label3" runat="server" Text="Travel Trips"></asp:Label>

                                </div>

                            </div>
                            <div class="widget-body">
                                <fieldset>
                                    <table style="width: 100%">
                                        <tr style="display: none">
                                            <td colspan="2">
                                                <div class=" no-margin" style="float: right">
                                                    <asp:Button ID="btnAddTrip" runat="server" CssClass="btn btn-primary" OnClick="btnAddTrip_Click"
                                                        Text="Add" ValidationGroup="trip" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="5px"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div style="height: 40px; float: right"></div>

                                                <div id="dt_example1" class="example_alt_pagination">

                                                    <asp:GridView ID="grid_Trip" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped  table-bordered pull-left"
                                                        EmptyDataText="No Data Exists" OnRowDeleting="grid_Trip_RowDeleting" OnPreRender="grid_Trip_PreRender" DataKeyNames="tripid" OnRowEditing="grid_Trip_RowEditing">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex +1 %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Date Of Departure">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldeptDate" runat="server" Text='<%#Eval("departuredate","{0:dd-MMM-yyyy}").ToString()+" "+Eval("departuretime").ToString()%>'></asp:Label>
                                                                    <asp:Label ID="lbldeptTime" runat="server" Text='<%#Eval("departuretime")%>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Date Of Arrival">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblArrDate" runat="server" Text='<%#Eval("arrivaldate","{0:dd-MMM-yyyy}").ToString()+" "+Eval("arrivaltime").ToString()%>'></asp:Label>
                                                                    <asp:Label ID="lblArrTime" runat="server" Text='<%#Eval("arrivaltime")%>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="From">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSource" runat="server" Text='<%#Eval("fromplace")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="To">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDestination" runat="server" Text='<%#Eval("toplace")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Travel Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbltraveltype" runat="server" Text='<% #Eval("triptype").ToString() == "I" ? "International" : "Domestic"%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Accommodation">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccommodation" runat="server" Text='<%#Eval("staytype")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Exception">
                                                                <ItemTemplate>

                                                                    <asp:Label ID="lblexemption" runat="server" Text='<%#Eval("exemption_raised")%>' Visible="false"></asp:Label>
                                                                    <span class="fs1" aria-hidden="true" data-icon='<%#Eval("exemption_raised").ToString()=="True"?"&#xe0fe;":""%>'></span>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="View">
                                                                <ItemTemplate>
                                                                    <%--<asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit" CssClass="link05" Text="View" ></asp:LinkButton>--%>
                                                                    <a href="javascript:void(window.open('ViewTripDetails.aspx?tripid=<%# Eval("tripid") %>','title','height=550,width=1100,left=100,top=30'));" class="link05">View </a>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Delete" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Delete" CssClass="link05" Text="Delete" OnClientClick="return confirm('Are you sure to Delete this entry?')"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>

                                                    <div class="clearfix"></div>
                                                </div>

                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row-fluid" id="divTrip" runat="server" visible="false">
                    <div class="span4">
                        <div class="widget">
                            <div class="widget-header">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14b;"></span>Trip Details
                                       
                                </div>
                            </div>
                            <div class="widget-body">
                                <fieldset>
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="frm-lft-clr123">Travel Type</td>
                                            <td class="frm-rght-clr123">
                                                <asp:DropDownList ID="ddl_traveltype" runat="server" CssClass="blue1" Width="90%" OnSelectedIndexChanged="ddl_traveltype_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Value="0">-----Select-----</asp:ListItem>
                                                    <asp:ListItem Value="D">Domestic</asp:ListItem>
                                                    <asp:ListItem Value="I">International</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddl_traveltype"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Select Travel Type" ValidationGroup="trip" InitialValue="0"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr id="trFromcity" runat="server">
                                            <td class="frm-lft-clr123">From</td>
                                            <td class="frm-rght-clr123">
                                                <asp:DropDownList ID="ddl_source" runat="server" CssClass="blue1" Width="90%">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl_source"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Select From" ValidationGroup="trip" InitialValue="0"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr id="trFromcountry" runat="server" visible="false">
                                            <td class="frm-lft-clr123">From</td>
                                            <td class="frm-rght-clr123">
                                                <asp:DropDownList ID="ddl_Fromcountry" runat="server" CssClass="blue1" Width="90%">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddl_Fromcountry"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Select From" ValidationGroup="trip" InitialValue="0"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr id="trToCity" runat="server">
                                            <td class="frm-lft-clr123">To
                                            </td>
                                            <td class="frm-rght-clr123">
                                                <asp:DropDownList ID="ddl_destination" runat="server" CssClass="blue1" Width="90%">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddl_destination"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Select To" ValidationGroup="trip" InitialValue="0"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr id="trToCountry" runat="server" visible="false">
                                            <td class="frm-lft-clr123">To
                                            </td>
                                            <td class="frm-rght-clr123">
                                                <asp:DropDownList ID="ddl_destinationCountry" runat="server" CssClass="blue1" Width="90%">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddl_destinationCountry"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Select To" ValidationGroup="trip" InitialValue="0"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-lft-clr123" style="width: 44%">Date Of Departure</td>
                                            <td class="frm-rght-clr123" style="width: 54%">
                                                <asp:TextBox ID="txtdepartdate" runat="server" CssClass="blue1" Width="80%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                                <asp:Image ID="Image11" runat="server" ImageUrl="~/img/clndr.gif" />
                                                <cc1:CalendarExtender ID="CalendarExtender11" runat="server" PopupButtonID="Image11"
                                                    TargetControlID="txtdepartdate" Enabled="True" Format="dd MMM yyyy">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdepartdate"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Enter Date Of Departure" ValidationGroup="trip"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                                <%--  <asp:CompareValidator ID="CompareValidator2" runat="server" CultureInvariantValues="false"
                                                                        ControlToValidate="txtdepartdate" ErrorMessage='<img src="../img/error1.gif" alt="" />'
                                                                        Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date" ToolTip="Please do not select earlier date than today."
                                                                        ValidationGroup="v"></asp:CompareValidator>--%>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td class="frm-lft-clr123">Time Of Departure </td>
                                            <td class="frm-rght-clr123">
                                                <asp:TextBox ID="txtdeparttime" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-lft-clr123" width="44%">Date Of Arrival</td>
                                            <td class="frm-rght-clr123" width="55%">
                                                <asp:TextBox ID="txtarvlDate" runat="server" CssClass="blue1" Width="80%"></asp:TextBox>
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/img/clndr.gif" />
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                                    TargetControlID="txtarvlDate" Enabled="True" Format="dd MMM yyyy">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtarvlDate"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Enter Date Of Arrival" ValidationGroup="trip"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                                <%-- <asp:CompareValidator ID="CompareValidator1" runat="server"
                                                                        ControlToValidate="txtdepartdate" ValueToCompare="txtarvlDate" ErrorMessage='<img src="../images/error1.gif" alt="" />'
                                                                        Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date" ToolTip="Please do not select earlier date than today."
                                                                        ValidationGroup="v"></asp:CompareValidator>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-lft-clr123">Time Of Arrival</td>
                                            <td class="frm-rght-clr123">
                                                <asp:TextBox ID="txtArvlTime" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-lft-clr123">Privillege Travel Details</td>
                                            <td class="frm-rght-clr123">
                                                <asp:TextBox ID="txtPTD" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-lft-clr123 border-bottom">Stay Accommodation</td>
                                            <td class="frm-rght-clr123 border-bottom">
                                                <asp:DropDownList ID="ddl_stayType" runat="server" CssClass="blue1" Width="90%">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddl_stayType"
                                                    Display="Dynamic" SetFocusOnError="True" ToolTip="Select Stay Accommodation" ValidationGroup="trip" InitialValue="0"
                                                    Width="6px" ErrorMessage='<img src="../img/error1.gif" alt="" />'></asp:RequiredFieldValidator>
                                                <asp:HiddenField ID="hftripid" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-lft-clr123 ">Employee Comments</td>
                                            <td class="frm-rght-clr123">
                                                <asp:TextBox ID="txtEmpCommets" runat="server" CssClass="blue1" Width="90%" TextMode="MultiLine" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-lft-clr123 border-bottom">GL Code</td>
                                            <td class="frm-rght-clr123 border-bottom">
                                                <asp:TextBox ID="txtGLCode" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <div class="span8">
                        <div class="widget">
                            <div class="widget-header">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14b;"></span>Expense Details
                 
                                </div>
                            </div>
                            <div class="widget-body">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="vertical-align: top; width: 50%">

                                            <table style="width: 100%">
                                                <tr>
                                                    <td colspan="2" height="30px" class="txt02">Travel</td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123" style="width: 44%">Ticket Booked</td>
                                                    <td class="frm-rght-clr123">
                                                        <table class="radio inline">
                                                            <tr>
                                                                <td>
                                                                    <asp:HiddenField ID="hftickerid" runat="server" />
                                                                    <asp:RadioButtonList ID="rbtnl" runat="server" Width="100px" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnl_SelectedIndexChanged">
                                                                        <asp:ListItem Value="True">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="False" Selected="True">No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123" style="width: 44%">Advance Given</td>
                                                    <td class="frm-rght-clr123">
                                                        <table class="radio inline">
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButtonList ID="rbtnl_ticketAdv" runat="server" Width="100px" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnl_ticketAdv_SelectedIndexChanged">
                                                                        <asp:ListItem Value="True">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="False" Selected="True">No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="trticketadv" runat="server" visible="false">
                                                    <td class="frm-lft-clr123">Advance Amount</td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:TextBox ID="txtticketAdv" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr id="trticket1" runat="server" visible="false">

                                                    <td class="frm-lft-clr123">Tier </td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:DropDownList ID="ddl_tier" runat="server" CssClass="blue1" Width="90%">
                                                        </asp:DropDownList>

                                                    </td>
                                                </tr>
                                                <tr id="trticket2" runat="server" visible="false">
                                                    <td class="frm-lft-clr123">Mode</td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:DropDownList ID="ddl_mode" runat="server" CssClass="blue1" OnSelectedIndexChanged="ddl_mode_SelectedIndexChanged" AutoPostBack="true" Width="90%">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr id="trticket3" runat="server" visible="false">
                                                    <td class="frm-lft-clr123">Class</td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:DropDownList ID="ddl_modeClass" runat="server" CssClass="blue1" Width="90%">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr id="trticket4" runat="server" visible="false">
                                                    <td class="frm-lft-clr123">Fair</td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:DropDownList ID="ddl_fareCurrecny" runat="server" CssClass="blue1" Width="35%">
                                                            <asp:ListItem Value="1">INR</asp:ListItem>
                                                            <asp:ListItem Value="2">USD</asp:ListItem>
                                                            <asp:ListItem Value="3">EUR</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:TextBox ID="txtticketfair" runat="server" CssClass="blue1" Width="55%" onkeypress="return isCharOrSpace()"></asp:TextBox>

                                                    </td>
                                                </tr>
                                                <tr id="trticket5" runat="server" visible="false">
                                                    <td class="frm-lft-clr123" style="width: 44%">Ticket Upload</td>
                                                    <td class="frm-rght-clr123" style="width: 54%">
                                                        <asp:FileUpload ID="fupTicket" runat="server" CssClass="blue1" Width="90%"></asp:FileUpload>
                                                    </td>
                                                </tr>
                                                <tr id="trticket6" runat="server" visible="false">
                                                    <td class="frm-lft-clr123" style="width: 44%">Boarding Pass Collected</td>
                                                    <td class="frm-rght-clr123" style="width: 54%">
                                                        <asp:CheckBox ID="chkpass" runat="server" Width="90%"></asp:CheckBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123" style="width: 44%">Exception</td>
                                                    <td class="frm-rght-clr123" style="width: 54%">
                                                        <asp:CheckBox ID="chkException" runat="server" Width="90%"></asp:CheckBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123 border-bottom">Admin Comments</td>
                                                    <td class="frm-rght-clr123 border-bottom">
                                                        <asp:TextBox ID="txtAdminComments" runat="server" CssClass="blue1" Width="90%" TextMode="MultiLine" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="vertical-align: top; width: 50%;">

                                            <table style="width: 99%;" align=" right">
                                                <tr>
                                                    <td height="30px" class="txt02">Stay Details</td>
                                                    <td class="txt02" style="text-align: right">Currecny&nbsp;
                                                                <asp:DropDownList ID="ddl_stayCurrency" runat="server" CssClass="blue1" Width="40%">
                                                                    <asp:ListItem Value="1">INR</asp:ListItem>
                                                                    <asp:ListItem Value="2">USD</asp:ListItem>
                                                                    <asp:ListItem Value="3">EUR</asp:ListItem>
                                                                </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height: 5px"></td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123" style="width: 44%">Lodging</td>
                                                    <td class="frm-rght-clr123" style="width: 54%;" valign="middle">
                                                        <table style="width: 100%; color: blue">
                                                            <tr>
                                                                <td style="width: 30%">Days:<br />
                                                                    <asp:Label ID="lbllodgedays" runat="server"></asp:Label></td>
                                                                <td style="width: 35%">Per Day:<br />
                                                                    <asp:Label ID="lbllodge" runat="server" Font-Size="Smaller" ForeColor="Blue"></asp:Label></td>
                                                                <td style="width: 35%">Total:<br />
                                                                    <asp:Label ID="lbllodgetotal" runat="server"></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123">Lodge Booked</td>
                                                    <td class="frm-rght-clr123">
                                                        <table class="radio inline">
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButtonList ID="rbtnl_lodge" runat="server" Width="100px" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnl_lodge_SelectedIndexChanged">
                                                                        <asp:ListItem Value="True">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="False" Selected="True">No</asp:ListItem>
                                                                    </asp:RadioButtonList>

                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="trlodge" runat="server" visible="false">
                                                    <td class="frm-lft-clr123">Fare</td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:TextBox ID="txtlodgefare" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>

                                                    </td>
                                                </tr>
                                                <tr id="trlodge2" runat="server" visible="false">
                                                    <td class="frm-lft-clr123">Address</td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:TextBox ID="txtLodgeAddress" runat="server" CssClass="blue1" Width="90%" TextMode="MultiLine" onkeypress="return isCharOrSpace()"></asp:TextBox>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123">Advance Given</td>
                                                    <td class="frm-rght-clr123">
                                                        <table class="radio inline">
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButtonList ID="rbtnl_lodgeAdv" runat="server" Width="100px" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnl_lodgeAdv_SelectedIndexChanged">
                                                                        <asp:ListItem Value="True">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="False" Selected="True">No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="trlodgeAdv" runat="server" visible="false">
                                                    <td class="frm-lft-clr123">Advance Amount</td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:TextBox ID="txt_lodgeAdv" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height: 5px; border-top: 1px solid #ddd"></td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123" style="width: 44%">Conveyance</td>
                                                    <td class="frm-rght-clr123" style="width: 54%;" valign="middle">
                                                        <table style="width: 100%; color: blue">
                                                            <tr>
                                                                <td style="width: 30%">Days:<br />
                                                                    <asp:Label ID="lbl_ConvDays" runat="server" Width="10%"></asp:Label></td>
                                                                <td style="width: 35%">Per Day:<br />
                                                                    <asp:Label ID="lblconv" runat="server" Font-Size="Smaller" ForeColor="Blue"></asp:Label></td>
                                                                <td style="width: 35%">Total:<br />
                                                                    <asp:Label ID="lblConvtotal" runat="server"></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123">Advance Given</td>
                                                    <td class="frm-rght-clr123">
                                                        <table class="radio inline">
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButtonList ID="rbtnl_conv" runat="server" Width="100px" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnl_conv_SelectedIndexChanged">
                                                                        <asp:ListItem Value="True">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="False" Selected="True">No</asp:ListItem>
                                                                    </asp:RadioButtonList>

                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="trconv" runat="server" visible="false">
                                                    <td class="frm-lft-clr123">Advance Amount</td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:TextBox ID="txtconvAdvance" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height: 5px; border-top: 1px solid #ddd"></td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123" style="width: 44%">Food</td>
                                                    <td class="frm-rght-clr123" style="width: 54%;" valign="middle">
                                                        <table style="width: 100%; color: blue">
                                                            <tr>
                                                                <td style="width: 30%">Days:<br />
                                                                    <asp:Label ID="lblfoodDays" runat="server" Width="10%"></asp:Label></td>
                                                                <td style="width: 35%">Per Day:<br />
                                                                    <asp:Label ID="lblfood" runat="server" Font-Size="Smaller" ForeColor="Blue"></asp:Label></td>
                                                                <td style="width: 35%">Total:<br />
                                                                    <asp:Label ID="lblfoodtotal" runat="server"></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123">Advance Given</td>
                                                    <td class="frm-rght-clr123">
                                                        <table class="radio inline">
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButtonList ID="rbtnl_food" runat="server" Width="100px" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnl_food_SelectedIndexChanged">
                                                                        <asp:ListItem Value="True">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="False" Selected="True">No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="trfood" runat="server" visible="false">
                                                    <td class="frm-lft-clr123">Advance Amount</td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:TextBox ID="txtFoodAdv" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height: 5px; border-top: 1px solid #ddd"></td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123" style="width: 44%">OOP Expense</td>
                                                    <td class="frm-rght-clr123" style="width: 54%;" valign="middle">
                                                        <table style="width: 100%; color: blue">
                                                            <tr>
                                                                <td style="width: 30%;">Days:<br />
                                                                    <asp:Label ID="lbloppDays" runat="server" Width="10%"></asp:Label></td>
                                                                <td style="width: 35%">Per Day:<br />
                                                                    <asp:Label ID="lbloop" runat="server" Font-Size="Smaller" ForeColor="Blue"></asp:Label></td>
                                                                <td style="width: 35%">Total:<br />
                                                                    <asp:Label ID="lblopptotal" runat="server"></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123">Advance Given</td>
                                                    <td class="frm-rght-clr123">
                                                        <table class="radio inline">
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButtonList ID="rbtnl_oop" runat="server" Width="100px" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnl_oop_SelectedIndexChanged">
                                                                        <asp:ListItem Value="True">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="False" Selected="True">No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="troop" runat="server" visible="false">
                                                    <td class="frm-lft-clr123">Advance Amount</td>
                                                    <td class="frm-rght-clr123">
                                                        <asp:TextBox ID="txtoopAdv" runat="server" CssClass="blue1" Width="90%" onkeypress="return isCharOrSpace()"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="frm-lft-clr123 border-bottom">Management Comments</td>
                                                    <td class="frm-rght-clr123 border-bottom">
                                                        <asp:TextBox ID="txt_mgmtComments" runat="server" CssClass="blue1" Width="90%" TextMode="MultiLine" onkeypress="return isCharOrSpace()"></asp:TextBox>

                                                    </td>
                                                </tr>

                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div style="text-align: right; margin-bottom: 10px">
                        <asp:Button ID="btnCalculateSummary" runat="server" CssClass="btn btn-primary" Text="Calculate Summary" OnClick="btnCalculateSummary_Click" Visible="false" />
                        <asp:Button ID="btnSaveTripDetails" runat="server" Text="Save" OnClick="btnSaveTripDetails_Click" />

                        <asp:Button ID="btnAproveExceptionm" runat="server" CssClass="btn  btn-primary" Text="Approve Exception" OnClick="btnAproveExceptionm_Click" />
                        <asp:Button ID="btnRejectExceptionm" runat="server" CssClass="btn  btn-primary" Text="Reject Exception" OnClick="btnRejectExceptionm_Click" />
                        <asp:Button ID="btnCancelTripDetails" runat="server" CssClass="btn" Text="Cancel" OnClick="btnCancelTripDetails_Click" />
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span8">
                        <div class="widget">
                            <div class="widget-header">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>Pre Travel Advance Summary 
                 
                                </div>
                            </div>
                            <div class="widget-body">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 50%; vertical-align: top">
                                            <table style="width: 99%" align="left">
                                                <tr>
                                                    <td class="txt02" colspan="2" style="height: 25px">Pre Booking Summary</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div id="Div3" class="example_alt_pagination">
                                                            <asp:GridView ID="grd_prebooked" runat="server" AutoGenerateColumns="False" CssClass="gvclass" Width="100%"
                                                                EmptyDataText="No Data  Found" ShowFooter="true" OnRowDataBound="grd_prebooked_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Trip">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblcode" runat="server" Text='<%#Eval("tripno")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Details">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDetails" runat="server" Text='<%#Eval("Details")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lbltotal" Font-Bold="true" runat="server" Text="Total"></asp:Label>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Currency">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblINR" runat="server" Text='<%#Eval("currencycode")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lbltotalINR" runat="server"></asp:Label>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUSD" runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lbltotalUSD" runat="server"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="INRSTD">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblINRSTD" runat="server" Text='<%#Eval("AmountINR")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label Font-Bold="true" ID="lbltotalINRSTD" runat="server"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height: 10px"></td>
                                                </tr>
                                                <tr>
                                                    <td class="txt02" colspan="2" style="height: 25px">Miscellaneous Allowance</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:GridView ID="grid_allowancetotal" runat="server" AutoGenerateColumns="False" CssClass="gvclass" Width="100%"
                                                            EmptyDataText="No Data Exists" ShowFooter="true" OnRowDataBound="grid_allowancetotal_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Description" HeaderStyle-Width="40%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("advance_desc")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lbltotal" Font-Bold="true" runat="server" Text="Total"></asp:Label>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Currency" HeaderStyle-Width="15%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblINR" runat="server" Text='<%#Eval("currencycode")%>'></asp:Label>
                                                                        <asp:Label ID="Label7" runat="server" Text='<%#Eval("currencytype")%>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Amount" HeaderStyle-Width="30%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("amount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="INRSTD">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblINRSTD" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lbltotalINRSTD" Font-Bold="true" runat="server"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 50%; vertical-align: top">
                                            <table style="width: 99%" align="right">
                                                <tr>
                                                    <td class="txt02" colspan="2" style="height: 25px">Advance Amount Summary</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:GridView ID="gridAdvanceSummary" runat="server" AutoGenerateColumns="False" CssClass="gvclass" Width="100%"
                                                            EmptyDataText="No Data  Found" ShowFooter="true" OnRowDataBound="gridAdvanceSummary_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Trip">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblcode" runat="server" Text='<%#Eval("tripno")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Details">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDetails" runat="server" Text='<%#Eval("Details")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lbltotal" Font-Bold="true" runat="server" Text="Total"></asp:Label>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Currency">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblINR" runat="server" Text='<%#Eval("currencycode")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lbltotalINR" runat="server"></asp:Label>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Amount">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblUSD" runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lbltotalUSD" runat="server"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="INRSTD">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblINRSTD" runat="server" Text='<%#Eval("AmountINR")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label Font-Bold="true" ID="lbltotalINRSTD" runat="server"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 5px" colspan="2"></td>
                                                </tr>
                                                <tr>
                                                    <td class="txt02" style="width: 50%">Total Estimation Amount</td>
                                                    <td style="width: 50%">
                                                        <asp:Label ID="Label5" runat="server" Text="INR" Width="30%"></asp:Label>
                                                        <asp:Label ID="txtEstimation" runat="server"></asp:Label>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt02">Final Advance Given</td>
                                                    <td>
                                                        <asp:Label ID="lbINR" runat="server" Text="INR" Width="30%"></asp:Label>
                                                        <asp:TextBox ID="txtFinalAmountGiven1" runat="server" Height="15px" Width="40%" onkeypress="return isCharOrSpace()"></asp:TextBox>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 5px" colspan="2"></td>
                                                </tr>
                                                <tr style="display: none">
                                                    <td class="txt02">Final Advance Given</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_finalCurrency" runat="server" CssClass="blue1" Width="30%">
                                                            <asp:ListItem Value="2">USD</asp:ListItem>
                                                            <asp:ListItem Value="3">EUR</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:TextBox ID="txtFinalAmountGiven2" runat="server" Width="40%" Height="15px" onkeypress="return isCharOrSpace()"></asp:TextBox>

                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="widget">
                            <div class="widget-header">
                                <div class="title">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>Approvers
                 
                                </div>
                            </div>
                            <div class="widget-body">
                                <div id="Div1" class="example_alt_pagination">
                                    <asp:GridView ID="Grid_Approvers" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped  table-bordered pull-left"
                                        EmptyDataText="No Data  Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Approver Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcode" runat="server" Text='<%#Eval("approvercode")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Approver Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("empname")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Level">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbllevel" runat="server" Text='<%#Eval("approverlevel")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("approverstatus")%>'></asp:Label>
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


            </div>

            <div class="form-actions no-margin" style="text-align: right">
                <asp:Button ID="btnSumitForm" runat="server" CssClass="btn btn-primary" Text="Approve" ValidationGroup="travel" OnClick="btnSumitForm_Click" Visible="false" />
                <asp:Button ID="btnRejecct" runat="server" CssClass="btn btn-primary" Text="Reject" ValidationGroup="travel" OnClick="btnRejecct_Click" Visible="false" />
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-primary" Text="Back" ValidationGroup="travel" OnClick="btnBack_Click" />
                <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" Text="Send" OnClick="btnSend_Click" />
            </div>
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
                $('#grid_Advance').dataTable({
                    "sPaginationType": "full_numbers"
                });
            });
        </script>

        <script type="text/javascript">
            //Data Tables
            $(document).ready(function () {
                $('#grid_Trip').dataTable({
                    "sPaginationType": "full_numbers"
                });
            });
        </script>

        <script type="text/javascript">
            //Data Tables
            $(document).ready(function () {
                $('#grd_prebooked').dataTable({
                    "sPaginationType": "full_numbers"
                });
            });
        </script>

        <script type="text/javascript">
            //Data Tables
            $(document).ready(function () {
                $('#Grid_Approvers').dataTable({
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
</body>
</html>
