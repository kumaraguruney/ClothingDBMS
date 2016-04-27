using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class ProductDesign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btaddProductdesign_Click(object sender, EventArgs e)
        {
            PaneladdProductdesign.Visible = true;
            PanelgvProductDesign.Visible = false;
        }

        protected void btnCancelProductDesign_Click(object sender, EventArgs e)
        {
            PaneladdProductdesign.Visible = false;
            PanelgvProductDesign.Visible = true;
        }

        protected void btnSaveProductDesign_Click(object sender, EventArgs e)
        {
            SqlDesign.InsertParameters["Product_ID"].DefaultValue = dropProductName.SelectedValue;
            if (txtProductDesignDescription.Text != null)
                SqlDesign.InsertParameters["Design_Description"].DefaultValue = txtProductDesignDescription.Text.ToUpper().Trim();
            else
                SqlDesign.InsertParameters["Design_Description"].DefaultValue = null;
            SqlDesign.InsertParameters["Size"].DefaultValue = dropProductSize.SelectedValue;
            SqlDesign.InsertParameters["Color"].DefaultValue = dropProductColor.SelectedValue;
            
            SqlDesign.Insert();
            gvProductDesign.DataBind();
            PaneladdProductdesign.Visible = false;
            PanelgvProductDesign.Visible = true;
            
            txtProductDesignDescription.Text = string.Empty;
            dropProductColor.SelectedIndex = -1;
            dropProductSize.SelectedIndex = -1;
            dropProductName.SelectedIndex = -1;
        }
    }
}