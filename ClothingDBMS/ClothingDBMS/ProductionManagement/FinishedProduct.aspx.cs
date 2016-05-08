using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProductionManagement
{
    public partial class FinishedProduct : System.Web.UI.Page
    {
        static string strProductID, strQty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveFinishedProduct_Click(object sender, EventArgs e)
        {



            SqlFinishedProduct.InsertParameters["Product_ID"].DefaultValue = strProductID;
            SqlFinishedProduct.InsertParameters["Manufactured_Date"].DefaultValue = ManufacturedDateTextBox.Text.Trim();
            SqlFinishedProduct.InsertParameters["Quantity"].DefaultValue = strQty;
            SqlFinishedProduct.InsertParameters["Available_Quantity"].DefaultValue = strQty;
            SqlFinishedProduct.Insert();
            gvFinishedProduct.DataBind();

            SqlProduct.UpdateParameters["WorkSchedule_ID"].DefaultValue = dropaddProduct.SelectedValue;
            SqlProduct.UpdateParameters["Is_FinishedProduct_Updated"].DefaultValue = "true";
            SqlProduct.Update();
            PanelgvFinishedProduct.Visible = true;
            dropaddProduct.SelectedIndex = -1;
            ManufacturedDateTextBox.Text = String.Empty;
            QuantityTextBox.Text = String.Empty;

        }

        protected void btnCancelFinishedProduct_Click(object sender, EventArgs e)
        {
            dropaddProduct.SelectedIndex = -1;
            ManufacturedDateTextBox.Text = String.Empty;
            QuantityTextBox.Text = String.Empty;
        }
        protected void calManufacturedDate_SelectionChanged(object sender, EventArgs e)
        {
            ManufacturedDateTextBox.Text = calManufacturedDate.SelectedDate.ToShortDateString();
            calpanel.Visible = false;
        }

        protected void calimgManufacturedDate_Click(object sender, ImageClickEventArgs e)
        {
            calpanel.Visible = true;
        }

        protected void dropaddProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlData.SelectCommand = "SELECT Workschedule.Workschedule_ID, Product.Product_ID, WorkOrder.Product_Quantity FROM Workschedule JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID AND ISNULL(Workschedule.Is_FinishedProduct_Updated, 0) = 'FALSE' AND Workschedule_ID ='" + dropaddProduct.SelectedValue + "' LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID ";
            DataSourceSelectArguments dsArguments = new DataSourceSelectArguments();
            DataView dvView = new DataView();

            dvView = (DataView)SqlData.Select(dsArguments);
            strProductID = dvView[0].Row["Product_ID"].ToString();
            strQty = dvView[0].Row["Product_Quantity"].ToString();

            QuantityTextBox.Text = strQty;
        }
    }
}