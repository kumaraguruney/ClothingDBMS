using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class RMStockUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddRMStockUpdate_Click(object sender, EventArgs e)
        {
            PaneladdRMStockUpdate.Visible = true;
            PanelgvRMStockUpdate.Visible = false;
        }

        protected void btnSaveRMStockUpdate_Click(object sender, EventArgs e)
        {
            //SqlInventory.InsertParameters["Inventory_ID"].DefaultValue = InventoryTextBox.Text.ToUpper().Trim();
            SqlRMStockUpdate.InsertParameters["StockMovement_ID"].DefaultValue = StockMovementIDDropDownList.SelectedValue;
            SqlRMStockUpdate.InsertParameters["RM_ID"].DefaultValue = RMIDDropDownList.SelectedValue;
            SqlRMStockUpdate.InsertParameters["Entry_ID"].DefaultValue = EntryIDDropDownList.SelectedValue;
            SqlRMStockUpdate.Insert();
            gvRMStockUpdate.DataBind();
            PaneladdRMStockUpdate.Visible = false;
            PanelgvRMStockUpdate.Visible = true;
            StockMovementIDDropDownList.SelectedIndex = -1;
            RMIDDropDownList.SelectedIndex = -1;
            EntryIDDropDownList.SelectedIndex = -1;
        }

        protected void btnCancelRMStockUpdate_Click(object sender, EventArgs e)
        {
            PaneladdRMStockUpdate.Visible = false;
            PanelgvRMStockUpdate.Visible = true;
        }
    }

}