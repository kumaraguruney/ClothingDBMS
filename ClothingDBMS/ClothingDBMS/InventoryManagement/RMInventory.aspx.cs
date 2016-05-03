using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class RMInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddRMInventory_Click(object sender, EventArgs e)
        {
            PaneladdRMInventory.Visible = true;
            PanelgvRMInventory.Visible = false;
        }

        protected void btnSaveRMInventory_Click(object sender, EventArgs e)
        {
            SqlRMInventory.InsertParameters["Inventory_ID"].DefaultValue = RMInventoryTextBox.Text.ToUpper().Trim();
            SqlRMInventory.InsertParameters["RM_ID"].DefaultValue = RMIDTextBox.Text.ToUpper().Trim();
            SqlRMInventory.InsertParameters["Procurement_Date"].DefaultValue = ProcurementDateTextBox.Text.ToUpper().Trim();
            SqlRMInventory.Insert();
            SqlRMInventory.DataBind();
            PaneladdRMInventory.Visible = false;
            PanelgvRMInventory.Visible = true;
            RMInventoryTextBox.Text = string.Empty;
            RMIDTextBox.Text = string.Empty;
            ProcurementDateTextBox.Text = string.Empty;
        }

        protected void btnCancelRMInventory_Click(object sender, EventArgs e)
        {
            PaneladdRMInventory.Visible = false;
            PanelgvRMInventory.Visible = true;
        }
    }
}