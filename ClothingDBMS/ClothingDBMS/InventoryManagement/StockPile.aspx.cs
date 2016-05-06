using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class StockPile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddStockPile_Click(object sender, EventArgs e)
        {
            PaneladdStockPile.Visible = true;
            PanelgvStockPile.Visible = false;

        }

        protected void btnSaveStockPile_Click(object sender, EventArgs e)
        {
            SqlStockPile.InsertParameters["Batch_ID"].DefaultValue = BatchIDDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Warehouse_ID"].DefaultValue = WarehouseIDDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Location_ID"].DefaultValue = LocationIDDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Quantity"].DefaultValue = QuantityTextBox.Text.ToUpper().Trim();
            SqlStockPile.InsertParameters["Created_Date"].DefaultValue = CreatedDateTextBox.Text.ToUpper().Trim();
            SqlStockPile.InsertParameters["Is_Product"].DefaultValue = rbStockPile.SelectedValue;
            SqlStockPile.Insert();
            gvStockPile.DataBind();
            PaneladdStockPile.Visible = false;
            PanelgvStockPile.Visible = true;
            BatchIDDropDownList.SelectedIndex = -1;
            WarehouseIDDropDownList.SelectedIndex = -1;
            LocationIDDropDownList.SelectedIndex = -1;
            QuantityTextBox.Text = String.Empty;
            CreatedDateTextBox.Text = String.Empty;

        }

        protected void btnCancelStockPile_Click(object sender, EventArgs e)
        {
            PaneladdStockPile.Visible = false;
            PanelgvStockPile.Visible = true;
        }
        protected void calCreatedDate_SelectionChanged(object sender, EventArgs e)
        {
            CreatedDateTextBox.Text = calCreatedDate.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calimgCreatedDate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }
    }
}