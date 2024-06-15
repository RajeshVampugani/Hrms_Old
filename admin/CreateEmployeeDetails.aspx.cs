using System.Data;
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
using DataAccessLayer;
using System.Text;
using System.EnterpriseServices;
using System.Web.UI.WebControls.WebParts;

public partial class admin_CreateEmployeeDetails : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    DataTable dtable = new DataTable();
    DataActivity activity = new DataActivity();
    SqlTransaction transaction = null;


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void btnsubmit_Click1(object sender, EventArgs e)
    {
        byte[] filedata = empdoc.FileBytes;
        string connection = ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        //SqlParameter[] sqlparam = new SqlParameter[4];

        //sqlparam[0] = new SqlParameter("@Employeename", SqlDbType.VarChar, 40);
        //if (tbname.Text == "")
        //{
        //    sqlparam[0].Value = System.Data.SqlTypes.SqlDateTime.Null;
        //}
        //else
        //{
        //    sqlparam[0].Value = tbname.Text;
        //}
        //sqlparam[1] = new SqlParameter("@Employeecode", SqlDbType.VarChar, 40);
        //if (tbempcode.Text == "")
        //{
        //    sqlparam[1].Value = System.Data.SqlTypes.SqlDateTime.Null;
        //}
        //else
        //{
        //    sqlparam[1].Value = tbempcode.Text;
        //}
        //sqlparam[2] = new SqlParameter("@EmployeeNo", SqlDbType.VarChar, 40);
        //if (tbempno.Text == "")
        //{
        //    sqlparam[2].Value = System.Data.SqlTypes.SqlDateTime.Null;
        //}
        //else
        //{
        //    sqlparam[2].Value = tbempno.Text;
        //}
        //byte[] filedata = empdoc.FileBytes;
        SqlCommand cmd = new SqlCommand("sp_CreateEmployee", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Uploaddocument", SqlDbType.VarBinary, -1).Value = filedata;
        cmd.Parameters.AddWithValue("@EmployeeNo", tbempno.Text);
        cmd.Parameters.AddWithValue("@Employeecode", tbempcode.Text);
        cmd.Parameters.AddWithValue("@Employeename", tbname.Text);
        conn.Open();
        cmd.ExecuteNonQuery();


        //ds = SQLServer.ExecuteDataset(conn, CommandType.StoredProcedure, transaction, "sp_CreateEmployee", sqlparam);
        SmartHr.Common.Alert("Employee Job Details Saved successfully!!!.");
        conn.Close();
    }
    //protected void Uploaddocument()
    //{
    //    string filename="";
    //    if(empdoc.HasFile)
    //    {
    //        filename=

  }