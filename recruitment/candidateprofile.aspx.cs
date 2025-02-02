﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataAccessLayer;
using System.Configuration;
using Common.Data;
using Common.Console;
using System.Globalization;

public partial class recruitment_candidateprofile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"] != null)
        {
            //Response.Redirect("~/Authenticate.aspx");
        }
        else
            Response.Redirect("~/notlogged.aspx");

        if (!IsPostBack)
        {

            if (Request.QueryString["id"] != null)
            {
                bindDetails();
            }
        }
    }

    protected void bindDetails()
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        //SqlParameter[] sqlParam = new SqlParameter[1];
        try
        {
            string sqlstr = "select * from tbl_recruitment_candidate_registration where id='" + id + "'";
            //sqlParam[0] = new SqlParameter("@id", SqlDbType.Int);
            //sqlParam[0].Value = id;
            DataSet ds = new DataSet();
            ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.Text, sqlstr);

            if (ds.Tables[0].Rows.Count >= 1)
            {
                txt_candidateName.Text = ds.Tables[0].Rows[0]["candidate_name"].ToString();
                txt_gender.Text = ds.Tables[0].Rows[0]["gender"].ToString();
                //txtapplieddate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Applied_Date"].ToString()).ToString("dd MMM yyyy", CultureInfo.InvariantCulture);
                if (ds.Tables[0].Rows[0]["Applied_Date"].ToString() != "")
                    txtapplieddate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Applied_Date"].ToString()).ToString("dd MMM yyyy");
                else txtapplieddate.Text = "";
                //txtapplieddate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Applied_Date"]).ToString("dd MMM yyyy");
                txt_phoneno.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                txt_email.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                txt_experience.Text = ds.Tables[0].Rows[0]["experience"].ToString();
                txt_skills.Text = ds.Tables[0].Rows[0]["skills"].ToString();
                txt_Qualifications.Text = ds.Tables[0].Rows[0]["Qualification"].ToString();
                txt_joinstatus.Text = ds.Tables[0].Rows[0]["joinstatus"].ToString();
                txt_mobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                lblexpectedsalary.Text = ds.Tables[0].Rows[0]["expectedsalary"].ToString();
                lblachievements.Text = ds.Tables[0].Rows[0]["achievements"].ToString();
                lblpassportno.Text = ds.Tables[0].Rows[0]["passportno"].ToString();
                lblpassportvalidity.Text = ds.Tables[0].Rows[0]["passportvalidity"].ToString();
                lbldob.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["dob"]).ToString("dd MMM yyyy");
                lbldesignation.Text = ds.Tables[0].Rows[0]["designation_id"].ToString();
                lblreferedby.Text = ds.Tables[0].Rows[0]["referredby"].ToString() + "-" + ds.Tables[0].Rows[0]["referrername"].ToString();
                lblnotes.Text = ds.Tables[0].Rows[0]["note"].ToString();
                lbladdress.Text = ds.Tables[0].Rows[0]["candidate_address"].ToString();
                txt_resumeuploads.Text = ds.Tables[0].Rows[0]["uploadresume"].ToString();
            }
        }
        catch (Exception ex)
        {
            Common.Console.Output.Log("During validation: " + ex.Message + ".    " + DateTime.Now);
            //Output.Show("Record not Saved. Please contact system admin. For error details please go through the log file.");
            Output.Show("Record is not present. Please contact system admin. For error details please go through the log file.");
        }
    }
}