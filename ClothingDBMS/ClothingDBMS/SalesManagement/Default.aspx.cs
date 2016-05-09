using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer.aspx");
        }

        protected void btnQuotation_Click(object sender, EventArgs e)
        {
            Response.Redirect("Quotation.aspx");
        }

        protected void btnSalesOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("SalesOrder.aspx");
        }

        protected void btnShipment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shipment.aspx");
        }

        protected void btnInvoice_Click(object sender, EventArgs e)
        {
            Response.Redirect("GenerateInvoice.aspx");
        }
        protected void btnPayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
}