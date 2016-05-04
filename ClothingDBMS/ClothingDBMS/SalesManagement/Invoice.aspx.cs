using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesManagement.Sales
{
    public partial class Invoice1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            panelAddInvoice.Visible = true;
            panelSaveInvoice.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlDataSourceInvoice.InsertParameters["Shipment_Id"].DefaultValue = dropShipmentId.SelectedValue;
            SqlDataSourceInvoice.InsertParameters["Sorder_Number"].DefaultValue = dropSorderNumber.SelectedValue;
            SqlDataSourceInvoice.InsertParameters["Product_Id"].DefaultValue = dropProductId.SelectedValue;
            SqlDataSourceInvoice.InsertParameters["Payment_Id"].DefaultValue = dropPaymentId.SelectedValue;
            SqlDataSourceInvoice.Insert();
            GridViewInvoice.DataBind();
            panelAddInvoice.Visible = false;
            panelSaveInvoice.Visible = true;
            dropShipmentId.SelectedIndex = 0;
            dropSorderNumber.SelectedIndex = 0;
            dropPaymentId.SelectedIndex = 0;
            dropProductId.SelectedIndex = 0;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddInvoice.Visible = false;
            panelSaveInvoice.Visible = true;
        }

    
    }
}