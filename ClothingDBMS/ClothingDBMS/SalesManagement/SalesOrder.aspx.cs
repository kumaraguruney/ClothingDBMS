using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesManagement.Sales
{
    public partial class SalesOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            panelAddSalesOrder.Visible = true;
            panelSaveSalesOrder.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlDataSourceSalesOrder.InsertParameters["Quotation_Number"].DefaultValue = dropQuotationNumber.SelectedValue;
            SqlDataSourceSalesOrder.InsertParameters["Product_Id"].DefaultValue = dropProductId.SelectedValue;
            SqlDataSourceSalesOrder.InsertParameters["Design_Id"].DefaultValue = dropDesignId.SelectedValue;
            SqlDataSourceSalesOrder.InsertParameters["Sorder_Date"].DefaultValue = txtSODate.Text.Trim();
            SqlDataSourceSalesOrder.InsertParameters["Due_Date"].DefaultValue = txtSODueDate.Text.Trim();
            SqlDataSourceSalesOrder.InsertParameters["Quantity"].DefaultValue = Quantity.Text;
            SqlDataSourceSalesOrder.InsertParameters["Late_Fee"].DefaultValue = LateFee.Text.Trim();
            SqlDataSourceSalesOrder.Insert();
            GridViewSalesOrder.DataBind();
            panelAddSalesOrder.Visible = false;
            panelSaveSalesOrder.Visible = true;
            dropQuotationNumber.SelectedIndex = 0;
            dropProductId.SelectedIndex = 0;
            dropDesignId.SelectedIndex = 0;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddSalesOrder.Visible = false;
            panelSaveSalesOrder.Visible = true;
        }
        protected void calSODueDate_SelectionChanged(object sender, EventArgs e)
        {
            txtSODueDate.Text = calDueDate.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calingSODueDate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }


        protected void calSODate_SelectionChanged(object sender, EventArgs e)
        {
            txtSODate.Text = calSODate.SelectedDate.ToShortDateString();
            calpanel1.Visible = false;
        }

        protected void calingSODate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel1.Visible = true;
        }
    }
}