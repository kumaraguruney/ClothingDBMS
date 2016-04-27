using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class Warehouse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnaddAllocates_Click(object sender, EventArgs e)
        {
            PaneladdAllocates.Visible = true;
            PanelgvWarehouse.Visible = false;
        }

        protected void btnSaveWarehouse_Click(object sender, EventArgs e)
        {
            SqlWarehouse.InsertParameters["Warehouse_Name"].DefaultValue = WarehouseNameTextBox.Text.ToUpper().Trim();
            SqlWarehouse.InsertParameters["Warehouse_Address"].DefaultValue = WarehouseAddressTextBox.Text.ToUpper().Trim();
            SqlWarehouse.InsertParameters["contact_number"].DefaultValue = ContactNumberTextBox.Text.ToUpper().Trim();
            SqlWarehouse.Insert();
            gvAllocates.DataBind();
            PaneladdAllocates.Visible = false;
            PanelgvWarehouse.Visible = true;
            WarehouseAddressTextBox.Text = string.Empty;
            WarehouseNameTextBox.Text = string.Empty;
            ContactNumberTextBox.Text = string.Empty;
        }

        protected void btnCancelAllocates_Click(object sender, EventArgs e)
        {
            PaneladdAllocates.Visible = false;
            PanelgvWarehouse.Visible = true;
        }
    }
}