<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RMInventory.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.RMInventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RM Inventory</title>
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
                 </ul>
            </div>
        </div>
    </div>

        <asp:SqlDataSource ID="SqlRMInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RMInventory] ORDER BY [Entry_ID]" DeleteCommand="DELETE FROM [RMInventory] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [RMInventory] ([Inventory_ID], [RM_ID], [Procurement_Date], [Quantity]) VALUES (@Inventory_ID, @RM_ID, @Procurement_Date, @Quantity)" UpdateCommand="UPDATE [RMInventory] SET [Inventory_ID] = @Inventory_ID, [RM_ID] = @RM_ID, [Procurement_Date] = @Procurement_Date, [Quantity] = @Quantity WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="RM_ID" Type="Int16" />
                <asp:Parameter Name="Procurement_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="RM_ID" Type="Int16" />
                <asp:Parameter Name="Procurement_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div style="margin-top:100px;" align="center">
        <asp:SqlDataSource ID="SqlInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Inventory] ORDER BY [Inventory_ID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_Name]">
        </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblProductInventory" runat="server" Text="RM Inventory Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvRMInventory" runat="server" style="margin-top: 0px">
                     <asp:Button ID="btnaddRMInventory" runat="server" Text="Add" OnClick="btnaddRMInventory_Click"/>
                    <asp:GridView ID="gvProductInventory" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlRMInventory" AutoGenerateColumns="False" DataKeyNames="Entry_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" ReadOnly="True" SortExpression="Entry_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Inventory_ID" HeaderText="Inventory_ID" SortExpression="Inventory_ID" />
                             <asp:BoundField DataField="RM_ID" HeaderText="RM_ID" SortExpression="RM_ID" />
                            <asp:BoundField DataField="Procurement_Date" HeaderText="Procurement_Date" SortExpression="Procurement_Date" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
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

                <asp:Panel ID="PaneladdRMInventory" Visible="false" runat="server">
                <asp:Label ID="lblRMInventoryDetails" Text="Enter RM Inventory Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblRMInventoryID" runat="server" Text="Inventory ID:" Width="200px" />
                    <asp:DropDownList ID="InventoryIDDropDownList" runat="server" DataSourceID="SqlInventory" DataTextField="Inventory_Name" DataValueField="Inventory_ID" Height="20px" Width="185px">
                    </asp:DropDownList>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblRMID" runat="server" Text="RM ID:" Width="184px" />
                    <asp:DropDownList ID="RMIDDropDownList" runat="server" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID" Height="19px" Width="191px">
                    </asp:DropDownList>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblProcurementDate" runat="server" Text="Procurement Date:" Width="200px" />
                    <asp:TextBox ID="ProcurementDateTextBox" runat="server" Width="199px"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgProcurementDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgProcurementDate_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calProcurementDate" runat="server" OnSelectionChanged="calProcurementDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="199px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btnSaveRMInventory" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveRMInventory_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelRMInventory" runat="server" Text="Cancel" OnClick="btnCancelRMInventory_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
