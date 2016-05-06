using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddProvides_Click(object sender, EventArgs e)
        {
            PaneladdProvides.Visible = true;
            PanelgvProvides.Visible = false;
        }

        protected void btnCancelProvides_Click(object sender, EventArgs e)
        {
            PaneladdProvides.Visible = false;
            PanelgvProvides.Visible = true;

        }

        protected void btnSaveProvides_Click(object sender, EventArgs e)
        {
            SqlProvides.InsertParameters["Quotation_ID"].DefaultValue = DropDownQuotation_ID.SelectedValue;
            SqlProvides.InsertParameters["RawMaterial_ID"].DefaultValue = DropDownRawMaterial_ID.SelectedValue;
            SqlProvides.InsertParameters["Unit_Price"].DefaultValue = txtUnit_Price.Text.ToUpper().Trim();
            SqlProvides.InsertParameters["Quantity"].DefaultValue = txtQuantity.Text.ToUpper().Trim();
            SqlProvides.Insert();
            gvProvides.DataBind();
            PaneladdProvides.Visible = false;
            PanelgvProvides.Visible = true;
            txtUnit_Price.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            DropDownQuotation_ID.SelectedIndex = -1;
            DropDownRawMaterial_ID.SelectedIndex = -1;

        }
    }

    }