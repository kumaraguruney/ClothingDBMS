<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quotation.aspx.cs" Inherits="SalesManagement.Sales.Quotation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quotation Information</title>
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
                <a class="navbar-brand" href="../Index.aspx">NTL
                </a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
</div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
          <li><a class="page-scroll" href="../Index.aspx">Home</a></li>
          <li><a class="page-scroll" href="Default.aspx">Sales Managment - Home</a></li>
          <li><a class="page-scroll" href="Customer.aspx">Customer</a></li>
          <li><a class="page-scroll" href="Quotation.aspx">Quotation</a></li>
          <li><a class="page-scroll" href="Quotes.aspx">Quotes</a></li>          
          <li><a class="page-scroll" href="SalesOrder.aspx">Sales Order</a></li>
          <li><a class="page-scroll" href="Contains.aspx">Contains</a></li>
          <li><a class="page-scroll" href="Shipment.aspx">Shipment</a></li>
                    <li><a class="page-scroll" href="Ships.aspx">Ships</a></li>
          <li><a class="page-scroll" href="Invoice.aspx">Invoice</a></li>
          <li><a class="page-scroll" href="Payment.aspx">Payment</a></li>
          <li><a class="page-scroll" href="ListingPrice.aspx">Listing Price</a></li>
                </ul>
            </div>
        </div>
    </div>
                <asp:SqlDataSource ID="SqlDataSourceCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [CUSTOMER] ORDER BY [Customer_Name]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT QUOTATION.Quotation_Number, QUOTATION.Quotation_Date, QUOTATION.Customer_Id, CUSTOMER.Customer_Name FROM QUOTATION INNER JOIN CUSTOMER ON QUOTATION.Customer_Id = CUSTOMER.Customer_Id AND ISNULL(QUOTATION.Is_SO, 0) = 'False' ORDER BY QUOTATION.Quotation_Number" DeleteCommand="DELETE FROM [QUOTATION] WHERE [Quotation_Number] = @Quotation_Number" InsertCommand="INSERT INTO [QUOTATION] ([Quotation_Date], [Customer_Id]) VALUES (@Quotation_Date, @Customer_Id)" UpdateCommand="UPDATE [QUOTATION] SET [Quotation_Date] = @Quotation_Date, [Customer_Id] = @Customer_Id WHERE [Quotation_Number] = @Quotation_Number">
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


        <div style="margin-top:100px;"  align="center">
        <br/>
    <asp:Label ID="lblQuotation" runat="server" Text="Quotation Data Management" Font-Bold="true"></asp:Label>  <br /> <br />
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server">
        <asp:Button ID="btnAdd" runat="server"   CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
        <asp:GridView ID="GridViewQuotation" runat="server" AutoGenerateColumns="False" DataKeyNames="Quotation_Number" DataSourceID="SqlDataSourceQuotation" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation_Number" ReadOnly="True" SortExpression="Quotation_Number" InsertVisible="False" />
                <asp:BoundField DataField="Quotation_Date" HeaderText="Quotation_Date" SortExpression="Quotation_Date" />

                <asp:BoundField DataField="Customer_Id" HeaderText="Customer_Id" SortExpression="Customer_Id" />
                <asp:BoundField DataField="Customer_Name" HeaderText="Customer_Name" SortExpression="Customer_Name" />
                <asp:TemplateField HeaderText="Convert to SO" ShowHeader="False">
                               <ItemTemplate>
                                    <asp:LinkButton ID="lnkConverttoSO" runat="server" OnClick="btnConverttoSOQuotation_Click" Text="Convert to SO"></asp:LinkButton>
                                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Open" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkOpen" runat="server"  OnClick="btnOpenQuotation_Click" Text="Open"></asp:LinkButton>
                                </ItemTemplate>
                </asp:TemplateField>
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
        </asp:GridView>
        </asp:Panel>

    
    
          <asp:Panel ID="panelAddQuotation" Visible="false" runat="server">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="lblQuotationTitle" Text="Enter New Quotation Information" runat="server" Font-Bold="True"/><br /> <br />

                          <br />
                    &nbsp;
              <br/>
              <br />
              <br />
              <asp:Label ID="lblCustomerId" runat="server" Text="Customer: " Width="200px" />
              <asp:DropDownList ID="dropCustomerId" runat="server" DataSourceID="SqlDataSourceCustomer" DataTextField="Customer_Name" DataValueField="Customer_Id">
                  <asp:ListItem Text="-- Customer ID --" Value="-1"></asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="rfvCustomerId" runat="server" ControlToValidate="dropCustomerId" ErrorMessage="(*) One Customer ID should be selected" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              <br />
              <br />
              <br />
              <asp:Label ID="lblQuotationDate" runat="server" Text="Quotation Date: " Width="150" />
              <asp:TextBox ID="txtQuotation" runat="server" ReadOnly="false" Width="230"></asp:TextBox>
              &nbsp;<asp:ImageButton ID="calingQuotation" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calingQuotation_Click" Width="25px" />
              <asp:Panel ID="calpanel" runat="server" Visible="false">
                  <asp:Calendar ID="calQuotation" runat="server" OnSelectionChanged="calQuotation_SelectionChanged"></asp:Calendar>
                  <br />
              </asp:Panel>
              <br />
              <br />
              <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" OnClick="btnSave_Click" Text="Save" ValidationGroup="addQuotationValidation" />
              <asp:Button ID="btnCancel" runat="server" CssClass="bg-primary" OnClick="btnCancel_Click" Text="Cancel" />
              <br />
     </asp:Panel>

       </div>
   </form>
</body>
</html>
