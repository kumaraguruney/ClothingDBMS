<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockPile.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.StockPile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory</title>
        <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="Kumaraguru" />
    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="../css/the-big-picture.css" rel="stylesheet" />
    <link href="../css/font-icon.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <link href="../css/flexslider.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/animate.min.css" rel="stylesheet" type="text/css" />
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
            <div id="custom-bootstrap-menu" class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <a class="navbar-brand" href="../Index.aspx">NTL</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../Index.aspx">Home</a></li>
                    <li><a class="page-scroll" href="Default.aspx">Inventory Management - Home</a> </li>
                    <li><a href="Warehouse.aspx">Warehouse</a></li>
                    <li><a href="Location.aspx">Location</a></li>
                    <li><a href="StockPile.aspx">Inventory</a></li>
                    <li><a href="Stockmovement.aspx">Stock Movement</a></li>
                    <li><a href="StockReconciliation.aspx">Stock Reconciliation</a></li>
                 </ul>
            </div>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlStockPile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT StockPile.Entry_ID, StockPile.Batch_ID, StockPile.Warehouse_ID, StockPile.Location_ID, StockPile.Quantity, StockPile.Created_Date, StockPile.Is_Product, CASE WHEN is_product = 'true' THEN Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description , ' ') + ', ' + FinishedProduct.Manufactured_Date ELSE RawMaterial_Name + ', ' + code_3.Code_Description + ', ' + ISNULL(RawMaterial_Description , ' ') + ',' + ProcuredRawMaterial.Procured_Date END AS Name, Warehouse_1.Warehouse_Name, Location.Location_Name FROM StockPile LEFT OUTER JOIN FinishedProduct ON FinishedProduct.Batch_ID = StockPile.Batch_ID LEFT OUTER JOIN ProcuredRawMaterial ON ProcuredRawMaterial.Batch_ID = StockPile.Batch_ID LEFT OUTER JOIN RawMaterial ON RawMaterial.RawMaterial_ID = ProcuredRawMaterial.RawMaterial_ID LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = RawMaterial.RawMaterial_Color LEFT OUTER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section INNER JOIN Warehouse AS Warehouse_1 ON Warehouse_1.Warehouse_ID = StockPile.Warehouse_ID INNER JOIN Location ON Location.Location_ID = StockPile.Location_ID ORDER BY StockPile.Entry_ID" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [StockPile] ([Batch_ID], [Warehouse_ID], [Location_ID], [Quantity], [Created_Date], [Is_Product]) VALUES (@Batch_ID, @Warehouse_ID, @Location_ID, @Quantity, @Created_Date, @Is_Product)" UpdateCommand="UPDATE [StockPile] SET [Batch_ID] = @Batch_ID, [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Quantity] = @Quantity, [Created_Date] = @Created_Date, [Is_Product] = @Is_Product WHERE [Entry_ID] = @Entry_ID">
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
          <div style="margin-top:100px;" align="center">
        <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse] ORDER BY [Warehouse_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDrop" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT FinishedProduct.Batch_ID, FinishedProduct.Product_ID, FinishedProduct.Quantity, FinishedProduct.Is_Stock_Piled, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') + ', ' + FinishedProduct.Manufactured_Date AS Name FROM FinishedProduct  JOIN Product ON Product.Product_ID = FinishedProduct.Product_ID AND Batch_ID = '0' LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section ORDER BY Name">
        </asp:SqlDataSource>
              <br />
        <asp:SqlDataSource ID="SqlFinishedProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT FinishedProduct.Batch_ID, FinishedProduct.Product_ID, FinishedProduct.Quantity, FinishedProduct.Is_Stock_Piled, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') + ', ' + FinishedProduct.Manufactured_Date AS Name FROM FinishedProduct  JOIN Product ON Product.Product_ID = FinishedProduct.Product_ID AND ISNULL(FinishedProduct.Is_Stock_Piled, 0) = 'FALSE' LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section ORDER BY Name">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse] ORDER BY [Warehouse_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlLocation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Location] where Warehouse_ID = @Warehouse_ID ORDER BY [Location_ID]">
            <SelectParameters>
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
                <br />
                <asp:Label ID="lblStockPile" runat="server" Text="Inventory Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvStockPile" runat="server" style="margin-top: 0px">
                     <asp:Button ID="btnaddStockPile" runat="server" Text="Add" OnClick="btnaddStockPile_Click"/>
                    <asp:GridView ID="gvStockPile" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlStockPile" AutoGenerateColumns="False" DataKeyNames="Entry_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" ReadOnly="True" SortExpression="Entry_ID" InsertVisible="False" />
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
                        <FooterStyle BackColor="#CCCCCC" />
                        <EditRowStyle BackColor="Yellow"/>
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                  
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdStockPile" Visible="false" runat="server">
                <asp:Label ID="lblInventoryDetails" Text="Enter Inventory Details" runat="server" /><br /> 
                    <asp:RadioButtonList ID="rbStockPile" AutoPostBack="true" runat="server" CssClass="radio" RepeatDirection="Horizontal" TextAlign="Right" width="250" OnSelectedIndexChanged="rbStockPile_SelectedIndexChanged">
                        <asp:ListItem Text="Product &nbsp;" Value="true"></asp:ListItem>
                        <asp:ListItem Text="Raw Material" Value="false"></asp:ListItem>
                    </asp:RadioButtonList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Label ID="lblBatchID" runat="server" Text="Batch:" Width="200px" />
                    <asp:DropDownList ID="BatchIDDropDownList" AppendDataBoundItems="True" AutoPostBack="True" runat="server" DataSourceID="SqlDrop" DataTextField="Name" DataValueField="Batch_ID" Height="20px" Width="185px" OnSelectedIndexChanged="BatchIDDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="Select a Batch" Value="-1"></asp:ListItem>
                    </asp:DropDownList> &nbsp;&nbsp;
                    <asp:TextBox ID="AvailableQuantityTextBox" ReadOnly="true" runat="server" Height="19px" Width="60px"></asp:TextBox>
                    


                    <br />
                    <br />
                    <asp:Label ID="lblWarehouseID" runat="server" Text="Warehouse:" Width="184px" />
                    <asp:DropDownList ID="WarehouseIDDropDownList" runat="server" AppendDataBoundItems="true" AutoPostBack="true" EnableViewState="false" DataSourceID="SqlWarehouse" DataTextField="Warehouse_Name" DataValueField="Warehouse_ID" Height="19px" Width="191px" >
                    <asp:ListItem Text="Select a Warehouse" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblLocationID" runat="server" Text="Location:" Width="184px" />
                    <asp:DropDownList ID="LocationIDDropDownList" runat="server" AppendDataBoundItems="true" AutoPostBack="true" EnableViewState="false" DataSourceID="SqlLocation" DataTextField="Location_Name" DataValueField="Location_ID" Height="31px" Width="191px">
                    <asp:ListItem Text="Select a Location" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="199px"></asp:TextBox>
                    <asp:RangeValidator ID="QuantityValidator" runat="server" Display="Dynamic" ErrorMessage="Value cannot exceed Available Quantity" ControlToValidate="QuantityTextBox" MaximumValue="1"
                        MinimumValue="0" Type="Integer"></asp:RangeValidator>
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
