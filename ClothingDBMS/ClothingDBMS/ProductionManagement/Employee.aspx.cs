using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddEmployee_Click(object sender, EventArgs e)
        {
            PaneladdEmployee.Visible = true;
            PanelgvEmployee.Visible = false;
        }

        protected void btnSaveEmployee_Click(object sender, EventArgs e)
        {
            SqlEmployee.InsertParameters["Employee_Name"].DefaultValue = txtEmployeeName.Text.ToUpper().Trim();
            SqlEmployee.InsertParameters["Address"].DefaultValue = txtEmployeeAddress.Text.ToUpper().Trim();
            SqlEmployee.InsertParameters["Contact_Number"].DefaultValue = txtEmployeeContactNumber.Text.ToUpper().Trim();
            SqlEmployee.InsertParameters["Date_of_Birth"].DefaultValue = txtEmployeeDOB.Text.Trim();
            SqlEmployee.Insert();
            gvEmployee.DataBind();
            PaneladdEmployee.Visible = false;
            PanelgvEmployee.Visible = true;
            txtEmployeeName.Text = string.Empty;
            txtEmployeeAddress.Text = string.Empty;
            txtEmployeeContactNumber.Text = string.Empty;
            txtEmployeeDOB.Text = string.Empty;
        }

        protected void btnCancelEmployee_Click(object sender, EventArgs e)
        {
            PaneladdEmployee.Visible = false;
            PanelgvEmployee.Visible = true;
        }

        protected void calDateofBirth_SelectionChanged(object sender, EventArgs e)
        {
            txtEmployeeDOB.Text = calDateofBirth.SelectedDate.ToShortDateString();
        }
    }
}