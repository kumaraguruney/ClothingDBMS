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
    }
}