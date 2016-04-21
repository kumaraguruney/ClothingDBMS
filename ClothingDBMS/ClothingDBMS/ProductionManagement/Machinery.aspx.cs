using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Machinery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btaddMachinery_Click(object sender, EventArgs e)
        {
            PaneladdMachinery.Visible = true;
            PanelgvMachinery.Visible = false;
        }

        protected void btnSaveMachinery_Click(object sender, EventArgs e)
        {
            SqlMachinery.InsertParameters["Machine_Name"].DefaultValue = txtMachineryName.Text.ToUpper().Trim();
            SqlMachinery.Insert();
            gvMachinery.DataBind();
            PaneladdMachinery.Visible = false;
            PanelgvMachinery.Visible = true;
            txtMachineryName.Text = string.Empty;
        }

        protected void btnCancelMachinery_Click(object sender, EventArgs e)
        {
            PaneladdMachinery.Visible = false;
            PanelgvMachinery.Visible = true;
        }
    }
}