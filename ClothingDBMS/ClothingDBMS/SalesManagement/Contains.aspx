<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contains.aspx.cs" Inherits="ClothingDBMS.SalesManagement.Contains" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contains</title>
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
          <li><a class="page-scroll" href="GenerateInvoice.aspx">Invoice</a></li>
          <li><a class="page-scroll" href="Payment.aspx">Payment</a></li>
          <li><a class="page-scroll" href="ListingPrice.aspx">Listing Price</a></li>
                </ul>
            </div>
        </div>
    </div>
                <asp:SqlDataSource ID="SqlContains" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT QUOTES.QUOTES_ID, QUOTES.Product_ID, QUOTES.Quotation_Number, Product.Price, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name, QUOTES.SOquantity * Product.Price AS TotalPrice, QUOTES.SOquantity, QUOTES.QOquantity FROM QUOTES INNER JOIN Product ON QUOTES.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section WHERE (QUOTES.Quotation_Number = @Quotation_Number) ORDER BY QUOTES.QUOTES_ID" DeleteCommand="DELETE FROM [QUOTES] WHERE [QUOTES_ID] = @QUOTES_ID" InsertCommand="INSERT INTO QUOTES(QOquantity, Product_ID, Quotation_Number, SOquantity) VALUES (@QOquantity, @Product_ID, @Quotation_Number, @SOquantity)" UpdateCommand="UPDATE [QUOTES] SET [SOquantity] = @SOquantity WHERE [QUOTES_ID] = @QUOTES_ID" >
                    <DeleteParameters>
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="QOquantity" Type="String" />
                        <asp:Parameter Name="Product_ID" Type="Int16" />
                        <asp:Parameter Name="Quotation_Number" Type="Int32" />
                        <asp:Parameter Name="SOquantity" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Quotation_Number" SessionField="Quotation_number" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SOquantity" />
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </UpdateParameters>
          </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [QUOTES]" DeleteCommand="DELETE FROM [QUOTES] WHERE [Quotation_Number] = @Quotation_Number" InsertCommand="INSERT INTO [QUOTES] ([QUOTES_ID], [QOquantity], [Product_Id], [Quotation_Number]) VALUES (@QUOTES_ID, @QOquantity, @Product_Id, @Quotation_Number)" UpdateCommand="UPDATE [QUOTATION] SET [Quotation_Date] = @Quotation_Date, [Customer_Id] = @Customer_Id, [Product_Id] = @Product_Id, [Quantity] = @Quantity WHERE [Quotation_Number] = @Quotation_Number">
         
        </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>

        <div style="margin-top:100px;"  align="center">
        <br/>
    <asp:Label ID="lblQuotation" runat="server" Text="Updat Sale Order" Font-Bold="True"></asp:Label>  <br /> <br />
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server">
            <a href="SalesOrder.aspx">Go Back to SalesOrder</a> <br />
        <asp:Button ID="btnAdd" runat="server"   CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
        <asp:GridView ID="GridViewQuotation" runat="server" AutoGenerateColumns="False" DataKeyNames="QUOTES_ID" DataSourceID="SqlContains" AllowSorting="True" OnRowDataBound="girdview_OnRowDataBound">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="QUOTES_ID" HeaderText="QUOTES_ID" ReadOnly="True" SortExpression="QUOTES_ID" InsertVisible="False" />
                <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" ReadOnly="True" SortExpression="Product_ID" />
                <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation_Number" ReadOnly="True" SortExpression="Quotation_Number" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="QOquantity" HeaderText="QOquantity" ReadOnly="True" SortExpression="QOquantity" />
                <asp:BoundField DataField="SOquantity" HeaderText="SOquantity" SortExpression="SOquantity" />
                <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" SortExpression="Price" />
                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" ReadOnly="True" />
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
            
            <asp:Label ID="lblAmount" Text="Quotation Total:" runat="server" ></asp:Label>
            <asp:Label ID="lblTotalAmount" Text="Quotation Total" runat="server" ></asp:Label>
        </asp:Panel>
            
    
    
          <asp:Panel ID="panelAddQuotation" Visible="false" runat="server">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="lblQuotationTitle" Text="Update Sales Order Information" runat="server" Font-Bold="True"/><br /> <br />

              <asp:Label ID="lblProductId" runat="server" Text="Product ID: " Width="160px" />
              <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID">
                  <asp:ListItem Text="-- Product ID --" Value="-1"></asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="rfvProductId" runat="server" ControlToValidate="dropProductId" ErrorMessage="(*)Select Product ID" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              &nbsp;
              <br/>
              <asp:Label ID="lbQuantity" runat="server" style="margin-left: 55px" Text="Quantity: " Width="143px" />
              <asp:TextBox ID="Quantity" runat="server" style="margin-top: 0px"></asp:TextBox>
              <br />
              <asp:RequiredFieldValidator ID="rfvAllocatesTime" runat="server" ControlToValidate="Quantity" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="revAllocatesTime" runat="server" ControlToValidate="Quantity" ErrorMessage=" (*) eg:200, " ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="addQuotationValidation"></asp:RegularExpressionValidator>
              <br />
              <br />

              &nbsp;<asp:Panel ID="calpanel" runat="server" Visible="false">
                        <br />
                    </asp:Panel>
     
        <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" ValidationGroup="addQuotationValidation" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server"  CssClass="bg-primary" Text="Cancel" OnClick="btnCancel_Click" /> 
         <br/>
     </asp:Panel>

       </div>
   </form>
</body>
</html>
