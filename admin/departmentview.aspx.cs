using DataAccessLayer;
using Smart.HR.Common.Console;
using Smart.HR.Common.Data;
//using Smart.HR.Common.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_company_empview : System.Web.UI.Page
{
    string sqlstr;
    DataSet ds = new DataSet();
    DataActivity DataActivity = new DataActivity();
    string UserCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();

            if (Session["role"] == null)
            {
                Response.Redirect("~/Default.aspx");
               
            }

        }
        if (Request.QueryString["updated"] != null)
            SmartHr.Common.Alert("Updated Successfully");
        message.InnerHtml = "";
    }

    private void bindgrid()
    {
        DataSet ds = null;
        SqlConnection Connection = null;
        Common.Data.DataActivity Activity = new Common.Data.DataActivity();
        Connection = Activity.OpenConnection();

        //string query = @"SELECT tbl_internate_departmentdetails.departmentid, tbl_internate_departmentdetails.department_name,tbl_internate_departmentdetails.department_code, tbl_internate_departmentdetails.estt_date, tbl_intranet_branch_detail.branch_name FROM tbl_intranet_branch_detail INNER JOIN tbl_internate_departmentdetails ON tbl_intranet_branch_detail.Branch_Id = tbl_internate_departmentdetails.branchid";
        string query = @"select
dd.departmentid, 
dd.dept_type_id,
dd.department_name,
dt.dept_type_name
from 
tbl_internate_departmentdetails dd
inner join tbl_internate_department_type dt
on dt.dept_type_id=dd.dept_type_id";
        ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.Text, query);
        Grid_Emp.DataSource = ds;
        Grid_Emp.DataBind();

    }

    protected void Grid_Emp_PreRender(object sender, EventArgs e)
    {
        //Grid_Emp.UseAccessibleHeader = true;
        //Grid_Emp.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    protected void Grid_Emp_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //DataActivity.OpenConnection();

            int ChildMenu = (int)Grid_Emp.DataKeys[(int)e.RowIndex].Value;
            if (ChildMenu != 0)
            {
                string sqlchildmenu = "Delete tbl_internate_departmentdetails where departmentid=" + ChildMenu;
                ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString, CommandType.Text, sqlchildmenu);
                Output.Show("Deleted Successfully");
                bindgrid();

            }
            else
            {
                Output.Show("Please select the record...");
            }
        }
        catch (Exception ex)
        {
            Output.Log("During validation: " + ex.Message + ".    " + DateTime.Now);
            Output.Show("Record not saved. Please contact system admin. For error details please go through the log file.");
        }
        finally
        {
            //DataActivity.CloseConnection();
        }
    }
}
