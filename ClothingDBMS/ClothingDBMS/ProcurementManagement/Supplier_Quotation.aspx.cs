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
            SqlSupplier_Quotation.InsertParameters["Supplier_Id"].DefaultValue = DropDownSupplier_Name.SelectedValue;
            SqlSupplier_Quotation.Insert();
            gvSupplier_Quotation.DataBind();
            PaneladdSupplier_Quotation.Visible = false;
            PanelgvSupplier_Quotation.Visible = true;
            DropDownSupplier_Name.SelectedIndex = -1;

        }

    }
}