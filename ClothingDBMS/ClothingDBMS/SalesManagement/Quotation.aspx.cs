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
            SqlDataSourceQuotation.InsertParameters["Quotation_Date"].DefaultValue = txtQuotation.Text.Trim();

            SqlDataSourceQuotation.Insert();
            GridViewQuotation.DataBind();
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            txtQuotation.Text = string.Empty;
            txtQuotation.Text = string.Empty;
            dropCustomerId.SelectedIndex = 0;
      

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            txtQuotation.Text = string.Empty;
            dropCustomerId.SelectedIndex = 0;
        }


        protected void calQuotation_SelectionChanged(object sender, EventArgs e)
        {
            txtQuotation.Text = calQuotation.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calingQuotation_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }
    }
}