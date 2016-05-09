<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Location.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.Inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Location</title>
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
<body><form id="form2" runat="server">
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
        <asp:SqlDataSource ID="SqlLocation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Location.Location_ID, Location.Location_Name, Location.Warehouse_ID, Location.Area, Warehouse.Warehouse_Name FROM Location INNER JOIN Warehouse ON Warehouse.Warehouse_ID = Location.Warehouse_ID ORDER BY Location.Location_ID" DeleteCommand="DELETE FROM [Location] WHERE [Location_ID] = @Location_ID" InsertCommand="INSERT INTO [Location] ([Location_Name], [Warehouse_ID], [Area]) VALUES (@Location_Name, @Warehouse_ID, @Area)" UpdateCommand="UPDATE [Location] SET [Location_Name] = @Location_Name, [Warehouse_ID] = @Warehouse_ID, [Area] = @Area WHERE [Location_ID] = @Location_ID">
            <DeleteParameters>
                <asp:Parameter Name="Location_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Location_Name" Type="String" />
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
                <asp:Parameter Name="Area" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Location_Name" Type="String" />
                <asp:Parameter Name="Warehouse_ID" Type="Byte" />
                <asp:Parameter Name="Area" Type="Int16" />
                <asp:Parameter Name="Location_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div style="margin-top:100px;" align="center">
        <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse] ORDER BY [Warehouse_Name]">
        </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Location Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Panel ID="PanelgvInventory" runat="server">
                     <asp:Button ID="btnaddInventory" runat="server" Text="Add" OnClick="btnaddInventory_Click"/>
                    <asp:GridView ID="gvInventory" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlLocation" AutoGenerateColumns="False" DataKeyNames="Location_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                       <AlternatingRowStyle BackColor="#CCCCCC" />
                         <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" ReadOnly="True" SortExpression="Location_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Location_Name" HeaderText="Location_Name" SortExpression="Location_Name" />
                            <asp:BoundField DataField="Warehouse_ID" HeaderText="Warehouse_ID" SortExpression="Warehouse_ID" />
                             <asp:BoundField DataField="Warehouse_Name" HeaderText="Warehouse_Name" SortExpression="Warehouse_Name" />
                             <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
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

                <asp:Panel ID="PaneladdInventory" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesInventoryDetails" Text="Enter Location Details" runat="server" /><br /> <br />
                    <br />
                    <asp:Label ID="lblIncludesWarehouseID" Width="200px" Text="Warehouse ID:" runat="server" />
                    <asp:DropDownList ID="WarehouseIDDropDownList" runat="server" DataSourceID="SqlWarehouse" DataTextField="Warehouse_Name" DataValueField="Warehouse_ID" style="margin-left: 0px" Width="186px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblInventoryName" runat="server" Text="Location Name:" Width="200px" />
                    <asp:TextBox ID="InventoryNameTextBox" runat="server" Width="199px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblArea" runat="server" Text="Area:" Width="200px" />
                    <asp:TextBox ID="AreaTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveInventory" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveInventory_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelInventory" runat="server" Text="Cancel" OnClick="btnCancelInventory_Click"/>
                   
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
