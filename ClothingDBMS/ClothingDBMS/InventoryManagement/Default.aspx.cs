using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnWarehouse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Warehouse.aspx");
        }

        protected void btnLocation_Click(object sender, EventArgs e)
        {
            Response.Redirect("Location.aspx");
        }

        protected void btnInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockPile.aspx");
        }

        protected void btnStock_Movement_Click(object sender, EventArgs e)
        {
            Response.Redirect("Stockmovement.aspx");
        }

        protected void btnStock_Reconciliation_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockReconciliation.aspx");
        }


    }
}