using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Require : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ProductID"] == null )
            {
                Response.Redirect("Product.aspx");
            }
        }

        protected void btaddProductRequire_Click(object sender, EventArgs e)
        {
            PaneladdProductRequire.Visible = true;
            PanelgvProductRequire.Visible = false;
        }

        protected void btnSaveProductRequire_Click(object sender, EventArgs e)
        {
            SqlRequires.InsertParameters["Product_ID"].DefaultValue = (string)Session["ProductID"];
            SqlRequires.InsertParameters["RawMaterial_ID"].DefaultValue = dropRawmaterial.SelectedValue;
            SqlRequires.InsertParameters["RawMaterial_Quantity"].DefaultValue = txtRawmaterialQty.Text;
            
            SqlRequires.Insert();
            gvProductRequire.DataBind();
            SqlRequireDrop.DataBind();
            PaneladdProductRequire.Visible = false;
            PanelgvProductRequire.Visible = true;
            txtRawmaterialQty.Text = string.Empty;
            dropRawmaterial.SelectedIndex = -1;
            
        }

        protected void btnCancelProductRequire_Click(object sender, EventArgs e)
        {
            PaneladdProductRequire.Visible = false;
            PanelgvProductRequire.Visible = true;
            txtRawmaterialQty.Text = string.Empty;
            dropRawmaterial.SelectedIndex = -1;
        }

       
    }
}