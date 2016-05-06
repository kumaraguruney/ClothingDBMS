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
            SqlDataSourceShipment.InsertParameters["Shipment_Date"].DefaultValue = txtShip.Text.Trim();
            SqlDataSourceShipment.InsertParameters["Due_Date"].DefaultValue = txtDue.Text.Trim();
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



        protected void calShipDate_SelectionChanged(object sender, EventArgs e)
        {
            txtShip.Text = calShip.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calingShip_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }

        protected void calDueDate_SelectionChanged(object sender, EventArgs e)
        {
            txtDue.Text = calDue.SelectedDate.ToShortDateString();
            calpanel1.Visible = false;
        }

        protected void calingDue_Click(object sender, ImageClickEventArgs e)
        {
            calpanel1.Visible = true;
        }
    }
}