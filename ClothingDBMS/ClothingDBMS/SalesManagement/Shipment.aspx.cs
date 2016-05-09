using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ClothingDBMS.SalesManagement
{
    public partial class Shipment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdateInv_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            GridViewRow row = btn.NamingContainer as GridViewRow;
            string pk = GridViewSalesOrder.DataKeys[row.RowIndex].Values[0].ToString();
            Session["Quotation_number"] = pk;
            Response.Redirect("ships.aspx");


        }
        protected void btnUpdateShip_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            GridViewRow row = btn.NamingContainer as GridViewRow;
            string pk = GridViewSalesOrder.DataKeys[row.RowIndex].Values[0].ToString();
            Session["Quotation_number"] = pk;

            SqlData.SelectCommand = "SELECT Quotes_ID From Quotes where ISNULL(Is_InventoryUpd,0) = 'false' and Quotes.Quotation_Number='"+ pk + "'";
            DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
            DataView dvView = new DataView();
            dvView = (DataView)SqlData.Select(dsArguments);
            int count = dvView.Count;
            if (count == 0)
            {
                SqlQuotationUpdate.UpdateParameters["Is_Shipped"].DefaultValue = "TRUE";
                SqlQuotationUpdate.UpdateParameters["Quotation_Number"].DefaultValue = pk;
                SqlQuotationUpdate.Update();
                GridViewSalesOrder.DataBind();
            }
            else
                Response.Redirect("Ships.aspx");



        }
    }
}