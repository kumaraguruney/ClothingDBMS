<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shipment.aspx.cs" Inherits="SalesManagement.Sales.Shipment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shipment Information</title>
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
    <form id="form1" runat="server" >
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
                <asp:SqlDataSource ID="SqlDataSourceSalesOrder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [SALES_ORDER] ORDER BY [Sorder_Number]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Inventory] ORDER BY [Inventory_Name]"></asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSourceShipment" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [SHIPMENT]" DeleteCommand="DELETE FROM [SHIPMENT] WHERE [Shipment_Id] = @Shipment_Id" InsertCommand="INSERT INTO [SHIPMENT] ([Shipment_Date], [Sorder_Number], [Inventory_Id], [Customer_Id], [Due_Date]) VALUES (@Shipment_Date, @Sorder_Number, @Inventory_Id, @Customer_Id, @Due_Date)" UpdateCommand="UPDATE [SHIPMENT] SET [Shipment_Date] = @Shipment_Date, [Sorder_Number] = @Sorder_Number, [Inventory_Id] = @Inventory_Id, [Customer_Id] = @Customer_Id, [Due_Date] = @Due_Date WHERE [Shipment_Id] = @Shipment_Id">
            <DeleteParameters>
                <asp:Parameter Name="Shipment_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Shipment_Date" Type="String" />
                <asp:Parameter Name="Sorder_Number" Type="Int32" />
                <asp:Parameter Name="Inventory_Id" Type="Int32" />
                <asp:Parameter Name="Customer_Id" Type="Int16" />
                <asp:Parameter Name="Due_Date" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Shipment_Date" Type="String" />
                <asp:Parameter Name="Sorder_Number" Type="Int32" />
                <asp:Parameter Name="Inventory_Id" Type="Int32" />
                <asp:Parameter Name="Customer_Id" Type="Int16" />
                <asp:Parameter Name="Due_Date" Type="String" />
                <asp:Parameter Name="Shipment_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
            <div style="margin-top:100px;"  align="center">
              
      
        <asp:Label ID="lblShipment" runat="server" Text="Shipment Management" Font-Bold="true"></asp:Label><br/><br/>
    
  
        <asp:Panel ID="panelAddShipment" Visible="false" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Enter New Shipment Information" Font-Bold="true"></asp:Label><br/>
                    <asp:Label ID="lblSorderNo" Width="200" Text="Sales order Number: " runat="server" />
                    <asp:DropDownList ID="dropSalesOrderNo" runat="server" DataSourceID="SqlDataSourceSalesOrder" DataTextField="Sorder_Number" DataValueField="Sorder_Number">
                        <asp:ListItem Text="-- Sales Order Number --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvSalesOrderNo" ValidationGroup="addShipmentValidation" runat="server" ControlToValidate="dropSalesOrderNo" ErrorMessage="(*) One Sales Order Number should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblInventoryId" Width="200" Text="Inventory Id: " runat="server" />
                    <asp:DropDownList ID="dropInventoryId" runat="server" DataSourceID="SqlDataSourceInventory" DataTextField="Inventory_Id" DataValueField="Inventory_Id">
                        <asp:ListItem Text="-- Inventory ID --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropInventoryId" ValidationGroup="addShipmentValidation" runat="server" ControlToValidate="dropInventoryId" ErrorMessage="(*) One Inventory ID should be Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblCustomerId" Width="200" Text="Customer Id: " runat="server" />
                    <asp:DropDownList ID="dropCustomerId" runat="server" DataSourceID="SqlDataSourceCustomer" DataTextField="Customer_Id" DataValueField="Customer_Id">
                        <asp:ListItem Text="-- Customer ID --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="addShipmentValidation" runat="server" ControlToValidate="dropCustomerId" ErrorMessage="(*) One Customer ID should be Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
   
                    <br /> <br />

             <asp:Label ID="lblShip" Width="200" Text="Shipment Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtShip" ReadOnly="false" Width="230" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton ID="calingShip" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calingShip_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calShip" runat="server" OnSelectionChanged="calShipDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />

             <asp:Label ID="lblDue" Width="150" Text="Due Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtDue" ReadOnly="false" Width="230" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calingDue_Click" Width="25px" />
                    <asp:Panel ID="calpanel1" runat="server" Visible="false">
                        <asp:Calendar ID="calDue" runat="server" OnSelectionChanged="calDueDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />

        <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" ValidationGroup="addShipmentValidation"  Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" CssClass="bg-primary" Text="Cancel" OnClick="btnCancel_Click" /> 
         </asp:Panel> 
    
        <asp:Panel ID="panelSaveShipment" Visible="true" runat="server">
            <asp:Button ID="btnAdd"  CssClass="bg-primary" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="GridViewShipment" runat="server" AutoGenerateColumns="False" DataKeyNames="Shipment_Id" DataSourceID="SqlDataSourceShipment" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
  
                    
                    <asp:BoundField DataField="Shipment_Id" HeaderText="Shipment ID" InsertVisible="False" ReadOnly="True" SortExpression="Shipment_Id" />
                    <asp:BoundField DataField="Shipment_Date" HeaderText="Shipment Date" SortExpression="Shipment_Date" />
                    <asp:TemplateField HeaderText="Sales Order Number" SortExpression="Sorder_Number">
                     <EditItemTemplate>
                                    <asp:DropDownList ID="dropSorderNumber" runat="server" DataSourceID="SqlDataSourceSalesOrder" DataTextField="Sorder_Number" DataValueField="Sorder_Number" SelectedValue='<%# Bind("Sorder_Number") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSorderNumber" runat="server" Text='<%# Bind("Sorder_Number") %>'></asp:Label>
                                </ItemTemplate>
                     </asp:TemplateField>

                    <asp:BoundField DataField="Inventory_Id" HeaderText="Inventory ID" SortExpression="Inventory_Id" />
                    <asp:TemplateField HeaderText="Customer ID" SortExpression="Customer_Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropCustomerId" runat="server" DataSourceID="SqlDataSourceCustomer" DataTextField="Customer_Id" DataValueField="Customer_Id" SelectedValue='<%# Bind("Customer_Id") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCustomerId" runat="server" Text='<%# Bind("Customer_Id") %>'></asp:Label>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Due_Date" HeaderText="Due Date" SortExpression="Due_Date" />
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
