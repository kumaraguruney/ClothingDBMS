using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Goods_Receipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddGoodsReceipt_Click(object sender, EventArgs e)
        {
            pnlAddGoodsReceipt.Visible = true;
            pnlGoodsReceipt.Visible = false;
        }

        protected void btnAddGoodsReceiptDB_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelAdd_Click(object sender, EventArgs e)
        {
            pnlAddGoodsReceipt.Visible = false;
            pnlGoodsReceipt.Visible = true;
        }
        protected void btnaddGoods_Receipt_Click(object sender, EventArgs e)
        {
            pnlAddGoodsReceipt.Visible = true;
            pnlGoodsReceipt.Visible = false;
        }

        protected void btnCancelGoods_Receipt_Click(object sender, EventArgs e)
        {
            pnlAddGoodsReceipt.Visible = false;
            pnlGoodsReceipt.Visible = true;

        }

        protected void btnSaveGoods_Receipt_Click(object sender, EventArgs e)
        {
            SqlGoods_Receipt.InsertParameters["Purchase_Order_ID"].DefaultValue = txtPurchase_Order_ID.Text.ToUpper().Trim();
            SqlGoods_Receipt.InsertParameters["Receipt_Date"].DefaultValue = txtReceiptDate.Text.ToUpper().Trim();
            SqlGoods_Receipt.InsertParameters["Supplier_Name"].DefaultValue = txtSupplierName.Text.ToUpper().Trim();
            SqlGoods_Receipt.InsertParameters["Delivery_Location"].DefaultValue = txtDeliveryLocation.Text.ToUpper().Trim();
            SqlGoods_Receipt.InsertParameters["Item_Code"].DefaultValue = txtItemCode.Text.ToUpper().Trim();
            SqlGoods_Receipt.InsertParameters["Delivered_Quantity"].DefaultValue = txtDeliveredQty.Text.ToUpper().Trim();
            SqlGoods_Receipt.InsertParameters["Ordered_Quantity"].DefaultValue = txtOrderedQty.Text.ToUpper().Trim();
            SqlGoods_Receipt.InsertParameters["Unit_Price"].DefaultValue = txtUnitPrice.Text.ToUpper().Trim();
            SqlGoods_Receipt.InsertParameters["Total_Price"].DefaultValue = txtTotalPrice.Text.ToUpper().Trim();

            SqlGoods_Receipt.Insert();
            gvGoods_Receipt.DataBind();
            pnlAddGoodsReceipt.Visible = false;
            pnlGoodsReceipt.Visible = true;
            txtPurchase_Order_ID.Text = string.Empty;
            txtReceiptDate.Text = string.Empty;
            txtSupplierName.Text = string.Empty;
            txtDeliveryLocation.Text = string.Empty;
            txtItemCode.Text = string.Empty;
            txtDeliveredQty.Text = string.Empty;
            txtOrderedQty.Text = string.Empty;
            txtUnitPrice.Text = string.Empty;
            txtTotalPrice.Text = string.Empty;
      

        }
    }

}
   