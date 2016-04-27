using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class RawMaterial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btaddRawmaterial_Click(object sender, EventArgs e)
        {
            PaneladdRawMaterial.Visible = true;
            PanelgvRawmaterial.Visible = false;
        }

        protected void btnSaveRawmaterial_Click(object sender, EventArgs e)
        {
            SqlRawmaterial.InsertParameters["Rawmaterial_Name"].DefaultValue = txtRawmaterialName.Text.ToUpper().Trim();
            SqlRawmaterial.InsertParameters["Rawmaterial_Color"].DefaultValue = dropRawmaterialcolor.SelectedValue;
            SqlRawmaterial.InsertParameters["Rawmaterial_Description"].DefaultValue = txtRawmaterialDescription.Text.ToUpper().Trim();
            SqlRawmaterial.Insert();
            gvRawmaterial.DataBind();
            PaneladdRawMaterial.Visible = false;
            PanelgvRawmaterial.Visible = true;
            txtRawmaterialName.Text = string.Empty;
            txtRawmaterialDescription.Text = string.Empty;
            dropRawmaterialcolor.SelectedIndex = -1;
        }

        protected void btnCancelRawmaterial_Click(object sender, EventArgs e)
        {
            PaneladdRawMaterial.Visible = false;
            PanelgvRawmaterial.Visible = true;
        }
    }
}