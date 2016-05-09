using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSupplier_Click(object sender, EventArgs e)
        {
            Response.Redirect("Supplier.aspx");
        }

        protected void btnSupplier_Quotation_Click(object sender, EventArgs e)
        {
            Response.Redirect("Supplier_Quotation.aspx");
        }

 
        protected void btnProvides_Click(object sender, EventArgs e)
        {
            Response.Redirect("Provides.aspx");
        }

        protected void btnOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orders.aspx");
        }

        protected void btnPurchase_Order_Click(object sender, EventArgs e)
        {
            Response.Redirect("Purchase_Order.aspx");
        }

        protected void btnProcuredRawMaterial_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProcuredRawMaterial.aspx");
        }


        protected void btnUpdates_Click(object sender, EventArgs e)
        {
            Response.Redirect("Updates.aspx");
        }

        protected void btnGoods_Receipt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Goods_Receipt.aspx");
        }


    }
}