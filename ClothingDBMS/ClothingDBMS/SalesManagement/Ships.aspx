<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ships.aspx.cs" Inherits="SalesManagement.Sales.Shipment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
*{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}</style>
</head>
<body>
  <form id="form1" runat="server">
          <div id="custom-bootstrap-menu" class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <a class="navbar-brand" href="../Index.aspx">NTL
                </a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
</div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
          <li><a href="../Index.aspx">Home</a></li>
          <li><a href="Default.aspx">Sales Managment - Home</a></li>
          <li><a href="Customer.aspx">Customer</a></li>
          <li><a href="Invoice.aspx">Invoice</a></li>
          <li><a href="Payment.aspx">Payment</a></li>
          <li><a href="Quotation.aspx">Quotation</a></li>
          <li><a href="SalesOrder.aspx">Sales Order</a></li>
          <li><a href="Ships.aspx">Shipment</a></li>
                </ul>
            </div>
        </div>
    </div>
                <asp:SqlDataSource ID="SqlContains" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT QUOTES.QUOTES_ID, QUOTES.Product_ID, QUOTES.Quotation_Number, Product.Price, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name, QUOTES.SOquantity * Product.Price AS TotalPrice, QUOTES.SOquantity, QUOTES.QOquantity, QUOTES.Is_InventoryUpd FROM QUOTES INNER JOIN Product ON QUOTES.Product_ID = Product.Product_ID AND ISNULL(QUOTES.Is_InventoryUpd, 0) = 'false' LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section WHERE (QUOTES.Quotation_Number = @Quotation_Number) ORDER BY QUOTES.QUOTES_ID" DeleteCommand="DELETE FROM [QUOTES] WHERE [QUOTES_ID] = @QUOTES_ID" InsertCommand="INSERT INTO QUOTES(QOquantity, Product_ID, Quotation_Number, SOquantity) VALUES (@QOquantity, @Product_ID, @Quotation_Number, @SOquantity)" UpdateCommand="UPDATE [QUOTES] SET [SOquantity] = @SOquantity WHERE [QUOTES_ID] = @QUOTES_ID" >
                    <DeleteParameters>
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="QOquantity" Type="String" />
                        <asp:Parameter Name="Product_ID" Type="Int16" />
                        <asp:Parameter Name="Quotation_Number" Type="Int32" />
                        <asp:Parameter Name="SOquantity" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Quotation_Number" SessionField="Quotation_number" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SOquantity" />
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </UpdateParameters>
          </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlContainsUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT QUOTES.QUOTES_ID, QUOTES.Product_ID, QUOTES.Quotation_Number, Product.Price, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name, QUOTES.SOquantity * Product.Price AS TotalPrice, QUOTES.SOquantity, QUOTES.QOquantity FROM QUOTES INNER JOIN Product ON QUOTES.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section WHERE (QUOTES.Quotation_Number = @Quotation_Number) ORDER BY QUOTES.QUOTES_ID" DeleteCommand="DELETE FROM [QUOTES] WHERE [QUOTES_ID] = @QUOTES_ID" InsertCommand="INSERT INTO QUOTES(QOquantity, Product_ID, Quotation_Number, SOquantity) VALUES (@QOquantity, @Product_ID, @Quotation_Number, @SOquantity)" UpdateCommand="UPDATE QUOTES SET  Shipped_Quantity= @Shipped_Quantity WHERE (QUOTES_ID = @QUOTES_ID)" >
                    <DeleteParameters>
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="QOquantity" Type="String" />
                        <asp:Parameter Name="Product_ID" Type="Int16" />
                        <asp:Parameter Name="Quotation_Number" Type="Int32" />
                        <asp:Parameter Name="SOquantity" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Quotation_Number" SessionField="Quotation_number" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Shipped_Quantity" />
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </UpdateParameters>
          </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlContainsIsInventoryUpdated" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT QUOTES.QUOTES_ID, QUOTES.Product_ID, QUOTES.Quotation_Number, Product.Price, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name, QUOTES.SOquantity * Product.Price AS TotalPrice, QUOTES.SOquantity, QUOTES.QOquantity FROM QUOTES INNER JOIN Product ON QUOTES.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section WHERE (QUOTES.Quotation_Number = @Quotation_Number) ORDER BY QUOTES.QUOTES_ID" DeleteCommand="DELETE FROM [QUOTES] WHERE [QUOTES_ID] = @QUOTES_ID" InsertCommand="INSERT INTO QUOTES(QOquantity, Product_ID, Quotation_Number, SOquantity) VALUES (@QOquantity, @Product_ID, @Quotation_Number, @SOquantity)" UpdateCommand="UPDATE QUOTES SET Shipped_quantity = @Shipped_quantity, Is_InventoryUpd = @Is_InventoryUpd WHERE (QUOTES_ID = @QUOTES_ID)" >
                    <DeleteParameters>
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="QOquantity" Type="String" />
                        <asp:Parameter Name="Product_ID" Type="Int16" />
                        <asp:Parameter Name="Quotation_Number" Type="Int32" />
                        <asp:Parameter Name="SOquantity" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Quotation_Number" SessionField="Quotation_number" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Shipped_quantity" />
                        <asp:Parameter Name="Is_InventoryUpd" />
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </UpdateParameters>
          </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [QUOTES]" DeleteCommand="DELETE FROM [QUOTES] WHERE [Quotation_Number] = @Quotation_Number" InsertCommand="INSERT INTO [QUOTES] ([QUOTES_ID], [QOquantity], [Product_Id], [Quotation_Number]) VALUES (@QUOTES_ID, @QOquantity, @Product_Id, @Quotation_Number)" UpdateCommand="UPDATE [QUOTATION] SET [Quotation_Date] = @Quotation_Date, [Customer_Id] = @Customer_Id, [Product_Id] = @Product_Id, [Quantity] = @Quantity WHERE [Quotation_Number] = @Quotation_Number">
         
        </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>

        <div style="margin-top:100px;"  align="center">
        <asp:SqlDataSource ID="SqlStockPile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT Design.Design_Name + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, '') + ', ' + FinishedProduct.Manufactured_Date AS Name, StockPile.Batch_ID FROM StockPile INNER JOIN FinishedProduct ON StockPile.Batch_ID = FinishedProduct.Batch_ID AND FinishedProduct.Product_ID = @Product_ID INNER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID INNER JOIN Design ON Design.Design_ID = Product.Design_ID INNER JOIN Code ON Code.Code_ID = Product.Size INNER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color INNER JOIN Warehouse ON Warehouse.Warehouse_ID = StockPile.Warehouse_ID INNER JOIN Location ON Location.Location_ID = StockPile.Location_ID ORDER BY NAME" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [StockPile] ([Batch_ID], [Warehouse_ID], [Location_ID], [Quantity], [Created_Date], [Is_Product], [Quotation_Number]) VALUES (@Batch_ID, @Warehouse_ID, @Location_ID, @Quantity, @Created_Date, @Is_Product, @Quotation_Number)" UpdateCommand="UPDATE [StockPile] SET [Batch_ID] = @Batch_ID, [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Quantity] = @Quantity, [Created_Date] = @Created_Date, [Is_Product] = @Is_Product WHERE [Entry_ID] = @Entry_ID">
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
                <asp:Parameter Name="Quotation_Number" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="dropProductId" Name="Product_ID" PropertyName="SelectedValue" />
            </SelectParameters>
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
        <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse] ORDER BY [Warehouse_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDrop" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT FinishedProduct.Batch_ID, FinishedProduct.Product_ID, FinishedProduct.Quantity, FinishedProduct.Is_Stock_Piled, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') + ', ' + FinishedProduct.Manufactured_Date AS Name FROM FinishedProduct  JOIN Product ON Product.Product_ID = FinishedProduct.Product_ID AND Batch_ID = '0' LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section ORDER BY Name">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlFinishedProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT FinishedProduct.Batch_ID, FinishedProduct.Product_ID, FinishedProduct.Quantity, FinishedProduct.Is_Stock_Piled, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') + ', ' + FinishedProduct.Manufactured_Date AS Name FROM FinishedProduct  JOIN Product ON Product.Product_ID = FinishedProduct.Product_ID AND ISNULL(FinishedProduct.Is_Stock_Piled, 0) = 'FALSE' LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section ORDER BY Name">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT Warehouse.Warehouse_Name, StockPile.Warehouse_ID FROM StockPile INNER JOIN Warehouse ON Warehouse.Warehouse_ID = StockPile.Warehouse_ID AND StockPile.Batch_ID = @Batch_ID INNER JOIN Location ON Location.Location_ID = StockPile.Location_ID ORDER BY Warehouse.Warehouse_Name">
            <SelectParameters>
                <asp:ControlParameter ControlID="BatchIDDropDownList" Name="Batch_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlLocation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT Location.Location_Name, StockPile.Location_ID FROM StockPile INNER JOIN FinishedProduct ON StockPile.Batch_ID = FinishedProduct.Batch_ID AND FinishedProduct.Product_ID = @Product_ID AND FinishedProduct.Batch_ID = @Batch_ID AND StockPile.Warehouse_ID = @WAREHOUSE_ID INNER JOIN Warehouse ON Warehouse.Warehouse_ID = StockPile.Warehouse_ID INNER JOIN Location ON Location.Location_ID = StockPile.Location_ID ORDER BY Location.Location_Name">
            <SelectParameters>
                <asp:ControlParameter ControlID="dropProductId" Name="Product_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="BatchIDDropDownList" Name="Batch_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="WarehouseIDDropDownList" DbType="String" Name="Warehouse_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProcuredRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT ProcuredRawMaterial.Batch_ID, ProcuredRawMaterial.RawMaterial_ID, ProcuredRawMaterial.Procured_Date, ProcuredRawMaterial.Quantity, ProcuredRawMaterial.Is_Stock_Piled, RawMaterial.RawMaterial_Name + ', ' + RawMaterial.RawMaterial_Description AS Name FROM ProcuredRawMaterial INNER JOIN RawMaterial ON RawMaterial.RawMaterial_ID = ProcuredRawMaterial.RawMaterial_ID AND ISNULL(ProcuredRawMaterial.Is_Stock_Piled, 0) = 'FALSE' ORDER BY ProcuredRawMaterial.Batch_ID">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlUpdateAvailableQty" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [FinishedProduct]" UpdateCommand="UPDATE FinishedProduct SET Available_Quantity = @Available_Quantity, Is_Stock_Piled = @Is_Stock_Piled WHERE (Batch_ID = @Batch_ID)">
            <UpdateParameters>
                <asp:Parameter Name="Available_Quantity" />
                <asp:Parameter Name="Is_Stock_Piled" />
                <asp:Parameter Name="Batch_ID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlUpdateAvailableRMQty" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM ProcuredRawMaterial" UpdateCommand="UPDATE ProcuredRawMaterial SET Available_Quantity = @Available_Quantity, Is_Stock_Piled = @Is_Stock_Piled WHERE (Batch_ID = @Batch_ID)">
            <UpdateParameters>
                <asp:Parameter Name="Available_Quantity" />
                <asp:Parameter Name="Is_Stock_Piled" />
                <asp:Parameter Name="Batch_ID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br/>
    <asp:Label ID="lblQuotation" runat="server" Text="Updating Inventory" Font-Bold="True"></asp:Label>  <br /> <br />
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server">
      
        <asp:GridView ID="GridViewQuotation" runat="server" AutoGenerateColumns="False" DataKeyNames="QUOTES_ID" DataSourceID="SqlContains" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="QUOTES_ID" HeaderText="QUOTES_ID" InsertVisible="False" ReadOnly="True" SortExpression="QUOTES_ID" />
                <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" ReadOnly="True" SortExpression="Product_ID" />
                <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation_Number" ReadOnly="True" SortExpression="Quotation_Number" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="SOquantity" HeaderText="SOquantity" SortExpression="SOquantity" />
            </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <EditRowStyle BackColor="Yellow"/>
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
            
            <br />
            <br />
            <asp:Label ID="lblProductId0" runat="server" Text="Product Name: " Width="160px" />
            <asp:DropDownList ID="dropProductId" runat="server" AppendDataBoundItems="true" AutoPostBack="true" DataSourceID="SqlContains" DataTextField="Name" DataValueField="Product_ID">
                <asp:ListItem Text="-- Product ID --" Value="-1"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblBatchID" runat="server" style="margin-left: 80px" Text="Batch:" Width="164px" />
            <asp:DropDownList ID="BatchIDDropDownList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlStockPile" DataTextField="Name" DataValueField="Batch_ID" Height="20px" Width="185px">
                <asp:ListItem Text="Select a Batch" Value="-1"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblWarehouseID" runat="server" Text="Warehouse:" Width="184px" />
            <asp:DropDownList ID="WarehouseIDDropDownList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlWarehouse" DataTextField="Warehouse_Name" DataValueField="Warehouse_ID" EnableViewState="False" Height="19px" Width="191px">
                <asp:ListItem Text="Select a Warehouse" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblLocationID" runat="server" Text="Location:" Width="184px" />
            <asp:DropDownList ID="LocationIDDropDownList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlLocation" DataTextField="Location_Name" DataValueField="Location_ID" EnableViewState="False" Height="31px" Width="191px" OnSelectedIndexChanged="LocationIDDropDownList_SelectedIndexChanged">
                <asp:ListItem Text="Select a Location" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblQuantity" runat="server" style="margin-left: 96px" Text="Quantity:" Width="200px" />
            <asp:TextBox ID="QuantityTextBox" runat="server" ReadOnly="true" Width="199px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblQuantity2" runat="server" style="margin-left: 96px" Text="SOQuantity:" Width="132px" />
            <asp:TextBox ID="QuantityTextBox1" runat="server" Width="199px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnUpdate" runat="server" CssClass="bg-primary" OnClick="btnSave_Click" Text="Update" ValidationGroup="addQuotationValidation" />
            <br />
            <br />
        </asp:Panel>
            
    
    
       </div>
   </form>
</body>
</html>