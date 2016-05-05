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
        protected void btnaddGoods_Receipt_Click(object sender, EventArgs e)
        {
            pnlAddPurchase_Order.Visible = true;
            pnlAddPurchase_Order.Visible = false;
        }

        protected void btnCancelGoods_Receipt_Click(object sender, EventArgs e)
        {
            pnlAddPurchase_Order.Visible = false;
            pnlAddPurchase_Order.Visible = true;

     

        protected void btnSaveGoods_Receipt_Click(object sender, EventArgs e)
        {
            SqlPurchase_Order.InsertParameters["Purchase_Date"].DefaultValue = txtPurchase_Date.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Supplier_Name"].DefaultValue = txtSupplierName.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Supplier_ID"].DefaultValue = txtSupplier_ID.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["RawMaterial_ID"].DefaultValue = txtRawMaterial_ID.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Quantity"].DefaultValue = txtQuantity.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Shipping_Address"].DefaultValue = txtShipping_Address.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Unit_Price"].DefaultValue = txtUnit_Price.Text.ToUpper().Trim();
            SqlPurchase_Order.InsertParameters["Total"].DefaultValue = txtTotal.Text.ToUpper().Trim();

            SqlPurchase_Order.Insert();
            gvPurchase_Order.DataBind();
            pnlAddPurchase_Order.Visible = false;
            pnlAddPurchase_Order.Visible = true;
            txtPurchase_Date.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            txtShipping_Address.Text = string.Empty;
            txtUnit_Price.Text = string.Empty;
            txtTotal.Text = string.Empty;
         
        }
    }

}