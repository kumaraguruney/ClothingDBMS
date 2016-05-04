<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RMStockUpdate.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.RMStockUpdate" %>

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
        <asp:SqlDataSource ID="SqlRMStockUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RMStockUpdate] ORDER BY [StockUpdate_ID]" DeleteCommand="DELETE FROM [RMStockUpdate] WHERE [StockUpdate_ID] = @StockUpdate_ID" InsertCommand="INSERT INTO [RMStockUpdate] ([StockMovement_ID], [Entry_ID], [RM_ID]) VALUES (@StockMovement_ID, @Entry_ID, @RM_ID)" UpdateCommand="UPDATE [RMStockUpdate] SET [StockMovement_ID] = @StockMovement_ID, [Entry_ID] = @Entry_ID, [RM_ID] = @RM_ID WHERE [StockUpdate_ID] = @StockUpdate_ID">
            <DeleteParameters>
                <asp:Parameter Name="StockUpdate_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StockMovement_ID" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
                <asp:Parameter Name="RM_ID" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StockMovement_ID" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
                <asp:Parameter Name="RM_ID" Type="Int16" />
                <asp:Parameter Name="StockUpdate_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
        <asp:SqlDataSource ID="SqlStockMovement" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockMovement] ORDER BY [StockMovement_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRMInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RMInventory] ORDER BY [Entry_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_Description]">
        </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblRMStockUpdate" runat="server" Text="RM Stock Update Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvRMStockUpdate" runat="server">
                     <asp:Button ID="btnaddRMStockUpdate" runat="server" Text="Add" OnClick="btnaddAllocates_Click"/>
                    <asp:GridView ID="gvRMStockUpdate" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlRMStockUpdate" AutoGenerateColumns="False" DataKeyNames="StockUpdate_ID">
                        <Columns>
                            <asp:BoundField DataField="StockUpdate_ID" HeaderText="StockUpdate_ID" ReadOnly="True" SortExpression="StockUpdate_ID" InsertVisible="False" />
                            <asp:BoundField DataField="StockMovement_ID" HeaderText="StockMovement_ID" SortExpression="StockMovement_ID" />
                             <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" SortExpression="Entry_ID" />
                            <asp:BoundField DataField="RM_ID" HeaderText="RM_ID" SortExpression="RM_ID" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdRMStockUpdate" Visible="false" runat="server">
                <asp:Label ID="lblRMStockUpdateDetails" Text="Enter RM Stock Update Details" runat="server" />
                    <br />
                    <br />
                    <asp:Label ID="lblIncludesStockMovementID" runat="server" Text="Stock Movement ID:" Width="200px" />
                    <asp:DropDownList ID="StockMovementIDDropDownList" runat="server" DataSourceID="SqlStockMovement" DataTextField="StockMovement_ID" DataValueField="StockMovement_ID" Height="33px" Width="182px">
                    </asp:DropDownList>
                    <br /> <br />
                    <asp:Label ID="lblRMID" runat="server" Text="RM ID:" Width="200px" />
                    <asp:DropDownList ID="RMIDDropDownList" runat="server" DataSourceID="SqlProductInventory" DataTextField="Entry_ID" DataValueField="Entry_ID" Height="26px" Width="182px">
                    </asp:DropDownList>
                        
                    <br />
                    <br />
                    <asp:Label ID="lblEntryID" Width="200px" Text="Entry ID:" runat="server" />
                    <asp:DropDownList ID="EntryIDDropDownList" runat="server" DataSourceID="SqlProduct" DataTextField="Product_Description" DataValueField="Product_ID" Height="26px" Width="182px">
                    </asp:DropDownList>
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveRMStockUpdate" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveRMStockUpdate_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelRMStockUpdate" runat="server" Text="Cancel" OnClick="btnCancelRMStockUpdate_Click"/>
                   
                    </asp:Panel>
        </div>
       
    </div>
   
</body>
</html>
