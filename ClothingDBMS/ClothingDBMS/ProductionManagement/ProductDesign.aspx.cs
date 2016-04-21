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
            SqlDesign.InsertParameters["Design_Name"].DefaultValue = txtProductDesignName.Text.ToUpper().Trim();
            if (txtProductDesignSection.Text != null)
                SqlDesign.InsertParameters["Section"].DefaultValue = txtProductDesignSection.Text.ToUpper().Trim();
            else
                SqlDesign.InsertParameters["Section"].DefaultValue = null;
            if (txtProductDesignSize.Text != null)
                SqlDesign.InsertParameters["Size"].DefaultValue = txtProductDesignSize.Text.ToUpper().Trim();
            else
                SqlDesign.InsertParameters["Size"].DefaultValue = null;
            if (txtProductDesignColor.Text != null)
                SqlDesign.InsertParameters["Color"].DefaultValue = txtProductDesignColor.Text.ToUpper().Trim();
            else
                SqlDesign.InsertParameters["Color"].DefaultValue = null;
            SqlDesign.Insert();
            gvProductDesign.DataBind();
            PaneladdProductdesign.Visible = false;
            PanelgvProductDesign.Visible = true;
            txtProductDesignName.Text = string.Empty;
            txtProductDesignSection.Text = string.Empty;
            txtProductDesignSize.Text = string.Empty;
            txtProductDesignColor.Text = string.Empty;
        }
    }
}