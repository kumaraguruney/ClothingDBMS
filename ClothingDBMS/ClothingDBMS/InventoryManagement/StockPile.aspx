<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockPile.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.StockPile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">



.radio
{
    color: #000;
}
.checkbox,.radio{position:relative;display:block;margin-top:10px;margin-bottom:10px}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}*,:after,:before{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}label{display:inline-block;max-width:100%;margin-bottom:5px;font-weight:700}
        </style>
</head>
<body>
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
        
          
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlStockPile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockPile] ORDER BY [Entry_ID]" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [StockPile] ([Batch_ID], [Warehouse_ID], [Location_ID], [Quantity], [Created_Date], [Is_Product]) VALUES (@Batch_ID, @Warehouse_ID, @Location_ID, @Quantity, @Created_Date, @Is_Product)" UpdateCommand="UPDATE [StockPile] SET [Batch_ID] = @Batch_ID, [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Quantity] = @Quantity, [Created_Date] = @Created_Date, [Is_Product] = @Is_Product WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
        <asp:SqlDataSource ID="SqlFinishedProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT FinishedProduct.Batch_ID, FinishedProduct.Product_ID, FinishedProduct.Quantity, FinishedProduct.Is_Stock_Piled, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') + ', ' + FinishedProduct.Manufactured_Date AS Name FROM FinishedProduct LEFT OUTER JOIN Product ON Product.Product_ID = FinishedProduct.Product_ID AND FinishedProduct.Is_Stock_Piled = 'TRUE' LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID AND FinishedProduct.Is_Stock_Piled = 'TRUE' LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size AND FinishedProduct.Is_Stock_Piled = 'TRUE' LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color AND FinishedProduct.Is_Stock_Piled = 'TRUE' LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section AND FinishedProduct.Is_Stock_Piled = 'TRUE' ORDER BY Name">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse] ORDER BY [Warehouse_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlLocation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Location] ORDER BY [Location_ID]">
        </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblStockPile" runat="server" Text="RM Inventory Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvStockPile" runat="server" style="margin-top: 0px">
                     <asp:Button ID="btnaddStockPile" runat="server" Text="Add" OnClick="btnaddStockPile_Click"/>
                    <asp:GridView ID="gvStockPile" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlStockPile" AutoGenerateColumns="False" DataKeyNames="Entry_ID">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" ReadOnly="True" SortExpression="Entry_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Batch_ID" HeaderText="Batch_ID" SortExpression="Batch_ID" />
                             <asp:BoundField DataField="Warehouse_ID" HeaderText="Warehouse_ID" SortExpression="Warehouse_ID" />
                            <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" SortExpression="Location_ID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" SortExpression="Created_Date" />
                            <asp:CheckBoxField DataField="Is_Product" HeaderText="Is_Product" SortExpression="Is_Product" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdStockPile" Visible="false" runat="server">
                <asp:Label ID="lblInventoryDetails" Text="Enter Inventory Details" runat="server" /><br /> 
                    <asp:RadioButtonList ID="rbStockPile" runat="server" CssClass="radio" RepeatDirection="Horizontal" TextAlign="Right" width="250">
                        <asp:ListItem Text="Product &nbsp;" Value="true"></asp:ListItem>
                        <asp:ListItem Text="Raw Material" Value="false"></asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    <asp:Label ID="lblBatchID" runat="server" Text="Batch:" Width="200px" />
                    <asp:DropDownList ID="BatchIDDropDownList" runat="server" DataSourceID="SqlFinishedProduct" DataTextField="Name" DataValueField="Batch_ID" Height="20px" Width="185px">
                    </asp:DropDownList>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblWarehouseID" runat="server" Text="Warehouse:" Width="184px" />
                    <asp:DropDownList ID="WarehouseIDDropDownList" runat="server" DataSourceID="SqlWarehouse" DataTextField="Warehouse_Name" DataValueField="Warehouse_ID" Height="19px" Width="191px">
                    </asp:DropDownList>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblLocationID" runat="server" Text="Location:" Width="184px" />
                    <asp:DropDownList ID="LocationIDDropDownList" runat="server" DataSourceID="SqlLocation" DataTextField="Location_Name" DataValueField="Location_ID" Height="31px" Width="191px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="199px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblCreatedDate" runat="server" Text="Created Date:" Width="200px" />
                    <asp:TextBox ID="CreatedDateTextBox" runat="server" Width="199px"></asp:TextBox>
                    &nbsp;<asp:ImageButton ID="calimgCreatedDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgCreatedDate_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calCreatedDate" runat="server" OnSelectionChanged="calCreatedDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveStockPile" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveStockPile_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelStockPile" runat="server" Text="Cancel" OnClick="btnCancelStockPile_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
