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

        }

        protected void btaddProductRequire_Click(object sender, EventArgs e)
        {
            PaneladdProductRequire.Visible = true;
            PanelgvProductRequire.Visible = false;
        }

        protected void btnSaveProductRequire_Click(object sender, EventArgs e)
        {
            if (dropDesign.SelectedValue != "-1")
                SqlRequires.InsertParameters["Design_ID"].DefaultValue = dropDesign.SelectedValue;
            else
                SetFocus(dropDesign);
            if (dropRawmaterial1.SelectedValue != "-1")
                SqlRequires.InsertParameters["Rawmaterial1_ID"].DefaultValue = dropRawmaterial1.SelectedValue;
            else
                SetFocus(dropRawmaterial1);
            if (txtProductRequireRawmaterial1Qty.Text != null)
                SqlRequires.InsertParameters["Rawmaterial1_Quantity"].DefaultValue = txtProductRequireRawmaterial1Qty.Text;
            else
                SetFocus(txtProductRequireRawmaterial1Qty);
            if (dropRawmaterial2.SelectedValue != "-1")
                SqlRequires.InsertParameters["Rawmaterial2_ID"].DefaultValue = dropRawmaterial2.SelectedValue;
            else
                SqlRequires.InsertParameters["Rawmaterial2_ID"].DefaultValue = null;
            if (txtProductRequiredRawmaterial2Qty.Text != null)
                SqlRequires.InsertParameters["Rawmaterial2_Quantity"].DefaultValue = txtProductRequiredRawmaterial2Qty.Text;
            else
                SqlRequires.InsertParameters["Rawmaterial2_Quantity"].DefaultValue = null;
            if (txtProductRequiredRawmaterial3Qty.Text != null)
                SqlRequires.InsertParameters["Rawmaterial3_Quantity"].DefaultValue = txtProductRequiredRawmaterial3Qty.Text;
            else
                SqlRequires.InsertParameters["Rawmaterial3_Quantity"].DefaultValue = null;
            if (txtProductRequiredRawmaterial4Qty.Text != null)
                SqlRequires.InsertParameters["Rawmaterial4_Quantity"].DefaultValue = txtProductRequiredRawmaterial4Qty.Text;
            else
                SqlRequires.InsertParameters["Rawmaterial4_Quantity"].DefaultValue = null;
            SqlRequires.Insert();
            gvProductRequire.DataBind();
            PaneladdProductRequire.Visible = false;
            PanelgvProductRequire.Visible = true;
            txtProductRequireRawmaterial1Qty.Text = string.Empty;
            txtProductRequiredRawmaterial2Qty.Text = string.Empty;
            txtProductRequiredRawmaterial3Qty.Text = string.Empty;
            txtProductRequiredRawmaterial4Qty.Text = string.Empty;
            dropDesign.SelectedIndex = 0;
            dropRawmaterial1.SelectedIndex = 0;
            dropRawmaterial2.SelectedIndex = 0;
            dropRawmaterial3.SelectedIndex = 0;
            dropRawmaterial4.SelectedIndex = 0;
        }

        protected void btnCancelProductRequire_Click(object sender, EventArgs e)
        {
            PaneladdProductRequire.Visible = false;
            PanelgvProductRequire.Visible = true;
        }
    }
}