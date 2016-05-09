using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.SalesManagement
{
    public partial class SalesOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void btnOpenQuotation_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            GridViewRow row = btn.NamingContainer as GridViewRow;
            string pk = GridViewSalesOrder.DataKeys[row.RowIndex].Values[0].ToString();
            Session["Quotation_number"] = pk;


            Response.Redirect("contains.aspx");

        }
    }
}