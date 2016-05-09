<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductStockUpdate.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.ProductStockUpdate1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Stock Update</title>
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

        <asp:SqlDataSource ID="SqlProductStockUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [ProductStockUpdate] ORDER BY [Stock_Update_ID]" DeleteCommand="DELETE FROM [ProductStockUpdate] WHERE [Stock_Update_ID] = @Stock_Update_ID" InsertCommand="INSERT INTO [ProductStockUpdate] ([Stock_Movement_ID], [Entry_ID], [Product_ID]) VALUES (@Stock_Movement_ID, @Entry_ID, @Product_ID)" UpdateCommand="UPDATE [ProductStockUpdate] SET [Stock_Movement_ID] = @Stock_Movement_ID, [Entry_ID] = @Entry_ID, [Product_ID] = @Product_ID WHERE [Stock_Update_ID] = @Stock_Update_ID">
            <DeleteParameters>
                <asp:Parameter Name="Stock_Update_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Stock_Movement_ID" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Stock_Movement_ID" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
                <asp:Parameter Name="Stock_Update_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div style="margin-top:100px;" align="center">
        <asp:SqlDataSource ID="SqlStockMovement" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockMovement] ORDER BY [StockMovement_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProductInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [ProductInventory] ORDER BY [Entry_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>
                <br />
                <asp:Label ID="lblProductStockUpdate" runat="server" Text="Product Stock Update Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvProductStockUpdate" runat="server">
                     <asp:Button ID="btnaddProductStockUpdate" runat="server" Text="Add" OnClick="btnaddProductStockUpdate_Click"/>
                    <asp:GridView ID="gvProductStockUpdate" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProductStockUpdate" AutoGenerateColumns="False" DataKeyNames="Stock_Update_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Stock_Update_ID" HeaderText="Stock_Update_ID" ReadOnly="True" SortExpression="Stock_Update_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Stock_Movement_ID" HeaderText="Stock_Movement_ID" SortExpression="Stock_Movement_ID" />
                             <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" SortExpression="Entry_ID" />
                            <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
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

                <asp:Panel ID="PaneladdProductStockUpdate" Visible="false" runat="server">
                <asp:Label ID="lblProductStockUpdateDetails" Text="Enter Product Stock Update Details" runat="server" />
                    <br />
                    <br />
                    <asp:Label ID="lblIncludesStockMovementID" runat="server" Text="Stock Movement ID:" Width="200px" />
                    <asp:DropDownList ID="StockMovementIDDropDownList" runat="server" DataSourceID="SqlStockMovement" DataTextField="StockMovement_ID" DataValueField="StockMovement_ID" Height="33px" Width="182px">
                    </asp:DropDownList>
                    <br /> <br />
                    <asp:Label ID="lblProductID" runat="server" Text="Product ID:" Width="200px" />
                    <asp:DropDownList ID="ProductIDDropDownList" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID" Height="26px" Width="182px">
                    </asp:DropDownList>
                        
                    <br />
                    <br />
                    <asp:Label ID="lblEntryID" Width="200px" Text="Entry ID:" runat="server" />
                    <asp:DropDownList ID="EntryIDDropDownList" runat="server" DataSourceID="SqlProductInventory" DataTextField="Entry_ID" DataValueField="Entry_ID" Height="26px" Width="182px">
                    </asp:DropDownList>
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveProductStockUpdate" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveProductStockUpdate_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelProductStockUpdate" runat="server" Text="Cancel" OnClick="btnCancelProductStockUpdate_Click"/>
                   
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
