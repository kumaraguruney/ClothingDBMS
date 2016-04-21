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

        }

        protected void btnSaveIncludes_Click(object sender, EventArgs e)
        {
            SqlIncludes.InsertParameters["WorkSchedule_ID"].DefaultValue = dropWorkschedule.SelectedValue;
            SqlIncludes.InsertParameters["Machine_ID"].DefaultValue = dropMachines.SelectedValue;
            SqlIncludes.Insert();
            gvIncludes.DataBind();
            PaneladdIncludesMachinery.Visible = false;
            PanelgvIncludes.Visible = true;
            dropMachines.SelectedIndex = 0;
            dropWorkschedule.SelectedIndex = 0;
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
        }
    }
}