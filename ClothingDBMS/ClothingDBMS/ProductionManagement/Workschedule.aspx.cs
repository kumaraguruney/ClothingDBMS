using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Workschedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveWorkSchedule_Click(object sender, EventArgs e)
        {
            SqlWorkSchedule.InsertParameters["WorkOrder_ID"].DefaultValue = dropaddWorkOrder.SelectedValue;
            SqlWorkSchedule.InsertParameters["WorkScheduled_By"].DefaultValue = dropaddScheduledBy.SelectedValue;
            SqlWorkSchedule.Insert();
            SqlWorkOrder.UpdateParameters["WorkOrder_ID"].DefaultValue = dropaddWorkOrder.SelectedValue;
            SqlWorkOrder.UpdateParameters["Is_WorkScheduled"].DefaultValue = "TRUE";
            SqlWorkOrder.Update();
            gvWorkSchedule.DataBind();
            dropaddWorkOrder.DataBind();
            PaneladdWorkSchedule.Visible = false;
            PanelgvWorkSchedule.Visible = true;
            dropaddWorkOrder.SelectedIndex = -1;
            dropaddScheduledBy.SelectedIndex = -1;
        }

        protected void btnCancelWorkSchedule_Click(object sender, EventArgs e)
        {
            PaneladdWorkSchedule.Visible = false;
            PanelgvWorkSchedule.Visible = true;
            dropaddWorkOrder.SelectedIndex = -1;
            dropaddScheduledBy.SelectedIndex = -1;
            
        }

        protected void btaddWorkSchedule_Click(object sender, EventArgs e)
        {
            PaneladdWorkSchedule.Visible = true;
            PanelgvWorkSchedule.Visible = false;
        }

        protected void lnkIncluded_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            GridViewRow row = btn.NamingContainer as GridViewRow;
            string WorkScheduleID = gvWorkSchedule.DataKeys[row.RowIndex].Values[0].ToString();
            Session["WorkScheduleID"] = WorkScheduleID;
            Response.Redirect("Includes.aspx");
        }

        protected void lnkAllocated_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            GridViewRow row = btn.NamingContainer as GridViewRow;
            string WorkScheduleEmployeeID = gvWorkSchedule.DataKeys[row.RowIndex].Values[0].ToString();
            Session["WorkScheduleEmployeeID"] = WorkScheduleEmployeeID;
            Response.Redirect("Allocates.aspx");
        }
    }
}