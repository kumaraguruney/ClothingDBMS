<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ProductionManagement.Index" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Kumaraguru">
    <title>Naveen Textile Limited - DBMS Project Spring 2016</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/the-big-picture.css" rel="stylesheet">
    <link href="css/font-icon.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <link href="css/flexslider.css" rel="stylesheet" type="text/css" />
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/animate.min.css" rel="stylesheet" type="text/css" />
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body id="hme">
    <form id="form2" runat="server">
    <div id="custom-bootstrap-menu" class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <a class="navbar-brand" href="index.aspx">Naveen Textile Limited</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="page-scroll" href="index.aspx">Home</a> </li>
                    <li><a class="page-scroll" href="ProductionManagement/Default.aspx">Production</a> </li>
                    <li><a class="page-scroll" href="InventoryManagement/Default.aspx">Inventory</a> </li>
                    <li><a class="page-scroll" href="ProcurementManagement/Default.aspx">Procurement</a> </li>
                    <li><a class="page-scroll" href="SalesManagement/Default.aspx">Sales</a> </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Login -->
    <!-- Start Carousel Main Slider -->
    <section class="carousel carousel-fade slide home-slider" id="fullslider" data-ride="carousel"
        data-interval="4500" data-pause="false"> 
    <!-- Carousel-Indicators -->
	<ol class="carousel-indicators"> 
		<li data-target="#fullslider" data-slide-to="0" class="active"></li>
		<li data-target="#fullslider" data-slide-to="1" class=""></li>		
        <li data-target="#fullslider" data-slide-to="2" class=""></li>		
        <li data-target="#fullslider" data-slide-to="3" class=""></li>	    	
	</ol>
    <!-- Carousel-Inner -->
	<div class="carousel-inner"> 
		<div class="item active bg1">
         <div class="banner-overlay">
         <!-- Slide - 1 -->
			<div class="container">
				<div class="row">			
					<div class="col-md-6 col-sm-8 col-xs-12 animated notranstion">						
						<br class="hidden-sm hidden-xs"/>
						<div class="wow" data-wow-duration="1500ms" data-wow-delay="100ms">
                        <h1 class="carouselText1 text-left wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="150ms">Production Management</h1>
						  <p class="wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="200ms">
                            Production Management refers to the application of management principles to the production function in a factory. In other words, production management involves application of planning, organizing, directing and controlling the production process.
                          </p>
                            <br/>
                           <div class="text-left buttonleft hidden-xs">
                           <a href="ProductionManagement/Default.aspx" class="btn btn-lg btn-borderwhite wow fadeInUp" data-wow-duration="1500ms" data-wow-delay="1200ms">Production</a> 
                           </div>
                      </div>						
					</div>
                    <div class="col-md-6 col-sm-4 hidden-xs animated">                                      
							<img src="img/slider/slide1-1.png" alt="" class="slide1-1 wow  fadeInRight"/>
					</div>
				</div>
			</div>
            </div>
		</div> <!-- End Slide - 1 -->
		<div class="item bg2">
          <div class="banner-overlay">
         <!-- Slide - 2 -->
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-4 hidden-xs animated">                                      
						<img src="img/slider/slide1-1.png" alt="" class="slide1-2 wow fadeInLeft img-responsive"/>
					</div>
					<div class="col-md-6 col-sm-8 col-xs-12 animated text-right">	
                      <div class="wow" data-wow-duration="1500ms" data-wow-delay="100ms">
                        <h1 class="carouselText1 text-left wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="150ms">Inventory Management</h1>
						  <p class="wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="200ms">
                            Inventory management is the process of efficiently overseeing the constant flow of units into and out of an existing inventory.
                          </p>
                            <br/>
                           <div class="text-left buttonleft hidden-xs">
                           <a href="InventoryManagement/Default.aspx" class="btn btn-lg btn-borderwhite wow fadeInUp" data-wow-duration="1500ms" data-wow-delay="1200ms">Inventory</a> 
                           </div>
                      </div>		                     
					</div>
				</div>
			</div>
            </div>
		</div> <!-- End Slide - 2 -->
		<div class="item bg3">
          <div class="banner-overlay">
         <!-- Slide - 3 -->
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-8 col-xs-12 animated notranstion">						
						<br class="hidden-sm hidden-xs"/>
						<div class="wow" data-wow-duration="1500ms" data-wow-delay="100ms">
                        <h1 class="carouselText1 text-left wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="150ms">Procurement Management</h1>
						  <p class="wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="200ms">
                            Procurement management is one such form of management, where goods and services are acquired from a different organization or firm. All organizations deal with this form of management at some point in the life of their businesses.
                          </p>
                            <br/>
                           <div class="text-left buttonleft hidden-xs">
                           <a href="ProcurementManagement/Default.aspx" class="btn btn-lg btn-borderwhite wow fadeInUp" data-wow-duration="1500ms" data-wow-delay="1200ms">Procurement</a> 
                           </div>
                      </div>						
					</div>
                    <div class="col-md-6 col-sm-4 hidden-xs animated">                                      
							<img src="img/slider/slide1-1.png" alt="" class="slide1-1 wow  fadeInRight"/>
					</div>				
				</div>
			</div>
            </div>
		</div> <!-- End Slide - 3 -->
       <div class="item bg4"> <!-- Slide - 4 -->
         <div class="banner-overlay">
          <div class="container">
				<div class="row">
                    	<div class="col-md-6 col-sm-4 hidden-xs animated">                                      
						<img src="img/slider/slide1-1.png" alt="" class="slide1-2 wow fadeInLeft img-responsive"/>
					</div>
					<div class="col-md-6 col-sm-8 col-xs-12 animated text-right">	
                      <div class="wow" data-wow-duration="1500ms" data-wow-delay="100ms">
                        <h1 class="carouselText1 text-left wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="150ms">Sales Management</h1>
						  <p class="wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="200ms">
                            Sales management is a business discipline which is focused on the practical application of sales techniques and the management of a firm's sales operations. It is an important business function as net sales through the sale of products and services and resulting profit drive most commercial business. These are also typically the goals and performance indicators of sales management.
                          </p>
                            <br/>
                           <div class="text-left buttonleft hidden-xs">
                           <a href="SalesManagement/Default.aspx" class="btn btn-lg btn-borderwhite wow fadeInUp" data-wow-duration="1500ms" data-wow-delay="1200ms">Sales</a> 
                           </div>
                      </div>		                     
					</div>
                </div>
           </div>
           </div>
        </div> <!-- End Slide - 4 -->		 
	</div>
	<!-- End Carousel-Inner -->
    <!-- Carousel - Control -->
	<a class="left carousel-control animated fadeInLeft" href="#fullslider" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
	<a class="right carousel-control animated fadeInRight" href="#fullslider" data-slide="next"><i class="fa fa-chevron-right"></i></a>	
    </section>
    <!--  End Carousel Main Slider  -->
    <!-- services section -->
    <section id="services" class="services service-section">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-sm-4 services"> <span class="icon icon-gears"></span>
        <div class="services-content">
          <h5>Production Management</h5>
          <p> Production management involves application of planning, organizing, directing and controlling the production process.
          </p>
        </div>
      </div>
      <div class="col-md-6 col-sm-4 services"> <span class="icon icon-basket"></span>
        <div class="services-content">
          <h5>Inventory Management</h5>
          <p> Inventory management is the process of efficiently overseeing the constant flow of units into and out of an existing inventory.</p>
        </div>
      </div>
      <div class="col-md-6 col-sm-4 services"> <span class="icon icon-documents"></span>
        <div class="services-content">
          <h5>Procurement Management</h5>
          <p> Procurement management is one such form of management, where goods and services are acquired from a different organization or firm. All organizations deal with this form of management at some point in the life of their businesses.</p>
        </div>
      </div>
      <div class="col-md-6 col-sm-4 services"> <span class="icon icon-pricetags"></span>
        <div class="services-content">
          <h5>Sales Management</h5>
          <p> Sales management is a business discipline which is focused on the practical application of sales techniques and the management of a firm's sales operations. It is an important business function as net sales through the sale of products and services and resulting profit drive most commercial business. These are also typically the goals and performance indicators of sales management.</p>
        </div>
      </div>
    </div>
  </div>
        
         <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.easing.min.js" type="text/javascript"></script>
    <script src="js/jquery.flexslider-min.js"></script>
    <script src="js/jquery.fancybox.pack.js"></script>
    <script src="js/wow.js" type="text/javascript"></script>
    <script src="js/retina.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript">
        //WOW Scroll Spy
        var wow = new WOW({
            //disabled for mobile
            mobile: false
        });
        wow.init();
    </script>
    </form>
</body>
</html>
