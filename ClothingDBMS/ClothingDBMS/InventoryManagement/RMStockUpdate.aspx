<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RMStockUpdate.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.RMStockUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RM Stock Update</title>
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
                    <li><a href="../Index.aspx">Home</a></li>
                    <li><a class="page-scroll" href="Default.aspx">Inventory Management - Home</a> </li>
                    <li><a href="Warehouse.aspx">Warehouse</a></li>
                    <li><a href="Location.aspx">Location</a></li>
                    <li><a href="StockPile.aspx">Inventory</a></li>
                    <li><a href="Stockmovement.aspx">Stock Movement</a></li>
                    <li><a href="StockReconciliation.aspx">Stock Reconciliation</a></li>
          <li><a class="page-scroll" href="Payment.aspx">Payment</a></li>
          <li><a class="page-scroll" href="ListingPrice.aspx">Listing Price</a></li>
                </ul>
            </div>
        </div>
    </div>

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
                    <li><a href="Inventory.aspx">Inventory</a></li>
                    <li><a href="StockMovement.aspx">Stock Movement</a></li>
                    <li><a href="StockReconciliation.aspx">Stock Reconciliation</a></li>
                 </ul>
            </div>
        </div>
    </div>

        <asp:SqlDataSource ID="SqlRMStockUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RMStockUpdate] ORDER BY [StockUpdate_ID]" DeleteCommand="DELETE FROM [RMStockUpdate] WHERE [StockUpdate_ID] = @StockUpdate_ID" InsertCommand="INSERT INTO [RMStockUpdate] ([StockMovement_ID], [Entry_ID], [RM_ID]) VALUES (@StockMovement_ID, @Entry_ID, @RM_ID)" UpdateCommand="UPDATE [RMStockUpdate] SET [StockMovement_ID] = @StockMovement_ID, [Entry_ID] = @Entry_ID, [RM_ID] = @RM_ID WHERE [StockUpdate_ID] = @StockUpdate_ID">
            <DeleteParameters>
                <asp:Parameter Name="StockUpdate_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StockMovement_ID" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
                <asp:Parameter Name="RM_ID" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StockMovement_ID" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
                <asp:Parameter Name="RM_ID" Type="Int16" />
                <asp:Parameter Name="StockUpdate_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div style="margin-top:100px;" align="center">
        <asp:SqlDataSource ID="SqlStockMovement" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockMovement] ORDER BY [StockMovement_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRMInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RMInventory] ORDER BY [Entry_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_Description]">
        </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblRMStockUpdate" runat="server" Text="RM Stock Update Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvRMStockUpdate" runat="server">
                     <asp:Button ID="btnaddRMStockUpdate" runat="server" Text="Add" OnClick="btnaddRMStockUpdate_Click"/>
                    <asp:GridView ID="gvRMStockUpdate" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlRMStockUpdate" AutoGenerateColumns="False" DataKeyNames="StockUpdate_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                       <AlternatingRowStyle BackColor="#CCCCCC" />
                         <Columns>
                            <asp:BoundField DataField="StockUpdate_ID" HeaderText="StockUpdate_ID" ReadOnly="True" SortExpression="StockUpdate_ID" InsertVisible="False" />
                            <asp:BoundField DataField="StockMovement_ID" HeaderText="StockMovement_ID" SortExpression="StockMovement_ID" />
                             <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" SortExpression="Entry_ID" />
                            <asp:BoundField DataField="RM_ID" HeaderText="RM_ID" SortExpression="RM_ID" />
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
                    <EditRowStyle BackColor="Yellow" />
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdRMStockUpdate" Visible="false" runat="server">
                <asp:Label ID="lblRMStockUpdateDetails" Text="Enter RM Stock Update Details" runat="server" />
                    <br />
                    <br />
                    <asp:Label ID="lblIncludesStockMovementID" runat="server" Text="Stock Movement ID:" Width="200px" />
                    <asp:DropDownList ID="StockMovementIDDropDownList" runat="server" DataSourceID="SqlStockMovement" DataTextField="StockMovement_ID" DataValueField="StockMovement_ID" Height="33px" Width="182px">
                    </asp:DropDownList>
                    <br /> <br />
                    <asp:Label ID="lblRMID" runat="server" Text="RM ID:" Width="200px" />
                    <asp:DropDownList ID="RMIDDropDownList" runat="server" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID" Height="26px" Width="182px">
                    </asp:DropDownList>
                        
                    <br />
                    <br />
                    <asp:Label ID="lblEntryID" Width="200px" Text="Entry ID:" runat="server" />
                    <asp:DropDownList ID="EntryIDDropDownList" runat="server" DataSourceID="SqlRMInventory" DataTextField="Entry_ID" DataValueField="Entry_ID" Height="26px" Width="182px">
                    </asp:DropDownList>
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveRMStockUpdate" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveRMStockUpdate_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelRMStockUpdate" runat="server" Text="Cancel" OnClick="btnCancelRMStockUpdate_Click"/>
                   
                    </asp:Panel>
        </div>
       </form>
   
</body>
</html>
