using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Includes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["WorkScheduleID"] == null)
            {
                Response.Redirect("Machinery.aspx");
            }
        }

        protected void btnSaveIncludes_Click(object sender, EventArgs e)
        {
            SqlIncludes.InsertParameters["WorkSchedule_ID"].DefaultValue = (string)Session["WorkScheduleID"];
            SqlIncludes.InsertParameters["Machine_ID"].DefaultValue = dropaddMachines.SelectedValue;
            SqlIncludes.InsertParameters["Hours_Of_Operation"].DefaultValue = txtIncludesHofOperation.Text.Trim();
            SqlIncludes.Insert();
            gvIncludes.DataBind();
            PaneladdIncludesMachinery.Visible = false;
            PanelgvIncludes.Visible = true;
            dropaddMachines.SelectedIndex = -1;
            txtIncludesHofOperation.Text = string.Empty;
        }

        protected void btnaddIncludes_Click(object sender, EventArgs e)
        {
            PaneladdIncludesMachinery.Visible = true;
            PanelgvIncludes.Visible = false;
        }

        protected void btnCancelIncludes_Click(object sender, EventArgs e)
        {
            PaneladdIncludesMachinery.Visible = false;
            PanelgvIncludes.Visible = true;
            dropaddMachines.SelectedIndex = -1;
            txtIncludesHofOperation.Text = string.Empty;
        }

       
    }
}