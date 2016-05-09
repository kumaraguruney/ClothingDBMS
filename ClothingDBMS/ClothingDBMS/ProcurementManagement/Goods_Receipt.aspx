<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Goods_Receipt.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Goods_Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Goods Receipt</title>
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

        <asp:SqlDataSource ID="SqlGoods_Receipt" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [goods_receipt] ORDER BY [receipt_id]" DeleteCommand="DELETE FROM [goods_receipt] WHERE [receipt_id] = @receipt_id" InsertCommand="INSERT INTO [goods_receipt] ([purchase_order_id], [receipt_date]) VALUES (@purchase_order_id, @receipt_date)" UpdateCommand="UPDATE [goods_receipt] SET [purchase_order_id] = @purchase_order_id, [receipt_date] = @receipt_date WHERE [receipt_id] = @receipt_id">
            <DeleteParameters>
                <asp:Parameter Name="receipt_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="purchase_order_id" Type="Int32" />
                <asp:Parameter Name="receipt_date" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="purchase_order_id" Type="Int32" />
                <asp:Parameter Name="receipt_date" Type="String" />
                <asp:Parameter Name="receipt_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    

        <asp:SqlDataSource ID="SqlPurchase_Order" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [purchase_order] ORDER BY [Purchase_Order_ID]" DeleteCommand="DELETE FROM [purchase_order] WHERE [Purchase_Order_ID] = @Purchase_Order_ID" InsertCommand="INSERT INTO [purchase_order] ([Purchase_Date], [Supplier_ID], [Total], [Shipping_Address]) VALUES (@Purchase_Date, @Supplier_ID, @Total, @Shipping_Address)" UpdateCommand="UPDATE [purchase_order] SET [Purchase_Date] = @Purchase_Date, [Supplier_ID] = @Supplier_ID, [Total] = @Total, [Shipping_Address] = @Shipping_Address WHERE [Purchase_Order_ID] = @Purchase_Order_ID">
            <DeleteParameters>
                <asp:Parameter Name="Purchase_Order_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Purchase_Date" Type="String" />
                <asp:Parameter Name="Supplier_ID" Type="Int16" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="Shipping_Address" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Purchase_Date" Type="String" />
                <asp:Parameter Name="Supplier_ID" Type="Int16" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="Shipping_Address" Type="String" />
                <asp:Parameter Name="Purchase_Order_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    

    <div style="margin-top:200px;" align="center">
        <asp:Label ID="lblGoodsReceipt" runat="server" Text="Goods Receipt Details"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnAddGoodsReceipt" runat="server" Text="Add" OnClick="btnAddGoodsReceipt_Click" />
        <br />
        <br />
        <asp:Panel ID="pnlGoodsReceipt" runat="server">
            <asp:GridView ID="gvGoods_Receipt" runat="server" AutoGenerateColumns="False" DataSourceID="SqlGoods_Receipt" DataKeyNames="receipt_id">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="receipt_id" HeaderText="receipt_id" InsertVisible="False" ReadOnly="True" SortExpression="receipt_id" />
                    <asp:BoundField DataField="purchase_order_id" HeaderText="purchase_order_id" SortExpression="purchase_order_id" />
                    <asp:BoundField DataField="receipt_date" HeaderText="receipt_date" SortExpression="receipt_date" />
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
        <asp:Panel ID="pnlAddGoodsReceipt" Visible="false" runat="server">
            <asp:Label ID="lblAddGoodsTitle" runat="server" Text="Add a Goods Receipt into the Database"></asp:Label><br />
            <br />
            <asp:Label ID="lblPurchaseOrder_ID" runat="server" Text="Purchase Order ID"></asp:Label>
            &nbsp;<asp:DropDownList ID="DropDownPurchaseOrder_ID" runat="server" DataSourceID="SqlPurchase_Order" DataTextField="Purchase_Order_ID" DataValueField="Supplier_ID" Height="28px" Width="300px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblReceiptDate" runat="server" Text="Receipt Date:"></asp:Label>
            <asp:TextBox ID="txtReceiptDate" runat="server"></asp:TextBox><br />
            <br />
            <br />

            <asp:Button ID="btnAddGoodsReceiptDB" runat="server" Text="Save" OnClick="btnSaveGoods_Receipt_Click" />
            <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" OnClick="btnCancelGoods_Receipt_Click" />
        </asp:Panel>
    </div>
        </form>
</body>
</html>
