<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contains.aspx.cs" Inherits="ClothingDBMS.SalesManagement.Contains" %>

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
          <li><a class="page-scroll" href="../Index.aspx">Home</a></li>
          <li><a class="page-scroll" href="Default.aspx">Sales Managment - Home</a></li>
          <li><a class="page-scroll" href="Customer.aspx">Customer</a></li>
          <li><a class="page-scroll" href="Quotation.aspx">Quotation</a></li>
          <li><a class="page-scroll" href="Quotes.aspx">Quotes</a></li>          
          <li><a class="page-scroll" href="SalesOrder.aspx">Sales Order</a></li>
          <li><a class="page-scroll" href="Contains.aspx">Contains</a></li>
          <li><a class="page-scroll" href="Shipment.aspx">Shipment</a></li>
                    <li><a class="page-scroll" href="Ships.aspx">Ships</a></li>
          <li><a class="page-scroll" href="Invoice.aspx">Invoice</a></li>
          <li><a class="page-scroll" href="Payment.aspx">Payment</a></li>
          <li><a class="page-scroll" href="ListingPrice.aspx">Listing Price</a></li>
                </ul>
            </div>
        </div>
    </div>
                <asp:SqlDataSource ID="SqlContains" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [CONTAINS] ORDER BY [CONTAINS_ID]">
          </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSalesorder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [SALES_ORDER] ORDER BY [Sorder_Number]">
            
        </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>

        <div style="margin-top:100px;"  align="center">
        <br/>
    <asp:Label ID="lblQuotation" runat="server" Text="Contains Data Management" Font-Bold="True"></asp:Label>  <br /> <br />
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server">
        <asp:Button ID="btnAdd" runat="server"   CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
        <asp:GridView ID="GridViewContains" runat="server" AutoGenerateColumns="False" DataKeyNames="CONTAINS_ID" DataSourceID="SqlContains" AllowSorting="True" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="CONTAINS_ID" HeaderText="CONTAINS_ID" ReadOnly="True" SortExpression="CONTAINS_ID" InsertVisible="False" />
                <asp:BoundField DataField="SOquantity" HeaderText="SOquantity" SortExpression="SOquantity" />

                <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
                <asp:BoundField DataField="Sorder_Number" HeaderText="Sorder_Number" SortExpression="Sorder_Number" />
            </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <EditRowStyle BackColor="Yellow"/>
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        </asp:Panel>

    
    
          <asp:Panel ID="panelAddQuotation" Visible="false" runat="server">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="lblQuotationTitle" Text="Enter New Sales Order  Information" runat="server" Font-Bold="True"/><br /> <br />

                          <asp:Label ID="lblCustomerId" runat="server" Text="Salesorder Number" Width="200px" />
              <asp:DropDownList ID="dropQotationNum" runat="server" DataSourceID="SqlDataSalesorder" DataTextField="Sorder_Number" DataValueField="Sorder_Number">
                  <asp:ListItem Text="-- Customer ID --" Value="-1"></asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="rfvAllocatesTime" runat="server" ControlToValidate="Quantity" ErrorMessage="(*) Select One Sales order Number" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              &nbsp;
              <br/>
              <asp:Label ID="lblProductId" runat="server" Text="Product: " Width="200px" />
              <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID">
                  <asp:ListItem Text="-- Product ID --" Value="-1"></asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="rfvProductId" runat="server" ControlToValidate="dropProductId" ErrorMessage="(*) One Product ID should be selected" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              <br />
              <asp:Label ID="lbQuantity" runat="server" style="margin-left: 95px" Text="Quantity: " Width="132px" />
            <asp:TextBox ID="Quantity" runat="server" style="margin-top: 0px"></asp:TextBox>
              <br />
              <asp:RequiredFieldValidator ID="rfvCustomerId" runat="server" ControlToValidate="dropQotationNum" ErrorMessage="(*) Enter Required amount of quantity" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="revAllocatesTime" runat="server" ControlToValidate="Quantity" ErrorMessage=" (*) eg:20, " ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="addQuotationValidation"></asp:RegularExpressionValidator>
              <br />
              <br />
              <br />
                    &nbsp;<asp:Panel ID="calpanel" runat="server" Visible="false">
                  <br />
              </asp:Panel>
              <br/>
              <br />
              <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" OnClick="btnSave_Click" Text="Save" ValidationGroup="addQuotationValidation" />
              <asp:Button ID="btnCancel" runat="server" CssClass="bg-primary" OnClick="btnCancel_Click" Text="Cancel" />
              <br />
     </asp:Panel>

       </div>
   </form>
</body>
</html>
