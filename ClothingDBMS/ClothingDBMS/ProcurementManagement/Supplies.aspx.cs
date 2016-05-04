using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Material_Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddsupplies_Click(object sender, EventArgs e)
        {
            Paneladdsupplies.Visible = true;
            Panelgvsupplies.Visible = false;
        }

        protected void btnCancelsupplies_Click(object sender, EventArgs e)
        {
            Paneladdsupplies.Visible = false;
            Panelgvsupplies.Visible = true;

        }

        protected void btnSavesupplies_Click(object sender, EventArgs e)
        {
            Sqlsupplies.InsertParameters["Name"].DefaultValue = txtsuppliesName.Text.ToUpper().Trim();
            Sqlsupplies.InsertParameters["Address"].DefaultValue = txtsuppliesAddress.Text.ToUpper().Trim();

            Sqlsupplies.Insert();
            gvsupplies.DataBind();
            Paneladdsupplies.Visible = false;
            Panelgvsupplies.Visible = true;
            txtsuppliesName.Text = string.Empty;
            txtsuppliesAddress.Text = string.Empty;

        }
    }
}

