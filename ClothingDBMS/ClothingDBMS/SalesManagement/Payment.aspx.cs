using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesManagement.Sales
{
    public partial class Payment1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            panelAddPayment.Visible = true;
            panelSavePayment.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlDataSourcePayment.InsertParameters["Acct_Id"].DefaultValue = Acct_Id.Text;
            SqlDataSourcePayment.InsertParameters["Status_Info"].DefaultValue = PaymentStatus.SelectedValue;
            SqlDataSourcePayment.InsertParameters["Payment_Date"].DefaultValue = txtPayment.Text.Trim();
            SqlDataSourcePayment.Insert();
            GridViewPayment.DataBind();
            panelAddPayment.Visible = false;
            panelSavePayment.Visible = true;
            Acct_Id.Text = string.Empty;
            PaymentStatus.SelectedIndex = -1;
            txtPayment.Text = string.Empty;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddPayment.Visible = false;
            panelSavePayment.Visible = true;
        }

        protected void calPayment_SelectionChanged(object sender, EventArgs e)
        {
            txtPayment.Text = calPayment.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calingPayment_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }
    }
}