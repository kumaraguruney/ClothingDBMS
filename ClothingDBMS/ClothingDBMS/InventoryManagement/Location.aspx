<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Location.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.Inventory" %>

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
          <li><a href="Location.aspx">Inventory Details</a></li>
          <li><a href="StockMovement.aspx">Stock Movement</a></li>
          <li><a href="ProductInventory.aspx">ProductInventory</a></li>
          <li><a href="RMInventory.aspx">RMInventory</a></li>
          
          
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlLocation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Location] ORDER BY [Location_ID]" DeleteCommand="DELETE FROM [Location] WHERE [Location_ID] = @Location_ID" InsertCommand="INSERT INTO [Location] ([Location_Name], [Warehouse_ID], [Area]) VALUES (@Location_Name, @Warehouse_ID, @Area)" UpdateCommand="UPDATE [Location] SET [Location_Name] = @Location_Name, [Warehouse_ID] = @Warehouse_ID, [Area] = @Area WHERE [Location_ID] = @Location_ID">
            <DeleteParameters>
                <asp:Parameter Name="Location_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Location_Name" Type="String" />
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
                <asp:Parameter Name="Area" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Location_Name" Type="String" />
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
                <asp:Parameter Name="Area" Type="Int16" />
                <asp:Parameter Name="Location_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
        <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse] ORDER BY [Warehouse_Name]">
        </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Location Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Panel ID="PanelgvInventory" runat="server">
                     <asp:Button ID="btnaddInventory" runat="server" Text="Add" OnClick="btnaddInventory_Click"/>
                    <asp:GridView ID="gvInventory" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlLocation" AutoGenerateColumns="False" DataKeyNames="Location_ID">
                        <Columns>
                            <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" ReadOnly="True" SortExpression="Location_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Location_Name" HeaderText="Location_Name" SortExpression="Location_Name" />
                            <asp:BoundField DataField="Warehouse_ID" HeaderText="Warehouse_ID" SortExpression="Warehouse_ID" />
                             <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdInventory" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesInventoryDetails" Text="Enter Location Details" runat="server" /><br /> <br />
                    <br />
                    <asp:Label ID="lblIncludesWarehouseID" Width="200px" Text="Warehouse ID:" runat="server" />
                    <asp:DropDownList ID="WarehouseIDDropDownList" runat="server" DataSourceID="SqlWarehouse" DataTextField="Warehouse_Name" DataValueField="Warehouse_ID" style="margin-left: 0px" Width="186px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblInventoryName" runat="server" Text="Location Name:" Width="200px" />
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
