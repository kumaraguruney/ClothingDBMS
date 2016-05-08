<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockReconciliation.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.StockReconciliation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
*{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}</style>
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
                    <li><a href="ProductStockUpdate.aspx">Product Stock Update</a></li>
                    <li><a href="RMStockUpdate.aspx">RM Stock Update</a></li>
                </ul>
            </div>
        </nav>
        <asp:SqlDataSource ID="SqlStockReconcile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" DeleteCommand="DELETE FROM [StockReconcile] WHERE [Record_ID] = @Record_ID" InsertCommand="INSERT INTO [StockReconcile] ([Warehouse_ID], [Location_ID], [Batch_ID], [Inventory_Quantity], [Physical_Quantity], [Reconciled_Date]) VALUES (@Warehouse_ID, @Location_ID, @Batch_ID, @Inventory_Quantity, @Physical_Quantity, @Reconciled_Date)" SelectCommand="SELECT StockReconcile.Record_ID, StockReconcile.Warehouse_ID, StockReconcile.Location_ID, StockReconcile.Batch_ID, StockReconcile.Inventory_Quantity, StockReconcile.Physical_Quantity, StockReconcile.Reconciled_Date, Warehouse.Warehouse_Name, Location.Location_Name FROM StockReconcile INNER JOIN Warehouse ON Warehouse.Warehouse_ID = StockReconcile.Warehouse_ID INNER JOIN Location ON Location.Location_ID = StockReconcile.Location_ID ORDER BY StockReconcile.Reconciled_Date" UpdateCommand="UPDATE [StockReconcile] SET [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Batch_ID] = @Batch_ID, [Inventory_Quantity] = @Inventory_Quantity, [Physical_Quantity] = @Physical_Quantity, [Reconciled_Date] = @Reconciled_Date WHERE [Record_ID] = @Record_ID">
            <DeleteParameters>
                <asp:Parameter Name="Record_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
                <asp:Parameter Name="Location_ID" Type="Int16" />
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Inventory_Quantity" Type="Int32" />
                <asp:Parameter Name="Physical_Quantity" Type="Int32" />
                <asp:Parameter Name="Reconciled_Date" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
                <asp:Parameter Name="Location_ID" Type="Int16" />
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Inventory_Quantity" Type="Int32" />
                <asp:Parameter Name="Physical_Quantity" Type="Int32" />
                <asp:Parameter Name="Reconciled_Date" Type="String" />
                <asp:Parameter Name="Record_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div align="center">
            <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlLocation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Location] where Warehouse_ID = @Warehouse_ID ORDER BY [Location_ID]">
            <SelectParameters>
                <asp:ControlParameter ControlID="WarehouseDropDownList" DbType="String" Name="Warehouse_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
            <br />
            <asp:Label ID="lblFinishedProduct" runat="server" Font-Bold="True" Text="Stock Reconciliation Details"></asp:Label>
            <br />
            <asp:Panel ID="PanelgvStockReconcile" runat="server" style="margin-top: 0px">
                <asp:Button ID="btnCheckStockReconciliation" runat="server" OnClick="btnCheckStockReconciliation_Click" Text="Check" />
                <asp:GridView ID="gvStockReconcile" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Record_ID" DataSourceID="SqlStockReconcile">
                    <Columns>
                        <asp:BoundField DataField="Record_ID" HeaderText="Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Record_ID" />
                        <asp:BoundField DataField="Warehouse_ID" HeaderText="Warehouse_ID" SortExpression="Warehouse_ID" />
                        <asp:BoundField DataField="Warehouse_Name" HeaderText="Warehouse_Name" SortExpression="Warehouse_Name" />
                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" SortExpression="Location_ID" />
                        <asp:BoundField DataField="Location_Name" HeaderText="Location_Name" SortExpression="Location_Name" />
                        <asp:BoundField DataField="Batch_ID" HeaderText="Batch_ID" SortExpression="Batch_ID" />
                        <asp:BoundField DataField="Inventory_Quantity" HeaderText="Inventory_Quantity" SortExpression="Inventory_Quantity" />
                        <asp:BoundField DataField="Physical_Quantity" HeaderText="Physical_Quantity" SortExpression="Physical_Quantity" />
                        <asp:BoundField DataField="Reconciled_Date" HeaderText="Reconciled_Date" SortExpression="Reconciled_Date" />
                    </Columns>
                    <EditRowStyle BackColor="Yellow" />
                </asp:GridView>
            </asp:Panel>
            <asp:Panel ID="PaneladdStockReconciliation" runat="server" Visible="false">
                <asp:Label ID="lblFinishedProductDetails" runat="server" Text="Enter Details" />
                <br /> 
                <br />
                    <asp:Label ID="lblWarehouse" runat="server" Text="Warehouse:" Width="200px" />
                <asp:DropDownList ID="WarehouseDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="SqlWarehouse" DataTextField="Warehouse_Name" DataValueField="Warehouse_ID" Width="250px">
                </asp:DropDownList>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblLocation" runat="server" Text="Location:" Width="200px" />
                <asp:DropDownList ID="LocationDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="SqlLocation" DataTextField="Location_Name" DataValueField="Location_ID" EnableViewState="False" Width="250px">
                </asp:DropDownList>
                <br />
                <br />
                <asp:RadioButtonList ID="rbStockReconcile" AutoPostBack="true" runat="server" CssClass="radio" RepeatDirection="Horizontal" TextAlign="Right" width="250" OnSelectedIndexChanged="rbStockReconcile_SelectedIndexChanged">
                        <asp:ListItem Text="Product &nbsp;" Value="true"></asp:ListItem>
                        <asp:ListItem Text="Raw Material" Value="false"></asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <br />
                <asp:Label ID="lblBatch" runat="server" Text="Batch:" Width="200px" />
                <asp:DropDownList ID="BatchDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID" EnableViewState="False" Width="250px">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblInventoryQuantity" runat="server" Text="Inventory Quantity:" Width="200px" />
                <asp:TextBox ID="InventoryQuantityTextBox" runat="server" Height="16px" ReadOnly="True" Width="225px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblPhysicalQuantity" runat="server" Text="Physical Quantity:" Width="200px" />
                <asp:TextBox ID="PhysicalQuantityTextBox" runat="server" Height="16px" Width="225px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblReconciledDate" runat="server" Text="Reconciled Date:" Width="200px" />
                <asp:TextBox ID="ReconciledDateTextBox" runat="server" Width="199px"></asp:TextBox>
                &nbsp;<asp:ImageButton ID="calimgReconciledDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgReconciledDate_Click" Width="25px" />
                <asp:Panel ID="calpanel" runat="server" Visible="false">
                    <asp:Calendar ID="calReconciledDate" runat="server" OnSelectionChanged="calReconciledDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveStockReconcile" runat="server" OnClick="btnSaveStockReconcile_Click" Text="Save" ValidationGroup="addAllocatesValidation" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancelStockReconcile" runat="server" OnClick="btnCancelStockReconcile_Click" Text="Cancel" />
            </asp:Panel>
        </div>
    </form>
    
</body>
</html>
