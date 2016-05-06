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

        protected void btnaddProduct_Click(object sender, EventArgs e)
        {
            PaneladdProduct.Visible = true;
            PanelgvProduct.Visible = false;
        }

        protected void btnCancelProduct_Click(object sender, EventArgs e)
        {
            PaneladdProduct.Visible = false;
            PanelgvProduct.Visible = true;
            txtProductDescription.Text = string.Empty;
            dropProductColor.SelectedIndex = -1;
            dropProductSize.SelectedIndex = -1;
            dropDesignName.SelectedIndex = -1;
        }

        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            SqlProduct.InsertParameters["Design_ID"].DefaultValue = dropDesignName.SelectedValue;
            if (txtProductDescription.Text != null)
                SqlProduct.InsertParameters["Product_Description"].DefaultValue = txtProductDescription.Text.ToUpper().Trim();
            else
                SqlProduct.InsertParameters["Product_Description"].DefaultValue = null;
            SqlProduct.InsertParameters["Size"].DefaultValue = dropProductSize.SelectedValue;
            SqlProduct.InsertParameters["Color"].DefaultValue = dropProductColor.SelectedValue;
            
            SqlProduct.Insert();
            gvProduct.DataBind();
            PaneladdProduct.Visible = false;
            PanelgvProduct.Visible = true;
            
            txtProductDescription.Text = string.Empty;
            dropProductColor.SelectedIndex = -1;
            dropProductSize.SelectedIndex = -1;
            dropDesignName.SelectedIndex = -1;
        }

        
        protected void lnkRequireds_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            GridViewRow row = btn.NamingContainer as GridViewRow;
            string productid  = gvProduct.DataKeys[row.RowIndex].Values[0].ToString();
            Session["ProductID"] = productid;
            Response.Redirect("Require.aspx");
        }
    }
}