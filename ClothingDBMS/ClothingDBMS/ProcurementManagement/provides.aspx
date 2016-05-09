<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Provides.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Provides Quotation</title>
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


        <asp:SqlDataSource ID="SqlProvides" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT provides.Prvd_id, provides.quotation_id, provides.RawMaterial_ID, provides.Quantity, provides.Unit_Price, RawMaterial.RawMaterial_Name, provides.Quantity * provides.Unit_Price AS totalprice FROM provides INNER JOIN RawMaterial ON RawMaterial.RawMaterial_ID = provides.RawMaterial_ID ORDER BY provides.Prvd_id" DeleteCommand="DELETE FROM [provides] WHERE [Prvd_id] = @Prvd_id" InsertCommand="INSERT INTO [provides] ([quotation_id], [RawMaterial_ID], [Quantity], [Unit_Price]) VALUES (@quotation_id, @RawMaterial_ID, @Quantity, @Unit_Price)" UpdateCommand="UPDATE [provides] SET [quotation_id] = @quotation_id, [RawMaterial_ID] = @RawMaterial_ID, [Quantity] = @Quantity, [Unit_Price] = @Unit_Price WHERE [Prvd_id] = @Prvd_id">
            <DeleteParameters>
                <asp:Parameter Name="Prvd_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Unit_Price" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Unit_Price" Type="Int32" />
                <asp:Parameter Name="Prvd_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div style="margin-top:200px;" align="center">
        <asp:SqlDataSource ID="SqlSupplier_Quotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [supplier_quotation] ORDER BY [quotation_id]" DeleteCommand="DELETE FROM [supplier_quotation] WHERE [quotation_id] = @quotation_id" InsertCommand="INSERT INTO [supplier_quotation] ([Supplier_id]) VALUES (@Supplier_id)" UpdateCommand="UPDATE [supplier_quotation] SET [Supplier_id] = @Supplier_id WHERE [quotation_id] = @quotation_id">
            <DeleteParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Supplier_id" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Supplier_id" Type="Int16" />
                <asp:Parameter Name="quotation_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_ID]">
        </asp:SqlDataSource>

                <br />
                <asp:Label ID="lblProvidesHeader" runat="server" Text="Provides Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddProvides" runat="server" Text="Add" OnClick="btnaddProvides_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvProvides" runat="server">
                    
                    <asp:GridView ID="gvProvides" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProvides" AutoGenerateColumns="False" DataKeyNames="Prvd_id" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Prvd_id" HeaderText="Prvd_id" InsertVisible="False" ReadOnly="True" SortExpression="Prvd_id" />
                            <asp:BoundField DataField="quotation_id" HeaderText="quotation_id" SortExpression="quotation_id" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" SortExpression="RawMaterial_ID" />
                            <asp:BoundField DataField="RawMaterial_Name" HeaderText="RawMaterial_Name" SortExpression="RawMaterial_Name" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Unit_Price" HeaderText="Unit_Price" SortExpression="Unit_Price" />
                            <asp:BoundField DataField="totalprice" HeaderText="totalprice" ReadOnly="True" SortExpression="totalprice" />
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

                <asp:Panel ID="PaneladdProvides" runat="server" Visible="false">
                        <asp:Label ID="lbUpdatesaddTitle" runat="server" Text="Add Updates into Database" />
                        <br />
                        <asp:Label ID="lbQuotation_ID" runat="server" Text="Quotation_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownQuotation_ID" runat="server" DataSourceID="SqlSupplier_Quotation" DataTextField="quotation_id" DataValueField="quotation_id" Height="29px" Width="151px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="rfvPrvd_id" runat="server" ControlToValidate="DropDownQuotation_ID" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="lblRawMaterial_Name" runat="server" Text="RawMaterial_Name: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownRawMaterial_ID" runat="server" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID" Height="29px" Width="151px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="lblUnit_Price" runat="server" Text="Unit_Price: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtUnit_Price" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtQuantity" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveProvides" runat="server" OnClick="btnSaveProvides_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelProvides" runat="server" OnClick="btnCancelProvides_Click" Text="Cancel" />
                    </asp:Panel>
        </div>

    </form>
                </body>
                    </html>
    
    