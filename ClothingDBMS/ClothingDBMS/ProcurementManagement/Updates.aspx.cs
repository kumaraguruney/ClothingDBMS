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
            SqlUpdate.InsertParameters["Update_ID"].DefaultValue = txtUpdate_id.Text.ToUpper().Trim();
            SqlUpdate.InsertParameters["Receipt_ID"].DefaultValue = txtReceipt_ID.Text.ToUpper().Trim();
            SqlUpdate.InsertParameters["Inventory_ID"].DefaultValue = txtInventory_ID.Text.ToUpper().Trim();

            SqlUpdate.Insert();
            gvUpdates.DataBind();
            PaneladdUpdates.Visible = false;
            PanelgvUpdates.Visible = true;
            txtUpdate_id.Text = string.Empty;
            txtReceipt_ID.Text = string.Empty;
            txtInventory_ID.Text = string.Empty;

        }
    }

}
    