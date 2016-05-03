using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Purchase_Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddPurchase_Order_Click(object sender, EventArgs e)
        {
            PaneladdPurchase_Order.Visible = true;
            PanelgvPurchase_Order.Visible = false;
        }

        protected void btnCancelPurchase_Order_Click(object sender, EventArgs e)
        {
            PaneladdPurchase_Order.Visible = false;
            PanelgvPurchase_Order.Visible = true;

        }

        protected void btnSavePurchase_Order_Click(object sender, EventArgs e)
        {
            SqlPurchase_Order.InsertParameters["Item_Code"].DefaultValue = txtPurchase_OrderName.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["unit_price"].DefaultValue = txtPurchase_OrderAddress.Text.ToUpper().Trim();

            SqlPurchase_Order.Insert();
            gvPurchase_Order.DataBind();
            PaneladdPurchase_Order.Visible = false;
            PanelgvPurchase_Order.Visible = true;
            txtPurchase_OrderName.Text = string.Empty;
            txtPurchase_OrderAddress.Text = string.Empty;

        }

    }
}