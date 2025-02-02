﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PFAdminChange.aspx.cs" Inherits="Forms_PFAdminChange" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%--<link href="../css/blue1.css" rel="stylesheet" />--%>
    <link href="../icomoon/style.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
    <style>
        table.a
        {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

         .letterHead
        {
            padding-top: 140px;
            padding-bottom: 100px;
        } 
         .letterHeadCustom
        {
            padding-top: 240px;
            padding-bottom: 100px;
        } 
    </style>
    <script>
        function hide() {
            var x = document.getElementById('printButton');
            x.style.display = 'none';
        }
        function letterHead() {
            document.getElementById("letterHead").setAttribute("class", "letterHead");
            document.getElementById("letterHeadOne").setAttribute("class", "letterHeadCustom");
            document.getElementById("letterHeadTwo").setAttribute("class", "letterHeadCustom");
            
        }
</script>
    <style>
        .dashboard-wrapper .main-container
        {
            border-top: 0px solid white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-wrapper" style="margin-left: 0px;">
            <div class="main-container">

                <asp:ScriptManager ID="rr" runat="server"></asp:ScriptManager>
                <asp:Panel ID="pnl1" runat="server" Style="margin-top: 20px">

                    <div class="row-fluid" style="padding-left: 20px; padding-right: 20px;">
                        <div class="span11">
                            <div>
                                <div class="widget-body">
                                    <fieldset>
                                        <div class="control-group" style="padding-right: 10px; margin: 20px 20px 20px 20px;">
                                            <div id="letterHead">
                                            <div>

                                                <br />
                                                <br />
                                                <br />
                                                <table class="body">
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="Text14" title="Please Enter Date " runat="server" placeholder="Date:" style="width: 150px; padding-left: 10px; height: 20px; float: left; border: none; font-family: Times New Roman; font-size: 16px; font-weight: bold" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <input id="Text1" placeholder="Name" type="text" title="Please Enter Employee Name" runat="server" style="width: 150px; padding-left: 10px; height: 20px; float: left; border: none; font-family: Times New Roman; font-size: 16px; font-weight: bold" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <input id="Text2" type="text" title="Please Enter Permanent Address" runat="server" placeholder="Door Number, Cross " style="width: 250px; padding-left: 10px; height: 20px; float: left; border: none; font-family: Times New Roman; font-size: 16px; font-weight: bold" />
                                                            <br />
                                                            <input id="Text26" type="text" title="Please Enter Permanent Address" runat="server" placeholder="Street, Landmark" style="width: 250px; padding-left: 10px; height: 20px; float: left; border: none; font-family: Times New Roman; font-size: 16px; font-weight: bold" />
                                                            <br />
                                                            <input id="Text3" type="text" title="Please Enter Place" runat="server" placeholder="City, State, Pin." style="width: 250px; padding-left: 10px; height: 20px; float: left; border: none; font-family: Times New Roman; font-size: 16px; font-weight: bold" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <input type="text" id="Text13" title="Please Enter Employee ID" runat="server" placeholder="Employee ID" style="width: 150px; padding-left: 10px; height: 20px; border: none; font-family: Times New Roman; font-size: 16px; font-weight: bold" />
                                                        </td>
                                                    </tr>




                                                    <tr>
                                                        <td style="padding-left: 10px"></td>
                                                    </tr>

                                                    <tr>
                                                        <td style="height: 20px"></td>
                                                    </tr>
                                                </table>
                                                <span style="margin-left: 7px; font-size: 14px;"><b>Dear </b>&nbsp;&nbsp;&nbsp;&nbsp
                                                   <input id="Text4" type="text" placeholder="First Name" title="Please Enter First Name" style="width: 150px; padding-left: 10px; height: 20px; border: none; font-family: Times New Roman; font-size: 16px; font-weight: bold" /></span>


                                                <br />
                                                <br />
                                                <p>
                                                    This is to inform you that with effect from 
                                              <input title="please enter Effective Date" type="text" placeholder="Effective Date" style="border-top: none; border-left: none; border-right: none; width: 100px;" />.
                                                   your compensation structure stands
revised as per the mail received for voluntary PF contribution.
                                                </p>
                                                <p>
                                                    Kindly refer to your Exhibit A enclosed for the Financial Year 
                                                    <input title="please enter FY Year" type="text" placeholder="FY Year" style="border-top: none; border-left: none; border-right: none; width: 100px;" />.
                                                </p>
                                                <p>
                                                    All other terms and conditions of your employment remain the same. You are required to maintain
confidentiality of your compensation & benefits details as per the terms of your employment.                                         
                                                </p>

                                                <p>Thanking you,</p>
                                                <p>Yours sincerely,</p>



                                                <p>
                                                    For <b>Escalon Business Services Pvt. Ltd.</b>
                                                </p>
                                            </div>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <div>
                                                <p style="font-size: 14px">
                                                    <b>Authorised signature</b>
                                                </p>


                                            </div>
                                                </div>
                                            <div id="letterHeadOne">
                                            <br />
                                            <br />
                                            <br />
                                            <div>
                                                <center><b>EXHIBIT- A</b></center>
                                                <br />
                                                <b>Your Compensation Package is as follows:-</b>
                                                <br />
                                                <br />
                                                <br />

                                                <%-- table --%>
                                                <div>
                                                    <table class="a">
                                                        <tr>
                                                            <td style="flex-align: center; font-size: 16px; border: 1px solid #dddddd; text-align: center; padding: 8px;"><b>Compensation Structure</b> </td>
                                                        </tr>
                                                    </table>
                                                    <table class="a">
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: center; padding: 8px; width: 40%;"><b>Exhibit A</b> </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: center; padding: 8px; width: 60%;"><b>Present Structure</b> </td>
                                                        </tr>
                                                    </table>
                                                    <table class="a">
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: center; padding: 8px; width: 40%;"><b>Description </b></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: center; padding: 8px; width: 30%;"><b>Yearly (Rs)</b> </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: center; padding: 8px; width: 30%;"><b>Monthly (Rs)</b> </td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"><b>Base Pay CTC</b> </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"><b>Variable Pay CTC</b></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"><b>Total CTC </b></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"><b>FIXED </b></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">Basic Salary </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>


                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">Housing Rent Allowance </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">Medical Reimbursement </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">Transportation Allowance </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">E.P.F.</td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">E.S.I.F.</td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">Special Allowance </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"><b>BENEFITS, ANNUITY & RETIRALS</b> </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">Company Bonus </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">Leave Encashment</td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">Administrative Charges on E.P.F. </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;">Gratuity on accrual basis </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"><b>Total Base CTC</b> </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"><b>Total Variable CTC</b> </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 40%;"><b>Total Annual CTC</b> </td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>
                                                            <td style="font-size: 16px; border: 1px solid #dddddd; text-align: left; padding: 8px; width: 30%;"></td>

                                                        </tr>

                                                    </table>

                                                </div>
                                                </div></div>
                                                <br />
                                                <br />
                                                <br />
                                                 <div id="letterHeadTwo">
                                                    <b>Notes:</b>
                                                    <ol style="text-align: justify">
                                                        Your Compensation Package is subject to the following Terms & Conditions:-
                                                    </ol>
                                                    <ol style="text-align: justify">
                                                        1. All Compensation will be paid by the Company in Indian Rupees, subject to statutory
deductions as applicable as per your employment.
                                                    </ol>
                                                    <ol style="text-align: justify">
                                                        2. Leave Encashment—Leave entitlement is 30 Days; Unavailed leaves can be encashed at
the end of the Financial Year or carried over to the next year as per HR policy of the company.
                                                    </ol>
                                                    <ol style="text-align: justify">
                                                        3. Annual Company Bonus (8.33% of Basic Salary) is paid in September every year based
on pro-rata payroll drawn in previous financial year.  
                                                    </ol>
                                                    <ol style="text-align: justify">
                                                        4. Provident Fund – Company will deduct Provident Fund every month as per the Employee’s
Provident Fund Act, 1952. 
                                                    </ol>
                                                    <ol style="text-align: justify">
                                                        5. Gratuity is paid on separation of employee from the Company, on completion of minimum 5
years of continuous service with the Company. 
                                                    </ol>
                                                    <ol style="text-align: justify">
                                                        6. Personal Tax — the payments described above will not be further grossed up for taxes
and you will be responsible for the payment of all taxes due with respect to such payments,
which will be deducted at source as per the prevailing rules.
                                                    </ol>
                                                    <ol style="text-align: justify">
                                                        7. Variable Pay, if applicable, will be paid on hitting specific Milestones as outlined in Exhibit B.
                                                    </ol>


                                                    <br />
                                                </div>
                                            </div>

                                            <asp:Button ID="printButton" runat="server" Text="Print" OnClientClick="letterHead(); hide(); window.print();" class="btn btn-info pull-right"  /><br />  
                                        </div>

                                    </fieldset>
                                <br />
                                <br />
                                <br />
                                </div>
                            </div>
                        </div>
                    </div>

                </asp:Panel>


            </div>
        </div>

    </form>
</body>
</html>
