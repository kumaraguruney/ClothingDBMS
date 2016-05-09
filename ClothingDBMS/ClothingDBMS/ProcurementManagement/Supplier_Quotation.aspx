<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplier_Quotation.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Supplier_Quotation" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier_Quotation Details</title>
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



        <asp:SqlDataSource ID="SqlSupplier_Quotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT supplier_quotation.quotation_id, supplier_quotation.Supplier_id, Supplier.Name FROM supplier_quotation INNER JOIN Supplier ON supplier_quotation.Supplier_id = Supplier.Supplier_id ORDER BY supplier_quotation.quotation_id" DeleteCommand="DELETE FROM [supplier_quotation] WHERE [quotation_id] = @quotation_id" InsertCommand="INSERT INTO [supplier_quotation] ([Supplier_id]) VALUES (@Supplier_id)" UpdateCommand="UPDATE [supplier_quotation] SET [Supplier_id] = @Supplier_id WHERE [quotation_id] = @quotation_id">
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

            <div  style="margin-top:200px;" align="center">
        <asp:SqlDataSource ID="SqlSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Supplier] ORDER BY [Name]">
        </asp:SqlDataSource>

                <br />
                <asp:Label ID="lbSupplier_QuotationHeader" runat="server" Text="Supplier_Quotation Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddSupplier_Quotation" runat="server" Text="Add" OnClick="btnaddSupplier_Quotation_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvSupplier_Quotation" runat="server">
                    <asp:GridView ID="gvSupplier_Quotation" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlSupplier_Quotation" AutoGenerateColumns="False" DataKeyNames="quotation_id"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                      <AlternatingRowStyle BackColor="#CCCCCC" />
                          <Columns>
                            <asp:BoundField DataField="quotation_id" HeaderText="quotation_id" ReadOnly="True" SortExpression="quotation_id" InsertVisible="False" />
                            <asp:BoundField DataField="Supplier_id" HeaderText="Supplier_id" SortExpression="Supplier_id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
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
                <asp:Panel ID="PaneladdSupplier_Quotation" Visible="false" runat="server">
                <asp:Label ID="lbSupplier_QuotationaddTitle" Text="Add Supplier_Quotation into Database" runat="server" /><br /> <br />
                    <br />
                    <br />
                    <asp:Label ID="lblSupplier_Name" runat="server" Text="Supplier_Name" Width="150px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownSupplier_Name" runat="server" DataSourceID="SqlSupplier" DataTextField="Name" DataValueField="Supplier_id" Height="28px" Width="300px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveSupplier_Quotation" runat="server" Text="Save" OnClick="btnSaveSupplier_Quotation_Click" ValidationGroup="addSupplier_QuotationValidation"/>
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCancelSupplier_Quotation" runat="server" OnClick="btnCancelSupplier_Quotation_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
