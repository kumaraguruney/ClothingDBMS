<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Warehouse.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.Warehouse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Warehouse</title>
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
<body style="height: 931px">
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
                    <li><a href="StockMovement.aspx">Stock Movement</a></li>
                    <li><a href="StockReconciliation.aspx">Stock Reconciliation</a></li>
                 </ul>
            </div>
        </div>
    </div>

        <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse] ORDER BY [Warehouse_Name]" DeleteCommand="DELETE FROM [Warehouse] WHERE [Warehouse_ID] = @Warehouse_ID" InsertCommand="INSERT INTO [Warehouse] ([Warehouse_Name], [Warehouse_address], [contact_number]) VALUES (@Warehouse_Name, @Warehouse_address, @contact_number)" UpdateCommand="UPDATE [Warehouse] SET [Warehouse_Name] = @Warehouse_Name, [Warehouse_address] = @Warehouse_address, [contact_number] = @contact_number WHERE [Warehouse_ID] = @Warehouse_ID">
            <DeleteParameters>
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Warehouse_Name" Type="String" />
                <asp:Parameter Name="Warehouse_address" Type="String" />
                <asp:Parameter Name="contact_number" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Warehouse_Name" Type="String" />
                <asp:Parameter Name="Warehouse_address" Type="String" />
                <asp:Parameter Name="contact_number" Type="String" />
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div style="margin-top:100px;" align="center">
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Warehouse Details" Font-Bold="True"></asp:Label> 
             
                <br /> <br />
                <asp:Panel ID="PanelgvWarehouse" runat="server">
                     <asp:Button ID="btnaddAllocates" runat="server" Text="Add" OnClick="btnaddAllocates_Click"/>
                    <asp:GridView ID="gvAllocates" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlWarehouse" AutoGenerateColumns="False" DataKeyNames="Warehouse_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Warehouse_ID" HeaderText="Warehouse_ID" ReadOnly="True" SortExpression="Warehouse_ID" />
                            <asp:BoundField DataField="Warehouse_Name" HeaderText="Warehouse_Name" SortExpression="Warehouse_Name" />
                             <asp:BoundField DataField="Warehouse_address" HeaderText="Warehouse_address" SortExpression="Warehouse_address" />
                            <asp:BoundField DataField="contact_number" HeaderText="contact_number" SortExpression="contact_number" />
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

                <asp:Panel ID="PaneladdAllocates" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesWarehouseDetails" Text="Enter Warehouse Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblAllocatesWarehouseName" runat="server" Text="Warehouse Name:" Width="200px" />
                    <asp:TextBox ID="WarehouseNameTextBox" runat="server" Width="199px"></asp:TextBox>
                        
                    <br />
                    <br />
                    <asp:Label ID="lblIncludesWarehouseAddress" Width="200px" Text="Warehouse Address:" runat="server" />
                    <asp:TextBox ID="WarehouseAddressTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblIncludesContactNumber" runat="server" Text="Contact Number:" Width="200px" />
                    <asp:TextBox ID="ContactNumberTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveWarehouse" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveWarehouse_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelAllocates" runat="server" Text="Cancel" OnClick="btnCancelAllocates_Click"/>
                   
                    </asp:Panel>
        </div>
    </form>
</body>
</html>

