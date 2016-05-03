using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class StockUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddStockUpdate_Click(object sender, EventArgs e)
        {
            PaneladdStockUpdate.Visible = true;
            PanelgvStockUpdate.Visible = false;
        }

        protected void btnSaveStockUpdate_Click(object sender, EventArgs e)
        {
            // SqlStockUpdate.InsertParameters["StockUpdate_ID"].DefaultValue = StockUpdateTextBox.Text.ToUpper().Trim();
            //SqlStockUpdate.InsertParameters["StockMovement_ID"].DefaultValue = StockMovementTextBox.Text.ToUpper().Trim();

            

           // SqlProductStockUpdate.InsertParameters["StockUpdate_ID"].DefaultValue = StockUpdateTextBox.Text.ToUpper().Trim();
            SqlProductStockUpdate.InsertParameters["Entry_ID"].DefaultValue = EntryIDTextBox.Text.ToUpper().Trim();
            SqlProductStockUpdate.InsertParameters["Product_ID"].DefaultValue = ProductIDTextBox.Text.ToUpper().Trim();
           // SqlRMStockUpdate.InsertParameters["StockUpdate_ID"].DefaultValue = StockUpdateTextBox.Text.ToUpper().Trim();
            SqlRMStockUpdate.InsertParameters["Entry_ID"].DefaultValue = EntryIDTextBox0.Text.ToUpper().Trim();
            SqlRMStockUpdate.InsertParameters["RM_ID"].DefaultValue = RMIDTextBox.Text.ToUpper().Trim();
            SqlStockUpdate.Insert();
            SqlProductStockUpdate.Insert();
            SqlRMStockUpdate.Insert();
            gvStockUpdate.DataBind();
            GVProductStockUpdate.DataBind();
            GVRMStockUpdate.DataBind();
            PaneladdStockUpdate.Visible = false;
            PanelProduct.Visible = false;
            PanelRM.Visible = false;
            PanelgvStockUpdate.Visible = true;
           // StockUpdateTextBox.Text = string.Empty;
            StockMovementTextBox.Text = string.Empty;
            EntryIDTextBox.Text = string.Empty;
            ProductIDTextBox.Text = string.Empty;
            EntryIDTextBox0.Text = string.Empty;
            RMIDTextBox.Text = string.Empty;


        }
       
        protected void btnCancelStockUpdate_Click(object sender, EventArgs e)
        {
            PaneladdStockUpdate.Visible = false;
            PanelProduct.Visible = false;
            PanelRM.Visible = false;
            PanelgvStockUpdate.Visible = true;
        }

        protected void StockUpdateList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            SqlStockUpdate.InsertParameters["StockMovement_ID"].DefaultValue = StockMovementTextBox.Text.ToUpper().Trim();
            if (StockUpdateList.SelectedValue == "1")
            {
                PanelProduct.Visible = true;
                PanelRM.Visible = false;
            }
            else
            {
                PanelRM.Visible = true;
                PanelProduct.Visible = false;
            }
        }
    }
}