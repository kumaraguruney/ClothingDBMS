using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class ProcuredRawMaterial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddProcuredRawMaterial_Click(object sender, EventArgs e)
        {
            PaneladdProcuredRawMaterial.Visible = true;
            PanelgvProcuredRawMaterial.Visible = false;

        }

        protected void btnMoveProcuredRawMaterial_Click(object sender, EventArgs e)
        {
            SqlProcuredRawMaterial.InsertParameters["RawMaterial_ID"].DefaultValue = dropaddRawMaterial.SelectedValue;
            SqlProcuredRawMaterial.InsertParameters["Procured_Date"].DefaultValue = ProcuredDateTextBox.Text.ToUpper().Trim();
            SqlProcuredRawMaterial.InsertParameters["Quantity"].DefaultValue = QuantityTextBox.Text.ToUpper().Trim();
            SqlProcuredRawMaterial.InsertParameters["Available_Quantity"].DefaultValue = QuantityTextBox.Text.ToUpper().Trim();

            SqlProcuredRawMaterial.Insert();
            gvProcuredRawMaterial.DataBind();
            PaneladdProcuredRawMaterial.Visible = false;
            PanelgvProcuredRawMaterial.Visible = true;
            dropaddRawMaterial.SelectedIndex = -1;
            ProcuredDateTextBox.Text = String.Empty;
            QuantityTextBox.Text = String.Empty;

        }

        protected void btnCancelProcuredRawMaterial_Click(object sender, EventArgs e)
        {
            PaneladdProcuredRawMaterial.Visible = false;
            PanelgvProcuredRawMaterial.Visible = true;
        }
        protected void calProcuredDate_SelectionChanged(object sender, EventArgs e)
        {
            ProcuredDateTextBox.Text = calProcuredDate.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calimgProcuredDate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }
    }
}