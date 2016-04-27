<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stockmovement.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.stockmovement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Warehouse Details</title>
</head>
<body style="height: 931px">
    <form id="form1" runat="server">
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
        <asp:SqlDataSource ID="SqlStockMovement" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockMovement] ORDER BY [StockMovement_ID]" DeleteCommand="DELETE FROM [StockMovement] WHERE [StockMovement_ID] = @StockMovement_ID" InsertCommand="INSERT INTO [StockMovement] ([From_Warehouse_ID], [To_Warehouse_ID]) VALUES (@From_Warehouse_ID, @To_Warehouse_ID)" UpdateCommand="UPDATE [StockMovement] SET [From_Warehouse_ID] = @From_Warehouse_ID, [To_Warehouse_ID] = @To_Warehouse_ID WHERE [StockMovement_ID] = @StockMovement_ID">
            <DeleteParameters>
                <asp:Parameter Name="StockMovement_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="From_Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="To_Warehouse_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="From_Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="To_Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="StockMovement_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
                <br />
                <asp:Label ID="lblStockMovement" runat="server" Text="Stock Movement" Font-Bold="True"></asp:Label> <br /> <br />
             
                <br /> <br />
                <asp:Panel ID="PanelgvStockMovement" runat="server">
                     <asp:Button ID="btnaddstockmovement" runat="server" Text="Add" OnClick="btnaddstockmovement_Click"/>
                    <asp:GridView ID="gvStockMovement" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlStockMovement" AutoGenerateColumns="False" DataKeyNames="StockMovement_ID">
                        <Columns>
                            <asp:BoundField DataField="StockMovement_ID" HeaderText="StockMovement_ID" ReadOnly="True" SortExpression="StockMovement_ID" InsertVisible="False" />
                            <asp:BoundField DataField="From_Warehouse_ID" HeaderText="From_Warehouse_ID" SortExpression="From_Warehouse_ID" />
                             <asp:BoundField DataField="To_Warehouse_ID" HeaderText="To_Warehouse_ID" SortExpression="To_Warehouse_ID" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdStockMovement" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesWarehouseDetails" Text="Stock Movement Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblStockMovementFromWarehouse" runat="server" Text="From Warehouse :" Width="200px" />
                    <asp:TextBox ID="fromWhereHouseTextbox" runat="server" Width="199px"></asp:TextBox>
                        
                    <br />
                    <br />
                    <asp:Label ID="lblStockMovementToWarehouse" Width="200px" Text="To Warehouse :" runat="server" />
                    <asp:TextBox ID="ToWarehouseTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveStockMovement" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveStockMovement_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelStockMovement" runat="server" Text="Cancel" OnClick="btnCancelStockMovement_Click"/>
                   
                    </asp:Panel>
        </div>
    </form>
</body>
</html>

