using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS
{
    public partial class Code : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddCode_Click(object sender, EventArgs e)
        {
            PaneladdCode.Visible = true;
            PanelgvCode.Visible = false;
        }

        protected void btnSaveCode_Click(object sender, EventArgs e)
        {
            SqlCode.InsertParameters["Code_Type"].DefaultValue = txtCodeType.Text.ToUpper().Trim();
            SqlCode.InsertParameters["Code_Description"].DefaultValue = txtCodeDescription.Text.ToUpper().Trim();
            SqlCode.Insert();
            gvCode.DataBind();
            PaneladdCode.Visible = false;
            PanelgvCode.Visible = true;
            txtCodeType.Text = string.Empty;
            txtCodeDescription.Text = string.Empty;
        }

        protected void btnCancelCode_Click(object sender, EventArgs e)
        {
            PaneladdCode.Visible = false;
            PanelgvCode.Visible = true;
        }
    }
}