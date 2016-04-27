using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesManagement.Sales
{
    public partial class Shipment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            panelAddShipment.Visible = true;
            panelSaveShipment.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            SqlDataSourceShipment.InsertParameters["Customer_Id"].DefaultValue = dropCustomerId.SelectedValue;
            SqlDataSourceShipment.InsertParameters["Inventory_Id"].DefaultValue = dropInventoryId.SelectedValue;
            SqlDataSourceShipment.InsertParameters["Sorder_Number"].DefaultValue = dropSalesOrderNo.SelectedValue;
            SqlDataSourceShipment.Insert();
            GridViewShipment.DataBind();
            panelAddShipment.Visible = false;
            panelSaveShipment.Visible = true;
            dropCustomerId.SelectedIndex = 0;
            dropInventoryId.SelectedIndex = 0;
            dropSalesOrderNo.SelectedIndex = 0;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddShipment.Visible = false;
            panelSaveShipment.Visible = true;
        }
    }
}