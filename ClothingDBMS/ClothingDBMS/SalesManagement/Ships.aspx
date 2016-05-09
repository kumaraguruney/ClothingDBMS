<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ships.aspx.cs" Inherits="ClothingDBMS.SalesManagement.Ships" %>

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
                
                <asp:SqlDataSource ID="SqlShipments" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [SHIPMENT] ORDER BY [Shipment_Id]" DeleteCommand="DELETE FROM [SHIPMENT] WHERE [Shipment_Id] = @Shipment_Id" InsertCommand="INSERT INTO [SHIPMENT] ([Shipment_Date], [Sorder_Number], [Customer_Id], [Due_Date]) VALUES (@Shipment_Date, @Sorder_Number, @Customer_Id, @Due_Date)" UpdateCommand="UPDATE [SHIPMENT] SET [Shipment_Date] = @Shipment_Date, [Sorder_Number] = @Sorder_Number, [Customer_Id] = @Customer_Id, [Due_Date] = @Due_Date WHERE [Shipment_Id] = @Shipment_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Shipment_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Shipment_Date" Type="String" />
                        <asp:Parameter Name="Sorder_Number" Type="Int32" />
                        <asp:Parameter Name="Customer_Id" Type="Int32" />
                        <asp:Parameter Name="Due_Date" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Shipment_Date" Type="String" />
                        <asp:Parameter Name="Sorder_Number" Type="Int32" />
                        <asp:Parameter Name="Customer_Id" Type="Int32" />
                        <asp:Parameter Name="Due_Date" Type="String" />
                        <asp:Parameter Name="Shipment_Id" Type="Int32" />
                    </UpdateParameters>
            
        </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlProductInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT [Product_ID], [Entry_ID] FROM [ProductInventory] ORDER BY [Entry_ID]" DeleteCommand="DELETE FROM [ProductInventory] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [ProductInventory] ([Product_ID]) VALUES (@Product_ID)" UpdateCommand="UPDATE [ProductInventory] SET [Product_ID] = @Product_ID WHERE [Entry_ID] = @Entry_ID">
           <DeleteParameters>
               <asp:Parameter Name="Entry_ID" Type="Int32" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="Product_ID" Type="Int16" />
           </InsertParameters>
           <UpdateParameters>
               <asp:Parameter Name="Product_ID" Type="Int16" />
               <asp:Parameter Name="Entry_ID" Type="Int32" />
           </UpdateParameters>
          </asp:SqlDataSource>

        <div style="margin-top:100px;"  align="center">
        <br/>
    <asp:Label ID="lblQuotation" runat="server" Text="Ships Data Management" Font-Bold="True"></asp:Label>  <br /> <br />
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server">
        <asp:Button ID="btnAdd" runat="server"   CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
            <asp:SqlDataSource ID="SqlShips" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" DeleteCommand="DELETE FROM [SHIPS] WHERE [Ships_Id] = @Ships_Id" InsertCommand="INSERT INTO [SHIPS] ([SPquantity], [Shipment_Id], [Entry_ID]) VALUES (@SPquantity, @Shipment_Id, @Entry_ID)" SelectCommand="SELECT * FROM [SHIPS] ORDER BY [Ships_Id]" UpdateCommand="UPDATE [SHIPS] SET [SPquantity] = @SPquantity, [Shipment_Id] = @Shipment_Id, [Entry_ID] = @Entry_ID WHERE [Ships_Id] = @Ships_Id">
                <DeleteParameters>
                    <asp:Parameter Name="Ships_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SPquantity" Type="Int16" />
                    <asp:Parameter Name="Shipment_Id" Type="Int32" />
                    <asp:Parameter Name="Entry_ID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SPquantity" Type="Int16" />
                    <asp:Parameter Name="Shipment_Id" Type="Int32" />
                    <asp:Parameter Name="Entry_ID" Type="Int32" />
                    <asp:Parameter Name="Ships_Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewShips" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Ships_Id" DataSourceID="SqlShips">
                <Columns>
                    <asp:BoundField DataField="Ships_Id" HeaderText="Ships_Id" InsertVisible="False" ReadOnly="True" SortExpression="Ships_Id" />
                    <asp:BoundField DataField="SPquantity" HeaderText="SPquantity" SortExpression="SPquantity" />
                    <asp:BoundField DataField="Shipment_Id" HeaderText="Shipment_Id" SortExpression="Shipment_Id" />
                    <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" SortExpression="Entry_ID" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <EditRowStyle BackColor="Yellow" />
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
         <asp:Label ID="lblQuotationTitle" Text="Enter shipment Quantity  Information" runat="server" Font-Bold="True"/><br /> <br />

                          <asp:Label ID="lblCustomerId" runat="server" Text="Shipment ID" Width="200px" />
              <asp:DropDownList ID="dropShipmentID" runat="server" DataSourceID="SqlShips" DataTextField="Shipment_Id" DataValueField="Shipment_Id">
                  <asp:ListItem Text="-- Sales Order --" Value="-1"></asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="rfvAllocatesTime" runat="server" ControlToValidate="dropQotationNum" ErrorMessage="(*) Select One Sales order Number" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              &nbsp;
              <br/>
              <asp:Label ID="lblProductId" runat="server" Text="Product: " Width="200px" />
              <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlProductInventory" DataTextField="Product_ID" DataValueField="Product_ID">
                  <asp:ListItem Text="-- Product ID --" Value="-1"></asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="rfvProductId" runat="server" ControlToValidate="dropProductId" ErrorMessage="(*) One Product ID should be selected" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              <br />
              <asp:Label ID="lbQuantity" runat="server" style="margin-left: 95px" Text="Quantity: " Width="132px" />
            <asp:TextBox ID="Quantity" runat="server" style="margin-top: 0px"></asp:TextBox>
              <br />
              <asp:RequiredFieldValidator ID="rfvCustomerId" runat="server" ControlToValidate="Quantity" ErrorMessage="(*) Enter Required amount of quantity" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="revAllocatesTime" runat="server" ControlToValidate="Quantity" ErrorMessage=" (*) eg:20, " ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="addQuotationValidation"></asp:RegularExpressionValidator>
              <br />
     
              <br />
              <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" OnClick="btnSave_Click" Text="Save" ValidationGroup="addQuotationValidation" />
              <asp:Button ID="btnCancel" runat="server" CssClass="bg-primary" OnClick="btnCancel_Click" Text="Cancel" />
              <br />
     </asp:Panel>

       </div>
   </form>
</body>
</html>

