using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductionManagement.ProductionManagement
{
    public partial class Require : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btaddProductRequire_Click(object sender, EventArgs e)
        {
            PaneladdProductRequire.Visible = true;
            PanelgvProductRequire.Visible = false;
        }

        protected void btnSaveProductRequire_Click(object sender, EventArgs e)
        {
            SqlRequires.InsertParameters["Product_ID"].DefaultValue = dropProduct.SelectedValue;
            SqlRequires.InsertParameters["RawMaterial_ID"].DefaultValue = dropRawmaterial.SelectedValue;
            SqlRequires.InsertParameters["RawMaterial_Quantity"].DefaultValue = txtRawmaterialQty.Text;
            
            SqlRequires.Insert();
            gvProductRequire.DataBind();
            SqlRequireDrop.DataBind();
            PaneladdProductRequire.Visible = false;
            PanelgvProductRequire.Visible = true;
            txtRawmaterialQty.Text = string.Empty;
            dropProduct.SelectedIndex = -1;
            dropRawmaterial.SelectedIndex = -1;
            
        }

        protected void btnCancelProductRequire_Click(object sender, EventArgs e)
        {
            PaneladdProductRequire.Visible = false;
            PanelgvProductRequire.Visible = true;
            txtRawmaterialQty.Text = string.Empty;
            dropProduct.SelectedIndex = -1;
            dropRawmaterial.SelectedIndex = -1;
        }

        protected void btnProductRequirefilter_Click(object sender, EventArgs e)
        {
            if(droprequire.SelectedValue != "-1")
                SqlRequires.SelectCommand = "SELECT Require.Require_ID, Require.Product_ID, Require.RawMaterial_ID, Require.RawMaterial_Quantity, Design.Design_Name + ', ' + code_1.Code_Description + ', ' + Code.Code_Description + ', ' + code_3.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Product_Name, RawMaterial.RawMaterial_Name + ', ' + code_2.Code_Description + ', ' + ISNULL(RawMaterial.RawMaterial_Description, ' ') AS Rawmaterial_Name FROM Require LEFT OUTER JOIN Product ON Require.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Design.Design_Section LEFT OUTER JOIN RawMaterial ON Require.RawMaterial_ID = Require.RawMaterial_ID LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = RawMaterial.RawMaterial_Color where Require.Product_ID ='" + droprequire.SelectedValue+"'";
            else
                SqlRequires.SelectCommand = "SELECT Require.Require_ID, Require.Product_ID, Require.RawMaterial_ID, Require.RawMaterial_Quantity, Design.Design_Name + ', ' + code_1.Code_Description + ', ' + Code.Code_Description + ', ' + code_3.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Product_Name, RawMaterial.RawMaterial_Name + ', ' + code_2.Code_Description + ', ' + ISNULL(RawMaterial.RawMaterial_Description, ' ') AS Rawmaterial_Name FROM Require LEFT OUTER JOIN Product ON Require.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Design.Design_Section LEFT OUTER JOIN RawMaterial ON Require.RawMaterial_ID = Require.RawMaterial_ID LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = RawMaterial.RawMaterial_Color ORDER BY Design.Design_Name";
            SqlRequires.DataBind();
            SqlRequireDrop.DataBind();
            gvProductRequire.DataBind();
        }

        protected void btnProductRequireClear_Click(object sender, EventArgs e)
        {
            SqlRequires.SelectCommand = "SELECT Require.Require_ID, Require.Product_ID, Require.RawMaterial_ID, Require.RawMaterial_Quantity, Design.Design_Name + ', ' + code_1.Code_Description + ', ' + Code.Code_Description + ', ' + code_3.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Product_Name, RawMaterial.RawMaterial_Name + ', ' + code_2.Code_Description + ', ' + ISNULL(RawMaterial.RawMaterial_Description, ' ') AS Rawmaterial_Name FROM Require LEFT OUTER JOIN Product ON Require.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Design.Design_Section LEFT OUTER JOIN RawMaterial ON Require.RawMaterial_ID = Require.RawMaterial_ID LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = RawMaterial.RawMaterial_Color ORDER BY Design.Design_Name";
            SqlRequires.DataBind();
            gvProductRequire.DataBind();
            SqlRequireDrop.DataBind();
            droprequire.SelectedIndex = -1;
        }
    }
}