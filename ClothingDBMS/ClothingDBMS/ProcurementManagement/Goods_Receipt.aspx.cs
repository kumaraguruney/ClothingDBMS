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
            SqlPurchase_Order.InsertParameters["PurchaseOrder_ID"].DefaultValue = DropDownPurchaseOrder_ID.SelectedValue;
            SqlGoods_Receipt.InsertParameters["Receipt_Date"].DefaultValue = txtReceiptDate.Text.ToUpper().Trim();
            SqlGoods_Receipt.Insert();
            gvGoods_Receipt.DataBind();
            pnlAddGoodsReceipt.Visible = false;
            pnlGoodsReceipt.Visible = true;
            DropDownPurchaseOrder_ID.SelectedIndex = -1;
            txtReceiptDate.Text = string.Empty;


        }
    }

}
   