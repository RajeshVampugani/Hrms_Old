using System;
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
public partial class payroll_admin_reports_Form12BA : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    string sqlstr;
    string strPop;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["role"] != null)
            {
               
            }
            else
                Response.Redirect("~/notlogged.aspx");

            bind_year();
        }
    }

    protected void btnsbmit_Click(object sender, EventArgs e)
    {

        strPop = "<script language='javascript'>window.open('perquisite-form12BA.aspx?empcode=" + txt_employee.Text.ToString() + "&yearrange=" + dd_year.SelectedItem.Text.ToString() + "')</script>";

        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "xx", strPop, false);
    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        txt_employee.Text = "";
    }

    protected void bind_year()
    {
        sqlstr = "select distinct year from tbl_payroll_employee_salary";
        ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ToString(), CommandType.Text, sqlstr);
        dd_year.DataTextField = "year";
        dd_year.DataValueField = "year";
        dd_year.DataSource = ds;
        dd_year.DataBind();
    }
}
