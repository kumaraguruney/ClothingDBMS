using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.SalesManagement
{
    public partial class ListingPrice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            panelAddQuotation.Visible = true;
            panelSaveQuotation.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            SqlProduct.UpdateParameters["Price"].DefaultValue = txtPrice.Text;
            SqlProduct.UpdateParameters["Product_Id"].DefaultValue = dropProductName.SelectedValue;

            SqlProduct.Update();
            GridViewProduct.DataBind();
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            txtPrice.Text = string.Empty;
            dropProductName.SelectedIndex = 0;
          }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            lblPrice.Text = string.Empty;
            dropProductName.SelectedIndex = 0;
            
        }


    }
}