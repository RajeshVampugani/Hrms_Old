﻿using System;
using System.Data;
using Smart.HR.BeeLogic;
using Smart.HR.Contracts;
using Smart.HR.Common.Console;
using System.Web.UI.WebControls;

public partial class Exit_CancelledResignationRequestForHr : System.Web.UI.Page
{
    // Declarations

    string UserCode, RoleId;
    int WorkFlowTypeId = 1;    // Resignation
    int ApplicationId = 1;
    string PageId = "Hr";

    IBase Lib = null;
    string Query = "";
    ExitCommon Exit = null;
    ExitEmployeeRule EmpRule = null;
    ExitCompanyRule CompanyRule = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"] != null)
        {
            UserCode = Session["empcode"].ToString();
            RoleId = Session["role"].ToString();

            #region Rule
            Exit = new ExitCommon();
            EmpRule = Exit.GetExitEmployeeRules();
            CompanyRule = Exit.GetExitCompanyRules();
            #endregion

            if (!IsPostBack)
            {
                BindDetails();
            }
        }
        else
        {
            Response.Redirect("~/notlogged.aspx");
        }
    }

    private void BindDetails()
    {
        Lib = new Base();
        // Application Type and Work Flow Type
        // Pending - Status = 1 and Resign Status = U
        Query = @"select distinct Resign.ResignationId,AppliedDate,Resign.EmpCode,emp_fname +' '+ isnull(emp_m_name,'') +' '+ isnull(emp_l_name,'') EmpName,Comments,stat.employeestatus as EmployeeStatus,Resign.NoticePeriod,DefaultLWD
                  from tbl_exit_Resignation Resign
                   left join tbl_intranet_employee_jobDetails job on Resign.EmpCode = job.empcode
                   left join tbl_intranet_employee_status stat on Resign.EmployeeType = stat.id
                   inner join tbl_exit_ResignationProcess ResignPro on ResignPro.ResignationId = Resign.ResignationId and Resign.WhichLevel=ResignPro.Level
                   inner join tbl_exit_approverdetails A on ResignPro.ApproversCode = A.ApproverCode
                  where Resign.ResignStatus in ('C','J') and 
                        Resign.ApplicationId=1 and 
                        Resign.WorkFlowTypeId = 1 and 
                        ResignPro.ApproversCode = '" + UserCode + "' and A.Hr = 'Y' and A.WorkFlowTypeId = 1 and A.Status = 1";

        Lib.Bee.WBindGrid(Query, Grid);


        // Cancelled - Status = 0 and Resign Status = C
        // Rejected - Status = 0 and Resign Status = J
        // Freezed - Status = 1 and Resign Status = F
        // Re-Initiate - Make Status = 0 and Resign Status = R for the previous record and insert new record with the same values except, Status = 1 and Resign Status = U
    }

    protected void Grid_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        int Id = (int)Grid.DataKeys[(int)e.NewEditIndex].Value;
        Server.Transfer("HrResignationRejectViewDetails.aspx?ResignId=" + Id + "");
    }

    protected void Grid_PreRender(object sender, EventArgs e)
    {
        if (Grid.Rows.Count > 0)
            Grid.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
}