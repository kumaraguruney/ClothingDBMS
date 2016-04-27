using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesManagement.Sales
{
    public partial class Quotation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            panelAddQuotation.Visible = true;
            panelSaveQuotation.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlDataSourceQuotation.InsertParameters["Customer_Id"].DefaultValue = dropCustomerId.SelectedValue;
            SqlDataSourceQuotation.InsertParameters["Product_Id"].DefaultValue = dropProductId.SelectedValue;
            SqlDataSourceQuotation.InsertParameters["Quantity"].DefaultValue = Quantity.Text;
            SqlDataSourceQuotation.Insert();
            GridViewQuotation.DataBind();
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            Quantity.Text = string.Empty;
            dropCustomerId.SelectedIndex = 0;
            dropProductId.SelectedIndex = 0;


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
        }
    }
}