﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using DataAccessLayer;
using querystring;
public partial class payroll_admin_fullandfinaluploadallowances : System.Web.UI.Page
{
    string sqlstr;
    SqlParameter[] sqlparm;
    DataSet ds = new DataSet();
    DataView dv = new DataView();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"] != null)
        {
            //    if (Session["role"].ToString() != "2" && Session["role"].ToString() != "3")
            //        Response.Redirect("~/Authenticate.aspx");
        }
        else Response.Redirect("~/notlogged.aspx");
        message.InnerHtml = "";
        if (!IsPostBack)
        {
            bind_PayheadName();
            //current_month();
            bind_fyear();
        }
    }

    protected void bind_fyear()
    {
        DateTime dt = DateTime.Now;

        if (Convert.ToInt16(dt.Day) > 30)
            dt = dt.AddMonths(1);

        if (Convert.ToInt32(dd_month.SelectedValue) >= 4)
            dd_year.Text = dt.Year + "-" + dt.AddYears(1).Year;
        else
            dd_year.Text = dt.AddYears(-1).Year + "-" + dt.Year;
    }

    protected void current_month()
    {
        DateTime dt = DateTime.Now;

        if (Convert.ToInt16(dt.Day) > 30)
            dt = dt.AddMonths(1);

        dd_month.Items.Add(new ListItem(dt.ToString("MMM"), dt.Month.ToString()));
        dd_month.SelectedValue = dt.Month.ToString();
    }


    protected void bind_PayheadName()
    {
        sqlstr = @"SELECT [id], [payhead_name] FROM [tbl_payroll_payhead] where type=3 and status=1 or payhead_name='Gratuity'";
        ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.Text, sqlstr);
        drpPayHead.DataTextField = "payhead_name";
        drpPayHead.DataValueField = "id";
        drpPayHead.DataSource = ds;
        drpPayHead.DataBind();
    }

    protected void bindadjustment()
    {
        sqlparm = new SqlParameter[3];
        sqlparm[0] = new SqlParameter("@allowanceid", drpPayHead.SelectedValue);
        sqlparm[1] = new SqlParameter("@month", dd_month.SelectedItem.Text);
        sqlparm[2] = new SqlParameter("@year", dd_year.Text.Trim().ToString());

        ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ToString(), CommandType.StoredProcedure, "sp_payroll_uploaded_detail", sqlparm);


        if (ViewState["sortExpr"] != null)
        {
            dv = new DataView(ds.Tables[0]);
            dv.Sort = (string)ViewState["sortExpr"];
        }
        else
            dv = ds.Tables[0].DefaultView;

        adjustgrid.DataSource = dv;
        adjustgrid.DataBind();
    }

    protected void adjustgrid_Sorting(object sender, GridViewSortEventArgs e)
    {
        ViewState["sortExpr"] = e.SortExpression;
        bindadjustment();
    }
    protected void adjustgrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        adjustgrid.PageIndex = e.NewPageIndex;
        bindadjustment();
    }
    protected void drpPayHead_DataBound(object sender, EventArgs e)
    {
        drpPayHead.Items.Insert(0, new ListItem("---Select Allowance---", "0"));
    }
    protected void dd_year_DataBound(object sender, EventArgs e)
    {

    }
    protected void btn_view_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            sqlparm = new SqlParameter[7];
            sqlparm[0] = new SqlParameter("@empcode", txt_employee.Text.Trim());
            sqlparm[1] = new SqlParameter("@allowanceid", drpPayHead.SelectedValue);
            sqlparm[2] = new SqlParameter("@allowancename", drpPayHead.SelectedItem.Text);
            sqlparm[3] = new SqlParameter("@amount", txtamount.Text.Trim());
            sqlparm[4] = new SqlParameter("@month", dd_month.SelectedItem.Text);
            sqlparm[5] = new SqlParameter("@year", dd_year.Text.Trim().ToString());
            sqlparm[6] = new SqlParameter("@modifiedby", "pramod");
            if (sqlparm[0].Value.ToString().Trim() != "")
            {
                if (sqlparm[3].Value == "") sqlparm[3].Value = "0.00";
                DBTask.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ToString(), CommandType.StoredProcedure, "sp_payroll_employee_importallowance", sqlparm);
            }
            else
            {
                SqlParameter[] sqlparm1 = new SqlParameter[3];
                sqlparm1[0] = new SqlParameter("@allowanceid", drpPayHead.SelectedValue);
                sqlparm1[1] = new SqlParameter("@month", dd_month.SelectedItem.Text);
                sqlparm1[2] = new SqlParameter("@year", dd_year.Text.Trim().ToString());
                DBTask.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ToString(), CommandType.Text, "delete from tbl_payroll_allowance_detail where year=@year and allowanceid=@allowanceid and month=@month", sqlparm1);
                //Response.Write("<script>alert('Please check format of empcode in excel');</script>");
                message.InnerHtml = "Please check format of empcode in excel";
                return;
            }
        }
        message.InnerHtml = drpPayHead.SelectedItem.Text + " data  uploaded successfully!";

        bindadjustment();
    }
    protected void btn_view1_Click(object sender, EventArgs e)
    {
        bindadjustment();
    }
}