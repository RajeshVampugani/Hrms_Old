﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowEmpFeedbackForm.aspx.cs" Inherits="InformationCenter_ShowEmpFeedbackForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Controls/Uploader.ascx" TagName="File_Uploader" TagPrefix="File_Uploader" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server"><meta charset="utf-8"/>
    <title>SmartDrive Labs</title>
        <script src="../js/html5-trunk.js"></script>
        <link href="../icomoon/style.css" rel="stylesheet"/>
        <!--[if lte IE 7]>
    <script src="../css/icomoon-font/lte-ie7.js"></script>
    <![endif]-->
        <!-- NVD graphs css -->
        <link href="../css@vd-charts.css" rel="stylesheet"/>
        <!-- Bootstrap css -->
        <link href="../css/main.css" rel="stylesheet"/>
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
                                    <h2></h2>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="row-fluid">
                                <div class="widget">
                                    <div class="widget-header">
                                        <div class="title">
                                            <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>Employee Information	
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <fieldset>
                                            <div class="control-group">
                    <table class="table table-condensed table-striped  table-bordered pull-left">
                                    <tr>
                                        <td width="19%" class="frm-lft-clr123">Employee Name</td>
                                        <td width="31%" class="frm-rght-clr123">
                                            <asp:Label ID="lbl_emp_name" runat="server" Text="Label"></asp:Label></td>
                                        <td width="18%" class="frm-lft-clr123">Gender</td>
                                        <td width="31%" class="frm-rght-clr123">
                                            <asp:Label ID="lbl_gender" runat="server" Text="Label"></asp:Label></td>
                                    </tr>

                                    <tr>
                                        <td width="19%" class="frm-lft-clr123">Employee Code </td>
                                        <td width="31%" class="frm-rght-clr123">
                                            <asp:Label ID="lbl_emp_code" runat="server" Text="Label"></asp:Label></td>
                                        <td width="18%" class="frm-lft-clr123">Branch</td>
                                        <td width="31%" class="frm-rght-clr123">
                                            <asp:Label ID="lbl_branch" runat="server" Text="Label"></asp:Label></td>
                                    </tr>

                                    <tr>
                                        <td width="19%" class="frm-lft-clr123" style="height: 27px">Department</td>
                                        <td width="31%" class="frm-rght-clr123" style="height: 27px">
                                            <asp:Label ID="lbl_department" runat="server" Text="Label"></asp:Label></td>
                                        <td width="18%" class="frm-lft-clr123" style="height: 27px">D.O.J</td>
                                        <td width="31%" class="frm-rght-clr123" style="height: 27px">
                                            <asp:Label ID="lbl_doj" runat="server" Text="Label"></asp:Label></td>
                                    </tr>

                                    <tr>
                                        <td width="19%" class="frm-lft-clr123 border-bottom">Designation</td>
                                        <td width="31%" class="frm-rght-clr123 border-bottom">
                                            <asp:Label ID="lbl_designation" runat="server" Text="Label"></asp:Label></td>
                                        <td width="18%" class="frm-lft-clr123 border-bottom">Status</td>
                                        <td width="31%" class="frm-rght-clr123 border-bottom">
                                            <asp:Label ID="lbl_emp_status" runat="server" Text="Label"></asp:Label>&nbsp;</td>
                                    </tr>
                    </table>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                 <div class="widget">
                                    <div class="widget-header">
                                        <div class="title">
                                            <span class="fs1" aria-hidden="true" data-icon="&#xe14a;"></span>EMPLOYEE SASTISFACTION SURVEY	
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <fieldset>
                                            <div class="control-group">
                                <td valign="top" width="100%">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">
                                        <tr>
                                            <td class="frm-lft-clr123" ><b>1.   Overall, how satisfied are you with MACTAY as an employer? (Please circle one number-out of 5)  </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="frm-rght-clr123">
                                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">
                                        <tr>
                                            <td class="frm-lft-clr123"><b>2.	MACTAY's leadership and planning.</b>
                                            </td>
                                        </tr>
                                                    <tr>
                                                        <td class="frm-lft-clr123" width="30%">I have confidence in the leadership of MACTAY</td>
                                                        <td class="frm-rght-clr123" width="20%">
                                                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                        <td class="frm-lft-clr123" width="30%">There is adequate planning of corporate objectives </td>
                                                        <td class="frm-rght-clr123" width="20%">
                                                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-lft-clr123" width="30%">Management does not play favorites</td>
                                                        <td class="frm-rght-clr123" width="20%">
                                                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                        <td class="frm-lft-clr123" width="30%">Management does not “say one thing and do another”</td>
                                                        <td class="frm-rght-clr123" width="20%">
                                                            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>
                                        </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">
                                        <tr>
                                            <td class="frm-lft-clr123"><b>3.Corporate Culture  </b>
                                            </td>
                                        </tr>
                                                    <tr>
                                                        <td class="frm-lft-clr123" width="30%">Quality is a top priority with MACTAY</td>
                                                        <td class="frm-rght-clr123" width="20%">
                                                            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                        <td class="frm-lft-clr123 border-bottom" width="30%">Individual initiative is encouraged at MACTAY  </td>
                                                        <td class="frm-rght-clr123 border-bottom" width="20%">
                                                            <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-lft-clr123"  width="30%"">Nothing at MACTAY keeps me from doing my best every day</td>
                                                        <td class="frm-rght-clr123" width="20%"">
                                                            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                         <td class="frm-lft-clr123 " width="30%" > </td>
                                                        <td class="frm-rght-clr123  " width="20%" > </td>  
                                                    </tr>
                                        </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">
                                        <tr>
                                            <td class="frm-lft-clr123"><b>4.Communications </b>
                                            </td>
                                        </tr>
                                                    <tr>
                                                        <td class="frm-lft-clr123" width="30%">MACTAY’s corporate communications are frequent enough </td>
                                                        <td class="frm-rght-clr123" width="20%">
                                                            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                        <td class="frm-lft-clr123 border-bottom" width="30%">I feel I can trust what MACTAY tells me</td>
                                                        <td class="frm-rght-clr123 border-bottom" width="20%">
                                                            <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-lft-clr123 " width="30%" >There is adequate communication between departments </td>
                                                        <td class="frm-rght-clr123  " width="20%" >
                                                            <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                        <td class="frm-lft-clr123 " width="30%" > </td>
                                                        <td class="frm-rght-clr123  " width="20%" > </td>                                                         
                                                    </tr>
                                        
                                        </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">
                                        <tr>
                                            <td class="frm-lft-clr123"><b>5.Career Development  </b>
                                            </td>
                                        </tr>
                                                    <tr>
                                                        <td class="frm-lft-clr123" width="30%">I have a clearly established career path at MACTAY</td>
                                                        <td class="frm-rght-clr123" width="20%">
                                                            <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                        <td class="frm-lft-clr123" width="30%">I have opportunities to learn and grow </td>
                                                        <td class="frm-rght-clr123" width="20%">
                                                            <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>
                                        </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">
                                                    <tr>
                                                        <td class="frm-lft-clr123">
                                                            <b>If you have been here at least six months, please respond to these Performance appraisal items</b>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                                    <td class="frm-lft-clr123" width="30%">My last performance appraisal accurately reflected my performance</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123" width="30%">The performance appraisal system is fair</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                      </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">    
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>6. Your Role  </b>
                                                        </td>
                                                    </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">I am given enough authority to make decisions I need to make</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123 border-bottom" width="30%">I feel I am contributing to MACTAY’s mission</td>
                                                                    <td class="frm-rght-clr123 border-bottom" width="20%">
                                                                        <asp:Label ID="Label19" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">I have the materials and equipment I need to do my job well </td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123" width="30%">
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                    </td>
                                                                </tr>
                                      </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">          
                                                   
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>7. Recognition and Rewards</b>
                                                        </td>
                                                    </tr>
                                                    
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">If I do good work I can count on making more money</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123" width="30%">If I do good work I can count on being promoted</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label22" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">I feel I am valued at MACTAY</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123  border-bottom" width="30%">MACTAY gives enough recognition for work that's well done </td>
                                                                    <td class="frm-rght-clr123  border-bottom" width="20%">
                                                                        <asp:Label ID="Label24" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123">My salary is fair for my responsibilities</td>
                                                                    <td class="frm-rght-clr123">
                                                                        <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123"></td>
                                                                    <td class="frm-rght-clr123">
                                                                    </td>
                                                                </tr>
                                   </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">          
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>8. Teamwork and Cooperation</b>
                                                        </td>
                                                    </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">I feel part of a team working toward a shared goal  </td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label26" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123" width="30%">"Politics" at this company are kept to a minimum </td>
                                                                    <td class="frm-rght-clr123" width="30%">
                                                                        <asp:Label ID="Label27" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                      </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">          
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>9.Working Conditions   </b>
                                                        </td>
                                                    </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">I believe my job is secure</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label28" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123" width="30%">My physical working conditions are good </td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label29" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">Deadlines at MACTAY are realistic </td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label30" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123" width="30%">My workload is reasonable</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label31" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">I can keep a reasonable balance between work and personal life</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label32" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123" width="30%">
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                    </td>
                                                                </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">          
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>10.	Your Immediate Supervisor </b>
                                                        </td>

                                                    </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">My supervisor treats me fairly</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label33" runat="server" Text="Label"></asp:Label>

                                                                    </td>


                                                                    <td class="frm-lft-clr123" width="30%">My supervisor treats me with respect</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label34" runat="server" Text="Label"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">My supervisor handles my work-related issues satisfactorily</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label35" runat="server" Text="Label"></asp:Label>

                                                                    </td>


                                                                    <td class="frm-lft-clr123" width="30%">My supervisor asks me for my input to help make decisions </td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label36" runat="server" Text="Label"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">My supervisor is an effective manager</td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label37" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                     <td class="frm-lft-clr123" width="30%">
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                    </td>
                                                                </tr>
                                       </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">          
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>11.	MACTAY's Training Program </b>
                                                        </td>
                                                    </tr>
                                                                <tr>
                                                                    <td class="frm-lft-clr123" width="30%">MACTAY provided as much initial training as I needed </td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label38" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                    <td class="frm-lft-clr123" width="30%">MACTAY provides as much ongoing training as I need </td>
                                                                    <td class="frm-rght-clr123" width="20%">
                                                                        <asp:Label ID="Label39" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                   </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">          
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>12.	How long do you plan to continue your career with MACTAY?</b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-rght-clr123  border-bottom">
                                                            <asp:Label ID="Label40" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>
                                         </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">   
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>13.	Would you recommend employment at MACTAY to a friend?</b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-rght-clr123  border-bottom">
                                                            <asp:Label ID="Label41" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>
                                         </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">   
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>14. What I like best about working in MACTAY?</b>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td class="frm-rght-clr123  border-bottom">
                                                            <asp:Label ID="Label42" runat="server" Text="Label"></asp:Label>

                                                        </td>
                                                    </tr>
                                         </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">   
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>15. Things that MACTAY should do to make it a better workplace?</b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-rght-clr123  border-bottom">
                                                            <asp:Label ID="Label43" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>
                                         </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">   
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>16. What I like best about working in my Department?</b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-rght-clr123  border-bottom">
                                                            <asp:Label ID="Label44" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>
                                         </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-striped  table-bordered pull-left">   
                                                    <tr>
                                                        <td class="frm-lft-clr123"><b>17. Things that my Department should do to make it a better place to work?</b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="frm-rght-clr123  border-bottom">
                                                            <asp:Label ID="Label45" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>
                                     </table>
                                      </td>
                                            </div>
                                        </fieldset>
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
