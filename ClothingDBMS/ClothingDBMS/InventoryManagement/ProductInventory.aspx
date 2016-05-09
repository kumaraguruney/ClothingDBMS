<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductInventory.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.ProductInventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Inventory</title>
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
*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}*,:after,:before{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}</style>
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
                    <li><a href="Stockmovement.aspx">Stock Movement</a></li>
                    <li><a href="StockReconciliation.aspx">Stock Reconciliation</a></li>
                 </ul>
            </div>
        </div>
    </div>

        <asp:SqlDataSource ID="SqlProductInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [ProductInventory] ORDER BY [Entry_ID]" DeleteCommand="DELETE FROM [ProductInventory] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [ProductInventory] ([Inventory_ID], [Product_ID], [Product_SKU], [Design_ID], [Manufactured_Date], [Created_Date], [Quantity]) VALUES (@Inventory_ID, @Product_ID, @Product_SKU, @Design_ID, @Manufactured_Date, @Created_Date, @Quantity)" UpdateCommand="UPDATE [ProductInventory] SET [Inventory_ID] = @Inventory_ID, [Product_ID] = @Product_ID, [Product_SKU] = @Product_SKU, [Design_ID] = @Design_ID, [Manufactured_Date] = @Manufactured_Date, [Created_Date] = @Created_Date, [Quantity] = @Quantity WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
                <asp:Parameter Name="Product_SKU" Type="Int32" />
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="Manufactured_Date" Type="String" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
                <asp:Parameter Name="Product_SKU" Type="Int32" />
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="Manufactured_Date" Type="String" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>
          <div style="margin-top:100px;" align="center">
        <asp:SqlDataSource ID="SqlInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Inventory] ORDER BY [Inventory_Name]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDesign" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Design] ORDER BY [Design_Name]">
        </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblProductInventory" runat="server" Text="Product Inventory Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvProductInventory" runat="server" style="margin-top: 0px">
                     <asp:Button ID="btnaddProductInventory" runat="server" Text="Add" OnClick="btnaddProductInventory_Click"/>
                    <asp:GridView ID="gvProductInventory" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProductInventory" AutoGenerateColumns="False" DataKeyNames="Entry_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" ReadOnly="True" SortExpression="Entry_ID" />
                            <asp:BoundField DataField="Inventory_ID" HeaderText="Inventory_ID" SortExpression="Inventory_ID" />
                             <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
                            <asp:BoundField DataField="Product_SKU" HeaderText="Product_SKU" SortExpression="Product_SKU" />
                            <asp:BoundField DataField="Design_ID" HeaderText="Design_ID" SortExpression="Design_ID" />
                            <asp:BoundField DataField="Manufactured_Date" HeaderText="Manufactured_Date" SortExpression="Manufactured_Date" />
                            <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" SortExpression="Created_Date" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
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

                <asp:Panel ID="PaneladdProductInventory" Visible="false" runat="server">
                <asp:Label ID="lblProductInventoryDetails" Text="Enter Product Inventory Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblAllocatesInventoryID" runat="server" Text="Inventory ID:" Width="200px" />
                    <asp:DropDownList ID="InventoryIDDropDownList" runat="server" DataSourceID="SqlInventory" DataTextField="Inventory_Name" DataValueField="Inventory_ID" Height="20px" Width="185px">
                    </asp:DropDownList>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblProductID" runat="server" Text="Product ID:" Width="200px" />
                    <asp:DropDownList ID="ProductIDDropDownList" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID" Height="17px" Width="179px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblDesignID" Width="200px" Text="Design ID:" runat="server" />
                    <asp:DropDownList ID="DesignIDDropDownList" runat="server" DataSourceID="SqlDesign" DataTextField="Design_Name" DataValueField="Design_ID" Height="25px" Width="180px">
                    </asp:DropDownList>
                    
                    <br />
                    <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Label ID="lblManufacturedDate" Width="150" Text="Manufactured Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="ManufacturedDateTextBox" ReadOnly="false" Width="230" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgManufacturedDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgManufacturedDate_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calManufacturedDate" runat="server" OnSelectionChanged="calManufacturedDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Label ID="lblCreatedDate" Width="150" Text="Created Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="CreatedDateTextBox" ReadOnly="false" Width="230" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgCreatedDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgCreatedDate_Click" Width="25px" />
                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                        <asp:Calendar ID="calCreatedDate" runat="server" OnSelectionChanged="calCreatedDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Label ID="lblProductSKU" runat="server" Text="Product SKU:" Width="200px" />
                    <asp:TextBox ID="ProductSKUTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="199px"></asp:TextBox>
                    <br />
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveProductInventory" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveProductInventory_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelProductInventory" runat="server" Text="Cancel" OnClick="btnCancelProductInventory_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
