﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Common.Console;
using Common.Data;
using System.Net.Mail;
using System.Configuration;

public partial class Reimbursement_ViewReimDetails : System.Web.UI.Page
{

    DataSet ds = new DataSet();
    DataActivity DA = new DataActivity();
    int rid;
    string UserCode;
    decimal total = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        rid = Convert.ToInt32(Request.QueryString["rid"].ToString());
        if (Session["empcode"] != null)
        {
            UserCode = Session["empcode"].ToString();
            if (!IsPostBack)
            {
                if (Request.QueryString["rid"] != null)
                {
                    BindReimDetails();
                }
            }
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    private void BindReimDetails()
    {
        SqlParameter[] parm = new SqlParameter[1];
        SqlConnection Connection = null;


        try
        {
            Output.AssignParameter(parm, 0, "@rid", "Int", 0, rid.ToString());
            Connection = DA.OpenConnection();
            DataSet ds = SQLServer.ExecuteDataset(Connection, CommandType.StoredProcedure, "sp_Rb_get_reimbursement_LM_Details", parm);
            grd.DataSource = ds;
            grd.DataBind();
            lblorginal.Text = ds.Tables[0].Rows[0]["Ammount"].ToString();

        }
        catch (Exception ex)
        {

            Common.Console.Output.Log("During validation: " + ex.Message + ".    " + DateTime.Now);
            Output.Show("Record not fetched. Please contact system admin. For error details please go through the log file.");
        }
        finally
        {
            DA.CloseConnection();
        }
    }

    protected void grd_PreRender(object sender, EventArgs e)
    {
        if (grd.Rows.Count > 0)
        {
            grd.UseAccessibleHeader = true;
            grd.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }

    protected void btnapprove_Click(object sender, EventArgs e)
    {
        if (Convert.ToDecimal(hdnamount.Value) >= Convert.ToDecimal(txtfinalammount.Text))
        {
            SqlParameter[] parm = new SqlParameter[5];
            SqlConnection Connection = null;
            SqlTransaction _Transaction = null;
            int Flag = 0;
            try
            {
                Output.AssignParameter(parm, 0, "@rid", "Int", 0, rid.ToString());
                Output.AssignParameter(parm, 1, "@finalammount", "Decimal", 50, txtfinalammount.Text);
                Output.AssignParameter(parm, 2, "@comments", "String", 200, txtdesc.Text);
                Output.AssignParameter(parm, 3, "@raisedby", "String", 50, UserCode);
                Output.AssignParameter(parm, 4, "@flag", "Int", 0, "1");

                Connection = DA.OpenConnection();
                _Transaction = Connection.BeginTransaction();
                Flag = SQLServer.ExecuteNonQuery(Connection, CommandType.StoredProcedure, _Transaction, "sp_Rb_Update_reimbursement_LM", parm);
                _Transaction.Commit();

                SqlConnection connection = new SqlConnection();

                DataSet dsAppvrEmails = GetAppvrsEmail(connection);
                if (dsAppvrEmails.Tables[0].Rows.Count < 1)
                {
                    Common.Console.Output.Show("Approver has not been assigned. !!!");
                    return;
                }
                sendmail(dsAppvrEmails);
            }
            catch (Exception ex)
            {
                _Transaction.Rollback();
                Common.Console.Output.Log("During validation: " + ex.Message + ".    " + DateTime.Now);
                Output.Show("Record not Approved. Please contact system admin. For error details please go through the log file.");
            }
            finally
            {
                DA.CloseConnection();
                Output.Show("Reimbursement Approved");
                Response.Redirect("LMPendingReimbursement.aspx?updated=true");
                ScriptManager.RegisterStartupScript(updatepanel1, updatepanel1.GetType(), "RefeshWindow", "RefeshWindow();", true);
                btnreject.Enabled = false;
                btnapprove.Enabled = false;
                BindReimDetails();
            }

        }
        else
        {
            Output.Show("Enter Valid Amount");
        }

    }

    private DataSet GetAppvrsEmail(SqlConnection conn)
    {

        string strAllemail;
        DataSet dsAllemail = new DataSet();

        DataSet ds3 = new DataSet();
        var activity = new DataActivity();
        SqlConnection connection = activity.OpenConnection();

        string str = @"select Empcode from tbl_Rb_Reimbursement where RID='" + rid + "'";
        DataSet ds = SQLServer.ExecuteDataset(connection, CommandType.Text, str);
        string empcode = ds.Tables[0].Rows[0]["Empcode"].ToString();
        //transaction = connection.BeginTransaction();
        //Label empcode = (Label)grdapprovers.Rows[0].FindControl("lblempcode");
        try
        {
            strAllemail = @"SELECT emp_fname+ ' ' + isnull(emp_m_name,'') + ' ' + isnull(emp_l_name,'') as name, 
official_email_id FROM dbo.tbl_intranet_employee_jobDetails where empcode = '" + UserCode + "' DECLARE @appvrCode varchar(50) SET @appvrCode = (select app_admin from tbl_employee_approvers where empcode = '" + empcode + "') SELECT emp_fname+ ' ' + isnull(emp_m_name,'') + ' ' + isnull(emp_l_name,'') as name, official_email_id FROM dbo.tbl_intranet_employee_jobDetails where empcode = @appvrCode select emp_fname,empcode,official_email_id from tbl_intranet_employee_jobDetails where empcode='" + empcode + "'";
            dsAllemail = SQLServer.ExecuteDataset(connection, CommandType.Text, strAllemail);

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

        return dsAllemail;
    }

    public void sendmail(DataSet ds)
    {
        string email = ds.Tables[1].Rows[0]["official_email_id"].ToString().Trim();
        //DataSet daEmpName = (DataSet)ViewState["employeeName"];
        string empName = ds.Tables[2].Rows[0]["emp_fname"].ToString().Trim();
        string appvrName = ds.Tables[1].Rows[0]["name"].ToString().Trim();
        string empcode = ds.Tables[2].Rows[0]["empcode"].ToString().Trim();
        if (email != "")
        {
            sendmail_Template(email, appvrName, empName, empcode);
        }
    }

    public bool sendmail_Template(string recievermailid, string approver, string employee,string empcode)
    {
        try
        {
            string senderId = ConfigurationManager.AppSettings["fromEmail"];
            string senderPassword = ConfigurationManager.AppSettings["pwd"];  

            string Template = EmailTemplate(approver, employee, empcode);
            bool IsAttachment = false;
            string FileName = string.Empty;
            System.Net.Mail.Attachment attachment = null;

            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            mailMessage.To.Add(recievermailid);
            mailMessage.From = new MailAddress(senderId);

            mailMessage.Subject = "Reimbursement Request Status";
            mailMessage.SubjectEncoding = System.Text.Encoding.UTF8;

            mailMessage.Body = Template;
            mailMessage.IsBodyHtml = true;

            mailMessage.Priority = MailPriority.High;

            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Credentials = new System.Net.NetworkCredential(senderId, senderPassword);
            smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"]);
            smtpClient.Host = ConfigurationManager.AppSettings["smtp"];
            smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);

            object userState = mailMessage;
            try
            {
                smtpClient.Send(mailMessage);
                if (IsAttachment)
                {
                    attachment.ContentStream.Close();
                }
                return true;
            }
            catch (System.Net.Mail.SmtpException)
            {
                return false;
            }
        }
        catch (Exception)
        {
            return false;
        }
    }

    public string EmailTemplate(string approver, string employee, string empcode)
    {
        string appr = approver.ToString();
        string emp = employee.ToString();
        string empcod = empcode.ToString();
        string EmailFormat = @"<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01//EN' 'https://www.w3.org/TR/html4/strict.dtd'>" +
                    "<html lang='en'>" +
"<head>" +

    "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>" +

    "<style type='text/css'>" +
        "body, td, div, p, a, input" +
        "{" +
            "font-family: arial, sans-serif;" +
        "}" +
    "</style>" +

    "<meta http-equiv='X-UA-Compatible' content='IE=edge'>" +
    "<title>Resignation Request</title>" +
    "<style type='text/css'>" +
        "body, td" +
        "{" +
            "font-size: 13px;" +
        "}" +

        "a:link, a:active" +
        "{" +
            "color: #1155CC;" +
            "text-decoration: none;" +
        "}" +

        "a:hover" +
       "{" +
            "text-decoration: underline;" +
            "cursor: pointer;" +
        "}" +

        "a:visited" +
        "{" +
            "color: #6611CC;" +
        "}" +

        "img" +
        "{" +
            "border: 0px;" +
        "}" +

        "pre" +
        "{" +
            "white-space: pre;" +
            "white-space: -moz-pre-wrap;" +
            "white-space: -o-pre-wrap;" +
            "white-space: pre-wrap;" +
           "word-wrap: break-word;" +
           "max-width: 800px;" +
            "overflow: auto;" +
        "}" +

        ".logo" +
        "{" +
            "left: -7px;" +
            "position: relative;" +
        "}" +
    "</style>" +
"</head>" +
"<body>" +
    "<div class='bodycontainer'>" +


        "<div class='maincontent'>" +

            "<table width='100%' cellpadding='0' cellspacing='0' border='0' class='message'>" +
                "<tr>" +

                    "<tr>" +
                        "<td colspan='2'><font size='-1' class='recipient'>" +
                            "<div></div>" +
                        "</font>" +
                           " <tr>" +
                                "<td colspan='2'>" +
                                    "<table width='100%' cellpadding='12' cellspacing='0' border='0'>" +
                                        "<tr>" +
                                            "<td>" +
                                                "<div style='overflow: hidden;'>" +
                                                    "<font size='-1'>" +
                                                        "<div id='leaveid'>" +
                                                            "<p><b>Dear " + appr + @",</b></p>" +
                                                            "<p style='text-align: justify; color: #000000; text-align: justify'> " + "Line Manager has Approved Reimbursment Request from " + emp + " - " + empcod + " and now submitted for your Approval / Reject.</p>" +

                                                             "<p>Click here - <a href='https://escalon.sdlapps.com'>https://escalon.sdlapps.com</a> </p>" +

                                                            "<p>" +
                                                                "<b>Regards,<br><br>" +
                                                                    "HR<br><br>" +
                                                                "</b>" +
                                                            "</p>" +
                                                            "<br>" +

                                                            "<table width='100%'>" +
                                                                "<tbody>" +
                                                                    "<tr>" +
                                                                        "<td colspan='2' style='font: 12px arial; color: #333; text-align: justify'>" +
                                                                            "<hr>" +
                                                                            "<br>" +
                                                                            "<b>This is a system generated mail. Please do not reply to this email ID. If you have a query or need any clarification you may contact HR." +
                                                                            "<br>" +
                                                                                //"(1) Call our 24-hour Customer Care or<br>" +
                                                                                //"(2) Email Us <a href='" + ConfigurationManager.AppSettings[""] + @"' target='_blank'>" + ConfigurationManager.AppSettings[""] + @"</a> </b>" +
                                                                            "<br>" +
                                                                            "<hr>" +
                                                                            "<br>" +
                                                                        "</td>" +
                                                                    "</tr>" +
                                                                "</tbody>" +
                                                            "</table>" +

                                                        "</div>" +
                                                    "</font>" +
                                                "</div>" +
                                    "</table>" +
            "</table>" +
        "</div>" +
    "</div>" +

"</body>" +
"</html>";

        return EmailFormat;
    }

    private bool Finalaamount()
    {
        Decimal Final, Orginal;
        //Label lblammount = grd.FooterRow.FindControl("lblammount") as Label;
        Orginal = Convert.ToDecimal(lblorginal.Text);
        Final = Convert.ToDecimal(txtfinalammount.Text);
        if (Orginal >= Final)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    private void Clearfeilds()
    {
        txtdesc.Text = "";
    }

    protected void btnreject_Click(object sender, EventArgs e)
    {

        SqlParameter[] parm = new SqlParameter[5];
        SqlConnection Connection = null;
        SqlTransaction _Transaction = null;
        int Flag = 0;
        try
        {
            Output.AssignParameter(parm, 0, "@rid", "Int", 50, rid.ToString());
            Output.AssignParameter(parm, 1, "@finalammount", "Decimal", 50, txtfinalammount.Text);
            Output.AssignParameter(parm, 2, "@comments", "String", 200, txtdesc.Text);
            Output.AssignParameter(parm, 3, "@raisedby", "String", 50, UserCode);
            Output.AssignParameter(parm, 4, "@flag", "Int", 0, "0");

            Connection = DA.OpenConnection();
            _Transaction = Connection.BeginTransaction();
            Flag = SQLServer.ExecuteNonQuery(Connection, CommandType.StoredProcedure, _Transaction, "sp_Rb_Update_reimbursement_LM", parm);
            _Transaction.Commit();


            SqlConnection connection = new SqlConnection();

            DataSet dsAppvrEmails = GetAppvrsEmail(connection);
            if (dsAppvrEmails.Tables[0].Rows.Count < 1)
            {
                Common.Console.Output.Show("Approver has not been assigned. !!!");
                return;
            }
            sendmail1(dsAppvrEmails);
        }
        catch (Exception ex)
        {
            _Transaction.Rollback();
            Common.Console.Output.Log("During validation: " + ex.Message + ".    " + DateTime.Now);
            Output.Show("Record not Rejected. Please contact system admin. For error details please go through the log file.");
        }
        finally
        {
            Output.Show("Reimbursement Rejected");
            Response.Redirect("LMPendingReimbursement.aspx?updated1=true");
            ScriptManager.RegisterStartupScript(updatepanel1, updatepanel1.GetType(), "RefeshWindow", "RefeshWindow();", true);
            Clearfeilds();
            BindReimDetails();
            DA.CloseConnection();
        }



    }

    public void sendmail1(DataSet ds)
    {
        string email = ds.Tables[2].Rows[0]["official_email_id"].ToString().Trim();
        //DataSet daEmpName = (DataSet)ViewState["employeeName"];
        string empName = ds.Tables[2].Rows[0]["emp_fname"].ToString().Trim();
        string appvrName = ds.Tables[0].Rows[0]["name"].ToString().Trim();
        //string empcode = ds.Tables[2].Rows[0]["empcode"].ToString().Trim();
        if (email != "")
        {
            sendmail_Template1(email, appvrName, empName);
        }
    }

    public bool sendmail_Template1(string recievermailid, string approver, string employee)
    {
        try
        {
            string senderId = ConfigurationManager.AppSettings["fromEmail"];
            string senderPassword = ConfigurationManager.AppSettings["pwd"];      

            string Template = EmailTemplate1(approver, employee);
            bool IsAttachment = false;
            string FileName = string.Empty;
            System.Net.Mail.Attachment attachment = null;

            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            mailMessage.To.Add(recievermailid);
            mailMessage.From = new MailAddress(senderId);

            mailMessage.Subject = "Reimbursement Request Status";
            mailMessage.SubjectEncoding = System.Text.Encoding.UTF8;

            mailMessage.Body = Template;
            mailMessage.IsBodyHtml = true;

            mailMessage.Priority = MailPriority.High;

            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Credentials = new System.Net.NetworkCredential(senderId, senderPassword);
            smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"]);
            smtpClient.Host = ConfigurationManager.AppSettings["smtp"];
            smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);

            object userState = mailMessage;
            try
            {
                smtpClient.Send(mailMessage);
                if (IsAttachment)
                {
                    attachment.ContentStream.Close();
                }
                return true;
            }
            catch (System.Net.Mail.SmtpException)
            {
                return false;
            }
        }
        catch (Exception)
        {
            return false;
        }
    }

    public string EmailTemplate1(string approver, string employee)
    {
        string appr = approver.ToString();
        string emp = employee.ToString();
        //string empcod = empcode.ToString();
        string EmailFormat = @"<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01//EN' 'https://www.w3.org/TR/html4/strict.dtd'>" +
                    "<html lang='en'>" +
"<head>" +

    "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>" +

    "<style type='text/css'>" +
        "body, td, div, p, a, input" +
        "{" +
            "font-family: arial, sans-serif;" +
        "}" +
    "</style>" +

    "<meta http-equiv='X-UA-Compatible' content='IE=edge'>" +
    "<title>Resignation Request</title>" +
    "<style type='text/css'>" +
        "body, td" +
        "{" +
            "font-size: 13px;" +
        "}" +

        "a:link, a:active" +
        "{" +
            "color: #1155CC;" +
            "text-decoration: none;" +
        "}" +

        "a:hover" +
       "{" +
            "text-decoration: underline;" +
            "cursor: pointer;" +
        "}" +

        "a:visited" +
        "{" +
            "color: #6611CC;" +
        "}" +

        "img" +
        "{" +
            "border: 0px;" +
        "}" +

        "pre" +
        "{" +
            "white-space: pre;" +
            "white-space: -moz-pre-wrap;" +
            "white-space: -o-pre-wrap;" +
            "white-space: pre-wrap;" +
           "word-wrap: break-word;" +
           "max-width: 800px;" +
            "overflow: auto;" +
        "}" +

        ".logo" +
        "{" +
            "left: -7px;" +
            "position: relative;" +
        "}" +
    "</style>" +
"</head>" +
"<body>" +
    "<div class='bodycontainer'>" +


        "<div class='maincontent'>" +

            "<table width='100%' cellpadding='0' cellspacing='0' border='0' class='message'>" +
                "<tr>" +

                    "<tr>" +
                        "<td colspan='2'><font size='-1' class='recipient'>" +
                            "<div></div>" +
                        "</font>" +
                           " <tr>" +
                                "<td colspan='2'>" +
                                    "<table width='100%' cellpadding='12' cellspacing='0' border='0'>" +
                                        "<tr>" +
                                            "<td>" +
                                                "<div style='overflow: hidden;'>" +
                                                    "<font size='-1'>" +
                                                        "<div id='leaveid'>" +
                                                            "<p><b>Dear " + emp + @",</b></p>" +
                                                            "<p style='text-align: justify; color: #000000; text-align: justify'> " + "Your Reimbursement Request has been Rejected by Line Manager  " + appr + " - "+UserCode+" .</p>" +

                                                              "<p>Click here - <a href='https://escalon.sdlapps.com'>https://escalon.sdlapps.com</a> </p>" +
                                                            "<p>" +
                                                                "<b>Regards,<br><br>" +
                                                                    "HR<br><br>" +
                                                                "</b>" +
                                                            "</p>" +
                                                            "<br>" +

                                                            "<table width='100%'>" +
                                                                "<tbody>" +
                                                                    "<tr>" +
                                                                        "<td colspan='2' style='font: 12px arial; color: #333; text-align: justify'>" +
                                                                            "<hr>" +
                                                                            "<br>" +
                                                                            "<b>This is a system generated mail. Please do not reply to this email ID. If you have a query or need any clarification you may contact HR." +
                                                                            "<br>" +
                                                                                //"(1) Call our 24-hour Customer Care or<br>" +
                                                                                //"(2) Email Us <a href='" + ConfigurationManager.AppSettings[""] + @"' target='_blank'>" + ConfigurationManager.AppSettings[""] + @"</a> </b>" +
                                                                            "<br>" +
                                                                            "<hr>" +
                                                                            "<br>" +
                                                                        "</td>" +
                                                                    "</tr>" +
                                                                "</tbody>" +
                                                            "</table>" +

                                                        "</div>" +
                                                    "</font>" +
                                                "</div>" +
                                    "</table>" +
            "</table>" +
        "</div>" +
    "</div>" +

"</body>" +
"</html>";

        return EmailFormat;
    }

    protected void grd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblAttachment = (Label)e.Row.FindControl("lblAttachment");
            Label aViewFile = (Label)e.Row.FindControl("aViewFile");

            if (lblAttachment.Text.Trim() == "No File")
            {
                lblAttachment.Text = "No File";
                lblAttachment.Visible = false;
            }
            else
                aViewFile.Text = "View File";
    

            lblAttachment.Visible = false;
            //aViewFile.Visible = true;
       
            total += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Ammount"));
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lbltotalammount = (Label)e.Row.FindControl("lbltotalammount");
            lbltotalammount.Text = total.ToString();
            lbltotalammount.Font.Bold = true;
            hdnamount.Value = total.ToString();
        }
    }

    protected void btnbck_Click(object sender, EventArgs e)
    {
        Response.Redirect("LMPendingReimbursement.aspx");
    }

}