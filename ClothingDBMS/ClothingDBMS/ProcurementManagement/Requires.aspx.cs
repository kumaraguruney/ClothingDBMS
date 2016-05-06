using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Requires : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddRequires_Click(object sender, EventArgs e)
        {
            PaneladdRequires.Visible = true;
            PanelgvRequires.Visible = false;
        }

        protected void btnCancelRequires_Click(object sender, EventArgs e)
        {
            PaneladdRequires.Visible = false;
            PanelgvRequires.Visible = true;

        }

        protected void btnSaveRequires_Click(object sender, EventArgs e)
        {
            SqlRequires.InsertParameters["WorkOrder_ID"].DefaultValue = DropDownQWorkOrder_ID.SelectedValue;
            SqlRequires.InsertParameters["RawMaterial_ID"].DefaultValue = DropDownRawMaterial_ID.SelectedValue;
            SqlRequires.Insert();
            gvRequires.DataBind();
            PaneladdRequires.Visible = false;
            PanelgvRequires.Visible = true;
            DropDownQWorkOrder_ID.SelectedIndex = -1;
            DropDownRawMaterial_ID.SelectedIndex = -1;

        }
    }

}
    
