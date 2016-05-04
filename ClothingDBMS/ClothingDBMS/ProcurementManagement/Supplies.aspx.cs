using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Material_Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddsupplies_Click(object sender, EventArgs e)
        {
            PaneladdSupplies.Visible = true;
            PanelgvSupplies.Visible = false;
        }

        protected void btnCancelsupplies_Click(object sender, EventArgs e)
        {
            PaneladdSupplies.Visible = false;
            PanelgvSupplies.Visible = true;

        }

        protected void btnSavesupplies_Click(object sender, EventArgs e)
        {
            SqlSupplies.InsertParameters["Supplier_ID"].DefaultValue = txtSupplies_ID.Text.ToUpper().Trim();
            SqlSupplies.InsertParameters["RawMaterial_ID"].DefaultValue = txtRawMaterial_ID.Text.ToUpper().Trim();

            SqlSupplies.Insert();
            gvSupplies.DataBind();
            PaneladdSupplies.Visible = false;
            PanelgvSupplies.Visible = true;
            txtSupplies_ID.Text = string.Empty;
            txtRawMaterial_ID.Text = string.Empty;

        }
    }
}

