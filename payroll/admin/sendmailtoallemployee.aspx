<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sendmailtoallemployee.aspx.cs"
    Inherits="payroll_admin_sendmailtoallemployee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>SmartDrive Labs Technologies India Pvt. Ltd. : Employee Details</title>
    <style type="text/css" media="all">
        @import "../../css/blue1.css";
    </style>
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />

    <script src="../../leave/js/popup.js"></script>
    <link href="../../js/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../js/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <%--<asp:ScriptManager ID="leave" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="1" runat="server">
            <ProgressTemplate>
                          <div class="divajax" style="left: 250px; top: 150px">
                    <table width="100%">
                    <tr>
                    <td align="center" valign="top"><img src="../../images/loading.gif" /></td>
                    </tr>
                    <tr>
                    <td valign="bottom" align="center" class="txt01" height="23">Please Wait...</td>
                    </tr>
                    </table>
                    </div>
            </ProgressTemplate>
            </asp:UpdateProgress>--%>
        <div>
            <table width="100%px" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td valign="middle" class="txt02 blue-brdr-1">&nbsp;Pay Slip Mail Details
                    </td>
                </tr>
                <tr>
                    <td height="5" valign="top"></td>
                </tr>
                <tr>
                    <td height="5" valign="top">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="frm-lft-clr123" width="15%">Employee Name\Code
                                </td>
                                <td class="frm-rght-clr123" width="15%">
                                    <asp:TextBox ID="txt_employee" runat="server" CssClass="blue1" Width="124px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9]+$" ControlToValidate="txt_employee" ToolTip=" enter only alphabets or numbers"
                                        ErrorMessage='<img src="../../images/error1.gif" alt="" />' ValidationGroup="v">
