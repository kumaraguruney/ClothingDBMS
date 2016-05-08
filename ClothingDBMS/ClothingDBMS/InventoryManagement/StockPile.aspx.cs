using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ClothingDBMS.InventoryManagement
{
    public partial class StockPile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddStockPile_Click(object sender, EventArgs e)
        {
            PaneladdStockPile.Visible = true;
            PanelgvStockPile.Visible = false;

        }

        protected void btnSaveStockPile_Click(object sender, EventArgs e)
        {
            if (rbStockPile.SelectedValue == "true")
                SqlData.SelectCommand = "SELECT Available_Quantity FROM FinishedProduct WHERE Batch_ID =" + BatchIDDropDownList.SelectedValue;
            else
                SqlData.SelectCommand = "SELECT Available_Quantity FROM ProcuredRawMaterial WHERE Batch_ID =" + BatchIDDropDownList.SelectedValue;

            DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
            DataView dvView = new DataView();
            string str = dvView.Count.ToString();
            dvView = (DataView)SqlData.Select(dsArguments);
            string strAvailableQty = dvView[0].Row["Available_Quantity"].ToString();
            AvailableQuantityTextBox.Text = strAvailableQty;

            SqlStockPile.InsertParameters["Batch_ID"].DefaultValue = BatchIDDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Warehouse_ID"].DefaultValue = WarehouseIDDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Location_ID"].DefaultValue = LocationIDDropDownList.SelectedValue;
            SqlStockPile.InsertParameters["Quantity"].DefaultValue = QuantityTextBox.Text.ToUpper().Trim();
            SqlStockPile.InsertParameters["Created_Date"].DefaultValue = CreatedDateTextBox.Text.ToUpper().Trim();
            SqlStockPile.InsertParameters["Is_Product"].DefaultValue = rbStockPile.SelectedValue;
            SqlStockPile.Insert();
            gvStockPile.DataBind();

            if (rbStockPile.SelectedValue == "false")
            {
                SqlUpdateAvailableRMQty.UpdateParameters["Available_Quantity"].DefaultValue = Convert.ToString(Convert.ToInt32(AvailableQuantityTextBox.Text) - Convert.ToInt32(QuantityTextBox.Text));
                SqlUpdateAvailableRMQty.UpdateParameters["Batch_ID"].DefaultValue = BatchIDDropDownList.SelectedValue; ;
                if (Convert.ToInt32(AvailableQuantityTextBox.Text) - Convert.ToInt32(QuantityTextBox.Text) == 0)
                {
                    SqlUpdateAvailableRMQty.UpdateParameters["Is_Stock_Piled"].DefaultValue = "TRUE";
                    
                }
                else
                {
                    SqlUpdateAvailableRMQty.UpdateParameters["Is_Stock_Piled"].DefaultValue = "FALSE";
                }
                SqlUpdateAvailableRMQty.Update();
            }

            else if (rbStockPile.SelectedValue == "true")
            {
                SqlUpdateAvailableQty.UpdateParameters["Available_Quantity"].DefaultValue = Convert.ToString(Convert.ToInt32(AvailableQuantityTextBox.Text) - Convert.ToInt32(QuantityTextBox.Text));
                SqlUpdateAvailableQty.UpdateParameters["Batch_ID"].DefaultValue = BatchIDDropDownList.SelectedValue; ;
                if (Convert.ToInt32(AvailableQuantityTextBox.Text) - Convert.ToInt32(QuantityTextBox.Text) == 0)
                {
                    SqlUpdateAvailableQty.UpdateParameters["Is_Stock_Piled"].DefaultValue = "TRUE";

                }
                else
                {
                    SqlUpdateAvailableQty.UpdateParameters["Is_Stock_Piled"].DefaultValue = "FALSE";
                }
                SqlUpdateAvailableQty.Update();
            }

            PaneladdStockPile.Visible = false;
            PanelgvStockPile.Visible = true;
            BatchIDDropDownList.SelectedIndex = -1;
            WarehouseIDDropDownList.SelectedIndex = -1;
            LocationIDDropDownList.SelectedIndex = -1;
            QuantityTextBox.Text = String.Empty;
            CreatedDateTextBox.Text = String.Empty;

        }

        protected void btnCancelStockPile_Click(object sender, EventArgs e)
        {
            PaneladdStockPile.Visible = false;
            PanelgvStockPile.Visible = true;
        }
        protected void calCreatedDate_SelectionChanged(object sender, EventArgs e)
        {
            CreatedDateTextBox.Text = calCreatedDate.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calimgCreatedDate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }

        protected void BatchIDDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbStockPile.SelectedValue == "true")
                SqlData.SelectCommand = "SELECT Available_Quantity FROM FinishedProduct WHERE Batch_ID =" + BatchIDDropDownList.SelectedValue;
            else
                SqlData.SelectCommand = "SELECT Available_Quantity FROM ProcuredRawMaterial WHERE Batch_ID =" + BatchIDDropDownList.SelectedValue;

            DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
            DataView dvView = new DataView();
            string str = dvView.Count.ToString();
            dvView = (DataView)SqlData.Select(dsArguments);
            string strAvailableQty = dvView[0].Row["Available_Quantity"].ToString();
            AvailableQuantityTextBox.Text = strAvailableQty;
            QuantityValidator.MaximumValue = strAvailableQty;
        }

        protected void rbStockPile_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbStockPile.SelectedValue == "false")
            {

                ListItem first = BatchIDDropDownList.Items[0];
                BatchIDDropDownList.Items.Clear();
                BatchIDDropDownList.Items.Add(first);
                BatchIDDropDownList.DataSourceID = "SqlProcuredRawMaterial";
                BatchIDDropDownList.DataTextField = "Name";
                BatchIDDropDownList.DataValueField = "Batch_ID";
            }

            else if (rbStockPile.SelectedValue == "true")
            {
                ListItem first = BatchIDDropDownList.Items[0];
                BatchIDDropDownList.Items.Clear();
                BatchIDDropDownList.Items.Add(first);
                BatchIDDropDownList.DataSourceID = "SqlFinishedProduct";
                BatchIDDropDownList.DataTextField = "Name";
                BatchIDDropDownList.DataValueField = "Batch_ID";
            }
            BatchIDDropDownList.DataBind();
        }
    }
}