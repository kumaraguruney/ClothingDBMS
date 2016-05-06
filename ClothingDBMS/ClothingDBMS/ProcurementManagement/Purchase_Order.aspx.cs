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

        protected void btnAddGoodsReceipt_Click(object sender, EventArgs e)
        {
            pnlAddPurchase_Order.Visible = true;
            pnlAddPurchase_Order.Visible = false;
        }

        protected void btnAddGoodsReceiptDB_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelAdd_Click(object sender, EventArgs e)
        {
            pnlAddPurchase_Order.Visible = false;
            pnlAddPurchase_Order.Visible = true;
        }
        protected void btnaddPurchase_Order_Click(object sender, EventArgs e)
        {
            pnlAddPurchase_Order.Visible = true;
            gvPurchase_Order.Visible = false;
        }

        protected void btnCancelPurchase_Order_Click(object sender, EventArgs e)
        {
            pnlAddPurchase_Order.Visible = false;
            pnlAddPurchase_Order.Visible = true;

        }

        protected void btnSaveGoods_Receipt_Click(object sender, EventArgs e)
        {
            SqlPurchase_Order.InsertParameters["Purchase_Date"].DefaultValue = txtPurchase_Date.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Supplier"].DefaultValue = DropDownSupplier_Name.SelectedValue;          
            SqlPurchase_Order.InsertParameters["RawMaterial"].DefaultValue = DropDownRawMaterial_Name.SelectedValue;
            SqlPurchase_Order.InsertParameters["Quantity"].DefaultValue = txtQuantity.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Shipping_Address"].DefaultValue = txtShipping_Address.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Unit_Price"].DefaultValue = txtUnit_Price.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Total"].DefaultValue = txtTotal.Text.ToUpper().Trim();
            SqlPurchase_Order.Insert();
            gvPurchase_Order.DataBind();
            pnlAddPurchase_Order.Visible = false;
            pnlAddPurchase_Order.Visible = true;
            txtPurchase_Date.Text = string.Empty;
            DropDownSupplier_Name.SelectedIndex = -1;
            DropDownRawMaterial_Name.SelectedIndex = -1;
            txtQuantity.Text = string.Empty;
            txtShipping_Address.Text = string.Empty;
            txtUnit_Price.Text = string.Empty;
            txtTotal.Text = string.Empty;
         
        }
    }

}
