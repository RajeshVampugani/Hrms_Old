﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class onboarding_vpfdeclarationform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"] == null)
            Response.Redirect("~/notlogged.aspx");
    }
    protected void btnprint_Click(object sender, EventArgs e)
    {
        Session["ctrl"] = pnl1;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=1000px,width=1000px,scrollbars=1');</script>");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string emp_code = txt_employee.Text.ToString();
        // bind_job_detail(emp_code);

    }
}