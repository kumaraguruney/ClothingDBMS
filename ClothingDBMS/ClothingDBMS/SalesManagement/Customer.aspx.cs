using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesManagement.Sales
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            panelAddCustomer.Visible = true;
            panelSaveCustomer.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlDataSourceCustomer.InsertParameters["Customer_Name"].DefaultValue = Customer_Name.Text;
            SqlDataSourceCustomer.InsertParameters["Address"].DefaultValue = Address.Text;
            SqlDataSourceCustomer.InsertParameters["City"].DefaultValue = City.Text;
            SqlDataSourceCustomer.InsertParameters["State"].DefaultValue = State.Text;
            SqlDataSourceCustomer.InsertParameters["Zipcode"].DefaultValue = Zipcode.Text;
            SqlDataSourceCustomer.InsertParameters["Email"].DefaultValue = Email.Text;
            SqlDataSourceCustomer.InsertParameters["Phone"].DefaultValue = Phone.Text;
            SqlDataSourceCustomer.InsertParameters["Fax"].DefaultValue = Fax.Text;
            SqlDataSourceCustomer.Insert();
            CustomerGridView.DataBind();
            panelAddCustomer.Visible = false;
            panelSaveCustomer.Visible = true;
            Fax.Text = string.Empty;
            Phone.Text = string.Empty;
            Email.Text = string.Empty;
            Zipcode.Text = string.Empty;
            State.Text = string.Empty;
            City.Text = string.Empty;
            Address.Text = string.Empty;
            Customer_Name.Text = string.Empty;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelAddCustomer.Visible = false;
            panelSaveCustomer.Visible = true;
        }

 
    }
}