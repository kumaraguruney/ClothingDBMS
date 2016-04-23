using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.InventoryManagement
{
    public partial class Warehouse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnaddAllocates_Click(object sender, EventArgs e)
        {
            PaneladdAllocates.Visible = true;
            PanelgvAllocates.Visible = false;
        }

        protected void btnSaveWarehouse_Click(object sender, EventArgs e)
        {
    
        }

        protected void btnCancelAllocates_Click(object sender, EventArgs e)
        {
            PaneladdAllocates.Visible = false;
            PanelgvAllocates.Visible = true;
        }
    }
}