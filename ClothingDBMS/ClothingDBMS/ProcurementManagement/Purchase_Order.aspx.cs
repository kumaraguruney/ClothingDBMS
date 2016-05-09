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
            pnlAddPurchase_Order.Visible = true;
            PanelgvPurchase_Order.Visible = false;
        }

        protected void btnCancelPurchase_Order_Click(object sender, EventArgs e)
        {
            pnlAddPurchase_Order.Visible = false;
            PanelgvPurchase_Order.Visible = true;

        }

        protected void btnSavePurchase_Order_Click(object sender, EventArgs e)
        {
            SqlPurchase_Order.InsertParameters["Purchase_Date"].DefaultValue = txtPurchase_Order_Date.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Supplier_ID"].DefaultValue = DropDownSupplier_Name.SelectedValue;          
                       
            SqlPurchase_Order.InsertParameters["Shipping_Address"].DefaultValue = txtShipping_Address.Text.ToUpper().Trim();
            
            SqlPurchase_Order.InsertParameters["Total"].DefaultValue = txtTotal.Text.ToUpper().Trim();
            SqlPurchase_Order.Insert();
            gvPurchase_Order.DataBind();
            pnlAddPurchase_Order.Visible = false;
            PanelgvPurchase_Order.Visible = true;
            txtPurchase_Order_Date.Text = string.Empty;
            DropDownSupplier_Name.SelectedIndex = -1;
            txtShipping_Address.Text = string.Empty;
            txtTotal.Text = string.Empty;
         
        }
    }

}
