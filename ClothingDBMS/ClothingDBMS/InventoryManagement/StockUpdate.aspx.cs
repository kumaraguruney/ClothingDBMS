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
        protected void btnaddStockUpdate_Click(object sender, EventArgs e)
        {
            PaneladdStockUpdate.Visible = true;
            PanelgvStockUpdate.Visible = false;
        }

        protected void btnSaveStockUpdate_Click(object sender, EventArgs e)
        {
            SqlStockUpdate.InsertParameters["Stock_Update_ID"].DefaultValue = StockUpdateTextBox.Text.ToUpper().Trim();
            SqlStockUpdate.InsertParameters["Stock_Movement_ID"].DefaultValue = StockMovementTextBox.Text.ToUpper().Trim();
            //SqlStockUpdate.InsertParameters["Quantity"].DefaultValue = QuantityTextBox.Text.ToUpper().Trim();
            SqlStockUpdate.Insert();
            gvStockUpdate.DataBind();
            PaneladdStockUpdate.Visible = false;
            PanelgvStockUpdate.Visible = true;
            StockUpdateTextBox.Text = string.Empty;
            StockMovementTextBox.Text = string.Empty;
            //QuantityTextBox.Text = string.Empty;
        }

        protected void btnCancelStockUpdate_Click(object sender, EventArgs e)
        {
            PaneladdStockUpdate.Visible = false;
            PanelgvStockUpdate.Visible = true;
        }
    }
}