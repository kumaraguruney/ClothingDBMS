using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Includes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveIncludes_Click(object sender, EventArgs e)
        {
            SqlIncludes.InsertParameters["WorkSchedule_ID"].DefaultValue = dropaddWorkschedule.SelectedValue;
            SqlIncludes.InsertParameters["Machine_ID"].DefaultValue = dropaddMachines.SelectedValue;
            SqlIncludes.InsertParameters["Hours_Of_Operation"].DefaultValue = txtIncludesHofOperation.Text.Trim();
            SqlIncludes.Insert();
            gvIncludes.DataBind();
            PaneladdIncludesMachinery.Visible = false;
            PanelgvIncludes.Visible = true;
            dropaddMachines.SelectedIndex = -1;
            dropaddWorkschedule.SelectedIndex = -1;
            SqlIncludesdrop.DataBind();
            txtIncludesHofOperation.Text = string.Empty;
        }

        protected void btnaddIncludes_Click(object sender, EventArgs e)
        {
            PaneladdIncludesMachinery.Visible = true;
            PanelgvIncludes.Visible = false;
        }

        protected void btnCancelIncludes_Click(object sender, EventArgs e)
        {
            PaneladdIncludesMachinery.Visible = false;
            PanelgvIncludes.Visible = true;
            dropaddMachines.SelectedIndex = -1;
            dropaddWorkschedule.SelectedIndex = -1;
            txtIncludesHofOperation.Text = string.Empty;
        }

        protected void btnIncludesfilter_Click(object sender, EventArgs e)
        {
            if (dropIncludesSearch.SelectedValue != "-1")
                SqlIncludes.SelectCommand = "SELECT Includes.Includes_ID, Includes.Machine_ID, Includes.Workschedule_ID, Includes.Hours_Of_Operation, Workschedule.WorkOrder_ID, Workschedule.WorkScheduled_Date, Workschedule.WorkScheduled_To_End, Workschedule.WorkScheduled_By, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Machinery.Machine_Name FROM Includes LEFT OUTER JOIN Workschedule ON Includes.Workschedule_ID = Workschedule.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Machinery ON Machinery.Machine_ID = Includes.Machine_ID where Includes.WorkSchedule_ID ='" + dropIncludesSearch.SelectedValue + "'";
            else
                SqlIncludes.SelectCommand = "SELECT Includes.Includes_ID, Includes.Machine_ID, Includes.Workschedule_ID, Includes.Hours_Of_Operation, Workschedule.WorkOrder_ID, Workschedule.WorkScheduled_Date, Workschedule.WorkScheduled_To_End, Workschedule.WorkScheduled_By, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Machinery.Machine_Name FROM Includes LEFT OUTER JOIN Workschedule ON Includes.Workschedule_ID = Workschedule.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Machinery ON Machinery.Machine_ID = Includes.Machine_ID ORDER BY Name";
            SqlIncludes.DataBind();
            SqlIncludesdrop.DataBind();
            gvIncludes.DataBind();
        }

        protected void btnIncludesClear_Click(object sender, EventArgs e)
        {
            SqlIncludes.SelectCommand = "SELECT Includes.Includes_ID, Includes.Machine_ID, Includes.Workschedule_ID, Includes.Hours_Of_Operation, Workschedule.WorkOrder_ID, Workschedule.WorkScheduled_Date, Workschedule.WorkScheduled_To_End, Workschedule.WorkScheduled_By, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Machinery.Machine_Name FROM Includes LEFT OUTER JOIN Workschedule ON Includes.Workschedule_ID = Workschedule.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Machinery ON Machinery.Machine_ID = Includes.Machine_ID ORDER BY Name";
            SqlIncludes.DataBind();
            gvIncludes.DataBind();
            SqlIncludesdrop.DataBind();
            dropIncludesSearch.SelectedIndex = -1;
        }
    }
}