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
       
        protected void btnSave_Click(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            SqlDataSourceSalesOrder.UpdateParameters["Quotation_Number"].DefaultValue = (string)Session["Quotation_number"]; ;
            SqlDataSourceSalesOrder.UpdateParameters["Sorder_Date"].DefaultValue = dt.ToShortDateString();
            SqlDataSourceSalesOrder.UpdateParameters["SOrderDue_Date"].DefaultValue = txtSODueDate.Text.Trim();
            SqlDataSourceSalesOrder.UpdateParameters["Is_SO"].DefaultValue = "True";
            SqlDataSourceSalesOrder.UpdateParameters["Late_Fee"].DefaultValue = LateFee.Text.Trim();
            SqlDataSourceSalesOrder.Update();

            txtSODueDate.Text = string.Empty;
            LateFee.Text= string.Empty;
            Response.Redirect("SalesOrder.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtSODueDate.Text = string.Empty;
            LateFee.Text = string.Empty;
            Response.Redirect("SalesOrder.aspx");

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


    }
}