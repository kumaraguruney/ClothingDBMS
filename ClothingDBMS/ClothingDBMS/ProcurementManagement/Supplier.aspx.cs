using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Supplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddSupplier_Click(object sender, EventArgs e)
        {
            PaneladdSupplier.Visible = true;
            PanelgvSupplier.Visible = false;
        }

        protected void btnCancelSupplier_Click(object sender, EventArgs e)
        {
            PaneladdSupplier.Visible = false;
            PanelgvSupplier.Visible = true;

        }

        protected void btnSaveSupplier_Click(object sender, EventArgs e)
        {
            SqlSupplier.InsertParameters["Name"].DefaultValue = txtSupplierName.Text.ToUpper().Trim();
            SqlSupplier.InsertParameters["Address"].DefaultValue = txtSupplierAddress.Text.ToUpper().Trim();

            SqlSupplier.Insert();
            gvSupplier.DataBind();
            PaneladdSupplier.Visible = false;
            PanelgvSupplier.Visible = true;
            txtSupplierName.Text = string.Empty;
            txtSupplierAddress.Text = string.Empty;
            
        }
    }
}