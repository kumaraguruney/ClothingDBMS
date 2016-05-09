<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Procurement Management</title>
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

         <div style="margin-top:100px; height: 475px; text-overflow:inherit; overflow:auto"  align="center">

                         <br/>
                         <br/>
                         <br/>
                         <br/>
                         <br/>
                         <br/>
                         <br/>
                         <br/>
             <asp:Button ID="btnSupplier" runat="server" CssClass="btn btn-primary btn-lg" Text="Supplier" Height="100" Width="100" OnClick="btnSupplier_Click" />

                         &nbsp-&nbsp->&nbsp;


             <asp:Button ID="btnSupplier_Quotation" runat="server" CssClass="btn btn-primary btn-lg" Text="Supplier Quotation" Height="100" Width="150" OnClick="btnSupplier_Quotation_Click" Font-Size="Medium" />

              -&nbsp-&nbsp>&nbsp;


             <asp:Button ID="btnProvides" runat="server" CssClass="btn btn-primary btn-lg" Text="Provides" Height="100" Width="100" OnClick="btnProvides_Click" />

              -&nbsp-&nbsp>&nbsp;


             <asp:Button ID="btnOrders" runat="server" CssClass="btn btn-primary btn-lg" Text="Orders" Height="100" Width="100" OnClick="btnOrders_Click" />

             -&nbsp->&nbsp;


             <asp:Button ID="btnPurchase_Order" runat="server" CssClass="btn btn-primary btn-lg" Text="Purchase Order" Height="100" Width="110" OnClick="btnPurchase_Order_Click" />
            
              -&nbsp-&nbsp>&nbsp;
              <asp:Button ID="btnUpdates" runat="server" CssClass="btn btn-primary btn-lg" Text="Updates" Height="100" Width="100" OnClick="btnUpdates_Click" />
            
              -&nbsp-&nbsp&nbsp->&nbsp;
              <asp:Button ID="btnGoods_Receipt" runat="server" CssClass="btn btn-primary btn-lg" Text="Goods Receipt" Height="100" Width="120" OnClick="btnGoods_Receipt_Click" />
            
              -&nbsp-&nbsp>&nbsp;
      

             <asp:Button ID="btnProcuredRawMaterial" runat="server" CssClass="btn btn-primary btn-lg" Text="Procured Raw Material" Height="100" Width="160" OnClick="btnProcuredRawMaterial_Click" />

          -&nbsp-&nbsp>&nbsp;
      

             <asp:Button ID="btnWorkorder" runat="server" CssClass="btn btn-primary btn-lg" Text="Workorder" Height="100" Width="160" OnClick="Workorder_Click" />
                     
      

             
             
             <br /> <br /> <br />




    
             </div>


    </form>
</body>
</html>
