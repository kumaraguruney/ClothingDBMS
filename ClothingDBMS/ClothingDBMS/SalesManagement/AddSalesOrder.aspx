<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSalesOrder.aspx.cs" Inherits="SalesManagement.Sales.SalesOrder" %>

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
                 (Query)<asp:SqlDataSource ID="SqlDataSou(Query)<asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
       
        <div style="margin-top:100px;" align="center">
        <br/>
            <br /> 
            <asp:SqlDataSource ID="SqlDataSourceSalesOrder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT QUOTATION.Quotation_Number, QUOTATION.Customer_Id, CUSTOMER.Customer_Name, QUOTATION.Sorder_Date, QUOTATION.SorderDue_Date, QUOTATION.Late_Fee FROM QUOTATION INNER JOIN CUSTOMER ON QUOTATION.Customer_Id = CUSTOMER.Customer_Id AND QUOTATION.Is_SO = 'True' ORDER BY QUOTATION.Quotation_Number" DeleteCommand="DELETE FROM [QUOTATION] WHERE [Quotation_Number] = @Quotation_Number" InsertCommand="INSERT INTO [QUOTATION] ([Quotation_Date], [Customer_Id]) VALUES (@Quotation_Date, @Customer_Id)" UpdateCommand="UPDATE QUOTATION SET Is_SO = @Is_SO, Sorder_Date = @Sorder_Date, SorderDue_Date = @SorderDue_Date, Late_Fee = @Late_Fee WHERE (Quotation_Number = @Quotation_Number)">
                <DeleteParameters>
                    <asp:Parameter Name="Quotation_Number" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Quotation_Date" Type="String" />
                    <asp:Parameter Name="Customer_Id" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Is_SO" />
                    <asp:Parameter Name="Sorder_Date" />
                    <asp:Parameter Name="SorderDue_Date" />
                    <asp:Parameter Name="Late_Fee" />
                    <asp:Parameter Name="Quotation_Number" Type="Int32" />
                </UpdateParameters>
        </asp:SqlDataSource>


            <br />
    

        <asp:Panel ID="panelAddSalesOrder" Visible="True" runat="server"> 
             &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblSalesOrder" runat="server" Font-Bold="True" Text="Converting to Sales Order"></asp:Label>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br /> 
             <asp:Label ID="lbLateFee" runat="server" Text="Late Fee ($): " Width="200" />
             <asp:TextBox ID="LateFee" runat="server" style="margin-top: 0px"></asp:TextBox>
             <br />
             <asp:RequiredFieldValidator ID="rfvSalesOrder" runat="server" ControlToValidate="LateFee" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red" ValidationGroup="addSalesOrderValidation"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="revAllocatesTime" runat="server" ControlToValidate="LateFee" ErrorMessage=" (*) eg:200, " ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="addSalesOrderValidation"></asp:RegularExpressionValidator>
             <br />
             <br />
             <asp:Label ID="lblDueDate" runat="server" Text="Due Date: " Width="200"></asp:Label>
             <asp:TextBox ID="txtSODueDate" runat="server" ReadOnly="false" Width="230"></asp:TextBox>
             &nbsp;<asp:ImageButton ID="calingSODueDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calingSODueDate_Click" Width="25px" />
             <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calDueDate" runat="server" OnSelectionChanged="calSODueDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
            <br /> <br /> 

             <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" OnClick="btnSave_Click" Text="Save" ValidationGroup="addQuotationValidation" />
             <asp:Button ID="btnCancel" runat="server" CssClass="bg-primary" OnClick="btnCancel_Click" Text="Cancel" />
             <br />
          
         </asp:Panel> 
                </div>
    </form>
</body>
</html>
