﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

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

            SqlData0.InsertParameters["Batch_ID"].DefaultValue = BatchDropDownList.SelectedValue;
            SqlData0.InsertParameters["Warehouse_ID"].DefaultValue = WarehouseDropDownList.SelectedValue;
            SqlData0.InsertParameters["Location_ID"].DefaultValue = LocationDropDownList.SelectedValue;
            SqlData0.InsertParameters["Is_Product"].DefaultValue = rbStockReconcile.SelectedValue;
            SqlData0.InsertParameters["Physical_Quantity"].DefaultValue = PhysicalQuantityTextBox.Text.Trim();
            SqlData0.InsertParameters["Reconciled_Date"].DefaultValue = ReconciledDateTextBox.Text.Trim() ;
            SqlData0.Insert();

            PaneladdStockReconciliation.Visible = false;
            PanelgvStockReconcile.Visible = true;
            BatchDropDownList.SelectedIndex = -1;
            WarehouseDropDownList.SelectedIndex = -1;
            LocationDropDownList.SelectedIndex = -1;
            InventoryQuantityTextBox.Text = String.Empty;
            PhysicalQuantityTextBox.Text = String.Empty;
            ReconciledDateTextBox.Text = String.Empty;
            rbStockReconcile.SelectedIndex = -1;

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

        protected void BatchDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (BatchDropDownList.SelectedValue != "-1")
            {
                SqlData.SelectCommand = "SELECT  sum(StockPile.Quantity) As Quantity FROM StockPile WHERE StockPile.Batch_ID ='" + BatchDropDownList.SelectedValue +"' and StockPile.Warehouse_ID ='"+ WarehouseDropDownList.SelectedValue + "' and StockPile.Location_ID =" + LocationDropDownList.SelectedValue ;
                DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
                DataView dvView = new DataView();
                dvView = (DataView)SqlData.Select(dsArguments);
                string strQty = dvView[0].Row["Quantity"].ToString();
                InventoryQuantityTextBox.Text = strQty;
                QuantityValidator.MaximumValue = strQty;
            }

        }

        protected void rbStockReconcile_SelectedIndexChanged(object sender, EventArgs e)
        {
            InventoryQuantityTextBox.Text = string.Empty;
            ListItem first = BatchDropDownList.Items[0];
            BatchDropDownList.Items.Clear();
            BatchDropDownList.Items.Add(first);
            BatchDropDownList.DataBind();
        }

        protected void WarehouseDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            BatchDropDownList.SelectedIndex = -1;
            LocationDropDownList.SelectedIndex = -1;
            InventoryQuantityTextBox.Text = String.Empty;
            PhysicalQuantityTextBox.Text = String.Empty;
            ReconciledDateTextBox.Text = String.Empty;
            InventoryQuantityTextBox.Text = string.Empty;
            ListItem first = BatchDropDownList.Items[0];
            LocationDropDownList.Items.Clear();
            LocationDropDownList.Items.Add(first);
            LocationDropDownList.DataBind();
        }
    }
}