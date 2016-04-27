using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btaddProduct_Click(object sender, EventArgs e)
        {
            PaneladdProduct.Visible = true;
            PanelgvProduct.Visible = false;
        }

        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            SqlProduct.InsertParameters["Product_Name"].DefaultValue = txtProductName.Text.ToUpper().Trim();
            SqlProduct.InsertParameters["Product_Is_Active"].DefaultValue = rbProductActive.SelectedValue;
            SqlProduct.InsertParameters["Product_Section"].DefaultValue = dropSection.SelectedValue;
            SqlProduct.Insert();
            gvProduct.DataBind();
            PaneladdProduct.Visible = false;
            PanelgvProduct.Visible = true;
            txtProductName.Text = string.Empty;
            rbProductActive.SelectedIndex = -1;
            dropSection.SelectedIndex = -1;
        }

        protected void btnCancelProduct_Click(object sender, EventArgs e)
        {
            PaneladdProduct.Visible = false;
            PanelgvProduct.Visible = true;
        }
    }
}