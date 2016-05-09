<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory Management</title>
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
                    <li><a class="page-scroll" href="Default.aspx">Inventory Management - Home</a> </li>
                    <li><a href="Warehouse.aspx">Warehouse</a></li>
                    <li><a href="Location.aspx">Location</a></li>
                    <li><a href="StockPile.aspx">Inventory</a></li>
                    <li><a href="StockMovement.aspx">Stock Movement</a></li>
                    <li><a href="StockReconciliation.aspx">Stock Reconciliation</a></li>
                 </ul>
            </div>
        </div>
    </div>

         <div style="margin-top:100px; height: 475px; text-overflow:inherit; overflow:auto"  align="center">




      <br /> <br /> <br /> <br /><br /> <br /> 


             <asp:Button ID="btnWarehouse" runat="server" CssClass="btn btn-primary btn-lg" Text="Warehouse" Height="100" Width="200" OnClick="btnWarehouse_Click" />

              -&nbsp-&nbsp-&nbsp>&nbsp;


             <asp:Button ID="btnLocation" runat="server" CssClass="btn btn-primary btn-lg" Text="Location" Height="100" Width="200" OnClick="btnLocation_Click" />

             -&nbsp-&nbsp-&nbsp>&nbsp;


             <asp:Button ID="btnInventory" runat="server" CssClass="btn btn-primary btn-lg" Text="Inventory" Height="100" Width="200" OnClick="btnInventory_Click" />
            
              -&nbsp-&nbsp-&nbsp>&nbsp;



             <asp:Button ID="btnStock_Movement" runat="server" CssClass="btn btn-primary btn-lg" Text="Stock Movement" Height="100" Width="200" OnClick="btnStock_Movement_Click" />

             -&nbsp-&nbsp-&nbsp>&nbsp;

             <asp:Button ID="btnStock_Reconciliation" runat="server" CssClass="btn btn-primary btn-lg" Text="Stock Reconciliation" Height="100" Width="200" OnClick="btnStock_Reconciliation_Click" />

                  <br /> <br /> <br />



             

             </div>


    </form>
</body>
</html>
