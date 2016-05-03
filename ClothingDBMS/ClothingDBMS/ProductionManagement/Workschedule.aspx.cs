﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Workschedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveWorkSchedule_Click(object sender, EventArgs e)
        {
            SqlWorkSchedule.InsertParameters["WorkOrder_ID"].DefaultValue = dropaddWorkOrder.SelectedValue;
            SqlWorkSchedule.InsertParameters["WorkScheduled_Date"].DefaultValue = txtWorkscheduleStartDate.Text.Trim();
            SqlWorkSchedule.InsertParameters["WorkScheduled_To_End"].DefaultValue = txtWorkscheduleEndDate.Text.Trim();
            SqlWorkSchedule.InsertParameters["WorkScheduled_By"].DefaultValue = dropaddScheduledBy.SelectedValue;
            SqlWorkSchedule.Insert();
            gvWorkSchedule.DataBind();
            PaneladdWorkSchedule.Visible = false;
            PanelgvWorkSchedule.Visible = true;
            dropaddWorkOrder.SelectedIndex = -1;
            dropaddScheduledBy.SelectedIndex = -1;
            txtWorkscheduleStartDate.Text = string.Empty;
            txtWorkscheduleEndDate.Text = string.Empty;
        }

        protected void btnCancelWorkSchedule_Click(object sender, EventArgs e)
        {
            PaneladdWorkSchedule.Visible = false;
            PanelgvWorkSchedule.Visible = true;
            dropaddWorkOrder.SelectedIndex = -1;
            dropaddScheduledBy.SelectedIndex = -1;
            txtWorkscheduleStartDate.Text = string.Empty;
            txtWorkscheduleEndDate.Text = string.Empty;
        }

        protected void btaddWorkSchedule_Click(object sender, EventArgs e)
        {
            PaneladdWorkSchedule.Visible = true;
            PanelgvWorkSchedule.Visible = false;
        }

        protected void calWorkscheduleStartDate_SelectionChanged(object sender, EventArgs e)
        {
            txtWorkscheduleStartDate.Text = calWorkscheduleStartDate.SelectedDate.ToShortDateString();
            cal1panel.Visible = false;
        }

        protected void calWorkscheduleEndDate_SelectionChanged(object sender, EventArgs e)
        {
            txtWorkscheduleEndDate.Text = calWorkscheduleEndDate.SelectedDate.ToShortDateString();
            cal2panel.Visible = false;
        }

        protected void coeWorkscheduleStartDate_Click(object sender, ImageClickEventArgs e)
        {
            cal1panel.Visible = true;
        }

        protected void coeWorkscheduleEndDate_Click(object sender, ImageClickEventArgs e)
        {
            cal2panel.Visible = true;
        }
    }
}