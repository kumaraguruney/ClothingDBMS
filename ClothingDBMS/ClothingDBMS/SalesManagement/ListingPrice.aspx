<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListingPrice.aspx.cs" Inherits="ClothingDBMS.SalesManagement.ListingPrice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
          <div id="custom-bootstrap-menu" class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <a class="navbar-brand" href="../Index.aspx">NTL
                </a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
</div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
          <li><a href="../Index.aspx">Home</a></li>
          <li><a href="Default.aspx">Sales Managment - Home</a></li>
          <li><a href="Customer.aspx">Customer</a></li>
          <li><a href="Invoice.aspx">Invoice</a></li>
          <li><a href="Payment.aspx">Payment</a></li>
          <li><a href="Quotation.aspx">Quotation</a></li>
          <li><a href="SalesOrder.aspx">Sales Order</a></li>
          <li><a href="Shipment.aspx">Shipment</a></li>
                </ul>
            </div>
        </div>
    </div>

        <div style="margin-top:100px;"  align="center">
       <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name, Product.Price FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section" UpdateCommand="UPDATE Product SET Price = @Price WHERE (Product_ID = @Product_ID)">
           <UpdateParameters>
               <asp:Parameter Name="Price" />
               <asp:Parameter Name="Product_ID" />
           </UpdateParameters>
            </asp:SqlDataSource>

        <br/>
    <asp:Label ID="lblQuotation" runat="server" Text="Updating the Price for Product" Font-Bold="True"></asp:Label>  <br /> <br />
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server">
        <asp:Button ID="btnAdd" runat="server"   CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
        <asp:GridView ID="GridViewProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="Product_ID" DataSourceID="SqlProduct" >
            <Columns>
                <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" InsertVisible="False" ReadOnly="True" SortExpression="Product_ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>
        </asp:Panel>

    
    
          <asp:Panel ID="panelAddQuotation" Visible="false" runat="server">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="lblQuotationTitle" Text="Enter New Sales Order  Information" runat="server" Font-Bold="True"/><br /> <br />

                          <asp:Label ID="lblProductType" runat="server" Text="Product Type:" Width="200px" />
              <asp:DropDownList ID="dropProductName" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID">
                  <asp:ListItem Text="-- Product ID --" Value="-1"></asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="rfvProductname" runat="server" ControlToValidate="dropProductName" ErrorMessage="(*) Select One Product Name" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              &nbsp;
              <br/>
              <asp:Label ID="lblPrice" runat="server" Text="Price per Unit: " Width="200px" />
              <asp:TextBox ID="txtPrice" runat="server" style="margin-top: 0px"></asp:TextBox>
              <br />
              <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="(*) Price Should me mentioned eg:35" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              <br />
              <br />
              <asp:Panel ID="calpanel" runat="server" Visible="false">
                  <br />
              </asp:Panel>
              <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" OnClick="btnSave_Click" Text="Save" ValidationGroup="addQuotationValidation" />
              <asp:Button ID="btnCancel" runat="server" CssClass="bg-primary" OnClick="btnCancel_Click" Text="Cancel" />
              <br />
              <br />
              <br />
              &nbsp;<br/>
              <br />
              <br />
     </asp:Panel>

       </div>
   </form>
</body>
</html>
