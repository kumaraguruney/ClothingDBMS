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
            gvWorkSchedule.DataBind();
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

        
    }
}