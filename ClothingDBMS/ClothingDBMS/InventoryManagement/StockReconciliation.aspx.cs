using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class StockReconciliation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCheckStockReconciliation_Click(object sender, EventArgs e)
        {
            PaneladdStockReconciliation.Visible = true;
            PanelgvStockReconcile.Visible = false;

        }
        protected void btnSaveStockReconcile_Click(object sender, EventArgs e)
        {
            //if (rbStockReconcile.SelectedValue == "true")
               // SqlData.SelectCommand = "SELECT Available_Quantity FROM FinishedProduct WHERE Batch_ID =" + BatchIDDropDownList.SelectedValue;
            //else
               // SqlData.SelectCommand = "SELECT Available_Quantity FROM ProcuredRawMaterial WHERE Batch_ID =" + BatchIDDropDownList.SelectedValue;

           // DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
            //DataView dvView = new DataView();
            //string str = dvView.Count.ToString();
            //dvView = (DataView)SqlData.Select(dsArguments);
            //string strAvailableQty = dvView[0].Row["Available_Quantity"].ToString();
            //AvailableQuantityTextBox.Text = strAvailableQty;

            SqlStockReconcile.InsertParameters["Warehouse_ID"].DefaultValue = WarehouseDropDownList.SelectedValue;
            SqlStockReconcile.InsertParameters["Location_ID"].DefaultValue = LocationDropDownList.SelectedValue;
            SqlStockReconcile.InsertParameters["Batch_ID"].DefaultValue = BatchDropDownList.SelectedValue;
            SqlStockReconcile.InsertParameters["Inventory_Quantity"].DefaultValue = InventoryQuantityTextBox.Text.ToUpper().Trim();
            SqlStockReconcile.InsertParameters["Physical_Quantity"].DefaultValue = PhysicalQuantityTextBox.Text.ToUpper().Trim();
            SqlStockReconcile.InsertParameters["Reconciled_Date"].DefaultValue = ReconciledDateTextBox.Text.Trim();
            SqlStockReconcile.Insert();
            gvStockReconcile.DataBind();

           // if (rbStockReconcile.SelectedValue == "false")
            //{
                //SqlUpdateAvailableRMQty.UpdateParameters["Available_Quantity"].DefaultValue = Convert.ToString(Convert.ToInt32(AvailableQuantityTextBox.Text) - Convert.ToInt32(QuantityTextBox.Text));
                //SqlUpdateAvailableRMQty.UpdateParameters["Batch_ID"].DefaultValue = BatchIDDropDownList.SelectedValue; ;
                //if (Convert.ToInt32(AvailableQuantityTextBox.Text) - Convert.ToInt32(QuantityTextBox.Text) == 0)
                //{
                  //  SqlUpdateAvailableRMQty.UpdateParameters["Is_Stock_Piled"].DefaultValue = "TRUE";

                //}
                //else
                //{
                  //  SqlUpdateAvailableRMQty.UpdateParameters["Is_Stock_Piled"].DefaultValue = "FALSE";
                //}
                //SqlUpdateAvailableRMQty.Update();
            //}

            //else if (rbStockPile.SelectedValue == "true")
            //{
            //    SqlUpdateAvailableQty.UpdateParameters["Available_Quantity"].DefaultValue = Convert.ToString(Convert.ToInt32(AvailableQuantityTextBox.Text) - Convert.ToInt32(QuantityTextBox.Text));
            //    SqlUpdateAvailableQty.UpdateParameters["Batch_ID"].DefaultValue = BatchIDDropDownList.SelectedValue; ;
            //    if (Convert.ToInt32(AvailableQuantityTextBox.Text) - Convert.ToInt32(QuantityTextBox.Text) == 0)
            //    {
            //        SqlUpdateAvailableQty.UpdateParameters["Is_Stock_Piled"].DefaultValue = "TRUE";

            //    }
            //    else
            //    {
            //        SqlUpdateAvailableQty.UpdateParameters["Is_Stock_Piled"].DefaultValue = "FALSE";
            //    }
            //    SqlUpdateAvailableQty.Update();
            //}

            PaneladdStockReconciliation.Visible = false;
            PanelgvStockReconcile.Visible = true;
            BatchDropDownList.SelectedIndex = -1;
            WarehouseDropDownList.SelectedIndex = -1;
            LocationDropDownList.SelectedIndex = -1;
            InventoryQuantityTextBox.Text = String.Empty;
            PhysicalQuantityTextBox.Text = String.Empty;
            ReconciledDateTextBox.Text = String.Empty;

        }

        protected void btnCancelStockReconcile_Click(object sender, EventArgs e)
        {
            PaneladdStockReconciliation.Visible = false;
            PanelgvStockReconcile.Visible = true;
        }
        protected void calReconciledDate_SelectionChanged(object sender, EventArgs e)
        {
            ReconciledDateTextBox.Text = calReconciledDate.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calimgReconciledDate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }

        //protected void BatchIDDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (rbStockPile.SelectedValue == "true")
        //        SqlData.SelectCommand = "SELECT Available_Quantity FROM FinishedProduct WHERE Batch_ID =" + BatchIDDropDownList.SelectedValue;
        //    else
        //        SqlData.SelectCommand = "SELECT Available_Quantity FROM ProcuredRawMaterial WHERE Batch_ID =" + BatchIDDropDownList.SelectedValue;

        //    DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
        //    DataView dvView = new DataView();
        //    string str = dvView.Count.ToString();
        //    dvView = (DataView)SqlData.Select(dsArguments);
        //    string strAvailableQty = dvView[0].Row["Available_Quantity"].ToString();
        //    AvailableQuantityTextBox.Text = strAvailableQty;
        //    QuantityValidator.MaximumValue = strAvailableQty;
        //}

        //protected void rbStockPile_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (rbStockPile.SelectedValue == "false")
        //    {

        //        ListItem first = BatchIDDropDownList.Items[0];
        //        BatchIDDropDownList.Items.Clear();
        //        BatchIDDropDownList.Items.Add(first);
        //        BatchIDDropDownList.DataSourceID = "SqlProcuredRawMaterial";
        //        BatchIDDropDownList.DataTextField = "Name";
        //        BatchIDDropDownList.DataValueField = "Batch_ID";
        //    }

        //    else if (rbStockPile.SelectedValue == "true")
        //    {
        //        ListItem first = BatchIDDropDownList.Items[0];
        //        BatchIDDropDownList.Items.Clear();
        //        BatchIDDropDownList.Items.Add(first);
        //        BatchIDDropDownList.DataSourceID = "SqlFinishedProduct";
        //        BatchIDDropDownList.DataTextField = "Name";
        //        BatchIDDropDownList.DataValueField = "Batch_ID";
        //    }
        //    BatchIDDropDownList.DataBind();
        //}
    }
}