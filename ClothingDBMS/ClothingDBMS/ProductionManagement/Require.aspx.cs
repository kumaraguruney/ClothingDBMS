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
            SqlRequires.InsertParameters["Design_ID"].DefaultValue = dropDesign.SelectedValue;
            SqlRequires.InsertParameters["RawMaterial_ID"].DefaultValue = dropRawmaterial.SelectedValue;
            SqlRequires.InsertParameters["RawMaterial_Quantity"].DefaultValue = txtRawmaterialQty.Text;
            
            SqlRequires.Insert();
            gvProductRequire.DataBind();
            PaneladdProductRequire.Visible = false;
            PanelgvProductRequire.Visible = true;
            txtRawmaterialQty.Text = string.Empty;
            dropDesign.SelectedIndex = -1;
            dropRawmaterial.SelectedIndex = -1;
            
        }

        protected void btnCancelProductRequire_Click(object sender, EventArgs e)
        {
            PaneladdProductRequire.Visible = false;
            PanelgvProductRequire.Visible = true;
        }

        protected void btnProductRequirefilter_Click(object sender, EventArgs e)
        {
            if(droprequire.SelectedValue != "-1")
                SqlRequires.SelectCommand = "SELECT Require.Require_ID, Require.Design_ID, Require.RawMaterial_ID, Require.RawMaterial_Quantity, Product.Product_Name + ', ' + code_1.Code_Description + ', ' + Code.Code_Description + ', ' + code_3.Code_Description + ', ' + ProductDesign.Design_Description AS Design_Name, RawMaterial.RawMaterial_Name + ', ' + code_2.Code_Description + ', ' + RawMaterial.RawMaterial_Description AS Rawmaterial_Name FROM Require LEFT OUTER JOIN ProductDesign ON Require.Design_ID = ProductDesign.Design_ID LEFT OUTER JOIN Product ON ProductDesign.Product_ID = Product.Product_ID LEFT OUTER JOIN Code ON Code.Code_ID = ProductDesign.Size LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = ProductDesign.Color LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Product_Section LEFT OUTER JOIN RawMaterial ON Require.RawMaterial_ID = Require.RawMaterial_ID LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = RawMaterial.RawMaterial_Color where Require.Design_ID ='" + droprequire.SelectedValue+"'";
            else
                SqlRequires.SelectCommand = "SELECT Require.Require_ID, Require.Design_ID, Require.RawMaterial_ID, Require.RawMaterial_Quantity, Product.Product_Name + ', ' + code_1.Code_Description + ', ' + Code.Code_Description + ', ' + code_3.Code_Description + ', ' + ProductDesign.Design_Description AS Design_Name, RawMaterial.RawMaterial_Name + ', ' + code_2.Code_Description + ', ' + RawMaterial.RawMaterial_Description AS Rawmaterial_Name FROM Require LEFT OUTER JOIN ProductDesign ON Require.Design_ID = ProductDesign.Design_ID LEFT OUTER JOIN Product ON ProductDesign.Product_ID = Product.Product_ID LEFT OUTER JOIN Code ON Code.Code_ID = ProductDesign.Size LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = ProductDesign.Color LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Product_Section LEFT OUTER JOIN RawMaterial ON Require.RawMaterial_ID = Require.RawMaterial_ID LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = RawMaterial.RawMaterial_Color ORDER BY Design_Name";
            SqlRequires.DataBind();
            gvProductRequire.DataBind();
        }

        protected void btnProductRequireClear_Click(object sender, EventArgs e)
        {
            SqlRequires.SelectCommand = "SELECT Require.Require_ID, Require.Design_ID, Require.RawMaterial_ID, Require.RawMaterial_Quantity, Product.Product_Name + ', ' + code_1.Code_Description + ', ' + Code.Code_Description + ', ' + code_3.Code_Description + ', ' + ProductDesign.Design_Description AS Design_Name, RawMaterial.RawMaterial_Name + ', ' + code_2.Code_Description + ', ' + RawMaterial.RawMaterial_Description AS Rawmaterial_Name FROM Require LEFT OUTER JOIN ProductDesign ON Require.Design_ID = ProductDesign.Design_ID LEFT OUTER JOIN Product ON ProductDesign.Product_ID = Product.Product_ID LEFT OUTER JOIN Code ON Code.Code_ID = ProductDesign.Size LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = ProductDesign.Color LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Product_Section LEFT OUTER JOIN RawMaterial ON Require.RawMaterial_ID = Require.RawMaterial_ID LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = RawMaterial.RawMaterial_Color ORDER BY Design_Name";
            SqlRequires.DataBind();
            gvProductRequire.DataBind();
            droprequire.SelectedIndex = -1;
        }
    }
}