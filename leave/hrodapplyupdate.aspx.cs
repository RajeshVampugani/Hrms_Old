﻿using Common.Console;
using Common.Data;
using Common.Date;
using Common.Mail;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class leave_hrodapplyupdate : System.Web.UI.Page
{
    private DataSet _ds = new DataSet();
    private string _companyId, _userCode, comment, sqlstr;
    public int i, k;
    DataActivity activity = new DataActivity();
    #region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["empcode"] != null && Session["companyid"] != null)
        {
            _companyId = Session["companyid"].ToString();
            _userCode = Session["empcode"].ToString();
            if (!IsPostBack)
            {
                BindOdType(_companyId);
            }
            this.Image1.Attributes.Add("onclick", "javascript:selectTime(this,getElementById('txtftime'))");
            this.imgouttime.Attributes.Add("onclick", "javascript:selectTime(this,getElementById('txttotime'))");
        }
        else
        {
            Response.Redirect("~/notlogged.aspx");
        }

    }
    #endregion

    #region Bind Od Type
    protected void BindOdType(string companyId)
    {
        SqlConnection conncetion = activity.OpenConnection();
        string sqlstr = @"select * from tbl_leave_createod where status=1 and company_id='" + companyId + "'";
        DataSet ds = SQLServer.ExecuteDataset(conncetion, CommandType.Text, sqlstr);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlOdType.DataSource = ds;
            ddlOdType.DataValueField = "odid";
            ddlOdType.DataTextField = "odtype";
            ddlOdType.DataBind();
        }
    }
    #endregion

    protected Boolean validate_applydate()
    {
        var activity = new DataActivity();
        try
        {
            SqlParameter[] sqlparam = new SqlParameter[3];
            Output.AssignParameter(sqlparam, 0, "@empcode", "String", 50, txt_employee.Text);
            if (divfull.Visible == true)
            {
                Output.AssignParameter(sqlparam, 1, "@startdate", "DateTime", 10, txt_sdate.Text);
                Output.AssignParameter(sqlparam, 2, "@enddate", "DateTime", 10, txt_edate.Text);

            }
            else
            {
                Output.AssignParameter(sqlparam, 1, "@startdate", "DateTime", 10, txt_select.Text);
                Output.AssignParameter(sqlparam, 2, "@enddate", "DateTime", 10, txt_select.Text);

            }
            SqlConnection connection = activity.OpenConnection();
            _ds = SQLServer.ExecuteDataset(connection, CommandType.StoredProcedure, "sp_leave_validate_applied_date", sqlparam);
            if (_ds.Tables[0].Rows.Count > 0)
            {
                Output.Show("You have already applied leave during this span! Please check application status");
                return false;
            }
            else
            {
                if (_ds.Tables[1].Rows.Count > 0)
                {
                    Output.Show("You have already applied for Compoff during this span! Please check application status");
                    return false;
                }
                else
                {
                    if (_ds.Tables[2].Rows.Count > 0)
                    {
                        Output.Show("You have already applied for OD during this span! Please check application status");
                        return false;
                    }
                    else
                    {
                        //if (_ds.Tables[4].Rows.Count > 0)
                        //{
                        //    Output.Show("You have already applied for Substitute Holiday during this span! Please check application status");
                        //    return false;
                        //}
                        //else
                        //{
                        if (_ds.Tables[3].Rows.Count > 0)
                        {
                            return true;
                        }
                        else
                        {
                            Output.Show("Your leave profile is not created! Please contact your Manager");
                            return false;
                        }
                        //}
                    }
                }

            }
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
        return true;
    }
    protected void btn_sbmit_Click(object sender, EventArgs e)
    {
        SqlConnection connection = activity.OpenConnection();
        SqlTransaction transaction = null;
        try
        {
            if (divhalf.Visible == true)
            {
                if (txt_select.Text == "")
                {
                    Output.Show("Please select date.");
                    txt_sdate.Focus();
                    return;
                }
                if (txtftime.Text == "")
                {
                    Output.Show("Please select from time.");
                    txtftime.Focus();
                    return;
                }
                if (txttotime.Text == "")
                {
                    Output.Show("Please select to time.");
                    txttotime.Focus();
                    return;
                }

            }
            //if (!validate_dutyroster())
            //    return;
            //if (!validate_OdDate())
            //    return;
            if (!validate_applydate())
                return;
            //  if (!Validate_Od())
            //    return;
            if (txt_comment.Text != "")
                comment = "<h6><b>Comments added by " + Session["name"].ToString() + " on " + DateTime.Now + " :</b><br>" + txt_comment.Text + "</h6>";
            else
                comment = "";
            int leavemode;
            DateTime fromdate = new DateTime();
            DateTime todate = new DateTime();
            DateTime fromtime = new DateTime();
            DateTime totime = new DateTime();
            DateTime hdate = new DateTime();
            bool half;

            ArrayList list = new ArrayList();

            if (divfull.Visible == true)
            {
                divfull.Visible = true;
                divhalf.Visible = false;
                leavemode = 1;
                fromdate = Utility.DateFormat(txt_sdate.Text);
                todate = Utility.DateFormat(txt_edate.Text);
                fromtime = Convert.ToDateTime(txtftime.Text);
                totime = Convert.ToDateTime(txttotime.Text);
                hdate = (DateTime)System.Data.SqlTypes.SqlDateTime.Null;
                half = false;
                HiddenField1.Value = Convert.ToString("1");
            }
            else
            {
                divfull.Visible = false;
                divhalf.Visible = true;
                leavemode = 0;
                fromdate = Utility.DateFormat(txt_select.Text);
                todate = Utility.DateFormat(txt_select.Text);
                fromtime = Convert.ToDateTime(txtftime.Text);
                totime = Convert.ToDateTime(txttotime.Text);
                hdate = Utility.DateFormat(txt_select.Text);
                half = opt_first.Checked;
                HiddenField1.Value = Convert.ToString("0.5");
            }

            if (divfull.Visible == true)
            {
                if (!validatetimespan(fromtime, totime))
                    return;
            }

            transaction = connection.BeginTransaction();
            int i = apply_od(txt_employee.Text.Trim().ToString(), Convert.ToDecimal(HiddenField1.Value), txt_reason.Text, 0, 0, true, true, System.DateTime.Now, Session["name"].ToString(), Session["name"].ToString(), comment.ToString(), leavemode, fromdate, todate, fromtime, totime, hdate, half, connection, transaction, ref k);
            hidd_leaveapplyid.Value = i.ToString();
            UpdateOd(6, 1, connection, transaction);
            updatebackmonth(connection, transaction);
            transaction.Commit();
            if (i <= 0)
            {
                list.Add("Problem applying OD, try again");
            }
            else
            {
                list.Add("OD application applied successfully");

                // mailtoapprover(list, i, "o");
                string str = "";
                for (int j = 0; j < list.Count; j++)
                {
                    str = str + list[j].ToString();
                    str = str + "\\n";
                }

                clearfield();
                Output.Show(str);
            }
        }
        catch (Exception ex)
        {
            if (transaction != null) transaction.Rollback();
            Output.Log("During validation: " + ex.Message + ".    " + DateTime.Now);
            Output.Show("Problem applying OD. Please contact system admin. For error details please go through the log file.");
        }
        finally
        {
            activity.CloseConnection();
        }
    }

    private bool validate_OdDate()
    {
        SqlConnection connection = activity.OpenConnection();
        try
        {
            sqlstr = @"select isnull(COUNT(*),0) as PresenetDays from tbl_attendance_log 
                    inner join tbl_attendance_empipenrollno_mapping on tbl_attendance_empipenrollno_mapping.machinecode=tbl_attendance_log.enrollno
                        where empcode='" + _userCode.ToString() + "' and convert(varchar(10),date,101) between convert(varchar(10),'" + txt_sdate.Text.ToString() + "',101) and convert(varchar(10),'" + txt_edate.Text.ToString() + "',101)";
            DataSet ds = SQLServer.ExecuteDataset(connection, CommandType.Text, sqlstr);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if ((ds.Tables[0].Rows[0]["PresenetDays"] != null) && (ds.Tables[0].Rows[0]["PresenetDays"].ToString() != ""))
                {
                    if (Convert.ToInt32(ds.Tables[0].Rows[0]["PresenetDays"]) > 0)
                    {
                        Common.Console.Output.Show("Leave not allowed as employee present between  " + txt_sdate.Text.ToString() + "  to  " + txt_edate.Text.ToString() + " . please choose different date.");
                        return false;
                    }
                }
            }
        }
        catch (Exception ex)
        {

            Output.Log("During validation: " + ex.Message + ".    " + DateTime.Now);
            Output.Show("Problem applying OD. Please contact system admin. For error details please go through the log file.");
        }
        finally
        {
            activity.CloseConnection();
        }
        return true;
    }

    public int apply_od(string empcode, decimal working_hour, string reason, int Approval_status, int Leave_status, bool flag, bool status, DateTime createddate, string createdby, string modifiedby, string comment, int leavemode, DateTime fromdate, DateTime todate, DateTime fromtime, DateTime totime, DateTime hdate, bool half, SqlConnection connection, SqlTransaction transaction, ref int j)
    {
        SqlParameter[] sqlparam = new SqlParameter[20];
        Output.AssignParameter(sqlparam, 0, "@empcode", "String", 50, empcode.ToString());
        Output.AssignParameter(sqlparam, 1, "@working_hour", "Decimal", 50, working_hour.ToString());
        Output.AssignParameter(sqlparam, 2, "@reason", "String", 5000, reason);
        Output.AssignParameter(sqlparam, 3, "@Approval_status", "Int", 50, Approval_status.ToString());
        Output.AssignParameter(sqlparam, 4, "@Leave_status", "Int", 50, Leave_status.ToString());
        Output.AssignParameter(sqlparam, 5, "@flag", "String", 50, flag.ToString());
        Output.AssignParameter(sqlparam, 6, "@status", "String", 50, status.ToString());
        Output.AssignParameter(sqlparam, 7, "@createdby", "String", 50, createdby.ToString());
        Output.AssignParameter(sqlparam, 8, "@createddate", "DateTime", 50, createddate.ToString());
        Output.AssignParameter(sqlparam, 9, "@comment", "String", 5000, comment);
        Output.AssignParameter(sqlparam, 10, "@modifiedby", "String", 50, modifiedby);
        Output.AssignParameter(sqlparam, 11, "@leavemode", "Int", 50, leavemode.ToString());
        Output.AssignParameter(sqlparam, 12, "@fromdate", "DateTime", 50, fromdate.ToString());
        Output.AssignParameter(sqlparam, 13, "@todate", "DateTime", 50, todate.ToString());
        Output.AssignParameter(sqlparam, 14, "@fromtime", "DateTime", 50, fromtime.ToString());
        Output.AssignParameter(sqlparam, 15, "@totime", "DateTime", 50, totime.ToString());
        Output.AssignParameter(sqlparam, 16, "@hdate", "DateTime", 50, hdate.ToString());
        Output.AssignParameter(sqlparam, 17, "@half", "String", 50, half.ToString());
        Output.AssignParameter(sqlparam, 18, "@comapnyid", "Int", 50, _companyId.ToString());
        Output.AssignParameter(sqlparam, 19, "@odtype", "Int", 50, "0");

        j = Convert.ToInt32(SQLServer.ExecuteScalar(connection, CommandType.StoredProcedure, transaction, "sp_leave_applyod", sqlparam));
        return j;
    }
    private void UpdateOd(int leavestatus, int status, SqlConnection _Connection, SqlTransaction _Transaction)
    {
        int approverstatus = 0;
        sqlstr = "SELECT approverpriority FROM tbl_leave_employee_hierarchy WHERE hr=1 AND employeecode=@empcode ORDER BY 1 DESC";
        SqlParameter[] sqlparm;

        sqlparm = new SqlParameter[2];
        Output.AssignParameter(sqlparm, 0, "@approverid", "String", 50, _userCode);
        Output.AssignParameter(sqlparm, 1, "@empcode", "String", 50, txt_employee.Text);
        approverstatus = Convert.ToInt32(SQLServer.ExecuteScalar(_Connection, CommandType.Text, _Transaction, sqlstr, sqlparm));


        SqlParameter[] sqlparm1 = new SqlParameter[6];
        Output.AssignParameter(sqlparm1, 0, "@id", "Int", 50, hidd_leaveapplyid.Value);
        Output.AssignParameter(sqlparm1, 1, "@comment", "String", 5000, "");
        Output.AssignParameter(sqlparm1, 2, "@leave_status", "Int", 50, leavestatus.ToString());
        Output.AssignParameter(sqlparm1, 3, "@status", "Int", 50, status.ToString());
        Output.AssignParameter(sqlparm1, 4, "@Approvel_status", "Int", 50, approverstatus.ToString());
        Output.AssignParameter(sqlparm1, 5, "@modifiedby", "String", 50, _userCode);

        string str1 = "update tbl_leave_apply_od set Leave_status=@leave_status,modifiedby=@modifiedby,comment=isnull(comment,'') +isnull( @comment,''),Approval_status=@Approvel_status,status=@status,modifieddate=getdate() where id=@id";
        SQLServer.ExecuteNonQuery(_Connection, CommandType.Text, _Transaction, str1, sqlparm1);

    }
    private bool Validate_Od()
    {
        try
        {

            SqlConnection connection = activity.OpenConnection();
            string sqlstr = @"select * from tbl_leave_create_od_rule where status=1 and company_id='" + _companyId + "' and odtypeid='" + ddlOdType.SelectedValue + "' ";
            DataSet ds20 = SQLServer.ExecuteDataset(connection, CommandType.Text, sqlstr);

            if (ds20.Tables[0].Rows.Count < 1)
            {
                Output.Show("OD Rule not defined,contact administrator");

                return false;
            }

            DateTime sdate;
            if (divfull.Visible == true)
                sdate = Utility.DateFormat(txt_sdate.Text);
            else
                sdate = Utility.DateFormat(txt_select.Text);

            TimeSpan ts = sdate - DateTime.Now;
            if (sdate > DateTime.Now)
            {
                Output.Show("Please select before current date.");

                return false;
            }
            if (Convert.ToInt16(ds20.Tables[0].Rows[0]["backdays"]) <
                   Convert.ToInt16(Math.Abs(ts.TotalDays)))
            {
                Output.Show("Maximum back day leave allowed is  " + ds20.Tables[0].Rows[0]["backdays"]);

                return false;
            }

            string sqlstr1 = @"select * from tbl_leave_create_od_rule_weekday where status=1 and od_id='" + ddlOdType.SelectedValue + "'";
            DataSet ds = SQLServer.ExecuteDataset(connection, CommandType.Text, sqlstr1);
            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    string exp = "applicable_week_of_type='" + DateTime.Now.DayOfWeek.ToString() + "'";
                    DataRow[] myrow = ds.Tables[0].Select(exp);
                    if (myrow.Length <= 0)
                    {
                        Output.Show("" + ddlOdType.SelectedItem.Text + " OD application should not apply on " + DateTime.Now.DayOfWeek.ToString() + "");
                        return false;
                    }

                }

            }

            if (ds20.Tables[0].Rows[0]["weektype"].ToString() != "0")
            {
                if (ds20.Tables[0].Rows[0]["weektype"].ToString() == "1") // Current Week
                {
                    DateTime s_date = Utility.DateFormat(txt_sdate.Text.ToString());
                    CultureInfo ciCurr = CultureInfo.CurrentCulture;
                    int weekNumdate = ciCurr.Calendar.GetWeekOfYear(s_date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
                    int weeknumofcurdate = ciCurr.Calendar.GetWeekOfYear(DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
                    if (weekNumdate != weeknumofcurdate)
                    {
                        Output.Show("" + ddlOdType.SelectedItem.Text + " OD application should apply on current week ");
                        return false;
                    }


                }
            }




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
        return true;
    }
    protected void updatebackmonth(SqlConnection _Connection, SqlTransaction _Transaction)
    {
        DateTime fromdate, todate, intime, outtime;

        int empshiftcode, leavemode;
        string empcode;
        DataSet ds2, ds3;
        string str1 = "SELECT empcode, date, fromtime,leavemode FROM tbl_leave_apply_od WHERE id=" + hidd_leaveapplyid.Value;
        DataSet ds = SQLServer.ExecuteDataset(_Connection, CommandType.Text, _Transaction, str1);

        if (ds.Tables[0].Rows.Count > 0)
        {
            fromdate = Convert.ToDateTime(ds.Tables[0].Rows[0]["date"]);
            todate = Convert.ToDateTime(ds.Tables[0].Rows[0]["fromtime"]);
            empcode = ds.Tables[0].Rows[0]["empcode"].ToString();
            leavemode = Convert.ToInt32(ds.Tables[0].Rows[0]["leavemode"].ToString());
            if (fromdate.Month != DateTime.Now.Month)
            {

                string str3 = @"select starttime,endtime from tbl_leave_shift where branch_id=" + Session["branch"].ToString();
                ds3 = SQLServer.ExecuteDataset(_Connection, CommandType.Text, _Transaction, str3);

                if (ds3.Tables[0].Rows.Count > 0)
                {
                    intime =Convert.ToDateTime( ds3.Tables[0].Rows[0]["starttime"].ToString());
                    outtime = Convert.ToDateTime(ds3.Tables[0].Rows[0]["endtime"].ToString());
                    string str4 = "UPDATE tbl_payroll_employee_attendence_detail SET mode='P', flag=1 WHERE empcode='" + empcode + "' AND date BETWEEN '" + fromdate + "' AND '" + todate + "'";
                    SQLServer.ExecuteNonQuery(_Connection, CommandType.Text, _Transaction, str4);
                }
            }
        }
    }
    private bool validatetimespan(DateTime fromtime, DateTime totime)
    {
        TimeSpan maxhrs = TimeSpan.FromHours(2);
        TimeSpan ts = totime.Subtract(fromtime);
        // TimeSpan maxhrs=02.00.00;
        if (fromtime < totime)
        {
            return true;

        }
        else
        {

            Output.Show("End Time Must be Greater than Start Time");
            return false;
        }
    }


    protected void mailtoapprover(ArrayList list, int leaveid, string type)
    {
        SqlConnection connection = activity.OpenConnection();
        SqlParameter[] sqlparm = new SqlParameter[2];
        Output.AssignParameter(sqlparm, 0, "@leaveapplyid", "Int", 50, leaveid.ToString());
        Output.AssignParameter(sqlparm, 1, "@type", "String", 50, type.ToString());
        DataSet ds = SQLServer.ExecuteDataset(connection, CommandType.StoredProcedure, "sp_leave_fetchmaildetail_employee", sqlparm);
        if (ds.Tables[0].Rows.Count > 0)
        {
            int i = ds.Tables[0].Rows.Count;
            int j = 0;

            while (i != 0)
            {

                string fromEmail = ConfigurationManager.AppSettings["fromEmail"].ToString();
                string fromPwd = ConfigurationManager.AppSettings["pwd"].ToString();
                string fromName = ConfigurationManager.AppSettings["fromName"].ToString();
                string smtp = ConfigurationManager.AppSettings["smtp"].ToString();
                string emailLogo = ConfigurationManager.AppSettings["emailLogo"].ToString();
                //query q = new query();
                string pairs = String.Format("10&leaveapplyid={0}&empcode={1}&approvercode={2}&post={3}", ds.Tables[0].Rows[j]["id"].ToString(), ds.Tables[0].Rows[j]["empcode"].ToString(), ds.Tables[0].Rows[j]["approvercode"].ToString(), "OD");
                //string encoded;
                //encoded = q.EncodePairs(pairs);

                string url = "<a target='content' style='text-decoration:none;color: #fff;background-color: #3968c6;background-image: none;filter: none;-webkit-box-shadow: none;-moz-box-shadow: none;box-shadow: none;padding:7px 13px 7px 13px;text-shadow: none;font-weight: normal;font-size: 24px;cursor: pointer;border: 1px solid rgba(0,0,0,0.13);-webkit-border-radius: 0;-moz-border-radius: 0;border-radius: 0;position: relative;z-index: 1;-webkit-user-select: none;'  href='" + ConfigurationManager.AppSettings["url"].ToString() + "?m=" + pairs + "' >Approve</a>";
                string url1 = "<a target='content' style='text-decoration:none;color: #fff;background-color: #3968c6;background-image: none;filter: none;-webkit-box-shadow: none;-moz-box-shadow: none;box-shadow: none;padding:7px 13px 7px 13px;;text-shadow: none;font-weight: normal;font-size: 24px;cursor: pointer;border: 1px solid rgba(0,0,0,0.13);-webkit-border-radius: 0;-moz-border-radius: 0;border-radius: 0;position: relative;z-index: 1;-webkit-user-select: none;'  href='" + ConfigurationManager.AppSettings["url"].ToString() + "?m=" + pairs + "'>Reject</a>";

                string subject = "Official Duty Application for Approval";

                string bodyContent = "";
                if (divfull.Visible == true)
                    bodyContent = "A new OD request has been submitted by employee " + Session["name"].ToString() + " from " + txt_sdate.Text + " to " + txt_edate.Text + ". <br/><br/><br/><br/>" + url + "&nbsp;&nbsp;&nbsp;" + url1;
                else
                    bodyContent = "A new OD request has been submitted by employee " + Session["name"].ToString() + " for the date " + txt_select.Text + ". <br/><br/><br/><br/>" + url + "&nbsp;&nbsp;&nbsp;" + url1;

                string completeBody = Email.GetBody(fromName, ds.Tables[0].Rows[j]["a_name"].ToString(), bodyContent);

                if (ds.Tables[0].Rows[j]["official_email_id"].ToString() != "")
                {
                    try
                    {

                        Common.Mail.Email.SendEmail(fromEmail, fromPwd, fromName, ds.Tables[0].Rows[j]["official_email_id"].ToString(), "", subject, completeBody, smtp, emailLogo);
                    }
                    catch
                    {
                        list.Add("Email is not delivered to the employee: " + ds.Tables[0].Rows[j]["a_name"].ToString() + " due to some technical problem.");
                    }
                }
                else
                {
                    list.Add("Email is does not exists fot the employee: " + ds.Tables[0].Rows[j]["a_name"].ToString());
                }

                i--;
                j++;
            }
        }
    }

    protected void clearfield()
    {
        txt_sdate.Text = "";
        txt_edate.Text = "";
        txt_reason.Text = "";
        txt_comment.Text = "";
        txtftime.Text = "";
        txttotime.Text = "";
        txt_select.Text = "";
        opt_first.Checked = true;
        opt_second.Checked = false;
        txt_employee.Text = "";
    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        clearfield();
    }



    protected void txt_ftime_TextChanged(object sender, EventArgs e)
    {
        try
        {
            TimeSpan t = Utility.DateFormat(txt_edate.Text) - Utility.DateFormat(txt_sdate.Text);
            HiddenField1.Value = Convert.ToString(t.Days + 1);
        }
        catch
        {
            HiddenField1.Value = Convert.ToString("1");
        }
    }

    protected void txt_date_TextChanged(object sender, EventArgs e)
    {
        try
        {
            TimeSpan t = Utility.DateFormat(txt_edate.Text) - Utility.DateFormat(txt_sdate.Text);
            HiddenField1.Value = Convert.ToString(t.Days + 1);
        }
        catch
        {
            HiddenField1.Value = Convert.ToString("1");
        }
    }

    protected void opt_first_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void opt_second_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void rdofullday_CheckedChanged(object sender, EventArgs e)
    {
        if (rdofullday.Checked == true)
        {
            divhalf.Visible = false;
            divfull.Visible = true;
        }
        else
        {
            divhalf.Visible = true;
            divfull.Visible = false;
        }
    }

    protected void rdohalfday_CheckedChanged(object sender, EventArgs e)
    {
        if (rdohalfday.Checked == true)
        {
            divhalf.Visible = true;
            divfull.Visible = false;
        }
        else
        {
            divhalf.Visible = false;
            divfull.Visible = true;
        }
    }
}