<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Orders</title>
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
                    <li><a class="page-scroll" href="Default.aspx">Procurement Management - Home</a> </li>
                    <li><a class="page-scroll" href="Supplier.aspx">Supplier</a> </li>
                    <li><a class="page-scroll" href="Supplier_Quotation.aspx">Supplier Quotation</a> </li>
                    <li><a class="page-scroll" href="provides.aspx">Provides</a> </li>
                    <li><a class="page-scroll" href="Orders.aspx">Orders</a> </li>
                    <li><a class="page-scroll" href="Purchase_Order.aspx">Purchase Order</a> </li>
                    <li><a class="page-scroll" href="Goods_Receipt.aspx">Goods Receipts</a> </li>
                    <li><a class="page-scroll" href="Updates.aspx">Updates</a> </li>
                    <li><a class="page-scroll" href="ProcuredRawMaterial.aspx">Procured Raw Material</a> </li>
                    
                   
                </ul>
            </div>
        </div>
    </div>


        <asp:SqlDataSource ID="SqlOrders" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Orders] ORDER BY [Order_ID]" DeleteCommand="DELETE FROM [Orders] WHERE [Order_ID] = @Order_ID" InsertCommand="INSERT INTO [Orders] ([RawMaterial_ID], [purchase_order_ID], [Quantity], [Unit_Price], [Total_Price]) VALUES (@RawMaterial_ID, @purchase_order_ID, @Quantity, @Unit_Price, @Total_Price)" UpdateCommand="UPDATE [Orders] SET [RawMaterial_ID] = @RawMaterial_ID, [purchase_order_ID] = @purchase_order_ID, [Quantity] = @Quantity, [Unit_Price] = @Unit_Price, [Total_Price] = @Total_Price WHERE [Order_ID] = @Order_ID">
            <DeleteParameters>
                <asp:Parameter Name="Order_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="purchase_order_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Unit_Price" Type="Int32" />
                <asp:Parameter Name="Total_Price" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="purchase_order_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Unit_Price" Type="Int32" />
                <asp:Parameter Name="Total_Price" Type="Int32" />
                <asp:Parameter Name="Order_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div style="margin-top:200px;" align="center">
        <asp:SqlDataSource ID="SqlPurchaseOrder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [purchase_order] ORDER BY [purchase_order_id]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_ID]">
        </asp:SqlDataSource>

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

                <br />
                <asp:Label ID="lbUpdatesHeader" runat="server" Text="Orders Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddOrders" runat="server" Text="Add" OnClick="btnaddOrders_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvOrders" runat="server">
                    
                    <asp:GridView ID="gvOrders" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlOrders" AutoGenerateColumns="False" DataKeyNames="Order_ID">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" SortExpression="Order_ID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" SortExpression="RawMaterial_ID" />
                            <asp:BoundField DataField="purchase_order_ID" HeaderText="purchase_order_ID" SortExpression="purchase_order_ID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Unit_Price" HeaderText="Unit_Price" SortExpression="Unit_Price" />
                            <asp:BoundField DataField="Total_Price" HeaderText="Total_Price" SortExpression="Total_Price" />
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

                <asp:Panel ID="PaneladdOrders" runat="server" Visible="false">
                        <asp:Label ID="lbUpdatesaddTitle" runat="server" Text="Add Updates into Database" />
                        <br />
                        <asp:Label ID="lblRawMaterial_Name" runat="server" Text="RawMaterial_Name: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="RawMaterial_IDDropDownList" runat="server" Height="29px" Width="151px" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID">
                        </asp:DropDownList>
                        <br />
                        <br />
                        &nbsp;<asp:Label ID="lblPurchase_Order_ID" runat="server" Text="Purchase_Order_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="PurchaseOrder_IDDropDownList" runat="server" Height="29px" Width="151px" DataSourceID="SqlPurchaseOrder" DataTextField="Purchase_Order_ID" DataValueField="Purchase_Order_ID">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="lblUnit_Price" runat="server" Text="Unit Price: " Width="150px"></asp:Label>
                        <asp:TextBox ID="txtUnitPrice" runat="server" Height="33px" Width="300px"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity: " Width="150px"></asp:Label>
                        <asp:TextBox ID="txtQuantity" runat="server" Height="33px" Width="300px"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblTotal" runat="server" Text="Total: " Width="150px"></asp:Label>
                        <asp:TextBox ID="txtTotal" runat="server" Height="33px" Width="300px"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="rfvPurchaseOrder_ID" runat="server" ControlToValidate="PurchaseOrder_IDDropDownList" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveOrders" runat="server" OnClick="btnSaveOrders_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelOrders" runat="server" OnClick="btnCancelOrders_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
    
    </body>
</html>
