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
            SqlProvides.InsertParameters["Prvd_ID"].DefaultValue = txtPrvd_ID.Text.ToUpper().Trim();
            SqlProvides.InsertParameters["Quotation_ID"].DefaultValue = txtQuotation_ID.Text.ToUpper().Trim();
            SqlProvides.InsertParameters["RawMaterial_ID"].DefaultValue = txtRawMaterial_ID.Text.ToUpper().Trim();

            SqlProvides.Insert();
            gvSupplies.DataBind();
            PaneladdProvides.Visible = false;
            PanelgvProvides.Visible = true;
            txtPrvd_ID.Text = string.Empty;
            txtQuotation_ID.Text = string.Empty;
            txtRawMaterial_ID.Text = string.Empty;

        }
    }

    }