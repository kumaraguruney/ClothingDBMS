using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SalesManagement.Sales
{
    public partial class Shipment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            string strBatch = BatchIDDropDownList.SelectedValue;
            string strWarehouse = WarehouseIDDropDownList.SelectedValue;
            string strLocation = LocationIDDropDownList.SelectedValue;

            SqlData.SelectCommand = "SELECT SUM(StockPile.Quantity) AS Quantity FROM StockPile INNER JOIN FinishedProduct ON FinishedProduct.Batch_ID = StockPile.Batch_ID AND StockPile.Batch_ID ='" + strBatch + "' AND StockPile.Warehouse_ID ='" + strWarehouse + "' AND StockPile.Location_ID ='" + strLocation + "' INNER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID INNER JOIN Location ON StockPile.Location_ID = Location.Location_ID";
            DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
            DataView dvView = new DataView();
            int count = dvView.Count;
            dvView = (DataView)SqlData.Select(dsArguments);
            string strQty = dvView[0].Row["Quantity"].ToString();

            SqlStockPile.InsertParameters["Batch_ID"].DefaultValue = BatchIDDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Warehouse_ID"].DefaultValue = WarehouseIDDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Location_ID"].DefaultValue = LocationIDDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Quantity"].DefaultValue = Convert.ToString(-Convert.ToInt32(QuantityTextBox1.Text));
            SqlStockPile.InsertParameters["Created_Date"].DefaultValue = System.DateTime.Today.ToShortDateString();
            SqlStockPile.InsertParameters["Is_Product"].DefaultValue = "True";
            SqlStockPile.InsertParameters["Quotation_Number"].DefaultValue = (string)Session["Quotation_number"];     
            SqlStockPile.Insert();
            

            SqlData.SelectCommand = "SELECT Quotes_ID FROM Quotes where Quotes.product_id ='" + dropProductId.SelectedValue +"' and Quotes.Quotation_Number ='"+ (string)Session["Quotation_number"]+"'";
            dsArguments = new DataSourceSelectArguments();
             dvView = new DataView();
            count = dvView.Count;
            dvView = (DataView)SqlData.Select(dsArguments);
            string strQuotesid = dvView[0].Row["Quotes_ID"].ToString();


            if (Convert.ToInt32(QuantityTextBox1.Text) <= Convert.ToInt32(strQty))
            {
                SqlContainsIsInventoryUpdated.UpdateParameters["Is_InventoryUpd"].DefaultValue = "True";
                SqlContainsIsInventoryUpdated.UpdateParameters["Shipped_Quantity"].DefaultValue = QuantityTextBox1.Text;
                SqlContainsIsInventoryUpdated.UpdateParameters["Quotes_ID"].DefaultValue = strQuotesid;
                SqlContainsIsInventoryUpdated.Update();
            }
            else
            {
                SqlContainsUpdate.UpdateParameters["Shipped_Quantity"].DefaultValue = QuantityTextBox1.Text;
                SqlContainsIsInventoryUpdated.UpdateParameters["Quotes_ID"].DefaultValue = strQuotesid;
                SqlContainsUpdate.Update();
            }

            GridViewQuotation.DataBind();
            QuantityTextBox1.Text = string.Empty;
            QuantityTextBox.Text = string.Empty;
            BatchIDDropDownList.SelectedIndex = -1;
            WarehouseIDDropDownList.SelectedIndex = -1;
            LocationIDDropDownList.SelectedIndex = -1;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            
        }

        protected void LocationIDDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strBatch = BatchIDDropDownList.SelectedValue;
            string strWarehouse = WarehouseIDDropDownList.SelectedValue;
            string strLocation = LocationIDDropDownList.SelectedValue;
            string strQty = null;
            if (strLocation != "-1")
            {
                SqlData.SelectCommand = "SELECT SUM(StockPile.Quantity) AS Quantity FROM StockPile INNER JOIN FinishedProduct ON FinishedProduct.Batch_ID = StockPile.Batch_ID AND StockPile.Batch_ID ='" + strBatch + "' AND StockPile.Warehouse_ID ='" + strWarehouse + "' AND StockPile.Location_ID ='" + strLocation + "' INNER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID INNER JOIN Location ON StockPile.Location_ID = Location.Location_ID";
                DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
                DataView dvView = new DataView();
                int count = dvView.Count;
                dvView = (DataView)SqlData.Select(dsArguments);
                strQty = dvView[0].Row["Quantity"].ToString();

            }
            QuantityTextBox.Text = strQty;
            QuantityTextBox1.MaxLength = Convert.ToInt32(strQty);
        }
    }
}