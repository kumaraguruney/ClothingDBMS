<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.Inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
            <nav>
    <div class="nav-wrapper">
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../Index.aspx">Home</a></li>
        <li><a href="Default.aspx">Inventory Management - Home</a></li>
        <li><a href="Warehouse.aspx">Warehouse Details</a></li>
          <li><a href="Inventory.aspx">Inventory Details</a></li>
          <li><a href="StockMovement.aspx">Stock Movement</a></li>
          <li><a href="StockUpdate.aspx">Stock Update</a></li>
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Inventory] ORDER BY [Inventory_ID]" DeleteCommand="DELETE FROM [Inventory] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [Inventory] ([Inventory_ID], [Warehouse_ID], [Quantity]) VALUES (@Inventory_ID, @Warehouse_ID, @Quantity)" UpdateCommand="UPDATE [Inventory] SET [Inventory_ID] = @Inventory_ID, [Warehouse_ID] = @Warehouse_ID, [Quantity] = @Quantity WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
                <asp:Parameter Name="Quantity" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Inventory Details" Font-Bold="True"></asp:Label> <br /> <br />
             
                <br /> <br />
                <asp:Panel ID="PanelgvInventory" runat="server">
                     <asp:Button ID="btnaddInventory" runat="server" Text="Add" OnClick="btnaddInventory_Click"/>
                    <asp:GridView ID="gvInventory" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlInventory" AutoGenerateColumns="False" DataKeyNames="Entry_ID">
                        <Columns>
                            <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" ReadOnly="True" SortExpression="Entry_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Inventory_ID" HeaderText="Inventory_ID" SortExpression="Inventory_ID" />
                             <asp:BoundField DataField="Warehouse_ID" HeaderText="Warehouse_ID" SortExpression="Warehouse_ID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdInventory" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesInventoryDetails" Text="Enter Inventory Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblAllocatesInventoryID" runat="server" Text="Inventory ID:" Width="200px" />
                    <asp:TextBox ID="InventoryTextBox" runat="server" Width="199px"></asp:TextBox>
                        
                    <br />
                    <br />
                    <asp:Label ID="lblIncludesWarehouseID" Width="200px" Text="Warehouse ID:" runat="server" />
                    <asp:TextBox ID="WarehouseIDTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblIncludesQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveInventory" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveInventory_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelInventory" runat="server" Text="Cancel" OnClick="btnCancelInventory_Click"/>
                   
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
