<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Updates.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Updates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Inventory</title>
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



        <asp:SqlDataSource ID="SqlUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Updates] ORDER BY [Update_id]" DeleteCommand="DELETE FROM [Updates] WHERE [Update_id] = @Update_id" InsertCommand="INSERT INTO [Updates] ([receipt_id], Date, [Remaining_Qty], [Received_Qty]) VALUES (@receipt_id, @Date, @Remaining_Qty, @Received_Qty)" UpdateCommand="UPDATE [Updates] SET [receipt_id] = @receipt_id, [Entry_id] = @Entry_id, [Remaining_Qty] = @Remaining_Qty, [Received_Qty] = @Received_Qty WHERE [Update_id] = @Update_id">
            <DeleteParameters>
                <asp:Parameter Name="Update_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="receipt_id" Type="Int32" />
                <asp:Parameter Name="Date" />
                <asp:Parameter Name="Remaining_Qty"  />
                <asp:Parameter Name="Received_Qty"  />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="receipt_id" Type="Int32" />
                <asp:Parameter Name="Entry_id" Type="Int32" />
                <asp:Parameter Name="Remaining_Qty" Type="Int32" />
                <asp:Parameter Name="Received_Qty" Type="Int32" />
                <asp:Parameter Name="Update_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div  style="margin-top:200px;" align="center">
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

        <asp:SqlDataSource ID="SqlStock_Pile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockPile] ORDER BY [Entry_ID]" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [StockPile] ([Batch_ID], [Warehouse_ID], [Location_ID], [Quantity], [Created_Date], [Is_Product]) VALUES (@Batch_ID, @Warehouse_ID, @Location_ID, @Quantity, @Created_Date, @Is_Product)" UpdateCommand="UPDATE [StockPile] SET [Batch_ID] = @Batch_ID, [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Quantity] = @Quantity, [Created_Date] = @Created_Date, [Is_Product] = @Is_Product WHERE [Entry_ID] = @Entry_ID">
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
                <asp:Label ID="lbUpdatesHeader" runat="server" Text="Updates Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddUpdates" runat="server" Text="Add" OnClick="btnaddUpdates_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvUpdates" runat="server">
                   
                    <asp:GridView ID="gvUpdates" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlUpdate" AutoGenerateColumns="False" DataKeyNames="Update_id" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                       <AlternatingRowStyle BackColor="#CCCCCC" />
                         <Columns>
                            <asp:BoundField DataField="Update_id" HeaderText="Update_id" SortExpression="Update_id" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="receipt_id" HeaderText="receipt_id" SortExpression="receipt_id" />
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                            <asp:BoundField DataField="Remaining_Qty" HeaderText="Remaining_Qty" SortExpression="Remaining_Qty" />
                            <asp:BoundField DataField="Received_Qty" HeaderText="Received_Qty" SortExpression="Received_Qty" />
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
                 <asp:Panel ID="PaneladdUpdates" runat="server" Visible="false">
                        <asp:Label ID="lbUpdatesaddTitle" runat="server" Text="Add Updates into Database" />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <asp:Label ID="lbReceipt_ID" runat="server" Text="Receipt_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownReceipt_ID" runat="server" DataSourceID="SqlGoods_Receipt" DataTextField="receipt_id" DataValueField="receipt_id" Height="27px" Width="333px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="lbIDate" runat="server" Text="Date: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtDate" runat="server" Height="35px" ValidationGroup="addSupplierValidation" Width="299px"></asp:TextBox>
&nbsp;<br />
                        <br />
                        <asp:Label ID="lblReceived_Qty" runat="server" Text="Received_Qty: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtReceived_Qty" runat="server" ValidationGroup="addSupplierValidation" Height="35px" Width="299px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lbRemaining_Qty" runat="server" Text="Remaining_Qty: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtRemaining_Qty" runat="server" Height="35px" ValidationGroup="addSupplierValidation" Width="312px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvUpdate_id" runat="server" ControlToValidate="txtRemaining_Qty" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveUpdates" runat="server" OnClick="btnSaveUpdates_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelUpdates" runat="server" OnClick="btnCancelUpdates_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
