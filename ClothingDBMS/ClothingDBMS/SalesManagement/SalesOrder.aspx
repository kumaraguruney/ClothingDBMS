<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesOrder.aspx.cs" Inherits="ClothingDBMS.SalesManagement.SalesOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sales Order Information</title>
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
          <li><a href="../Index.aspx">Home</a></li>
          <li><a href="Default.aspx">Sales Managment - Home</a></li>
          <li><a href="Customer.aspx">Customer</a></li>
          <li><a href="Invoice.aspx">Invoice</a></li>
          <li><a href="Payment.aspx">Payment</a></li>
          <li><a href="Quotation.aspx">Quotation</a></li>
          <li><a href="AddSalesOrder.aspx">Sales Order</a></li>
          <li><a href="Shipment.aspx">Shipment</a></li>
                </ul>
            </div>
 </div>
    </div>
                 (Query)<asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
       
        <div style="margin-top:100px;" align="center">
            <asp:SqlDataSource ID="SqlDataSourceSalesOrder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT QUOTATION.Quotation_Number, QUOTATION.Customer_Id, CUSTOMER.Customer_Name, QUOTATION.Sorder_Date, QUOTATION.SorderDue_Date, QUOTATION.Late_Fee FROM QUOTATION INNER JOIN CUSTOMER ON QUOTATION.Customer_Id = CUSTOMER.Customer_Id AND QUOTATION.Is_SO = 'True' ORDER BY QUOTATION.Quotation_Number" DeleteCommand="DELETE FROM [QUOTATION] WHERE [Quotation_Number] = @Quotation_Number" InsertCommand="INSERT INTO [QUOTATION] ([Quotation_Date], [Customer_Id]) VALUES (@Quotation_Date, @Customer_Id)" UpdateCommand="UPDATE [QUOTATION] SET [Quotation_Date] = @Quotation_Date, [Customer_Id] = @Customer_Id WHERE [Quotation_Number] = @Quotation_Number">
                <DeleteParameters>
                    <asp:Parameter Name="Quotation_Number" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Quotation_Date" Type="String" />
                    <asp:Parameter Name="Customer_Id" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Quotation_Date" Type="String" />
                    <asp:Parameter Name="Customer_Id" Type="Int32" />
                    <asp:Parameter Name="Quotation_Number" Type="Int32" />
                </UpdateParameters>
        </asp:SqlDataSource>


        <br/>
        <asp:Label ID="lblSalesOrder" runat="server" Text="Sales Order Management" Font-Bold="true"></asp:Label><br /> <br />
    

        <asp:Panel ID="panelSaveSalesOrder" Visible="true" runat="server" >
            <asp:GridView ID="GridViewSalesOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="Quotation_Number" DataSourceID="SqlDataSourceSalesOrder" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <FooterStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation_Number" InsertVisible="False" ReadOnly="True" SortExpression="Quotation_Number" />
                            <asp:BoundField DataField="Customer_Id" HeaderText="Customer_Id" SortExpression="Customer_Id" />
                            <asp:BoundField DataField="Customer_Name" HeaderText="Customer_Name" SortExpression="Customer_Name" />
                            <asp:BoundField DataField="Sorder_Date" HeaderText="Sorder_Date" SortExpression="Sorder_Date" />
                            <asp:BoundField DataField="SorderDue_Date" HeaderText="SorderDue_Date" SortExpression="SorderDue_Date" />
                            <asp:BoundField DataField="Late_Fee" HeaderText="Late_Fee" SortExpression="Late_Fee" />
                             <asp:TemplateField HeaderText="Open" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkOpen" runat="server"  OnClick="btnOpenQuotation_Click" Text="Open"></asp:LinkButton>
                                </ItemTemplate>
                                </asp:TemplateField>
                           
                </Columns>
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
                </div>
    </form>
</body>
</html>
