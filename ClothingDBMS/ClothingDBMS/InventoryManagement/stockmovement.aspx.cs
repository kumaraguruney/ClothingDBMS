using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class stockmovement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddstockmovement_Click(object sender, EventArgs e)
        {
            PaneladdStockMovement.Visible = true;
            PanelgvStockMovement.Visible = false;

        }

        protected void btnSaveStockMovement_Click(object sender, EventArgs e)
        {
            SqlStockMovement.InsertParameters["from_warehouse_id"].DefaultValue = FromWarehouseDropDownList.SelectedValue;
            SqlStockMovement.InsertParameters["to_warehouse_id"].DefaultValue = ToWarehouseDropDownList.SelectedValue;
            
            SqlStockMovement.Insert();
            gvStockMovement.DataBind();
            PaneladdStockMovement.Visible = false;
            PanelgvStockMovement.Visible = true;
            FromWarehouseDropDownList.SelectedIndex = -1;
            ToWarehouseDropDownList.SelectedIndex = -1;
        }

        protected void btnCancelStockMovement_Click(object sender, EventArgs e)
        {
            PaneladdStockMovement.Visible = false;
            PanelgvStockMovement.Visible = true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}