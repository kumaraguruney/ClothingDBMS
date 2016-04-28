using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Design : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddDesign_Click(object sender, EventArgs e)
        {
            PaneladdDesign.Visible = true;
            PanelgvDesign.Visible = false;
        }

        protected void btnSaveDesign_Click(object sender, EventArgs e)
        {
            SqlDesign.InsertParameters["Design_Name"].DefaultValue = txtDesignName.Text.ToUpper().Trim();
            SqlDesign.InsertParameters["Design_Is_Active"].DefaultValue = rbDesignActive.SelectedValue;
            SqlDesign.InsertParameters["Design_Section"].DefaultValue = dropSection.SelectedValue;
            SqlDesign.Insert();
            gvDesign.DataBind();
            PaneladdDesign.Visible = false;
            PanelgvDesign.Visible = true;
            txtDesignName.Text = string.Empty;
            rbDesignActive.SelectedIndex = -1;
            dropSection.SelectedIndex = -1;
        }

        protected void btnCancelDesign_Click(object sender, EventArgs e)
        {
            PaneladdDesign.Visible = false;
            PanelgvDesign.Visible = true;
        }
    }
}