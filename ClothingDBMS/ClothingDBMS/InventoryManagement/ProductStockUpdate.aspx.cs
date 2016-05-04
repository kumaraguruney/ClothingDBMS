using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class ProductStockUpdate1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddProductStockUpdate_Click(object sender, EventArgs e)
        {
            PaneladdProductStockUpdate.Visible = true;
            PanelgvProductStockUpdate.Visible = false;
        }

        protected void btnSaveProductStockUpdate_Click(object sender, EventArgs e)
        {
            //SqlInventory.InsertParameters["Inventory_ID"].DefaultValue = InventoryTextBox.Text.ToUpper().Trim();
            SqlProductStockUpdate.InsertParameters["Stock_Movement_ID"].DefaultValue = StockMovementIDDropDownList.SelectedValue;
            SqlProductStockUpdate.InsertParameters["Product_ID"].DefaultValue = ProductIDDropDownList.SelectedValue;
            SqlProductStockUpdate.InsertParameters["Entry_ID"].DefaultValue = EntryIDDropDownList.SelectedValue;
            SqlProductStockUpdate.Insert();
            gvProductStockUpdate.DataBind();
            PaneladdProductStockUpdate.Visible = false;
            PanelgvProductStockUpdate.Visible = true;
            StockMovementIDDropDownList.SelectedIndex = -1;
            ProductIDDropDownList.SelectedIndex = -1;
            EntryIDDropDownList.SelectedIndex = -1;
        }

        protected void btnCancelProductStockUpdate_Click(object sender, EventArgs e)
        {
            PaneladdProductStockUpdate.Visible = false;
            PanelgvProductStockUpdate.Visible = true;
        }

}
}