using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ProductionManagement.ProductionManagement
{
    public partial class Workorder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddWorkOrder_Click(object sender, EventArgs e)
        {
            PaneladdWorkorder.Visible = true;
            PanelgvWorkOrder.Visible = false;
        }

        protected void btnSaveWorkOrder_Click(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            SqlWorkorder.InsertParameters["Product_ID"].DefaultValue = dropaddProduct.SelectedValue;
            SqlWorkorder.InsertParameters["Product_Quantity"].DefaultValue = txtProductQuantity.Text;
            SqlWorkorder.InsertParameters["DueDate"].DefaultValue = txtWorkorderDueDate.Text.Trim();
            SqlWorkorder.InsertParameters["Submitted_By"].DefaultValue = txtWorkorderSubmittedBy.Text.ToUpper();
            SqlWorkorder.InsertParameters["CreatedDate"].DefaultValue = dt.ToString();
            SqlWorkorder.Insert();
            gvWorkOrder.DataBind();
            PaneladdWorkorder.Visible = false;
            PanelgvWorkOrder.Visible = true;
            txtProductQuantity.Text = string.Empty;
            txtWorkorderDueDate.Text = string.Empty;
            txtWorkorderSubmittedBy.Text = string.Empty;
            dropaddProduct.SelectedIndex = -1 ;
        }

        protected void btnCancelWorkOrder_Click(object sender, EventArgs e)
        {
            PaneladdWorkorder.Visible = false;
            PanelgvWorkOrder.Visible = true;
            txtProductQuantity.Text = string.Empty;
            txtWorkorderDueDate.Text = string.Empty;
            txtWorkorderSubmittedBy.Text = string.Empty;
            dropaddProduct.SelectedIndex = -1;
        }

        protected void calWorkorderdue_SelectionChanged(object sender, EventArgs e)
        {
            txtWorkorderDueDate.Text = calWorkorderdue.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void coeWorkorderDueDate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }

        protected void lnkRequireds_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            GridViewRow row = btn.NamingContainer as GridViewRow;
            string workorderid = gvWorkOrder.DataKeys[row.RowIndex].Values[0].ToString();
            SqlData.SelectCommand = "SELECT Product_ID FROM WorkOrder where WorkOrder_ID ='" + workorderid +"'";
            DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
            DataView dvView = new DataView();
            dvView = (DataView)SqlData.Select(dsArguments);
            string productid = dvView[0].Row["Product_ID"].ToString();
            Session["ProductID"] = productid;
            Response.Redirect("Require.aspx");
        }
    }
}