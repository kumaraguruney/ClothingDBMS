using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Supplier_Quotation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddSupplier_Quotation_Click(object sender, EventArgs e)
        {
            PaneladdSupplier_Quotation.Visible = true;
            PanelgvSupplier_Quotation.Visible = false;
        }

        protected void btnCancelSupplier_Quotation_Click(object sender, EventArgs e)
        {
            PaneladdSupplier_Quotation.Visible = false;
            PanelgvSupplier_Quotation.Visible = true;

        }

        protected void btnSaveSupplier_Quotation_Click(object sender, EventArgs e)
        {
            SqlSupplier_Quotation.InsertParameters["Item_Code"].DefaultValue = txtSupplier_QuotationName.Text.ToUpper().Trim();
            SqlSupplier_Quotation.InsertParameters["unit_price"].DefaultValue = txtSupplier_QuotationAddress.Text.ToUpper().Trim();

            SqlSupplier_Quotation.Insert();
            gvSupplier_Quotation.DataBind();
            PaneladdSupplier_Quotation.Visible = false;
            PanelgvSupplier_Quotation.Visible = true;
            txtSupplier_QuotationName.Text = string.Empty;
            txtSupplier_QuotationAddress.Text = string.Empty;

        }

    }
}