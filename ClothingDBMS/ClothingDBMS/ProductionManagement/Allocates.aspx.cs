using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Allocates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddAllocates_Click(object sender, EventArgs e)
        {
            PaneladdAllocates.Visible = true;
            PanelgvAllocates.Visible = false;
        }

        protected void btnSaveAllocates_Click(object sender, EventArgs e)
        {
            SqlAllocates.InsertParameters["WorkSchedule_ID"].DefaultValue = (string)Session["WorkScheduleEmployeeID"];
            SqlAllocates.InsertParameters["Employee_ID"].DefaultValue = dropEmployee.SelectedValue;
            SqlAllocates.InsertParameters["Allocated_Time"].DefaultValue = txtAllocatesTime.Text.Trim();
            SqlAllocates.Insert();
            gvAllocates.DataBind();
            SqlAllocatesdrop.DataBind();
            PaneladdAllocates.Visible = false;
            PanelgvAllocates.Visible = true;
            
            dropEmployee.SelectedIndex = -1;
            txtAllocatesTime.Text = string.Empty;
        }

        protected void btnCancelAllocates_Click(object sender, EventArgs e)
        {
            PaneladdAllocates.Visible = false;
            PanelgvAllocates.Visible = true;
            dropEmployee.SelectedIndex = -1;
            txtAllocatesTime.Text = string.Empty;
        }

       
    }
}