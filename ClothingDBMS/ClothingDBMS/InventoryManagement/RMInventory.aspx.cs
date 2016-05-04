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
            SqlRMInventory.InsertParameters["Inventory_ID"].DefaultValue = InventoryIDDropDownList.SelectedValue;
            SqlRMInventory.InsertParameters["RM_ID"].DefaultValue = RMIDDropDownList.SelectedValue;
            SqlRMInventory.InsertParameters["Procurement_Date"].DefaultValue = ProcurementDateTextBox.Text.ToUpper().Trim();
            SqlRMInventory.InsertParameters["Quantity"].DefaultValue = QuantityTextBox.Text.ToUpper().Trim();
            SqlRMInventory.Insert();
            SqlRMInventory.DataBind();
            PaneladdRMInventory.Visible = false;
            PanelgvRMInventory.Visible = true;
            InventoryIDDropDownList.SelectedIndex = -1;
            RMIDDropDownList.SelectedIndex = -1;
            ProcurementDateTextBox.Text = string.Empty;
            QuantityTextBox.Text = String.Empty;
        }

        protected void btnCancelRMInventory_Click(object sender, EventArgs e)
        {
            PaneladdRMInventory.Visible = false;
            PanelgvRMInventory.Visible = true;
        }
        protected void calProcurementDate_SelectionChanged(object sender, EventArgs e)
        {
            ProcurementDateTextBox.Text = calProcurementDate.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calimgProcurementDate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }
    }
}