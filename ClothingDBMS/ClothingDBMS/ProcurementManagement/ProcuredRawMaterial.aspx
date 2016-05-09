<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcuredRawMaterial.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.ProcuredRawMaterial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Procured Raw Material</title>
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

        <asp:SqlDataSource ID="SqlProcuredRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [ProcuredRawMaterial]">
        </asp:SqlDataSource>
          <div  style="margin-top:200px;" align="center">
        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT RawMaterial.RawMaterial_ID, RawMaterial.RawMaterial_Name + ',' + Code.Code_Description + ', ' + RawMaterial.RawMaterial_Description AS RawMaterial_Name FROM RawMaterial LEFT OUTER JOIN Code ON Code.Code_ID = RawMaterial.RawMaterial_Color"></asp:SqlDataSource>
                <br />
                <asp:Label ID="lblProcuredRawMaterial" runat="server" Text="Procured Raw Material Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvProcuredRawMaterial" runat="server" style="margin-top: 0px">
                    <asp:Button ID="btnaddProcuredRawMaterial" runat="server" Text="Add" OnClick="btnaddProcuredRawMaterial_Click"/>
                    <asp:GridView ID="gvProcuredRawMaterial" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProcuredRawMaterial" AutoGenerateColumns="False" DataKeyNames="Batch_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <Columns>
                            <asp:BoundField DataField="Batch_ID" HeaderText="Batch_ID" ReadOnly="True" SortExpression="Batch_ID" InsertVisible="False" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" SortExpression="RawMaterial_ID" />
                             <asp:BoundField DataField="Procured_Date" HeaderText="Procured_Date" SortExpression="Procured_Date" />
                             <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Available_Quantity" HeaderText="Available_Quantity" SortExpression="Available_Quantity" />
                            <asp:CheckBoxField DataField="Is_Stock_Piled" HeaderText="Is_Stock_Piled" SortExpression="Is_Stock_Piled" />
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
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdProcuredRawMaterial" Visible="false" runat="server">
                <asp:Label ID="lblFinishedProductDetails" Text="Enter Procured Raw Material Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblRawMaterialID" runat="server" Text="Raw Material:" Width="200px" />
                    <asp:DropDownList ID="dropaddRawMaterial" Width="250px" AppendDataBoundItems="True" EnableViewState="False" runat="server" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID">
                    </asp:DropDownList>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblProcuredDate" runat="server" Text="Procured Date:" Width="200px" />
                    <asp:TextBox ID="ProcuredDateTextBox" runat="server" Width="199px"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgProcuredDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgProcuredDate_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calProcuredDate" OnSelectionChanged="calProcuredDate_SelectionChanged" runat="server"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnMoveProcuredRawMaterial" ValidationGroup="addAllocatesValidation" runat="server" Text="Move" OnClick="btnMoveProcuredRawMaterial_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelProcuredRawMaterial" runat="server" Text="Cancel" OnClick="btnCancelProcuredRawMaterial_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
