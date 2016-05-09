<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinishedProduct.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.FinishedProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Finished Product</title>
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

        <asp:SqlDataSource ID="SqlFinishedProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT FinishedProduct.Batch_ID, FinishedProduct.Product_ID, FinishedProduct.Manufactured_Date, FinishedProduct.Quantity, FinishedProduct.Is_Stock_Piled, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name, Available_Quantity FROM FinishedProduct INNER JOIN Product ON FinishedProduct.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section ORDER BY FinishedProduct.Batch_ID" DeleteCommand="DELETE FROM [FinishedProduct] WHERE [Batch_ID] = @Batch_ID" InsertCommand="INSERT INTO [FinishedProduct] ([Product_ID], [Manufactured_Date], [Quantity], [Is_Stock_Piled]) VALUES (@Product_ID, @Manufactured_Date, @Quantity, @Is_Stock_Piled)" UpdateCommand="UPDATE [FinishedProduct] SET [Product_ID] = @Product_ID, [Manufactured_Date] = @Manufactured_Date, [Quantity] = @Quantity, [Is_Stock_Piled] = @Is_Stock_Piled WHERE [Batch_ID] = @Batch_ID">
            <DeleteParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_ID" Type="Int32" />
                <asp:Parameter Name="Manufactured_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Is_Stock_Piled" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_ID" Type="Int32" />
                <asp:Parameter Name="Manufactured_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Is_Stock_Piled" Type="Boolean" />
                <asp:Parameter Name="Batch_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div style="margin-top:100px;" align="center">
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>
                <br />
                <asp:Label ID="lblFinishedProduct" runat="server" Text="Finished Product Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvFinishedProduct" runat="server" style="margin-top: 0px">
                     <asp:Button ID="btnaddFinishedProduct" runat="server" Text="Add" OnClick="btnaddFinishedProduct_Click"/>
                    <asp:GridView ID="gvFinishedProduct" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlFinishedProduct" AutoGenerateColumns="False" DataKeyNames="Batch_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Batch_ID" HeaderText="Batch_ID" ReadOnly="True" SortExpression="Batch_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
                             <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                             <asp:BoundField DataField="Manufactured_Date" HeaderText="Manufactured_Date" SortExpression="Manufactured_Date" />
                             <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Available_Quantity" HeaderText="Available_Quantity" SortExpression="Available_Quantity" />
                            <asp:CheckBoxField DataField="Is_Stock_Piled" HeaderText="Is_Stock_Piled" SortExpression="Is_Stock_Piled" />
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

                <asp:Panel ID="PaneladdFinishedProduct" Visible="false" runat="server">
                <asp:Label ID="lblFinishedProductDetails" Text="Enter Finished Product Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblProductID" runat="server" Text="Product:" Width="200px" />
                    <asp:DropDownList ID="dropaddProduct" Width="250px" AppendDataBoundItems="True" EnableViewState="False" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID">
                    </asp:DropDownList>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblManufacturedDate" runat="server" Text="Manufactured Date:" Width="200px" />
                    <asp:TextBox ID="ManufacturedDateTextBox" runat="server" Width="199px"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgManufacturedDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgManufacturedDate_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calManufacturedDate" runat="server" OnSelectionChanged="calManufacturedDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveFinishedProduct" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveFinishedProduct_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelFinishedProduct" runat="server" Text="Cancel" OnClick="btnCancelFinishedProduct_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
