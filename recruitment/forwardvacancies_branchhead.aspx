﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forwardvacancies_branchhead.aspx.cs" Inherits="recruitment_forwardvacancies_branchhead" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css" media="all">
        @import "../css/blue1.css";
        @import "../css/example.css";
        @import "../css/ajax__tab_xp2.css";
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td valign="top" class="blue-brdr-1" colspan="4">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="3%">
                                            <img src="../images/employee-icon.jpg" width="16" height="16" />
                                        </td>
                                        <td class="txt01">CRITERIA FOR FORWARDING RRFS
                                        </td>
                                        <td align="right">
                                            <span id="message" runat="server" class="txt-red" enableviewstate="false"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="5"></td>
                        </tr>
                        <tr>
                            <td class="frm-lft-clr123" width="15%">From Date
                            </td>
                            <td class="frm-rght-clr123" width="15%">
                                <asp:TextBox ID="txt_fromdate" runat="server" CssClass="blue1" Width="100px"></asp:TextBox>&#160;
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/clndr.gif" />
                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" PopupButtonID="Image4"
                                    TargetControlID="txt_fromdate" Enabled="True" Format="MM/dd/yyyy">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="frm-lft-clr123">To Date
                            </td>
                            <td class="frm-rght-clr123">
                                <asp:TextBox ID="txt_todate" runat="server" CssClass="blue1" Width="100px"></asp:TextBox>&#160;
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/clndr.gif" />
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                    TargetControlID="txt_todate" Enabled="True" Format="MM/dd/yyyy">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="frm-lft-clr123">Location Of Vacancy
                            </td>
                            <td class="frm-rght-clr123">
                                <asp:DropDownList ID="ddl_location" runat="server" CssClass="blue1" Width="142px"
                                    Height="20px">
                                </asp:DropDownList>
                            </td>

                        </tr>

                        <tr>
                            <td class="frm-lft-clr123 border-bottom">Department Of Vacancy
                            </td>
                            <td class="frm-rght-clr123 border-bottom">
                                <asp:DropDownList ID="ddl_dept" runat="server" CssClass="blue1" Width="142px"
                                    Height="20px">
                                </asp:DropDownList>
                            </td>
                            <td class="frm-lft-clr123 border-bottom">Raiser Of Vacancy
                            </td>
                            <td class="frm-rght-clr123 border-bottom">
                                <asp:DropDownList ID="ddl_raiser" runat="server" CssClass="blue1" Width="142px"
                                    Height="20px">
                                </asp:DropDownList>
                            </td>
                            <td colspan="2" align="center" class="frm-rght-clr123 border-bottom">
                                <asp:Button ID="btn_Sumbit" runat="server" Text="Submit" CssClass="button" OnClick="btn_Sumbit_Click" />
                                &nbsp;
                    <asp:Button ID="btn_clear" runat="server" Text="Clear" CssClass="button" OnClick="btn_clear_Click" />
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" height="5"></td>
                        </tr>
                        <tr>
                            <td colspan="4" height="5"></td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="grdRRF" runat="server" AutoGenerateColumns="False" Width="100%"
                                    CellPadding="4" CaptionAlign="Left" AllowSorting="True" PageSize="100" Style="border-right: 1px solid #c9dffb"
                                    EmptyDataText="No Data Found." CssClass="gvclass">
                                    <%--<PagerSettings Mode="NextPreviousFirstLast"   FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous"/> --%>
                                    <Columns>
                                        <%-- <asp:HyperLinkField HeaderText="Select" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/recruitment/approveRequistionForm.aspx?Id={0}"
                                    Text="Select">
                                    <ControlStyle CssClass="link05" Width="6%" />
                                    <HeaderStyle CssClass="frm-lft-clr123" />
                                    <ItemStyle CssClass="frm-rght-clr1234"></ItemStyle>
                                </asp:HyperLinkField>--%>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hfid" runat="server" Value='<%# Eval("id") %>' />
                                                <asp:CheckBox ID="chkselect" runat="server" />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="frm-lft-clr123" Width="8%" />
                                            <ItemStyle CssClass="frm-rght-clr1234"></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText=" Department">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("department_name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="frm-lft-clr123" Width="20%" />
                                            <ItemStyle CssClass="frm-rght-clr1234"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Designation">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("designationname") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="frm-lft-clr123" Width="20%" />
                                            <ItemStyle CssClass="frm-rght-clr1234"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No Of Posts">
                                            <ItemTemplate>
                                                <asp:Label ID="lblnoofposts" runat="server" Text='<%# Eval("total_no_posts") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="frm-lft-clr123" Width="15%" />
                                            <ItemStyle CssClass="frm-rght-clr1234"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Requested By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRequestedBy" runat="server" Text='<%# Eval("requestedby") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="frm-lft-clr123" Width="15%" />
                                            <ItemStyle CssClass="frm-rght-clr1234"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Requisition Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblrequisitionDate" runat="server" Text='<%# Eval("createddate") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="frm-lft-clr123" Width="15%" />
                                            <ItemStyle CssClass="frm-rght-clr1234"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" View">
                                            <ItemTemplate>
                                                <a href='viewRequistionStatus.aspx?id=<%# Eval("id") %>' class="link05"><%# Eval("rrf_code") %></a>

                                            </ItemTemplate>
                                            <HeaderStyle CssClass="frm-lft-clr123" Width="10%" />
                                            <ItemStyle CssClass="frm-rght-clr1234"></ItemStyle>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" height="10"></td>
                        </tr>
                        <tr>
                            <td class="frm-lft-clr123 border-bottom">Select Approver
                            </td>
                            <td class="frm-rght-clr123 border-bottom">
                                <asp:DropDownList ID="ddl_org_head" runat="server" CssClass="blue1" Width="142px"
                                    Height="20px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddl_org_head"
                                    Display="Dynamic" ErrorMessage='<img src="../images/error1.gif" alt="" />' ToolTip="Select Approver" InitialValue="0"
                                    ValidationGroup="s" Width="6px" SetFocusOnError="True"><img src="../images/error1.gif" alt="" /></asp:RequiredFieldValidator>
                            </td>
                            <td colspan="4">&nbsp;
                                    <asp:Button ID="btnsend" runat="server" Text="Send" CssClass="button" ValidationGroup="s" OnClick="btnsend_Click" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
