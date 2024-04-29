<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editsubgroup.aspx.cs" Inherits="admin_editsubgroup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Admin Panel</title>
    <style type="text/css" media="all">
        @import "../css/blue1.css";
        @import "../css/example.css";
    </style>

    <script type="text/javascript" src="../js/tabber.js"></script>

    <script type="text/javascript">
        document.write('<style type="text/css">.tabber{display:none;}<\/style>');
    </script>

<link href="../css/blue1.css" rel="stylesheet" /></head>
<body>
    <div class="header">
        <form id="cmaster" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
            <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tbody>
                    <tr>
                        <td valign="top" class="blue-brdr-1" colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="3%">
                                        <img src="../images/employee-icon.jpg" width="16" height="16" />
                                    </td>
                                    <td class="txt01">
                                        Edit Subgroup
                                    </td>
                                    <td align="right">
                                        <span id="message" runat="server" class="txt02" enableviewstate="false">&nbsp;</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="5" valign="top">
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tbody>
                                    <tr>
                                        <td class="frm-lft-clr123" width="23%">
                                            SubGroup Name
                                        </td>
                                        <td class="frm-rght-clr123" width="77%">
                                            <asp:TextBox ID="txt_Subgroup_name" runat="server" CssClass="blue1" Width="182px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_Subgroup_name"
                                                Display="Dynamic" SetFocusOnError="True" ToolTip="Enter subgroup Name" ValidationGroup="c"
                                                Width="6px"><img src="../images/../img/error1.gif" alt="" /></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                  
                                    <tr>
                                        <td class="frm-lft-clr123 border-bottom">
                                            &nbsp;
                                        </td>
                                        <td class="frm-rght-clr123 border-bottom">
                                            <asp:Button ID="btnsv" runat="server" Text="Save" CssClass="button" ValidationGroup="c"
                                                OnClick="btnsv_Click"></asp:Button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="20" valign="bottom">
                                            Mandatory Fields (<img src="../img/error1.gif" alt="" />)
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        </form>
    </div>
</body>
</html>
