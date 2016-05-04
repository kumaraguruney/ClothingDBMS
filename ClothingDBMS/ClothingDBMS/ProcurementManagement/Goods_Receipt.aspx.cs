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
            PaneladdGoods_Receipt.Visible = true;
            PanelgvGoods_Receipt.Visible = false;
        }

        protected void btnCancelGoods_Receipt_Click(object sender, EventArgs e)
        {
            PaneladdGoods_Receipt.Visible = false;
            PanelgvGoods_Receipt.Visible = true;

        }

        protected void btnSaveGoods_Receipt_Click(object sender, EventArgs e)
        {
            SqlGoods_Receipt.InsertParameters["Name"].DefaultValue = txtGoods_ReceiptName.Text.ToUpper().Trim();
            SqlGoods_Receipt.InsertParameters["Address"].DefaultValue = txtGoods_ReceiptAddress.Text.ToUpper().Trim();

            SqlGoods_Receipt.Insert();
            gvGoods_Receipt.DataBind();
            PaneladdGoods_Receipt.Visible = false;
            PanelgvGoods_Receipt.Visible = true;
            txtGoods_ReceiptName.Text = string.Empty;
            txtGoods_ReceiptAddress.Text = string.Empty;

        }
    }

}
   