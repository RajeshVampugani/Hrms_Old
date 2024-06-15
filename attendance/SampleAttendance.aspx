<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SampleAttendance.aspx.cs" Inherits="attendance_SampleAttendance" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>SmartDrive Labs</title>
    <link href="../icomoon/style.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
    <script>
        function iskey(keycode)
        { return false; }
    </script>

</head>
<body>
    <form id="myForm" runat="server">
               <asp:UpdateProgress runat="server" ID="updateprogress1" AssociatedUpdatePanelID="updatepanel1" DisplayAfter="1">
            <ProgressTemplate>
                <div class="modal-backdrop fade in">
                    <div class="center-align-text">
                        <img src="images/loader.gif" alt="" />
                        Please Wait.....
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <script type="text/javascript">
            function ValidateData() {
                var branch = document.getElementById('<%=ddlbranch.ClientID %>');
                var frmdate = document.getElementById('<%=tbstartdate.ClientID%>');
                var todate = document.getElementById('<%=tbenddate.ClientID %>');

                if (branch.value == 0) {
                    alert("Please Enter Branch");
                    return false;
                }
                if (frmdate.value == "") {
                    alert("Please Enter From Date");
                    return false;
                }
                if (todate.value == "") {
                    alert("Please Enter To Date");
                    return false;
                }
                return true;
            }
        </script>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="form-horizontal no-margin">
            <div class="dashboard-wrapper" style="margin-left:0px">
                <div class="main-container">
                    <asp:UpdatePanel ID="updatepanel1" runat="server">
                        <ContentTemplate>
                            <div class="page-header">
                                <div class="pull-left">
                                    <h2>Process Attendence</h2>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="row-fluid">
                                <div class="widget"></div>
                                <div class="widget-header">
                                    <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span> Process Attendance
                                </div>
                                <div>
                                    <asp:Label ID="lblmessage" Text="" runat="server" ForeColor="Red" Font-size="Medium" CssClass="lbl lbl-important pull-right"></asp:Label> />
                                </div>
                            </div>
                            <div class="widget-body">
                                <fieldset>
                                    <div class="control-group">
                                       <label class="control-label">Branch</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="ddlbranch" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">From Date</label>
                                        <div class="controls">
                                            <asp:TextBox ID="tbstartdate" runat="server" CssClass="span3" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                       <asp:Image ID="img_f" runat="server" ImageUrl="~/leave/images/clndr.gif" />&nbsp;
                                             </div>
                                        <cc1:CalendarExtender ID="calenderextender1" runat="server" PopupButtonID="img_f" TargetControlID="tbstartdate"></cc1:CalendarExtender>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">To Date</label>
                                        ><div class="controls">
                                            <asp:TextBox ID="tbenddate" runat="server" CssClass="span3" onkeypress="return iskey(event);" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                        <asp:Image ID="image1" runat="server" ImageUrl="~/leave/images/clndr.gif" />&nbsp;
                                      <cc1:CalendarExtender ID="calenderextender2" runat="server" PopupButtonID="image1" TargetControlID="tbenddate"></cc1:CalendarExtender>
                                              </div>
                                    </div>
                                    <div class="form-actions no-margin">
                                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-info" Text="Process Attendance" OnClientClick="return validateData();" />&nbsp;
                                    </div>
                                </fieldset>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>                                     
                </div>
            </div>
    </form>
</body>
</html>