<img src="../../images/error1.gif" alt="" /></asp:RegularExpressionValidator>

                                </td>
                                <td class="frm-lft-clr123" width="15%">Designation
                                </td>
                                <td class="frm-rght-clr123" width="15%">
                                    <asp:DropDownList ID="dd_designation" runat="server" CssClass="blue1" DataSourceID="SqlDataSource1"
                                        DataTextField="designationname" DataValueField="id" OnDataBound="dd_designation_DataBound"
                                        Width="158px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:intranetConnectionString %>"
                                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [id], [designationname] FROM [tbl_intranet_designation]"></asp:SqlDataSource>
                                </td>
                                <td class="frm-lft-clr123" style="width: 11%">Department
                                </td>
                                <td colspan="2" class="frm-rght-clr123" width="15%">&nbsp;<asp:DropDownList ID="dd_branch" runat="server" CssClass="blue1" DataSourceID="SqlDataSource2"
                                    DataTextField="department_name" DataValueField="departmentid" OnDataBound="dd_branch_DataBound"
                                    Width="145px">
                                </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:intranetConnectionString %>"
                                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT distinct  [departmentid], branch_name + '-' + department_name department_name FROM [tbl_internate_departmentdetails] INNER JOIN tbl_intranet_branch_detail ON tbl_intranet_branch_detail.branch_id=tbl_internate_departmentdetails.branchid order by department_name"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                                                <td class="frm-lft-clr123  " width="15%">Cost Center Group</td>
                                                                     <td class="frm-rght-clr123 " width="15%">
                                                                                <asp:DropDownList ID="ddl_cc_groupid" runat="server" CssClass="blue1" Height="" Width="158px"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddl_cc_groupid_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                     </td>
                                                                    <td class="frm-lft-clr123 " style="border-left: none;" width="15%">Cost Center Code</td>
                                                                    <td class="frm-rght-clr123 " width="15%">
                                                                        <asp:DropDownList ID="ddl_cc_code" runat="server" CssClass="blue1" Height="" Width="158px"
                                                                            AutoPostBack="true"  OnSelectedIndexChanged="ddl_cc_code_SelectedIndexChanged">
                                                                            <asp:ListItem Value="0">------Select--------</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                <td class="frm-lft-clr123 border-bottom" width="15%">Financial Year
                                </td>
                                <td class="frm-rght-clr123 border-bottom" width="15%">&nbsp;<asp:DropDownList ID="dd_year" runat="server" CssClass="blue1" DataTextField="year"
                                    DataValueField="year" ToolTip="Financial Year" Width="129px">
                                </asp:DropDownList>
                                </td>
                                                            </tr>
                               
                            <tr>
                               
                                <td class="frm-lft-clr123 border-bottom" width="15%">Month
                                </td>
                                <td class="frm-rght-clr123 border-bottom">&nbsp;<asp:DropDownList ID="dd_month" runat="server" CssClass="blue1" DataTextField="month "
                                    DataValueField="month " ToolTip="Month" Width="129px">
                                </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="reqPayHead" runat="server" ControlToValidate="dd_month"
                                        Display="Dynamic" ErrorMessage='<img src="../../images/error1.gif" alt="" />'
                                        ToolTip="Select Month" ValidationGroup="a"><img src="../../images/error1.gif" alt="" /></asp:RequiredFieldValidator>
                                    &nbsp;&nbsp;
                                </td>
                                <td colspan="3" class="frm-rght-clr123 border-bottom" width="12%">
                                    <asp:Button ID="btn_search" runat="server" CssClass="button" Text="Search" OnClick="btn_search_Click" />&nbsp;
                                </td>
                                
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="5" valign="top"></td>
                </tr>
                <tr>
                    <td valign="middle" class="txt02 blue-brdr-1">&nbsp;Send Salary Slip
                    </td>
                </tr>
                <tr>
                    <td height="5" valign="top"></td>
                </tr>
                <tr>
                    <td height="5" valign="top">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td valign="top" align="right">
                                    <table width="100%">
                                        <tr>
                                            <td class="frm-lft-clr123" align="left" width="20%" style="display: none;">
                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="blue1" DataSourceID="SqlDataSource4"
                                                    DataTextField="department" DataValueField="printername" OnDataBound="DropDownList1_DataBound"
                                                    Width="158px">
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="DropDownList1"
                                                    Display="Dynamic" ErrorMessage='<img src="../../images/error1.gif" alt="" />'
                                                    Operator="NotEqual" ValidationGroup="b" ValueToCompare="0"></asp:CompareValidator><asp:SqlDataSource
                                                        ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:intranetConnectionString %>"
                                                        SelectCommand="SELECT [department], [printername] FROM [tbl_intranet_printersetting]"></asp:SqlDataSource>
                                            </td>
                                            <td class="frm-rght-clr123 " style="display: none;">
                                                
                                                <td class="frm-rght-clr123" align="left" width="20%" style="border-bottom: 1px solid #d9d9d9">
                                                    <asp:Button ID="btnprint" runat="server" CssClass="button" Text="Print" ToolTip="Print" Style="display: none;"
                                                        OnClick="btnprint_Click" ValidationGroup="b" />&nbsp;&nbsp; &nbsp;<asp:Button ID="btnsend"
                                                            runat="server" CssClass="button" ToolTip="Send Mail" Text="Send mail" OnClick="btnsend_Click" />&nbsp;
                                                </td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td height="10px"></td></tr>
                            <tr>
                                <td valign="top">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td valign="top">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td valign="top" class="txt02">&nbsp;Employee Record
                                                        <br />
                                                            
                                                            <asp:LinkButton ID="lnkcheckall" OnClick="lnkcheckall_Click" runat="server" CssClass="txt-red">Check All</asp:LinkButton>
                                                            |
                                                        <asp:LinkButton ID="lnkuncheckall" runat="server" CssClass="txt-red" OnClick="lnkuncheckall_Click">Uncheck All</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                     <tr><td height="10px"></td></tr>
                                                    <tr>
                                                        <td valign="top">
                                                            <div class="widget-content">
                                                                <asp:GridView ID="empgrid" runat="server" CellSpacing="0"
                                                                    CellPadding="4" DataKeyNames="empcode" Width="100%" AutoGenerateColumns="False"
                                                                    BorderWidth="0px" AllowPaging="True" PageSize="200" EmptyDataText="No such employee exists !"
                                                                    OnPageIndexChanging="empgrid_PageIndexChanging" CssClass="table table-hover table-striped table-bordered table-highlight-head">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Select">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="checkg" runat="Server" Checked="false"></asp:CheckBox>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Emp Code">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblempcodeg" runat="server" Text='<%# Bind("empcode")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Employee Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="l3" runat="server" Text='<%# Bind ("name") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Designation">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="l1" runat="server" Text='<%# Bind ("designationname") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Department">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="l4" runat="server" Text='<%# Bind ("department_name") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Cost Center Group">
                                                                                                            <HeaderStyle CssClass="" HorizontalAlign="Left" />
                                                                                                            <ItemStyle Width="26%" HorizontalAlign="Left" VerticalAlign="Top" CssClass="" />
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="ll2" runat="server" Text='<%# Bind ("cost_center_group_name") %>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Cost Center Name">
                                                                                                            <HeaderStyle CssClass="" HorizontalAlign="Left" />
                                                                                                            <ItemStyle Width="26%" HorizontalAlign="Left" VerticalAlign="Top" CssClass="" />
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="ly2" runat="server" Text='<%# Bind ("cost_center_name") %>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                    </Columns>

                                                                </asp:GridView>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:SqlDataSource ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:intranetConnectionString %>"
                                                    runat="server" SelectCommand="sp_payroll_fetch_emp_detail" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                        <asp:Parameter DefaultValue="" Name="name" Type="String" />
                                                        <asp:Parameter DefaultValue="0" Name="desg" Type="Int32" />
                                                        <asp:Parameter DefaultValue="0" Name="branch" Type="Int32" />
                                                        <asp:Parameter Name="status" Type="String" />
                                                        <asp:Parameter Name="month" Type="String" />
                                                        <asp:Parameter Name="year" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="10" valign="top"></td>
                            </tr>
                        </table>
                        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="false"></CR:CrystalReportViewer>
                    </td>
                </tr>
                <tr>
                </tr>
            </table>
        </div>
        <%--</ContentTemplate>
</asp:UpdatePanel>--%>
    </form>
</body>
</html>
