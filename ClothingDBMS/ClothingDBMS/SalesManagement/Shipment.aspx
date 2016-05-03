<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shipment.aspx.cs" Inherits="SalesManagement.Sales.Shipment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" >
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
    <div style="height: 452px; margin-top: 0px" align="center">
               <asp:SqlDataSource ID="SqlDataSourceShipment" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [SHIPMENT]" DeleteCommand="DELETE FROM [SHIPMENT] WHERE [Shipment_Id] = @Shipment_Id" InsertCommand="INSERT INTO [SHIPMENT] ([Shipment_Date], [Sorder_Number], [Inventory_Id], [Customer_Id], [Due_Date]) VALUES (@Shipment_Date, @Sorder_Number, @Inventory_Id, @Customer_Id, @Due_Date)" UpdateCommand="UPDATE [SHIPMENT] SET [Shipment_Date] = @Shipment_Date, [Sorder_Number] = @Sorder_Number, [Inventory_Id] = @Inventory_Id, [Customer_Id] = @Customer_Id, [Due_Date] = @Due_Date WHERE [Shipment_Id] = @Shipment_Id">
            <DeleteParameters>
                <asp:Parameter Name="Shipment_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Shipment_Date" Type="DateTime" />
                <asp:Parameter Name="Sorder_Number" Type="Int32" />
                <asp:Parameter Name="Inventory_Id" Type="Int32" />
                <asp:Parameter Name="Customer_Id" Type="Int16" />
                <asp:Parameter Name="Due_Date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Shipment_Date" Type="DateTime" />
                <asp:Parameter Name="Sorder_Number" Type="Int32" />
                <asp:Parameter Name="Inventory_Id" Type="Int32" />
                <asp:Parameter Name="Customer_Id" Type="Int16" />
                <asp:Parameter Name="Due_Date" Type="DateTime" />
                <asp:Parameter Name="Shipment_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
      
        <asp:Label ID="lblShipment" runat="server" Text="Shipment Management" Font-Bold="true"></asp:Label>
    
  
        <asp:Panel ID="panelAddShipment" Visible="false" runat="server" Height="134px">
                    <asp:Label ID="lblSorderNo" Width="200" Text="Sales order Number: " runat="server" />
                    <asp:DropDownList ID="dropSalesOrderNo" runat="server" DataSourceID="SqlDataSourceSalesOrder" DataTextField="Sorder_Number" DataValueField="Sorder_Number"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvSalesOrderNo" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropSalesOrderNo" ErrorMessage="(*) One Sales Order Number should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblInventoryId" Width="200" Text="Inventory Id: " runat="server" />
                    <asp:DropDownList ID="dropInventoryId" runat="server" DataSourceID="SqlDataSourceInventory" DataTextField="Inventory_Id" DataValueField="Inventory_Id"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropInventoryId" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropInventoryId" ErrorMessage="(*) One Inventory ID should be Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblCustomerId" Width="200" Text="Inventory Id: " runat="server" />
                    <asp:DropDownList ID="dropCustomerId" runat="server" DataSourceID="SqlDataSourceCustomer" DataTextField="Customer_Id" DataValueField="Customer_Id"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropCustomerId" ErrorMessage="(*) One Customer ID should be Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
   
                    <br /> <br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /> 
         </asp:Panel> 
    
        <asp:Panel ID="panelSaveShipment" Visible="true" runat="server" Height="175px">
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="GridViewShipment" runat="server" AutoGenerateColumns="False" DataKeyNames="Shipment_Id" DataSourceID="SqlDataSourceShipment" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Shipment_Id" HeaderText="Shipment_Id" InsertVisible="False" ReadOnly="True" SortExpression="Shipment_Id" />
                    <asp:BoundField DataField="Shipment_Date" HeaderText="Shipment_Date" SortExpression="Shipment_Date" />
                    <asp:BoundField DataField="Sorder_Number" HeaderText="Sorder_Number" SortExpression="Sorder_Number" />
                    <asp:BoundField DataField="Inventory_Id" HeaderText="Inventory_Id" SortExpression="Inventory_Id" />
                    <asp:BoundField DataField="Customer_Id" HeaderText="Customer_Id" SortExpression="Customer_Id" />
                    <asp:BoundField DataField="Due_Date" HeaderText="Due_Date" SortExpression="Due_Date" />
                </Columns>
        </asp:GridView>
        </asp:Panel>
    
 
    </div>
    </form>
</body>
</html>
