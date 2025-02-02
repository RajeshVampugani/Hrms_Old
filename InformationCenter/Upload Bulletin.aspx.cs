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
using DataAccessLayer;
using System.Data.SqlClient;
using Common.Console;

public partial class InformationCenter_Upload_Bulletin : System.Web.UI.Page
{
    string sqlstr, file_name;
    DataSet ds;

    //---------------------------------------FORM LOAD BINDING DATA IN GRIDVIEW-----------------------------------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)// innitially the page loads and is not a postback, the the control flows.
        {
            if (Session["role"] != null) // role may be admin/super admin/ employee.
            {
                //
            }
            else
                Response.Redirect("~/notlogged.aspx");
            bindgrid(); // the data of the grid view should be retrived from the db and should be displayed in grid view this code will do that.
        }
        message.InnerHtml = "";// this code can be used to display a message to the user.
    }
    

    //-------------------------------------CLICKING ON SUBMIT BUTTON TO SAVE RECORDS IN DATABASE-------------------------------------
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)// all the validations are verified and if true it proceeds.
            {
                if (fupload.PostedFile.FileName.ToString() != "") // the the space in the file upload box is not empty then the control gets inside the if s{}.
                {
                    file_name = System.DateTime.Now.GetHashCode().ToString() + System.IO.Path.GetExtension(fupload.PostedFile.FileName);// the file name along with the file extention is saved in file_name.
                    fupload.PostedFile.SaveAs(Server.MapPath("../upload/bulletindocuments/" + file_name)); //this code specifies where to save the file.
                    ViewState.Add("file_name", file_name.ToString());// the file name is saved in view state for future usage.
                }

                bool s = saverecords(); // the saverecords() returned value is stored in the bool b .
                if (s) // if s is true then print the below message.
                {
                    Output.Show("Record has been saved successfully!");
                    //Response.Write("<script>alert('Record has been saved successfully!')</script>");
                   
                    message.InnerHtml = "Record has been saved successfully!";
                    reset(); // this will reset all the fields of the page.
                }
                bindgrid(); // to update the girdView.
            }
        }
        catch (Exception ex)
        {
            Output.Show("File has not been uploaded. Please try again!");
           // Response.Write("<script>alert('File has not been uploaded. Please try again!')</script>");
            message.InnerHtml = "File has not been uploaded. Please try again!";
        }

    }

    //-------------------------------------FUNCTION TO SAVE VALUES IN DATABASE-------------------------------------
    protected bool saverecords()
    {
        try
        {
            DateTime dt;
            dt = System.DateTime.Now;
            if (ddlexpiry.SelectedIndex == 0)
            {
                dt = dt.AddMonths(1);
            }

            if (ddlexpiry.SelectedIndex == 1)
            {
                dt = dt.AddMonths(3);
            }

            if (ddlexpiry.SelectedIndex == 2)
            {
                dt = dt.AddMonths(6);
            }

            if (ddlexpiry.SelectedIndex == 3)
            {
                dt = dt.AddMonths(12);
            }

            if (ddlexpiry.SelectedIndex == 4)
            {
                dt = dt.AddYears(7);
            }


            if (Convert.ToInt32(ViewState["flagedit"]) != 1) // checks if the viewstate is 1 or not, why this is done?, this is done so that we have controle over data saving and data editing.
            {
                SqlParameter[] newparameter = new SqlParameter[8];

                newparameter[0] = new SqlParameter("@type", SqlDbType.VarChar, 50);
                newparameter[0].Value = ddltype.SelectedItem.Text;

                newparameter[1] = new SqlParameter("@subject", SqlDbType.VarChar, 100);
                newparameter[1].Value = txtsubject.Text.Trim().ToString();

                newparameter[2] = new SqlParameter("@description", SqlDbType.VarChar, 1000);
                newparameter[2].Value = txtdescription.Text.Trim().ToString();

                newparameter[3] = new SqlParameter("@upload", SqlDbType.VarChar, 150);
                newparameter[3].Value = ViewState["file_name"].ToString();

                newparameter[4] = new SqlParameter("@postedby", SqlDbType.VarChar, 50);
                newparameter[4].Value = Session["name"].ToString();

                newparameter[5] = new SqlParameter("@posteddate", SqlDbType.DateTime);
                newparameter[5].Value = System.DateTime.Now;

                newparameter[6] = new SqlParameter("@expirydate", SqlDbType.DateTime);
                newparameter[6].Value = dt;

                newparameter[7] = new SqlParameter("@expiry", SqlDbType.VarChar, 20);
                newparameter[7].Value = ddlexpiry.SelectedValue.ToString();

                ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.StoredProcedure, "intranet_insert_bulletindocuments_sp", newparameter);
                return true;
            }
            if (Convert.ToInt32(ViewState["flagedit"]) == 1)
            {
                //----------------Deletion of old uploaded file from the server------------------

                if (fupload.PostedFile.FileName.ToString() != "")
                {
                    sqlstr = "SELECT upload FROM tbl_intranet_bulletin_documents WHERE id=" + ViewState["id"];
                    ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.Text, sqlstr);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string file = Server.MapPath("../upload/bulletindocuments/") + ds.Tables[0].Rows[0]["upload"].ToString();
                        System.IO.File.Delete(file);
                    }
                }

                //----------------Edition of record in database---------------------------------

                SqlParameter[] newparameter = new SqlParameter[9];

                newparameter[0] = new SqlParameter("@type", SqlDbType.VarChar, 50);
                newparameter[0].Value = ddltype.SelectedItem.Text;

                newparameter[1] = new SqlParameter("@subject", SqlDbType.VarChar, 100);
                newparameter[1].Value = txtsubject.Text.Trim().ToString();

                newparameter[2] = new SqlParameter("@description", SqlDbType.VarChar, 1000);
                newparameter[2].Value = txtdescription.Text.Trim().ToString();

                newparameter[3] = new SqlParameter("@upload", SqlDbType.VarChar, 150);
                newparameter[3].Value = ViewState["file_name"].ToString();

                newparameter[4] = new SqlParameter("@postedby", SqlDbType.VarChar, 50);
                newparameter[4].Value = Session["name"].ToString();

                newparameter[5] = new SqlParameter("@posteddate", SqlDbType.DateTime);
                newparameter[5].Value = System.DateTime.Now;

                newparameter[6] = new SqlParameter("@id", SqlDbType.Int);
                newparameter[6].Value = ViewState["id"].ToString();

                newparameter[7] = new SqlParameter("@expirydate", SqlDbType.DateTime);
                newparameter[7].Value = dt;

                newparameter[8] = new SqlParameter("@expiry", SqlDbType.VarChar, 20);
                newparameter[8].Value = ddlexpiry.SelectedValue.ToString();

                ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.StoredProcedure, "intranet_update_bulletindocuments_sp", newparameter);
                return true;
            }
            return true;
        }
        catch (SqlException sql)
        {
            Output.Show("Cannot insert duplicate values or some database error has been occured!");
            //message.InnerHtml = "Cannot insert duplicate values or some database error has been occured!";
            return false;
        }
        catch (Exception ex)
        {
            message.InnerHtml = ex.Message;
            return false;
        }
        finally
        {

        }
    }

    //--------------------------------------BINDING GRID----------------------------------------------------------------------------------
    protected void bindgrid()
    {
        sqlstr = "SELECT id,type,subject,description,upload,postedby FROM tbl_intranet_bulletin_documents ORDER BY posteddate desc";
        ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.Text, sqlstr);

        griddetails.DataSource = ds;
        griddetails.DataBind();
    }

    //-----------------------------------------PAGING IN GRID--------------------------------------------------------------------------
    protected void griddetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        griddetails.PageIndex = e.NewPageIndex;
        bindgrid();
    }

    //-----------------------------------------CHANGING COLOR OF ROW ON MOVING MOUSE---------------------------------------------------
    protected void griddetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    e.Row.Attributes.Add("onmouseover", "this.className='hover-clr'");
        //    e.Row.Attributes.Add("onmouseout", "this.className='out-clr'");
        //}
    }

    //---------------------------------------DELETING A PARTICULAR RECORDS FROM GRIDVIEW -------------------------------------------------
    protected void griddetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int code;
        code = (int)griddetails.DataKeys[e.RowIndex].Value;

        //----------------Deletion of uploaded file from the server------------------

        sqlstr = "SELECT upload FROM tbl_intranet_bulletin_documents WHERE id=" + code;
        ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.Text, sqlstr);

        if (ds.Tables[0].Rows.Count > 0)
        {
            string file = Server.MapPath("../upload/hrdocuments/") + ds.Tables[0].Rows[0]["upload"].ToString();
            System.IO.File.Delete(file);
        }

        //----------------Deletion of record from the database------------------

        sqlstr = "DELETE FROM tbl_intranet_bulletin_documents WHERE id=" + code;
        DBTask.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.Text, sqlstr);
        bindgrid();
        reset();
    }

    //-----------------------------------CLICKING ON EDIT BUTTON-------------------------------------------------------------------
    protected void griddetails_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id;

        ViewState["flagedit"] = 1; //FOR EDITING RECORDS

        id = (int)griddetails.DataKeys[e.NewEditIndex].Value;
        ViewState["id"] = id;

        sqlstr = "SELECT id,type,subject,description,upload,postedby,expirydate,expiry FROM tbl_intranet_bulletin_documents WHERE id='" + id + "'";
        ds = DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["intranetConnectionString"].ConnectionString.ToString(), CommandType.Text, sqlstr);

        ddltype.SelectedValue = ds.Tables[0].Rows[0]["type"].ToString();
        txtsubject.Text = ds.Tables[0].Rows[0]["subject"].ToString();
        txtdescription.Text = ds.Tables[0].Rows[0]["description"].ToString();
        ViewState["file_name"] = ds.Tables[0].Rows[0]["upload"].ToString();
        ddlexpiry.SelectedValue = ds.Tables[0].Rows[0]["expiry"].ToString();
        rfvupload.Enabled = false;

        lbl_file.Text = "<a href='../upload/hrdocuments/" + ds.Tables[0].Rows[0]["upload"].ToString() + "'>" + ds.Tables[0].Rows[0]["upload"].ToString() + "</a>";
    }

    //------------------------------------CLICKING ON RESET BUTTON-------------------------------------------------------------------------
    protected void btnreset_Click(object sender, EventArgs e)
    {
        reset();
    }

    //------------------------------------FUNCTION TO RESET CONTROLS VALUE-----------------------------------------------------------
    protected void reset()
    {
        ddltype.SelectedIndex = 0;
        txtsubject.Text = "";
        txtdescription.Text = "";
        lbl_file.Text = "";
        rfvupload.Enabled = true;
        ViewState.Remove("file_name");
        ddlexpiry.SelectedIndex = 0;
    }
}