using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProductionManagement
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRawMaterial_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rawmaterial.aspx");
        }

        protected void btnMachinery_Click(object sender, EventArgs e)
        {
            Response.Redirect("Machinery.aspx");
        }

        protected void btnProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx");
        }

        protected void btnWorkOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("WorkOrder.aspx");
        }

        protected void btnWorkSchedule_Click(object sender, EventArgs e)
        {
            Response.Redirect("workschedule.aspx");
        }

        protected void btnFinishedProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("FinishedProduct.aspx");
        }

        protected void btnDesign_Click(object sender, EventArgs e)
        {
            Response.Redirect("Design.aspx");
        }

        protected void btnEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee.aspx");
        }
    }
}