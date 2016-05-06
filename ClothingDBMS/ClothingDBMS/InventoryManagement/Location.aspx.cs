using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class Inventory : System.Web.UI.Page
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
            //SqlInventory.InsertParameters["Inventory_ID"].DefaultValue = InventoryTextBox.Text.ToUpper().Trim();
            SqlLocation.InsertParameters["Warehouse_ID"].DefaultValue = WarehouseIDDropDownList.SelectedValue;
            SqlLocation.InsertParameters["Area"].DefaultValue = AreaTextBox.Text.ToUpper().Trim();
            SqlLocation.InsertParameters["Location_Name"].DefaultValue = InventoryNameTextBox.Text.ToUpper().Trim();
            SqlLocation.Insert();
            gvInventory.DataBind();
            PaneladdInventory.Visible = false;
            PanelgvInventory.Visible = true;
            InventoryNameTextBox.Text = string.Empty;
            WarehouseIDDropDownList.SelectedIndex = -1;
            AreaTextBox.Text = string.Empty;
        }

        protected void btnCancelInventory_Click(object sender, EventArgs e)
        {
            PaneladdInventory.Visible = false;
            PanelgvInventory.Visible = true;
        }
    }
}