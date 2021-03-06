﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="SalesManagement.Sales.Invoice1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice Information</title>
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
          <li><a class="page-scroll" href="Invoice.aspx">Invoice</a></li>

          <li><a class="page-scroll" href="Payment.aspx">Payment</a></li>
          <li><a class="page-scroll" href="ListingPrice.aspx">Listing Price</a></li>
                </ul>
            </div>
        </div>
    </div>
         <asp:SqlDataSource ID="SqlDataSourceShipment" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [SHIPMENT] ORDER BY [Shipment_Id]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSalesOrder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>"  SelectCommand="SELECT * FROM [SALES_ORDER] ORDER BY [Sorder_Number]"></asp:SqlDataSource>
            
        <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDataSourcePayment" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [PAYMENT] ORDER BY [Payment_Id]"></asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlDataSourceInvoice" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [INVOICE]" DeleteCommand="DELETE FROM [INVOICE] WHERE [Invoice_Number] = @Invoice_Number" InsertCommand="INSERT INTO [INVOICE] ([Invoice_Date], [Shipment_Id], [Sorder_Number], [Product_Id], [Payment_Id]) VALUES (@Invoice_Date, @Shipment_Id, @Sorder_Number, @Product_Id, @Payment_Id)" UpdateCommand="UPDATE [INVOICE] SET [Invoice_Date] = @Invoice_Date, [Shipment_Id] = @Shipment_Id, [Sorder_Number] = @Sorder_Number, [Product_Id] = @Product_Id, [Payment_Id] = @Payment_Id WHERE [Invoice_Number] = @Invoice_Number">
                   <DeleteParameters>
               <asp:Parameter Name="Invoice_Number" Type="Int32" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="Invoice_Date" Type="DateTime" />
               <asp:Parameter Name="Shipment_Id" Type="Int32" />
               <asp:Parameter Name="Sorder_Number" Type="Int32" />
               <asp:Parameter Name="Product_Id" Type="Int32" />
               <asp:Parameter Name="Payment_Id" Type="Int32" />
           </InsertParameters>
           <UpdateParameters>
               <asp:Parameter Name="Invoice_Date" Type="DateTime" />
               <asp:Parameter Name="Shipment_Id" Type="Int32" />
               <asp:Parameter Name="Sorder_Number" Type="Int32" />
               <asp:Parameter Name="Product_Id" Type="Int32" />
               <asp:Parameter Name="Payment_Id" Type="Int32" />
               <asp:Parameter Name="Invoice_Number" Type="Int32" />
           </UpdateParameters>
        </asp:SqlDataSource>

    <div style="margin-top:100px;" align="center">
        <br/>
        <asp:Label ID="lblInvoice" runat="server" Text="Invoice Data Managment" Font-Bold="true"></asp:Label>  <br /> <br />
  
        <asp:Panel ID="panelAddInvoice" Visible="false" runat="server"> 
            <asp:Label ID="lblInvoiceaddTitle" Text="Enter New Invoice Information" runat="server" /><br /> <br />
                    <asp:Label ID="lblShipmentId" Width="200" Text="Shipment ID: " runat="server" />
                    <asp:DropDownList ID="dropShipmentId" runat="server" DataSourceID="SqlDataSourceShipment" DataTextField="Shipment_Id" DataValueField="Shipment_Id">
                        <asp:ListItem Text="-- Shipment ID --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvShipmentId" ValidationGroup="addInvoiceValidation" runat="server" ControlToValidate="dropShipmentId" ErrorMessage="(*) One Shipment ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />

                    <asp:Label ID="lblSorderNumber" Width="200" Text="Sales Order Number: " runat="server" />
                    <asp:DropDownList ID="dropSorderNumber" runat="server" DataSourceID="SqlDataSourceSalesOrder" DataTextField="Sorder_Number" DataValueField="Sorder_Number">
                         <asp:ListItem Text="-- Sales Order Number --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropSorderNumber" ValidationGroup="addInvoiceValidation" runat="server" ControlToValidate="dropSorderNumber" ErrorMessage="(*) One Sales Order Number should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />

                    <asp:Label ID="lblProductId" Width="200" Text="Product ID: " runat="server" />
                    <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlDataSourceProduct" DataTextField="Product_Id" DataValueField="Product_Id">
                         <asp:ListItem Text="-- Product ID --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfcdropProductId" ValidationGroup="addInvoiceValidation" runat="server" ControlToValidate="dropProductId" ErrorMessage="(*) One Product ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />

                    <asp:Label ID="lblPyamentId" Width="200" Text="Payment ID: " runat="server" />
                    <asp:DropDownList ID="dropPaymentId" runat="server" DataSourceID="SqlDataSourcePayment" DataTextField="Payment_Id" DataValueField="Payment_Id">
                         <asp:ListItem Text="-- Payment ID --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropPaymentId" ValidationGroup="addInvoiceValidation" runat="server" ControlToValidate="dropPaymentId" ErrorMessage="(*) One Payment ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
<br/>  <br/>           
        <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" ValidationGroup="addInvoiceValidation" Text="Save" OnClick="btnSave_Click" /> &nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" CssClass="bg-primary" Text="Cancel" OnClick="btnCancel_Click" /> 
         </asp:Panel> 
        <asp:Panel ID="panelSaveInvoice" Visible="true" runat="server">
            <asp:Button ID="btnAdd" runat="server" CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
            <br /> <br />
            <asp:GridView ID="GridViewInvoice" runat="server" AutoGenerateColumns="False" DataKeyNames="Invoice_Number" DataSourceID="SqlDataSourceInvoice" AllowSorting="True"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
      
                    <asp:BoundField DataField="Invoice_Number" HeaderText="Invoice Number" InsertVisible="False" ReadOnly="True" SortExpression="Invoice_Number" />
                    <asp:BoundField DataField="Invoice_Date" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Invoice Date" SortExpression="Invoice_Date" />
                    <asp:TemplateField HeaderText="Shipment ID" SortExpression="Shipment_Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropShipmentId" runat="server" DataSourceID="SqlDataSourceShipment" DataTextField="Name" DataValueField="Shipment_Id" SelectedValue='<%# Bind("Shipment_Id") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblShipmentId" runat="server" Text='<%# Bind("Shipment_Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sales Order Number" SortExpression="Sorder_Number">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropSOrderNumber" runat="server" DataSourceID="SqlDataSourceSalesOrder" DataTextField="Sorder_Number" DataValueField="Sorder_Number" SelectedValue='<%# Bind("Sorder_Number") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSOrderNumber" runat="server" Text='<%# Bind("Sorder_Number") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                   <asp:TemplateField HeaderText="Product ID" SortExpression="Product_Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlDataSourceProduct" DataTextField="Product_Id" DataValueField="Product_Id" SelectedValue='<%# Bind("Product_Id") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblProductId" runat="server" Text='<%# Bind("Product_Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                <asp:TemplateField HeaderText="Payment ID" SortExpression="Payment_Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropPaymentId" runat="server" DataSourceID="SqlDataSourcePayment" DataTextField="Payment_Id" DataValueField="Payment_Id" SelectedValue='<%# Bind("Payment_Id") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPaymentId" runat="server" Text='<%# Bind("Payment_Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
               <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
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
      </div>
    </form>
</body>
</html>
