<%@ Page Language="C#" AutoEventWireup="true" CodeFile="calculate_gratuity.aspx.cs"
    Inherits="payroll_admin_calculate_gratuity" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Employee Pay Structure</title>
    <style type="text/css" media="all">
@import "../../css/blue1.css";
</style>

    <script language="JavaScript" type="text/javascript" src="../../js/popup.js"></script>

    <script type="text/javascript" src="../../js/jquery-1.2.2.pack.js"></script>

    <script type="text/javascript" src="../../js/ddaccordion.js"></script>

    <script type="text/javascript" src="../../js/timepicker.js"></script>

    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="Emp_PayStructure" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <%--  <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="1" runat="server">
            <ProgressTemplate>
                <div class="divajax">
                <table width="100%">
                <tr>
                <td align="center" valign="top"><img src="../../images/loading.gif" /></td>
                </tr>
                <tr>
                <td valign="bottom" align="center" class="txt01">Please Wait...</td>
                </tr>
                </table></div>
            </ProgressTemplate> 
        </asp:UpdateProgress>--%>
                <table width="718" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td valign="top">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td valign="top" class="blue-brdr-1" style="width: 719px">
                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="3%" style="height: 16px">
                                                    <img src="../../images/employee-icon.jpg" width="16" height="16" /></td>
                                                <td class="txt01" style="height: 16px">
                                                    Employee Full and Final Settlement</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="5" colspan="4">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20" valign="top" style="width: 719px">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="txt02" style="height: 13px">
                                                    Full and Final Settlement</td>
                                                <td class="txt02" align="right">
                                                    <span id="message" runat="server"></span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" style="height: 123px; width: 719px;">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td style="height: 5px;" colspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="frm-lft-clr123" style="width: 11%">
                                                    Employee Code</td>
                                                <td class="frm-rght-clr123" style="width: 27%">
                                                    <asp:TextBox ID="txt_employee" size="40" CssClass="input" runat="server" ToolTip="Employee Code"
                                                        Width="121px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="reqEmpcode" runat="server" ControlToValidate="txt_employee"
                                                        ErrorMessage='<img src="../../images/error1.gif" alt="" />' ToolTip="Enter Employee Code"><img src="../../images/error1.gif" alt="" /></asp:RequiredFieldValidator>
                                                    <a href="JavaScript:newPopup1('../../leave/admin/pickemployee.aspx');" class="link05">
                                                        Pick Employee</a></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 5px;" colspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="frm-lft-clr123" style="width: 11%">
                                                    &nbsp;</td>
                                                <td class="frm-rght-clr123" style="width: 27%">
                                                    <asp:Button ID="btnsbmit" runat="server" CssClass="button" OnClick="btnsbmit_Click"
                                                        Text="Submit" ToolTip="Click to view Employee Payslip" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 5px;" colspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <tr>
                                                        <td class="frm-lft-clr123" style="width: 11%">
                                                            Gratuity Amount</td>
                                                        <td class="frm-rght-clr123" style="width: 27%">
                                                            <asp:Label ID="lblgraduityAmount" runat="server"></asp:Label>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 5px;" colspan="2">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-lft-clr123" style="width: 11%">
                                                            Max Exmption
                                                        </td>
                                                        <td class="frm-rght-clr123" style="width: 27%">
                                                            <asp:Label ID="lblMaxExmption" runat="server"></asp:Label>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 5px;" colspan="2">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-lft-clr123" style="width: 11%">
                                                            Last 10 Basic Average</td>
                                                        <td class="frm-rght-clr123" style="width: 27%">
                                                            <asp:Label ID="lblLast10basic" runat="server"></asp:Label>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 5px;" colspan="2">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-lft-clr123" style="width: 11%">
                                                            &nbsp;</td>
                                                        <td class="frm-rght-clr123" style="width: 27%">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="2">
                                                            Mandatory Fields (<img src="../../images/error1.gif" alt="" />)</td>
                                                    </tr>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
