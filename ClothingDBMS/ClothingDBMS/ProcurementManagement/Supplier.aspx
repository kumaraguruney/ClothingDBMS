<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Supplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier Details</title>
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


        <asp:SqlDataSource ID="SqlSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Supplier] ORDER BY [Name]" DeleteCommand="DELETE FROM [Supplier] WHERE [Supplier_id] = @Supplier_id" InsertCommand="INSERT INTO [Supplier] ([Name], [Address]) VALUES (@Name, @Address)" UpdateCommand="UPDATE [Supplier] SET [Name] = @Name, [Address] = @Address WHERE [Supplier_id] = @Supplier_id">
            <DeleteParameters>
                <asp:Parameter Name="Supplier_id" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Supplier_id" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div style="margin-top:200px;" align="center">
                <br />
                <asp:Label ID="lbSupplierHeader" runat="server" Text="Supplier Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddSupplier" runat="server" Text="Add" OnClick="btnaddSupplier_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvSupplier" runat="server">
                    <asp:GridView ID="gvSupplier" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlSupplier" AutoGenerateColumns="False" DataKeyNames="Supplier_id" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Supplier_id" HeaderText="Supplier_id" ReadOnly="True" SortExpression="Supplier_id" InsertVisible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                             <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
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
                <asp:Panel ID="PaneladdSupplier" Visible="false" runat="server">
                <asp:Label ID="lbSupplieraddTitle" Text="Add Supplier into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbSupplierName" Width="150px" Text="Supplier Name: " runat="server" />
                    <asp:TextBox ID="txtSupplierName" ValidationGroup="addSupplierValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvSupplierName" ValidationGroup="addSupplierValidation" runat="server" ControlToValidate="txtSupplierName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblSupplierAddress" Width="150" Text="Address: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtSupplierAddress" runat="server"></asp:TextBox><br />
                    <br />
                    <br />
                    <br /> <br />
                    <asp:Button ID="btnSaveSupplier" ValidationGroup="addSupplierValidation" runat="server" Text="Save" OnClick="btnSaveSupplier_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelSupplier" runat="server" Text="Cancel" OnClick="btnCancelSupplier_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>




