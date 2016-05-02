<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockUpdate.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.StockUpdate" %>

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
        <asp:SqlDataSource ID="SqlStockUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockUpdate] ORDER BY [StockMovement_ID]" DeleteCommand="DELETE FROM [StockUpdate] WHERE [StockUpdate_ID] = @StockUpdate_ID" InsertCommand="INSERT INTO [StockUpdate] ([StockMovement_ID]) VALUES (@StockMovement_ID)" UpdateCommand="UPDATE [StockUpdate] SET [StockMovement_ID] = @StockMovement_ID WHERE [StockUpdate_ID] = @StockUpdate_ID">
            <DeleteParameters>
                <asp:Parameter Name="StockUpdate_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StockMovement_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StockMovement_ID" Type="Int32" />
                <asp:Parameter Name="StockUpdate_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
        <asp:SqlDataSource ID="SqlProductStockUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [ProductStockUpdate] ORDER BY [StockUpdate_ID]" InsertCommand="INSERT INTO [ProductStockUpdate] ([StockUpdate_ID], Entry_ID, Product_ID) VALUES (@StockUpdate_ID),@Entry_ID, @Product_ID">
        <InsertParameters>
            <asp:Parameter Name="StockUpdate_ID" Type="Int32" />
            <asp:Parameter Name="Entry_ID" Type="Int32" />
            <asp:Parameter Name="Product_ID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRMStockUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RMStockUpdate] ORDER BY [StockUpdate_ID]" InsertCommand="INSERT INTO [RMStockUpdate] ([StockUpdate_ID], Entry_ID, RM_ID) VALUES (@StockUpdate_ID),@Entry_ID, @RM_ID">
         <InsertParameters>
            <asp:Parameter Name="StockUpdate_ID" Type="Int32" />
            <asp:Parameter Name="Entry_ID" Type="Int32" />
            <asp:Parameter Name="RM_ID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Stock Update Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Panel ID="PanelgvStockUpdate" runat="server">
                     <asp:Button ID="btnaddStockUpdate" runat="server" Text="Add" OnClick="btnaddStockUpdate_Click"/>
                    <asp:GridView ID="gvStockUpdate" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlStockUpdate" AutoGenerateColumns="False" DataKeyNames="StockUpdate_ID">
                        <Columns>
                            <asp:BoundField DataField="StockUpdate_ID" HeaderText="StockUpdate_ID" ReadOnly="True" SortExpression="StockUpdate_ID" InsertVisible="False" />
                            <asp:BoundField DataField="StockMovement_ID" HeaderText="StockMovement_ID" SortExpression="StockMovement_ID" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                     <br />
                     <asp:GridView ID="GVProductStockUpdate" runat="server" AutoGenerateColumns="False" DataSourceID="SqlProductStockUpdate">
                         <Columns>
                             <asp:BoundField DataField="StockUpdate_ID" HeaderText="StockUpdate_ID" SortExpression="StockUpdate_ID" />
                             <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" SortExpression="Entry_ID" />
                             <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
                         </Columns>
                     </asp:GridView>
                     <br />
                     <asp:GridView ID="GVRMStockUpdate" runat="server" AutoGenerateColumns="False" DataSourceID="SqlRMStockUpdate">
                         <Columns>
                             <asp:BoundField DataField="StockUpdate_ID" HeaderText="StockUpdate_ID" SortExpression="StockUpdate_ID" />
                             <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" SortExpression="Entry_ID" />
                             <asp:BoundField DataField="RM_ID" HeaderText="RM_ID" SortExpression="RM_ID" />
                         </Columns>
                     </asp:GridView>
                     <br />
                   </asp:Panel>

                <asp:Panel ID="PaneladdStockUpdate" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesInventoryDetails" Text="Enter Stock Update Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblIncludesStockMovementID" runat="server" Text="Stock Movement ID:" Width="200px" />
                    <asp:TextBox ID="StockMovementTextBox" runat="server" Width="199px"></asp:TextBox>
                        
                    <br />
                    <br />
                    <asp:RadioButtonList ID="StockUpdateList" runat="server" AutoPostBack="true" CssClass="radio" OnSelectedIndexChanged="StockUpdateList_SelectedIndexChanged" RepeatDirection="Horizontal">
                        <asp:ListItem Text="ProductStockUpdate " Value="1"></asp:ListItem>
                        <asp:ListItem Text="RMStockUpdate " Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                    
                    <br />
                    
                    <br />
                    <asp:Panel ID="PanelProduct" runat="server" Visible="false">
                        <asp:Label ID="lblEntryID" runat="server" Text="Entry ID:" Width="200px" />
                        <asp:TextBox ID="EntryIDTextBox" runat="server" Width="199px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblProductID" runat="server" Text="Product ID:" Width="200px" />
                        <asp:TextBox ID="ProductIDTextBox" runat="server" Width="199px"></asp:TextBox>
                        <br />
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Panel ID="PanelRM" Visible="false" runat="server">
                    <asp:Label ID="lblEntryID0" runat="server" Text="Entry ID:" Width="200px" />
                    <asp:TextBox ID="EntryIDTextBox0" runat="server" Width="199px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblRMID" runat="server" Text="RM ID:" Width="200px" />
                    <asp:TextBox ID="RMIDTextBox" runat="server" Width="199px"></asp:TextBox>
                        </asp:Panel>
                    <br />
                    <br />
                    <asp:Button ID="btnSaveStockUpdate" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveStockUpdate_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelStockUpdate" runat="server" Text="Cancel" OnClick="btnCancelStockUpdate_Click"/>
                   
                    </asp:Panel>
        </div>
    </form>
    
</body>
</html>
