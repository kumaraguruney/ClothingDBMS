using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ClothingDBMS.InventoryManagement
{
    public partial class stockmovement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void btnaddstockmovement_Click(object sender, EventArgs e)
        {
            PaneladdStockMovement.Visible = true;
            Panel1.Visible = true;
            PanelgvStockMovement.Visible = false;

        }

        protected void btnMoveStockMovement_Click(object sender, EventArgs e)
        {
            
            string strBatchID = ProductDropDownList.SelectedValue;
            string strWarehouseID = FromWarehouseDropDownList.SelectedValue;
            string strLocationID = FromLocationDropDownList.SelectedValue;
            string strIsProduct = rbIs_Product.SelectedValue;

            SqlStockPile.InsertParameters["Batch_ID"].DefaultValue = ProductDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Warehouse_ID"].DefaultValue = TowarehouseDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Location_ID"].DefaultValue = ToLocationDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Quantity"].DefaultValue = ToQuantityTextBox.Text.Trim();
            SqlStockPile.InsertParameters["Created_Date"].DefaultValue = System.DateTime.Now.ToShortDateString();
            SqlStockPile.InsertParameters["Is_Product"].DefaultValue = rbIs_Product.SelectedValue;
            SqlStockPile.Insert();

            SqlData.SelectCommand = "SELECT  StockPile.Quantity, StockPile.Created_Date FROM StockPile INNER JOIN FinishedProduct ON FinishedProduct.Batch_ID = StockPile.Batch_ID AND StockPile.Batch_ID ='" + strBatchID + "' AND StockPile.Warehouse_ID ='" + strWarehouseID + "' AND StockPile.Location_ID ='" + strLocationID + "' INNER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID INNER JOIN Location ON StockPile.Location_ID = Location.Location_ID";
            DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
            DataView dvView = new DataView();

            

            dvView = (DataView)SqlData.Select(dsArguments);
            string strQty = dvView[0].Row["Quantity"].ToString();
            string strCreatedDate = dvView[0].Row["Created_Date"].ToString();

            int intQty = Convert.ToInt32(strQty);
            int intToQty = Convert.ToInt32(ToQuantityTextBox.Text);
            if (intToQty != intQty)
            {

                dsArguments = new DataSourceSelectArguments();
                dvView = new DataView();
                SqlData.SelectCommand = "SELECT Entry_ID from StockPile where Batch_ID ='" + strBatchID + "' AND Warehouse_ID ='" + strWarehouseID + "' AND Location_ID ='" + strLocationID + "' AND Quantity ='" + strQty + "' and Is_Product ='" + strIsProduct + "'";
                dvView = (DataView)SqlData.Select(dsArguments);
                string EntryID = dvView[0].Row["Entry_ID"].ToString();
                SqlStockPile.UpdateParameters["Batch_ID"].DefaultValue = ProductDropDownList.SelectedValue;
                SqlStockPile.UpdateParameters["Warehouse_ID"].DefaultValue = FromWarehouseDropDownList.SelectedValue;
                SqlStockPile.UpdateParameters["Location_ID"].DefaultValue = FromLocationDropDownList.SelectedValue;
                SqlStockPile.UpdateParameters["Quantity"].DefaultValue = Convert.ToString(intQty - intToQty);
                SqlStockPile.UpdateParameters["Created_Date"].DefaultValue = strCreatedDate;
                SqlStockPile.UpdateParameters["Is_Product"].DefaultValue = rbIs_Product.SelectedValue;
                SqlStockPile.UpdateParameters["Entry_ID"].DefaultValue = EntryID;
                SqlStockPile.Update();

            }
            else
            {
                SqlData.SelectCommand = "SELECT Entry_ID from StockPile where Batch_ID ='" + strBatchID + "' AND Warehouse_ID ='" + strWarehouseID + "' AND Location_ID ='" + strLocationID + "' AND Quantity ='" + strQty + "' and Is_Product ='" + strIsProduct + "'";
                dvView = (DataView)SqlData.Select(dsArguments);
                string EntryID = dvView[0].Row["Quantity"].ToString();
                SqlStockPile.SelectCommand = "DELETE FROM [StockPile] WHERE [Entry_ID] ='" + EntryID;
                SqlStockPile.Delete();

            }

           
            gvStockMovement.DataBind();
            PaneladdStockMovement.Visible = false;
            Panel1.Visible = false;
            PanelgvStockMovement.Visible = true;
            TowarehouseDropDownList.SelectedIndex = -1;
            ToQuantityTextBox.Text = String.Empty;
            ToLocationDropDownList.SelectedIndex = -1;
        }

        protected void btnCancelStockMovement_Click(object sender, EventArgs e)
        {
            PaneladdStockMovement.Visible = false;
            PanelgvStockMovement.Visible = true;
        }

        protected void FromLocationDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strBatch = ProductDropDownList.SelectedValue;
            string strWarehouse = FromWarehouseDropDownList.SelectedValue;
            string strLocation = FromLocationDropDownList.SelectedValue;
            SqlData.SelectCommand = "SELECT  StockPile.Quantity FROM StockPile INNER JOIN FinishedProduct ON FinishedProduct.Batch_ID = StockPile.Batch_ID AND StockPile.Batch_ID ='" + strBatch + "' AND StockPile.Warehouse_ID ='" + strWarehouse + "' AND StockPile.Location_ID ='" + strLocation + "' INNER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID INNER JOIN Location ON StockPile.Location_ID = Location.Location_ID";
            DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
            DataView dvView = new DataView();
            string str = dvView.Count.ToString();
            dvView = (DataView)SqlData.Select(dsArguments);
            string strQty = dvView[0].Row["Quantity"].ToString();
            QuantityTextBox.Text = strQty;


            
        }

        protected void TowarehouseDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlLocation.SelectParameters["locationID"].DefaultValue = FromLocationDropDownList.SelectedValue;
        }
    }
}