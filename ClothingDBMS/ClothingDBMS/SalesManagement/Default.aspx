<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sales Management</title>
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
      

 
                 <div style="margin-top:100px; height: 475px; text-overflow:inherit; overflow:auto"  align="center">
                         <br/>
                         <br/>
                         <br/>
                         <br/>
                         <br/>
                         <br/>
                         <br/>
                         <br/>
             <asp:Button ID="btnCustomer" runat="server" CssClass="btn btn-primary btn-lg" Text="Customer" Height="100" Width="100" OnClick="btnCustomer_Click" />

              -&nbsp-&nbsp-&nbsp-&nbsp-&nbsp-&nbsp-&nbsp->&nbsp;


             <asp:Button ID="btnQuotation" runat="server" CssClass="btn btn-primary btn-lg" Text="Quotation" Height="100" Width="100" OnClick="btnQuotation_Click" />

              -&nbsp-&nbsp-&nbsp-&nbsp-&nbsp-&nbsp-&nbsp->&nbsp;


             <asp:Button ID="btnSalesOrder" runat="server" CssClass="btn btn-primary btn-lg" Text="Sales Order" Height="100" Width="100" OnClick="btnSalesOrder_Click" />

              -&nbsp-&nbsp-&nbsp-&nbsp-&nbsp-&nbsp-&nbsp->&nbsp;


             <asp:Button ID="btnShipment" runat="server" CssClass="btn btn-primary btn-lg" Text="Shipment" Height="100" Width="100" OnClick="btnShipment_Click" />

             -&nbsp-&nbsp-&nbsp-&nbsp-&nbsp-&nbsp-&nbsp->&nbsp;


             <asp:Button ID="btnInvoice" runat="server" CssClass="btn btn-primary btn-lg" Text="Invoice" Height="100" Width="100" OnClick="btnInvoice_Click" />
            
              -&nbsp-&nbsp-&nbsp-&nbsp-&nbsp-&nbsp-&nbsp->&nbsp;



             <asp:Button ID="btnPayment" runat="server" CssClass="btn btn-primary btn-lg" Text="Payment" Height="100" Width="100" OnClick="btnPayment_Click" />




             <br /> <br /> <br />


                          

             </div>
          
    </form>
</body>

</html>
