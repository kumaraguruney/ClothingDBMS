using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.SalesManagement
{
    public partial class Ships : System.Web.UI.Page
    {
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            panelAddQuotation.Visible = true;
            panelSaveQuotation.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            SqlShips.InsertParameters["SPquantity"].DefaultValue = Quantity.Text;
            SqlShips.InsertParameters["Product_Id"].DefaultValue = dropProductId.SelectedValue;
            SqlShips.InsertParameters["Shipment_Id"].DefaultValue = dropShipmentID.SelectedValue;

            SqlShips.Insert();
            GridViewShips.DataBind();
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            Quantity.Text = string.Empty;
            dropProductId.SelectedIndex = 0;
            dropShipmentID.SelectedIndex = 0;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            Quantity.Text = string.Empty;
            dropProductId.SelectedIndex = 0;
            dropShipmentID.SelectedIndex = 0;
        }


    }
}