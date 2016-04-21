using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            SqlWorkorder.InsertParameters["Design_ID"].DefaultValue = dropDesign.SelectedValue;
            SqlWorkorder.InsertParameters["Product_Quantity"].DefaultValue = txtProductQuantity.Text;
            DateTime DueDate = DateTime.ParseExact(txtWorkorderDueDate.Text, "MM/dd/yyyy", null);
            SqlWorkorder.InsertParameters["DueDate"].DefaultValue = DueDate.ToString();
            SqlWorkorder.InsertParameters["Submitted_By"].DefaultValue = txtWorkorderSubmittedBy.Text;
            SqlWorkorder.InsertParameters["CreatedDate"].DefaultValue = dt.ToString();
            SqlWorkorder.Insert();
            gvWorkOrder.DataBind();
            PaneladdWorkorder.Visible = false;
            PanelgvWorkOrder.Visible = true;
            txtProductQuantity.Text = string.Empty;
            txtWorkorderDueDate.Text = string.Empty;
            txtWorkorderSubmittedBy.Text = string.Empty;
            dropDesign.SelectedIndex = 0 ;
        }

        protected void btnCancelWorkOrder_Click(object sender, EventArgs e)
        {
            PaneladdWorkorder.Visible = false;
            PanelgvWorkOrder.Visible = true;
        }
    }
}