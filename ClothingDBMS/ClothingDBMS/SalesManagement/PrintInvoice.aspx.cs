using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ClothingDBMS.SalesManagement
{
    public partial class PrintInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlData.SelectCommand = "SELECT CUSTOMER.CUSTOMER_Name, (Customer.Address + ', ' + Customer.City + ', ' + Customer.State + ', ' + Customer.Zipcode+ ', ' + Customer.Email+ ', ' + Customer.Phone) as Address, Quotation.Shipment_Date  FROM QUOTATION JOIN CUSTOMER ON CUSTOMER.CUSTOMER_ID = QUOTATION.CUSTOMER_ID WHERE QUOTATION.QUOTATION_NUMBER ='" + Session["Quotation_number"]+"'";
            DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
            DataView dvView = new DataView();
            dvView = (DataView)SqlData.Select(dsArguments);
            //int count = dvView.Count;

            InvoiceNo.Text = (string)Session["Quotation_number"];
            //dvView = (DataView)SqlData.Select(dsArguments);
            //String strCustomerName = dvView[0].Row["Customer_Name"].ToString();
            //String strAddress = dvView[0].Row["Address"].ToString();
            //String strShipDate = dvView[0].Row["Shipment_Date"].ToString();
            
            //Customer_Name.Text = strCustomerName;
            
            //ShipmentAddress.Text = strAddress;
            //ShipmentDate.Text = strShipDate;
        }
    }
}