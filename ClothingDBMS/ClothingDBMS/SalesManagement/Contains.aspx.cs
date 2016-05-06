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

           
            SqlContains.InsertParameters["SOquantity"].DefaultValue = Quantity.Text;
            SqlContains.InsertParameters["Product_Id"].DefaultValue = dropProductId.SelectedValue;
            SqlContains.InsertParameters["Sorder_Number"].DefaultValue = dropQotationNum.SelectedValue;

            SqlContains.Insert();
            GridViewContains.DataBind();
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            Quantity.Text = string.Empty;
            dropProductId.SelectedIndex = 0;
            dropQotationNum.SelectedIndex = 0;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            panelAddQuotation.Visible = false;
            panelSaveQuotation.Visible = true;
            Quantity.Text = string.Empty;
            dropProductId.SelectedIndex = 0;
            dropQotationNum.SelectedIndex = 0;
        }

    }
}