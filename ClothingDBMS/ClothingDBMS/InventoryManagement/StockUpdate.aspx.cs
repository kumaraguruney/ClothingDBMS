using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class StockUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddInventory_Click(object sender, EventArgs e)
        {
            PaneladdInventory.Visible = true;
            PanelgvInventory.Visible = false;
        }

        protected void btnSaveInventory_Click(object sender, EventArgs e)
        {
            SqlStockUpdate.InsertParameters["Inventory_ID"].DefaultValue = InventoryTextBox.Text.ToUpper().Trim();
            SqlStockUpdate.InsertParameters["Warehouse_ID"].DefaultValue = WarehouseIDTextBox.Text.ToUpper().Trim();
            SqlStockUpdate.InsertParameters["Quantity"].DefaultValue = QuantityTextBox.Text.ToUpper().Trim();
            SqlStockUpdate.Insert();
            gvInventory.DataBind();
            PaneladdInventory.Visible = false;
            PanelgvInventory.Visible = true;
            InventoryTextBox.Text = string.Empty;
            WarehouseIDTextBox.Text = string.Empty;
            QuantityTextBox.Text = string.Empty;
        }

        protected void btnCancelInventory_Click(object sender, EventArgs e)
        {
            PaneladdInventory.Visible = false;
            PanelgvInventory.Visible = true;
        }
    }
}