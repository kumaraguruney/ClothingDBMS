using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class FinishedProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddFinishedProduct_Click(object sender, EventArgs e)
        {
            PaneladdFinishedProduct.Visible = true;
            PanelgvFinishedProduct.Visible = false;

        }

        protected void btnSaveFinishedProduct_Click(object sender, EventArgs e)
        {
            SqlFinishedProduct.InsertParameters["Product_ID"].DefaultValue = dropaddProduct.SelectedValue;
            SqlFinishedProduct.InsertParameters["Manufactured_Date"].DefaultValue = ManufacturedDateTextBox.Text.ToUpper().Trim();
            SqlFinishedProduct.InsertParameters["Quantity"].DefaultValue = QuantityTextBox.Text.ToUpper().Trim();

            SqlFinishedProduct.Insert();
            gvFinishedProduct.DataBind();
            PaneladdFinishedProduct.Visible = false;
            PanelgvFinishedProduct.Visible = true;
            dropaddProduct.SelectedIndex = -1;
            ManufacturedDateTextBox.Text = String.Empty;
            QuantityTextBox.Text = String.Empty;

        }

        protected void btnCancelFinishedProduct_Click(object sender, EventArgs e)
        {
            PaneladdFinishedProduct.Visible = false;
            PanelgvFinishedProduct.Visible = true;
        }
        protected void calManufacturedDate_SelectionChanged(object sender, EventArgs e)
        {
            ManufacturedDateTextBox.Text = calManufacturedDate.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calimgManufacturedDate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }
    }
}