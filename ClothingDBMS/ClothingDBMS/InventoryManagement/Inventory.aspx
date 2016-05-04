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
          <li><a href="ProductInventory.aspx">ProductInventory</a></li>
          <li><a href="RMInventory.aspx">RMInventory</a></li>
          <li><a href="StockMovement.aspx">Stock Movement</a></li>
          <li><a href="StockUpdate.aspx">Stock Update</a></li>
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Inventory] ORDER BY [Inventory_ID]" DeleteCommand="DELETE FROM [Inventory] WHERE [Inventory_ID] = @Inventory_ID" InsertCommand="INSERT INTO [Inventory] ([Inventory_Name], [Warehouse_ID], [Area]) VALUES (@Inventory_Name, @Warehouse_ID, @Area)" UpdateCommand="UPDATE [Inventory] SET [Inventory_Name] = @Inventory_Name, [Warehouse_ID] = @Warehouse_ID, [Area] = @Area WHERE [Inventory_ID] = @Inventory_ID">
            <DeleteParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Inventory_Name" Type="String" />
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
                <asp:Parameter Name="Area" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Inventory_Name" Type="String" />
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
                <asp:Parameter Name="Area" Type="Int16" />
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
        <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse] ORDER BY [Warehouse_Name]">
        </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Inventory Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Panel ID="PanelgvInventory" runat="server">
                     <asp:Button ID="btnaddInventory" runat="server" Text="Add" OnClick="btnaddInventory_Click"/>
                    <asp:GridView ID="gvInventory" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlInventory" AutoGenerateColumns="False" DataKeyNames="Inventory_ID">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Inventory_ID" HeaderText="Inventory_ID" ReadOnly="True" SortExpression="Inventory_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Inventory_Name" HeaderText="Inventory_Name" SortExpression="Inventory_Name" />
                            <asp:BoundField DataField="Warehouse_ID" HeaderText="Warehouse_ID" SortExpression="Warehouse_ID" />
                             <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdInventory" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesInventoryDetails" Text="Enter Inventory Details" runat="server" /><br /> <br />
                    <br />
                    <asp:Label ID="lblIncludesWarehouseID" Width="200px" Text="Warehouse ID:" runat="server" />
                    <asp:DropDownList ID="WarehouseIDDropDownList" runat="server" DataSourceID="SqlWarehouse" DataTextField="Warehouse_Name" DataValueField="Warehouse_ID" style="margin-left: 0px" Width="186px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblInventoryName" runat="server" Text="Inventory Name:" Width="200px" />
                    <asp:TextBox ID="InventoryNameTextBox" runat="server" Width="199px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblArea" runat="server" Text="Area:" Width="200px" />
                    <asp:TextBox ID="AreaTextBox" runat="server" Width="199px"></asp:TextBox>
                    
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
