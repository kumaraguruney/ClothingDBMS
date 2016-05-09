<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Purchase_Order.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Purchase_Order" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purchase_Order Details</title>
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
                    <li><a class="page-scroll" href="Purchase_Orders.aspx">Purchase Orders</a> </li>
                    <li><a class="page-scroll" href="Goods_Receipt.aspx">Goods Receipts</a> </li>
                    <li><a class="page-scroll" href="Updates.aspx">Updates</a> </li>
                    <li><a class="page-scroll" href="ProcuredRawMaterial.aspx">Procured Raw Material</a> </li>
                    
                   
                </ul>
            </div>
        </div>
    </div>


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
                <br />
                <br />

        <asp:SqlDataSource ID="SqlSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Supplier] ORDER BY [Name]">
        </asp:SqlDataSource>

                <br />
                <asp:Label ID="lbPurchase_OrderHeader" runat="server" Text="Purchase_Order Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddPurchase_Order" runat="server" Text="Add" OnClick="btnaddPurchase_Order_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvPurchase_Order" runat="server">
                    <asp:GridView ID="gvPurchase_Order" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlPurchase_Order" AutoGenerateColumns="False" DataKeyNames="Purchase_Order_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Purchase_Order_ID" HeaderText="Purchase_Order_ID" ReadOnly="True" SortExpression="Purchase_Order_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Purchase_Date" HeaderText="Purchase_Date" SortExpression="Purchase_Date" />
                             <asp:BoundField DataField="Supplier_ID" HeaderText="Supplier_ID" SortExpression="Supplier_ID" />
                            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                            <asp:BoundField DataField="Shipping_Address" HeaderText="Shipping_Address" SortExpression="Shipping_Address" />
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
                <asp:Panel ID="pnlAddPurchase_Order" Visible="false" runat="server">
                <asp:Label ID="lbPurchase_OrderaddTitle" Text="Add Purchase_Order into Database" runat="server" />
                    <br />
                    <br />
                    <asp:Label ID="lblPurchase_Order_Date" Width="149px" Text="Purchase_Order_Date: " runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:TextBox ID="txtPurchase_Order_Date" runat="server" ValidationGroup="addPurchase_OrderValidation" Width="274px"></asp:TextBox>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Label ID="lblSupplier_Name" runat="server" Text="Supplier_Name" Width="149px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownSupplier_Name" runat="server" Height="28px" Width="300px" DataSourceID="SqlSupplier" DataTextField="Name" DataValueField="Supplier_id">
                    </asp:DropDownList>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
                    &nbsp;&nbsp;
                    <asp:Label ID="lblTotal" runat="server" Text="Total: " Width="150px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtTotal" runat="server" Height="33px" Width="300px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblShipping_Address" runat="server" Text="Shipping Address: " Width="237px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtShipping_Address" runat="server" Height="33px" Width="300px"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSavePurchase_Order" runat="server" OnClick="btnSavePurchase_Order_Click" Text="Save" ValidationGroup="addPurchase_OrderValidation" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCancelPurchase_Order" runat="server" OnClick="btnCancelPurchase_Order_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
