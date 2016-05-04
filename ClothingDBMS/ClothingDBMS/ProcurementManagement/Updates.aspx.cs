using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Updates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddUpdates_Click(object sender, EventArgs e)
        {
            PaneladdUpdates.Visible = true;
            PanelgvUpdates.Visible = false;
        }

        protected void btnCancelUpdates_Click(object sender, EventArgs e)
        {
            PaneladdUpdates.Visible = false;
            PanelgvUpdates.Visible = true;

        }

        protected void btnSaveUpdates_Click(object sender, EventArgs e)
        {
            SqlUpdates.InsertParameters["Name"].DefaultValue = txtUpdatesName.Text.ToUpper().Trim();
            SqlUpdates.InsertParameters["Address"].DefaultValue = txtUpdatesAddress.Text.ToUpper().Trim();

            SqlUpdates.Insert();
            gvUpdates.DataBind();
            PaneladdUpdates.Visible = false;
            PanelgvUpdates.Visible = true;
            txtUpdatesName.Text = string.Empty;
            txtUpdatesAddress.Text = string.Empty;

        }
    }

}
    