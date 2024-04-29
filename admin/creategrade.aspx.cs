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
using Smart.HR.Common.Console;

public partial class Admin_Company_createcompany : System.Web.UI.Page
{
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        message.InnerHtml = "";
        if (!IsPostBack)
        {
            if (Session["role"] != null)
            {
                //if (Session["role"].ToString() != "2" && Session["role"].ToString() != "3")
                   // Response.Redirect("~/Authenticate.aspx");
            }
            else
                Response.Redirect("~/notlogged.aspx");
        }
    }

    public void btnsv_Click(object sender, EventArgs e)
    {
        insert_department_detail();
    }

    protected void insert_department_detail()
    {
        //@gradename varchar(50),
        //@description varchar(500),
        //@createdby varchar(50)

        SqlParameter[] sqlparam = new SqlParameter[4];

        sqlparam[0] = new SqlParameter("@gradename", SqlDbType.VarChar, 50);
        sqlparam[0].Value = txt_branch_name.Text;

        sqlparam[1] = new SqlParameter("@description", SqlDbType.VarChar, 500);
        sqlparam[1].Value = txt_branch_code.Text;

        sqlparam[2] = new SqlParameter("@createdby", SqlDbType.VarChar, 50);
        sqlparam[2].Value = Session["name"].ToString();

        sqlparam[3] = new SqlParameter("@gradetype", SqlDbType.VarChar, 1);
        sqlparam[3].Value = System.Data.SqlTypes.SqlString.Null;

        //ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.StoredProcedure, "sp_intranet_insert_grade", sqlparam);
        int i = DBTask.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.StoredProcedure, "[sp_intranet_insert_grade]", sqlparam);
        if (i < 0)
        {
            Output.Show("Grade is already exist. Try another Grade.");
           
        }
        else
        {
            Output.Show("Created Successfully");
            reset();
        }
    }

    protected void reset()
    {
        txt_branch_code.Text = "";
        txt_branch_name.Text = "";
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        reset();
    }
}