<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="SalesManagement.Sales.Invoice1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
                <nav>
    <div class="nav-wrapper">
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../Index.aspx">Home</a></li>
        <li><a href="Default.aspx">Sales Managment - Home</a></li>
        <li><a href="Customer.aspx">Customer Management</a></li>
          <li><a href="Invoice.aspx">Invoice Management</a></li>
          <li><a href="Payment.aspx">Payment Management</a></li>
          <li><a href="Quotation.aspx">Quotation Management</a></li>
          <li><a href="SalesOrder.aspx">Sales Order Management</a></li>
          <li><a href="Shipment.aspx">Shipment Management</a></li>
       </ul>
    </div>
  </nav>
        <div align="center">
        <br/>
        <asp:Label ID="lblInvoice" runat="server" Text="Invoice Management" Font-Bold="true"></asp:Label>
       <asp:SqlDataSource ID="SqlDataSourceInvoice" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [INVOICE]" DeleteCommand="DELETE FROM [INVOICE] WHERE [Invoice_Number] = @Invoice_Number" InsertCommand="INSERT INTO [INVOICE] ([Invoice_Date], [Shipment_Id], [Sorder_Number], [Product_Id], [Payment_Id]) VALUES (@Invoice_Date, @Shipment_Id, @Sorder_Number, @Product_Id, @Payment_Id)" UpdateCommand="UPDATE [INVOICE] SET [Invoice_Date] = @Invoice_Date, [Shipment_Id] = @Shipment_Id, [Sorder_Number] = @Sorder_Number, [Product_Id] = @Product_Id, [Payment_Id] = @Payment_Id WHERE [Invoice_Number] = @Invoice_Number">
           <DeleteParameters>
               <asp:Parameter Name="Invoice_Number" Type="Int32" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="Invoice_Date" Type="DateTime" />
               <asp:Parameter Name="Shipment_Id" Type="Int32" />
               <asp:Parameter Name="Sorder_Number" Type="Int32" />
               <asp:Parameter Name="Product_Id" Type="Int32" />
               <asp:Parameter Name="Payment_Id" Type="Int32" />
           </InsertParameters>
           <UpdateParameters>
               <asp:Parameter Name="Invoice_Date" Type="DateTime" />
               <asp:Parameter Name="Shipment_Id" Type="Int32" />
               <asp:Parameter Name="Sorder_Number" Type="Int32" />
               <asp:Parameter Name="Product_Id" Type="Int32" />
               <asp:Parameter Name="Payment_Id" Type="Int32" />
               <asp:Parameter Name="Invoice_Number" Type="Int32" />
           </UpdateParameters>
        </asp:SqlDataSource>
         
        <asp:Panel ID="panelAddInvoice" Visible="false" runat="server" Height="134px"> 
                    <asp:Label ID="lblShipmentId" Width="200" Text="Shipment ID: " runat="server" />
                    <asp:DropDownList ID="dropShipmentId" runat="server" DataSourceID="SqlDataSourceShipment" DataTextField="Shipment_Id" DataValueField="Shipment_Id"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvShipmentId" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropShipmentId" ErrorMessage="(*) One Shipment ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblSorderNumber" Width="200" Text="Sales Order Number: " runat="server" />
                    <asp:DropDownList ID="dropSorderNumber" runat="server" DataSourceID="SqlDataSourceSalesOrder" DataTextField="Sorder_Number" DataValueField="Sorder_Number"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropSorderNumber" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropSorderNumber" ErrorMessage="(*) One Sales Order Number should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblProductId" Width="200" Text="Product ID: " runat="server" />
                    <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlDataSource" DataTextField="Product_Id" DataValueField="Product_Id"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfcdropProductId" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropProductId" ErrorMessage="(*) One Product ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblPyamentId" Width="200" Text="Payment ID: " runat="server" />
                    <asp:DropDownList ID="dropPaymentId" runat="server" DataSourceID="SqlDataSourcePayment" DataTextField="Payment_Id" DataValueField="Payment_Id"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropPaymentId" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropPaymentId" ErrorMessage="(*) One Payment ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
<br/>  <br/>           
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /> 
         </asp:Panel> 
        <asp:Panel ID="panelSaveInvoice" Visible="true" runat="server" Height="51px">
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="GridViewInvoice" runat="server" AutoGenerateColumns="False" DataKeyNames="Invoice_Number" DataSourceID="SqlDataSourceInvoice" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Invoice_Number" HeaderText="Invoice_Number" InsertVisible="False" ReadOnly="True" SortExpression="Invoice_Number" />
                    <asp:BoundField DataField="Invoice_Date" HeaderText="Invoice_Date" SortExpression="Invoice_Date" />
                    <asp:BoundField DataField="Shipment_Id" HeaderText="Shipment_Id" SortExpression="Shipment_Id" />
                    <asp:BoundField DataField="Sorder_Number" HeaderText="Sorder_Number" SortExpression="Sorder_Number" />
                    <asp:BoundField DataField="Product_Id" HeaderText="Product_Id" SortExpression="Product_Id" />
                    <asp:BoundField DataField="Payment_Id" HeaderText="Payment_Id" SortExpression="Payment_Id" />
                </Columns>
        </asp:GridView>
        </asp:Panel>
      </div>
    </form>
</body>
</html>
