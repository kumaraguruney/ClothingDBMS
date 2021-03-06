﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClothingDBMS.ProcurementManagement
{
    public partial class Updates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddUpdates_Click(object sender, EventArgs e)
        {
            PaneladdUpdates.Visible = true;
            PanelgvUpdates.Visible = false;
        }

        protected void btnCancelUpdates_Click(object sender, EventArgs e)
        {
            PaneladdUpdates.Visible = false;
            PanelgvUpdates.Visible = true;

        }

        protected void btnSaveUpdates_Click(object sender, EventArgs e)
        {
            SqlUpdate.InsertParameters["Receipt_ID"].DefaultValue = DropDownReceipt_ID.SelectedValue;
            SqlUpdate.InsertParameters["Date"].DefaultValue = txtDate.Text.ToUpper().Trim();
            SqlUpdate.InsertParameters["Received_Qty"].DefaultValue = txtReceived_Qty.Text.ToUpper().Trim();
            SqlUpdate.InsertParameters["Remaining_Qty"].DefaultValue = txtRemaining_Qty.Text.ToUpper().Trim();
            SqlUpdate.Insert();
            gvUpdates.DataBind();
            PaneladdUpdates.Visible = false;
            PanelgvUpdates.Visible = true;
            txtReceived_Qty.Text = string.Empty;
            txtRemaining_Qty.Text = string.Empty;
            DropDownReceipt_ID.SelectedIndex = -1;
            txtDate.Text = string.Empty;

        }
    }

}
    