using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.SalesManagement
{
    public partial class Contains : System.Web.UI.Page
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

            SqlContains.InsertParameters["QOquantity"].DefaultValue = Quantity.Text;
            SqlContains.InsertParameters["SOquantity"].DefaultValue = Quantity.Text;
            SqlContains.InsertParameters["Product_Id"].DefaultValue = dropProductId.SelectedValue;
            SqlContains.InsertParameters["Quotation_Number"].DefaultValue = (string)Session["Quotation_number"];

            SqlContains.Insert();
            GridViewQuotation.DataBind();
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            Quantity.Text = string.Empty;
            dropProductId.SelectedIndex = -1;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            Quantity.Text = string.Empty;
            dropProductId.SelectedIndex = -1;
        }

        int total = 0;
        protected void girdview_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "TotalPrice"));
            }
            lblTotalAmount.Text = total.ToString();
        }

    }
}