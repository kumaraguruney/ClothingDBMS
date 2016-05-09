﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stockmovement.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.stockmovement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Warehouse Details</title>
    <style type="text/css">
*{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}</style>
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
          <li><a href="ProductInventory.aspx">ProductInventory</a></li>
          <li><a href="RMInventory.aspx">RMInventory</a></li>
          <li><a href="StockMovement.aspx">Stock Movement</a></li>
          <li><a href="ProductStockUpdate.aspx">Product Stock Update</a></li>
          <li><a href="RMStockUpdate.aspx">RM Stock Update</a></li>
          <li><a href="StockPile.aspx">StockPile</a></li>
          
         
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlStockPile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT StockPile.Entry_ID, StockPile.Batch_ID, StockPile.Warehouse_ID, StockPile.Location_ID, StockPile.Quantity, StockPile.Created_Date, StockPile.Is_Product, CASE WHEN is_product = 'true' THEN Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description , ' ') + ', ' + FinishedProduct.Manufactured_Date ELSE RawMaterial_Name + ', ' + code_3.Code_Description + ', ' + ISNULL(RawMaterial_Description , ' ') + ',' + ProcuredRawMaterial.Procured_Date END AS Name, Warehouse.Warehouse_Name, Location.Location_Name FROM StockPile LEFT OUTER JOIN FinishedProduct ON FinishedProduct.Batch_ID = StockPile.Batch_ID LEFT OUTER JOIN ProcuredRawMaterial ON ProcuredRawMaterial.Batch_ID = StockPile.Batch_ID LEFT OUTER JOIN RawMaterial ON RawMaterial.RawMaterial_ID = ProcuredRawMaterial.RawMaterial_ID LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = RawMaterial.RawMaterial_Color LEFT OUTER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section INNER JOIN Warehouse ON Warehouse.Warehouse_ID = StockPile.Warehouse_ID INNER JOIN Location ON Location.Location_ID = StockPile.Location_ID ORDER BY Name" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [StockPile] ([Batch_ID], [Warehouse_ID], [Location_ID], [Quantity], [Created_Date], [Is_Product]) VALUES (@Batch_ID, @Warehouse_ID, @Location_ID, @Quantity, @Created_Date, @Is_Product)" UpdateCommand="UPDATE [StockPile] SET [Batch_ID] = @Batch_ID, [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Quantity] = @Quantity, [Created_Date] = @Created_Date, [Is_Product] = @Is_Product WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="String" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="String" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
        <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse] ORDER BY [Warehouse_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProductStockPile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT StockPile.Batch_ID, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') + ', ' + FinishedProduct.Manufactured_Date AS Name FROM StockPile INNER JOIN FinishedProduct ON FinishedProduct.Batch_ID = StockPile.Batch_ID AND StockPile.Is_Product = 'TRUE' AND StockPile.Quantity &lt;&gt; 0 INNER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section INNER JOIN Warehouse ON Warehouse.Warehouse_ID = StockPile.Warehouse_ID INNER JOIN Location ON Location.Location_ID = StockPile.Location_ID ORDER BY Name" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [StockPile] ([Batch_ID], [Warehouse_ID], [Location_ID], [Quantity], [Created_Date], [Is_Product]) VALUES (@Batch_ID, @Warehouse_ID, @Location_ID, @Quantity, @Created_Date, @Is_Product)" UpdateCommand="UPDATE [StockPile] SET [Batch_ID] = @Batch_ID, [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Quantity] = @Quantity, [Created_Date] = @Created_Date, [Is_Product] = @Is_Product WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="String" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="String" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProductRMDropDownStockPile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT StockPile.Batch_ID, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') + ', ' + FinishedProduct.Manufactured_Date AS Name FROM StockPile INNER JOIN FinishedProduct ON FinishedProduct.Batch_ID = StockPile.Batch_ID AND StockPile.Is_Product = 'TRUE' AND StockPile.Quantity = - 100 INNER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section INNER JOIN Warehouse ON Warehouse.Warehouse_ID = StockPile.Warehouse_ID INNER JOIN Location ON Location.Location_ID = StockPile.Location_ID ORDER BY Name" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [StockPile] ([Batch_ID], [Warehouse_ID], [Location_ID], [Quantity], [Created_Date], [Is_Product]) VALUES (@Batch_ID, @Warehouse_ID, @Location_ID, @Quantity, @Created_Date, @Is_Product)" UpdateCommand="UPDATE [StockPile] SET [Batch_ID] = @Batch_ID, [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Quantity] = @Quantity, [Created_Date] = @Created_Date, [Is_Product] = @Is_Product WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="String" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="String" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRMStockPile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT StockPile.Batch_ID, RawMaterial.RawMaterial_Name + ', ' + code_1.Code_Description + ', ' + ISNULL(RawMaterial.RawMaterial_Description, ' ') + ', ' + ProcuredRawMaterial.Procured_Date AS Name FROM StockPile INNER JOIN ProcuredRawMaterial ON ProcuredRawMaterial.Batch_ID = StockPile.Batch_ID AND ISNULL(StockPile.Is_Product, 0) = 'FALSE' AND StockPile.Quantity &lt;&gt; 0 INNER JOIN RawMaterial ON ProcuredRawMaterial.RawMaterial_ID = RawMaterial.RawMaterial_ID LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = RawMaterial.RawMaterial_Color ORDER BY Name" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [StockPile] ([Batch_ID], [Warehouse_ID], [Location_ID], [Quantity], [Created_Date], [Is_Product]) VALUES (@Batch_ID, @Warehouse_ID, @Location_ID, @Quantity, @Created_Date, @Is_Product)" UpdateCommand="UPDATE [StockPile] SET [Batch_ID] = @Batch_ID, [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Quantity] = @Quantity, [Created_Date] = @Created_Date, [Is_Product] = @Is_Product WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="String" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="String" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlFromWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT StockPile.Warehouse_ID, Warehouse.Warehouse_Name FROM StockPile INNER JOIN Warehouse ON Warehouse.Warehouse_ID = StockPile.Warehouse_ID AND StockPile.Batch_ID = @BatchID">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="ProductRMDownList" Name="BatchID" PropertyName="SelectedValue" />
                  </SelectParameters>
              </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlFromLocation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT StockPile.Location_ID, Location.Location_Name FROM StockPile INNER JOIN Warehouse ON StockPile.Warehouse_ID = @Warehouse_ID AND StockPile.Batch_ID = @BatchID INNER JOIN Location ON StockPile.Location_ID = Location.Location_ID ORDER BY Location.Location_Name">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="FromWarehouseDropDownList" Name="Warehouse_ID" PropertyName="SelectedValue" />
                      <asp:ControlParameter ControlID="ProductRMDownList" Name="BatchID" PropertyName="SelectedValue" />
                  </SelectParameters>
              </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlLocation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Location.Location_ID, Location.Location_Name, Location.Warehouse_ID, Location.Area, Warehouse.Warehouse_Name FROM Location INNER JOIN Warehouse ON Warehouse.Warehouse_ID = Location.Warehouse_ID AND Warehouse.Warehouse_ID = @Warehouse_ID AND Location.Location_ID &lt;&gt; @locationID ORDER BY Location.Location_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="TowarehouseDropDownList" DefaultValue="0" Name="Warehouse_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FromLocationDropDownList" DefaultValue="" Name="locationID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlFinishedProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [FinishedProduct] ORDER BY [Batch_ID]">
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockPile]"></asp:SqlDataSource>
                <br />
                <asp:Label ID="lblStockMovement" runat="server" Text="Stock Movement" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Panel ID="PanelgvStockMovement" runat="server">
                     <asp:Button ID="btnaddstockmovement" runat="server" Text="Add" OnClick="btnaddstockmovement_Click"/>
                     <asp:GridView ID="gvStockMovement" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Entry_ID" DataSourceID="SqlStockPile">
                         <Columns>
                             <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" InsertVisible="False" ReadOnly="True" SortExpression="Entry_ID" />
                             <asp:BoundField DataField="Batch_ID" HeaderText="Batch_ID" SortExpression="Batch_ID" />
                             <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                             <asp:BoundField DataField="Warehouse_ID" HeaderText="Warehouse_ID" SortExpression="Warehouse_ID" />
                             <asp:BoundField DataField="Warehouse_Name" HeaderText="Warehouse_Name" SortExpression="Warehouse_Name" />
                             <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" SortExpression="Location_ID" />
                             <asp:BoundField DataField="Location_Name" HeaderText="Location_Name" SortExpression="Location_Name" />
                             <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                             <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" SortExpression="Created_Date" />
                             <asp:CheckBoxField DataField="Is_Product" HeaderText="Is_Product" SortExpression="Is_Product" />
                         </Columns>
                         <EditRowStyle BackColor="Yellow" />
                     </asp:GridView>
                   </asp:Panel>
              <div class="form-inline">
                    
                        </div>
              <div>
                <asp:Panel ID="PaneladdStockMovement" Visible="false" runat="server" Width="414px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButtonList ID="rbStockMovement" AutoPostBack ="True" width="250" RepeatDirection="Horizontal" CssClass="radio" TextAlign="Right" runat="server" OnSelectedIndexChanged="rbStockMovement_SelectedIndexChanged">
                        <asp:ListItem Value="true" Text="Product &nbsp"></asp:ListItem>
                        <asp:ListItem Value="false" Text="Raw Material"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblAllocatesWarehouseDetails" runat="server" Text="Stock Movement Details" />
                    <br />
                    <br />
                    <asp:Label ID="lblProduct" runat="server" Text="Product or Raw Material :" Width="200px" />
                    <asp:DropDownList ID="ProductRMDownList" AppendDataBoundItems="True" AutoPostBack="True" runat="server" DataSourceID="SqlProductRMDropDownStockPile" DataTextField="Name" DataValueField="Batch_ID" Height="20px" Width="185px">
                    <asp:ListItem Text="Select" Value="-1"></asp:ListItem>
                    </asp:DropDownList>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblWarehouse" runat="server" Text="From Warehouse :" Width="200px" />
                    <asp:DropDownList ID="FromWarehouseDropDownList" runat="server" AutoPostBack="true" AppendDataBoundItems="true" EnableViewState="false" DataSourceID="SqlFromWarehouse" DataTextField="Warehouse_Name" DataValueField="Warehouse_ID" Height="39px" Width="170px">
                    <asp:ListItem Text="-- Select Warehouse --" Value="-1"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblLocation" runat="server" Text="From Location:" Width="200px" />
                    <asp:DropDownList ID="FromLocationDropDownList" AutoPostBack="true" AppendDataBoundItems="true" EnableViewState="false" runat="server" DataSourceID="SqlFromLocation" DataTextField="Location_Name" DataValueField="Location_ID" Height="39px" Width="170px" OnSelectedIndexChanged="FromLocationDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="-- Select Location --" Value="-1"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblQuantity"  runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" AutoPostBack="true" ReadOnly="true" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                   
                    </asp:Panel>
                  </div>

                            <div>
                <asp:Panel ID="Panel1" Visible="false" runat="server" Width="777px" style="margin-top: 0px">
                    <br />
                    <asp:Label ID="LblToWarehouse" runat="server" Text="To Warehouse :" Width="200px" Height="16px" />
                    &nbsp;&nbsp;<asp:DropDownList ID="TowarehouseDropDownList" OnSelectedIndexChanged="TowarehouseDropDownList_SelectedIndexChanged" AutoPostBack="true" runat="server" AppendDataBoundItems="true" EnableViewState="false" DataSourceID="SqlWarehouse" DataTextField="Warehouse_Name" DataValueField="Warehouse_ID" Height="39px" Width="170px" >
                    <asp:ListItem Text="-- Select Warehouse --" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <asp:Label ID="lblToLocation" runat="server" Text="To Location:" Width="200px" />
                    <asp:DropDownList ID="ToLocationDropDownList" AutoPostBack="true" AppendDataBoundItems="true" EnableViewState="false" runat="server" DataSourceID="SqlLocation" DataTextField="Location_Name" DataValueField="Location_ID" Height="39px" Width="170px">
                    <asp:ListItem Text="-- Select Location --" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblToQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="ToQuantityTextBox" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="QuantityValidator" runat="server" Display="Dynamic" ErrorMessage="Value cannot exceed Available Quantity" ControlToValidate="ToQuantityTextBox" MaximumValue="1"
                        MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    <br />
                    <br />
             
                    <br />
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnMoveStockMovement" runat="server" OnClick="btnMoveStockMovement_Click" Text="Move" ValidationGroup="addAllocatesValidation" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancelStockMovement" runat="server" OnClick="btnCancelStockMovement_Click" Text="Cancel" />
                    <br />
                    &nbsp;&nbsp;
                                       
                    </asp:Panel>
                  </div>

        </div>
    </form>
</body>
</html>

