﻿using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System;
using Common.Data;
using Common.Console;
using System.Globalization;
using Smart.HR.Contracts;
using Smart.HR.BeeLogic;
using DataAccessLayer;
using System.Net.Mail;

public partial class Forms_GenerateEmployementLetter : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    string sqlstr;
    DataTable dtable = new DataTable();
    DataActivity activity = new DataActivity();
    SqlConnection connection = new SqlConnection();
    SqlTransaction transaction = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        txt_employement_ltr_numbr.ReadOnly = true;
        txt_employement_ltr_numbr.BackColor = System.Drawing.SystemColors.Window;
        string toemail = Request.QueryString["toemail"];
        string name = Request.QueryString["Name"];
        if (!IsPostBack)
        {
            txt_to_date.Text = DateTime.Now.ToString("dd-MMM-yyyy");
            binddepartment();
            binddesignation();
            BindEmployementLetterNumber();
        }
        string employee_name = Request.QueryString["Employee_Name"];
        string employement_Letter_number = Request.QueryString["Employement_letter_Number"];
        string hr_1 = Request.QueryString["Hr_1"];
        string hr_2 = Request.QueryString["Hr_2"];
        string employee_id = Request.QueryString["Employee_ID"];
        string from_date = Request.QueryString["From_Date"];
        string to_date = Request.QueryString["To_Date"];
        string department = Request.QueryString["Department"];
        string designation = Request.QueryString["Designation"];
        string issued_by = Request.QueryString["Issued_By"];
        string email = Request.QueryString["Email_ID"];
    }

    protected void binddepartment()
    {
        string sqlstr = "select departmentid,department_name from tbl_internate_departmentdetails";
        DataSet ds = new DataSet();
        ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.Text, sqlstr);
        drpdepartment.DataTextField = "department_name";
        drpdepartment.DataValueField = "departmentid";
        drpdepartment.DataSource = ds;
        drpdepartment.DataBind();
        drpdepartment.Items.Insert(0, new ListItem("--Select--", "0"));
    }

    protected void binddesignation()
    {
        string sqlstr = "select id,designationname FROM tbl_intranet_designation";
        DataSet ds = new DataSet();
        ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.Text, sqlstr);
        drpdesignation.DataTextField = "designationname";
        drpdesignation.DataValueField = "id";
        drpdesignation.DataSource = ds;
        drpdesignation.DataBind();
        drpdesignation.Items.Insert(0, new ListItem("--Select--", "0"));
    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Reset();
    }

    protected void Reset()
    {
        tbemployeename.Text = "";
        txt_employement_ltr_numbr.Text = "";
        txt_hr_1.Text = "";
        txt_hr_2.Text = "";
        tbemployee_id.Text = "";
        tbemployeeaddress.Text = "";
        txt_from_date.Text = "";
        txt_to_date.Text = "";
        drpdepartment.SelectedValue = "0";
        drpdesignation.SelectedValue = "0";
        tbIssuedby.Text = "";
        txt_email.Text = "";
    }

    protected void btngetempdetails_Click1(object sender, EventArgs e)
    {
        string employee_id = tbemployee_id.Text.Trim();
        BindEmployee(employee_id);
    }

    protected void BindEmployee(string employee)
    {
        try
        {
            connection = activity.OpenConnection();
            sqlstr = @"SELECT DISTINCT rtrim(jd.empcode) as empcode, 
coalesce(jd.emp_fname,'') + '' + coalesce(jd.emp_m_name,'') + '' + coalesce(jd.emp_l_name,'') as employee_name,  
jd.card_no,cont.per_add1,    
tbl_intranet_grade.gradename grade,jd.official_email_id,    
jd.degination_id,desg.designationname,desg.id,   
jd.dept_id,tbl_internate_departmentdetails.department_name,   
 jd.dep_type_id,tbl_internate_department_type.dept_type_name,   
jd.branch_id,tbl_intranet_branch_detail.branch_name,    
convert(varchar(10),jd.emp_doj,101)emp_doj,    
tbl_intranet_role.role,              
jd.emp_status    
FROM tbl_intranet_employee_jobDetails jd 
left join tbl_internate_department_type on jd.dep_type_id=tbl_internate_department_type.dept_type_id
left JOIN tbl_intranet_designation desg ON jd.degination_id=desg.id    
left JOIN tbl_internate_departmentdetails ON jd.dept_id=tbl_internate_departmentdetails.departmentid    
left JOIN tbl_intranet_branch_detail ON jd.branch_id=tbl_intranet_branch_detail.Branch_id    
left outer JOIN tbl_intranet_grade ON jd.grade=tbl_intranet_grade.id
left join tbl_login on tbl_login.empcode=jd.empcode
left join tbl_intranet_role on tbl_intranet_role.id=tbl_login.role
left join tbl_intranet_employee_contactlist cont on jd.empcode=cont.empcode 
WHERE 1=1 and jd.status=1 and jd.emp_status in('1','3','4') and jd.emp_doleaving is null 
and jd.empcode = '" + employee + "'";
            ds = SQLServer.ExecuteDataset(connection, CommandType.Text, sqlstr);
            if (ds.Tables[0].Rows.Count < 1)
                return;
            //txt_employee_id.Text = ds.Tables[0].Rows[0]["empcode"].ToString();
            tbemployeename.Text = ds.Tables[0].Rows[0]["employee_name"].ToString();
            tbemployeeaddress.Text = ds.Tables[0].Rows[0]["per_add1"].ToString();
            drpdepartment.SelectedValue = ds.Tables[0].Rows[0]["dept_id"].ToString();
            drpdesignation.SelectedValue = ds.Tables[0].Rows[0]["degination_id"].ToString();
            txt_email.Text = ds.Tables[0].Rows[0]["official_email_id"].ToString();
        }
        catch (Exception ex)
        {
            Output.Log("During Job Details: " + ex.Message + ".    " + DateTime.Now);
            Output.Show("Record not saved. Please contact system admin. For error details please go through the log file.");
        }
        finally
        {
            activity.CloseConnection();
        }
    }

    protected void btngenerateletter_Click(object sender, EventArgs e)
    {
        if (txt_from_date.Text != "" && txt_to_date.Text != "")
        {
            //if (Convert.ToDateTime(txt_from_date.Text) >= Convert.ToDateTime(txt_to_date.Text))
            //{
            //    txt_to_date.Focus();
            //    Output.Show("Enter Valid Date");
            //}
            //else
            //{

                var parm = new SqlParameter[12];
                SqlTransaction transaction = null;
                var activity = new DataActivity();
                int flag = 0;
                try
                {
                    Output.AssignParameter(parm, 0, "@employee_id", "String", 20, tbemployee_id.Text);
                    Output.AssignParameter(parm, 1, "@employee_name", "String", 60, tbemployeename.Text);
                    Output.AssignParameter(parm, 2, "@employement_letter_number", "String", 30, txt_employement_ltr_numbr.Text);
                    Output.AssignParameter(parm, 3, "@hr_1", "String", 10, txt_hr_1.Text);
                    Output.AssignParameter(parm, 4, "@hr_2", "String", 10, txt_hr_2.Text);
                    Output.AssignParameter(parm, 5, "@employee_address", "String", 1000, tbemployeeaddress.Text);
                    Output.AssignParameter(parm, 6, "@from_date", "DateTime", 0, txt_from_date.Text);
                    Output.AssignParameter(parm, 7, "@to_date", "DateTime", 0, txt_to_date.Text);
                    Output.AssignParameter(parm, 8, "@department", "String", 40, drpdepartment.SelectedItem.Text);
                    Output.AssignParameter(parm, 9, "@designation", "String", 40, drpdesignation.SelectedItem.Text);
                    Output.AssignParameter(parm, 10, "@issued_by", "String", 40, tbIssuedby.Text);
                    Output.AssignParameter(parm, 11, "@email_address", "String", 40, txt_email.Text);

                    SqlConnection connection = activity.OpenConnection();
                    transaction = connection.BeginTransaction();
                    flag = SQLServer.ExecuteNonQuery(connection, CommandType.StoredProcedure, transaction, "sp_insert_into_tbl_employement_letter_details", parm);
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    if (transaction != null) transaction.Rollback();
                    Output.Log("During validation: " + ex.Message + ".    " + DateTime.Now);
                    Output.Show("Record not saved. Please contact system admin. For error details please go through the log file.");
                }
                finally
                {
                    activity.CloseConnection();
                }
                if (flag > 0)
                {
                    Output.Show("Employee Details Submitted Successfully");
                }
                else
                {
                    Output.Show("Record not saved. Please contact system admin. For error details please go through the log file.");
                }
                BindEmployementLetterNumber();
                Session["Address"] = tbemployeeaddress.Text;
                Session["dept"] = drpdepartment.SelectedItem.Text;
                Session["Designation"] = drpdesignation.SelectedItem.Text;
                Response.Redirect("EmployementLetterDetails.aspx?Employee_Name=" + tbemployeename.Text + "&Employement_letter_Number=" + txt_employement_ltr_numbr.Text + "&Hr_1=" + txt_hr_1.Text + "&Hr_2=" + txt_hr_2.Text + "&Employee_ID=" + tbemployee_id.Text + "&From_Date=" + txt_from_date.Text + "&To_Date=" + txt_to_date.Text + "&Issued_By=" + tbIssuedby.Text + "&Email_ID=" + txt_email.Text + " ");
            //}
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        Response.Redirect("SendEmployementLetterMail.aspx?toemail=" + txt_email.Text.ToString() + "&Name=" + tbemployeename.Text + "");
    }

    private void BindEmployementLetterNumber()
    {
        var activity = new DataActivity();
        try
        {
            SqlConnection connection = activity.OpenConnection();
            sqlstr = "select COUNT(@@ROWCOUNT) AS totalRows from tbl_employement_letter_details";
            ds = SQLServer.ExecuteDataset(connection, CommandType.Text, sqlstr);
            int refnNo = Convert.ToInt32(ds.Tables[0].Rows[0]["totalRows"]) + 1;
            txt_employement_ltr_numbr.Text = refnNo.ToString();
        }
        catch (Exception ex)
        {
            Output.Log("During validation: " + ex.Message + ".    " + DateTime.Now);
            Output.Show("Record not saved. Please contact system admin. For error details please go through the log file.");
        }
        finally
        {
            activity.CloseConnection();
        }
    }

}