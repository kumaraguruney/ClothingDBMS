<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockReconciliation.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.StockReconciliation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stock Reconciliation</title>
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
*{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}</style>
</head>
<body>
    
    <form id="form2" runat="server">
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
                    <li><a href="StockMovement.aspx">Stock Movement</a></li>
                    <li><a href="StockReconciliation.aspx">Stock Reconciliation</a></li>
                 </ul>
            </div>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlStockPile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT StockPile.Entry_ID, StockPile.Batch_ID, StockPile.Warehouse_ID, StockPile.Location_ID, StockPile.Quantity, StockPile.Created_Date, StockPile.Is_Product, Warehouse.Warehouse_Name, Location.Location_Name, StockPile.Physical_Quantity, StockPile.Reconciled_Date FROM StockPile INNER JOIN Warehouse ON Warehouse.Warehouse_ID = StockPile.Warehouse_ID INNER JOIN Location ON Location.Location_ID = StockPile.Location_ID ORDER BY StockPile.Entry_ID" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" UpdateCommand="UPDATE StockPile SET Physical_Quantity = @Physical_Quantity, Reconciled_Date = @Reconciled_Date WHERE (Entry_ID = @Entry_ID)">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Physical_Quantity" />
                <asp:Parameter Name="Reconciled_Date" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div style="margin-top:100px;" align="center">
                <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockPile]"></asp:SqlDataSource>
                <br />
        <asp:SqlDataSource ID="SqlBatch" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT StockPile.Entry_ID, StockPile.Batch_ID, StockPile.Warehouse_ID, StockPile.Location_ID, StockPile.Quantity, StockPile.Created_Date, StockPile.Is_Product, CASE WHEN is_product = 'true' THEN Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description , ' ') + ', ' + FinishedProduct.Manufactured_Date ELSE RawMaterial_Name + ', ' + code_3.Code_Description + ', ' + ISNULL(RawMaterial_Description , ' ') + ',' + ProcuredRawMaterial.Procured_Date END AS Name, Warehouse.Warehouse_Name, Location.Location_Name FROM StockPile INNER JOIN Location ON Location.Location_ID = StockPile.Location_ID AND StockPile.Warehouse_ID = @Warehouse_ID AND StockPile.Location_ID = @Location_ID AND StockPile.Is_Product = @Is_Product LEFT OUTER JOIN FinishedProduct ON FinishedProduct.Batch_ID = StockPile.Batch_ID LEFT OUTER JOIN ProcuredRawMaterial ON ProcuredRawMaterial.Batch_ID = StockPile.Batch_ID LEFT OUTER JOIN RawMaterial ON RawMaterial.RawMaterial_ID = ProcuredRawMaterial.RawMaterial_ID LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = RawMaterial.RawMaterial_Color LEFT OUTER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section INNER JOIN Warehouse ON Warehouse.Warehouse_ID = StockPile.Warehouse_ID ORDER BY Name" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO StockPile(Physical_Quantity, Reconciled_Date) VALUES (@Physical_Quantity, @Reconciled_Date)" UpdateCommand="UPDATE StockPile SET Physical_Quantity = @Physical_Quantity, Reconciled_Date = @Reconciled_Date WHERE (Entry_ID = @Entry_ID)">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Physical_Quantity" />
                <asp:Parameter Name="Reconciled_Date" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="WarehouseDropDownList" Name="Warehouse_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="LocationDropDownList" Name="Location_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="rbStockReconcile" Name="Is_Product" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Physical_Quantity" />
                <asp:Parameter Name="Reconciled_Date" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
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
                <asp:GridView ID="gvStockReconcile" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Entry_ID" DataSourceID="SqlStockPile" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" InsertVisible="False" ReadOnly="True" SortExpression="Entry_ID" />
                        <asp:BoundField DataField="Batch_ID" HeaderText="Batch_ID" SortExpression="Batch_ID" />
                        <asp:BoundField DataField="Warehouse_ID" HeaderText="Warehouse_ID" SortExpression="Warehouse_ID" />
                        <asp:BoundField DataField="Warehouse_Name" HeaderText="Warehouse_Name" SortExpression="Warehouse_Name" />
                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" SortExpression="Location_ID" />
                        <asp:BoundField DataField="Location_Name" HeaderText="Location_Name" SortExpression="Location_Name" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" SortExpression="Created_Date" />
                        <asp:CheckBoxField DataField="Is_Product" HeaderText="Is_Product" SortExpression="Is_Product" />
                        <asp:BoundField DataField="Physical_Quantity" HeaderText="Physical_Quantity" SortExpression="Physical_Quantity" />
                        <asp:BoundField DataField="Reconciled_Date" HeaderText="Reconciled_Date" SortExpression="Reconciled_Date" />
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
            </asp:Panel>
            <asp:Panel ID="PaneladdStockReconciliation" runat="server" Visible="false">
                <asp:Label ID="lblFinishedProductDetails" runat="server" Text="Enter Details" />
                <br /> 
                <br />
                    <asp:Label ID="lblWarehouse" runat="server" Text="Warehouse:" Width="200px" />
                <asp:DropDownList ID="WarehouseDropDownList" runat="server" AutoPostBack="true" AppendDataBoundItems="True" DataSourceID="SqlWarehouse" DataTextField="Warehouse_Name" DataValueField="Warehouse_ID" Width="250px" OnSelectedIndexChanged="WarehouseDropDownList_SelectedIndexChanged">
                <asp:ListItem Text="-- Select Warehouse --" Value="0"></asp:ListItem>
                </asp:DropDownList>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblLocation" runat="server" Text="Location:" Width="200px" />
                <asp:DropDownList ID="LocationDropDownList" runat="server" EnableViewState="false" AutoPostBack="true" AppendDataBoundItems="True" DataSourceID="SqlLocation" DataTextField="Location_Name" DataValueField="Location_ID" Width="250px">
                <asp:ListItem Text="-- Select Location --" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:RadioButtonList ID="rbStockReconcile" AutoPostBack="true" runat="server" CssClass="radio" RepeatDirection="Horizontal" TextAlign="Right" width="250" OnSelectedIndexChanged="rbStockReconcile_SelectedIndexChanged">
                        <asp:ListItem Text="Product &nbsp;" Value="true"></asp:ListItem>
                        <asp:ListItem Text="Raw Material" Value="false"></asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <br />
                <asp:Label ID="lblBatch" runat="server" Text="Name:" Width="200px" />
                <asp:DropDownList ID="BatchDropDownList" runat="server" AutoPostBack="true" AppendDataBoundItems="True" DataSourceID="SqlBatch" DataTextField="Name" DataValueField="Entry_ID" Width="250px" OnSelectedIndexChanged="BatchDropDownList_SelectedIndexChanged">
                <asp:ListItem Text="-- Select Name --" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblInventoryQuantity" runat="server" Text="Inventory Quantity:" Width="200px" />
                <asp:TextBox ID="InventoryQuantityTextBox" runat="server" Height="16px" ReadOnly="True" Width="225px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblPhysicalQuantity" runat="server" Text="Physical Quantity:" Width="200px" />
                <asp:TextBox ID="PhysicalQuantityTextBox" runat="server" Height="16px" Width="225px"></asp:TextBox>
                    
                    <asp:RangeValidator ID="QuantityValidator" runat="server" ControlToValidate="PhysicalQuantityTextBox" Display="Dynamic" ErrorMessage="Value cannot exceed Available Quantity" MaximumValue="1" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    
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
