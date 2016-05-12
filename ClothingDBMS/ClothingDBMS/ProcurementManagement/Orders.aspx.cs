using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddOrders_Click(object sender, EventArgs e)
        {
            PaneladdOrders.Visible = true;
            PanelgvOrders.Visible = false;
        }

        protected void btnCancelOrders_Click(object sender, EventArgs e)
        {
            PaneladdOrders.Visible = false;
            PanelgvOrders.Visible = true;

        }

        protected void btnSaveOrders_Click(object sender, EventArgs e)
        {
            SqlOrders.InsertParameters["PurchaseOrder_ID"].DefaultValue = PurchaseOrder_IDDropDownList.SelectedValue;
            SqlOrders.InsertParameters["RawMaterial_ID"].DefaultValue = PurchaseOrder_IDDropDownList.SelectedValue;
           

            SqlOrders.Insert();
            gvOrders.DataBind();
            PaneladdOrders.Visible = false;
            PanelgvOrders.Visible = true;
            RawMaterial_IDDropDownList.SelectedIndex = -1;
            PurchaseOrder_IDDropDownList.SelectedIndex = -1;
           
        }
    }

}
   