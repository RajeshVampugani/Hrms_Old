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
using DataAccessLayer;
using System.Data.SqlClient;

public partial class payroll_admin_pt_group_master : System.Web.UI.Page
{
    string sqlstr;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!IsPostBack)
            {
                if (Session["role"] != null)
                {

                }
                else Response.Redirect("~/notlogged.aspx");

            }
        }

        //SqlDataSource1.DataBind();
        //griddetail.DataBind();
       
    }
    protected void btnsbmit_Click(object sender, EventArgs e)
    {
        SqlParameter[] sqlparam = new SqlParameter[4];
        sqlparam[0] = new SqlParameter("@group_name", SqlDbType.VarChar, 50);
        sqlparam[0].Value = txt_name.Text.ToString();

        sqlparam[1] = new SqlParameter("@desc", SqlDbType.Decimal);
        sqlparam[1].Value = Convert.ToDecimal(txt_alias.Text.ToString().Trim());

        sqlparam[2] = new SqlParameter("@createdby", SqlDbType.VarChar, 50);
        sqlparam[2].Value = Session["name"].ToString();

        sqlparam[3] = new SqlParameter("@createddate", SqlDbType.DateTime);
        sqlparam[3].Value = System.DateTime.Now;

        sqlstr = "insert into tbl_payroll_ptgroup_details(ptgrp_name,ptgrp_rate,createdby,createddate)values(@group_name,@desc,@createdby,@createddate)";
        DBTask.ExecuteScalar(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ToString(), CommandType.Text, sqlstr, sqlparam);
        message.InnerHtml = "PT Group created successfully";
        SqlDataSource1.DataBind();
        griddetail.DataBind();
        clear();
    }
    protected void clear()
    {
        txt_alias.Text = "";
        txt_name.Text = "";
    }
}
