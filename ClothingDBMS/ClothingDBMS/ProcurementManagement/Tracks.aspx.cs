using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Tracks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddTracks_Click(object sender, EventArgs e)
        {
            PaneladdTracks.Visible = true;
            PanelgvTracks.Visible = false;
        }

        protected void btnCancelTracks_Click(object sender, EventArgs e)
        {
            PaneladdTracks.Visible = false;
            PanelgvTracks.Visible = true;

        }

        protected void btnSaveTracks_Click(object sender, EventArgs e)
        {
            SqlTracks.InsertParameters["Track_ID"].DefaultValue = txtTrack_ID.Text.ToUpper().Trim();
            SqlTracks.InsertParameters["Inventory_ID"].DefaultValue = txtInventory_ID.Text.ToUpper().Trim();
            SqlTracks.InsertParameters["RM_ID"].DefaultValue = txtRM_ID.Text.ToUpper().Trim();
            SqlTracks.Insert();
            gvTracks.DataBind();
            PaneladdTracks.Visible = false;
            PanelgvTracks.Visible = true;
            txtTrack_ID.Text = string.Empty;
            txtInventory_ID.Text = string.Empty;
            txtRM_ID.Text = string.Empty;

        }
    }

}
   