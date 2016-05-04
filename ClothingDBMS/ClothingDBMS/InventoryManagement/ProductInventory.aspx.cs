using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class ProductInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddProductInventory_Click(object sender, EventArgs e)
        {
            PaneladdProductInventory.Visible = true;
            PanelgvProductInventory.Visible = false;
        }

        protected void btnSaveProductInventory_Click(object sender, EventArgs e)
        {
            SqlProductInventory.InsertParameters["Inventory_ID"].DefaultValue = InventoryIDDropDownList.SelectedValue;
            SqlProductInventory.InsertParameters["Product_ID"].DefaultValue = ProductIDDropDownList.SelectedValue;
            SqlProductInventory.InsertParameters["Design_ID"].DefaultValue = DesignIDDropDownList.SelectedValue;
            SqlProductInventory.InsertParameters["Manufactured_Date"].DefaultValue = ManufacturedDateTextBox.Text.ToUpper().Trim();
            SqlProductInventory.InsertParameters["Created_Date"].DefaultValue = CreatedDateTextBox.Text.ToUpper().Trim();
            SqlProductInventory.InsertParameters["Product_SKU"].DefaultValue = ProductSKUTextBox.Text.ToUpper().Trim();
            SqlProductInventory.InsertParameters["Quantity"].DefaultValue = QuantityTextBox.Text.ToUpper().Trim();
            SqlProductInventory.Insert();
            SqlProductInventory.DataBind();
            PaneladdProductInventory.Visible = false;
            PanelgvProductInventory.Visible = true;
            InventoryIDDropDownList.SelectedIndex= -1;
            DesignIDDropDownList.SelectedIndex = -1;
            ManufacturedDateTextBox.Text = string.Empty;
            ProductIDDropDownList.SelectedIndex = -1;
            CreatedDateTextBox.Text = string.Empty;
            ProductSKUTextBox.Text = string.Empty;
            QuantityTextBox.Text = string.Empty;
        }

        protected void btnCancelProductInventory_Click(object sender, EventArgs e)
        {
            PaneladdProductInventory.Visible = false;
            PanelgvProductInventory.Visible = true;
        }
        protected void calManufacturedDate_SelectionChanged(object sender, EventArgs e)
        {
            ManufacturedDateTextBox.Text = calManufacturedDate.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calimgManufacturedDate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }
        protected void calCreatedDate_SelectionChanged(object sender, EventArgs e)
        {
            CreatedDateTextBox.Text = calCreatedDate.SelectedDate.ToShortDateString();
            Panel1.Visible = false;
        }

        protected void calimgCreatedDate_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = true;
        }
    }
}