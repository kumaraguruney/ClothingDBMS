using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Allocates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddAllocates_Click(object sender, EventArgs e)
        {
            PaneladdAllocates.Visible = true;
            PanelgvAllocates.Visible = false;
        }

        protected void btnSaveAllocates_Click(object sender, EventArgs e)
        {
            SqlAllocates.InsertParameters["WorkSchedule_ID"].DefaultValue = dropWorkschedule.SelectedValue;
            SqlAllocates.InsertParameters["Employee_ID"].DefaultValue = dropEmployee.SelectedValue;
            SqlAllocates.InsertParameters["Allocated_Time"].DefaultValue = txtAllocatesTime.Text.Trim();
            SqlAllocates.Insert();
            gvAllocates.DataBind();
            SqlAllocatesdrop.DataBind();
            PaneladdAllocates.Visible = false;
            PanelgvAllocates.Visible = true;
            
            dropEmployee.SelectedIndex = -1;
            dropWorkschedule.SelectedIndex = -1;
            txtAllocatesTime.Text = string.Empty;
        }

        protected void btnCancelAllocates_Click(object sender, EventArgs e)
        {
            PaneladdAllocates.Visible = false;
            PanelgvAllocates.Visible = true;
        }

        protected void btnAllocatesfilter_Click(object sender, EventArgs e)
        {
            if (dropAllocatesSearch.SelectedValue != "-1")
                SqlAllocates.SelectCommand = "SELECT Allocates.Allocates_ID, Allocates.Workschedule_ID, Allocates.Employee_ID, Allocates.Allocated_Time, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Employee.Employee_Name FROM Allocates LEFT OUTER JOIN Workschedule ON Workschedule.Workschedule_ID = Allocates.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Allocates.Employee_ID where Allocates.WorkSchedule_ID ='" + dropAllocatesSearch.SelectedValue + "'";
            else
                SqlAllocates.SelectCommand = "SELECT Allocates.Allocates_ID, Allocates.Workschedule_ID, Allocates.Employee_ID, Allocates.Allocated_Time, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Employee.Employee_Name FROM Allocates LEFT OUTER JOIN Workschedule ON Workschedule.Workschedule_ID = Allocates.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Allocates.Employee_ID ORDER BY Name";
            SqlAllocates.DataBind();
            SqlAllocatesdrop.DataBind();
            gvAllocates.DataBind();
        }

        protected void btnAllocatesClear_Click(object sender, EventArgs e)
        {
            SqlAllocates.SelectCommand = "SELECT Allocates.Allocates_ID, Allocates.Workschedule_ID, Allocates.Employee_ID, Allocates.Allocated_Time, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Employee.Employee_Name FROM Allocates LEFT OUTER JOIN Workschedule ON Workschedule.Workschedule_ID = Allocates.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Allocates.Employee_ID ORDER BY Name";
            SqlAllocates.DataBind();
            gvAllocates.DataBind();
            SqlAllocatesdrop.DataBind();
            dropAllocatesSearch.SelectedIndex = -1;
        }
    }
}