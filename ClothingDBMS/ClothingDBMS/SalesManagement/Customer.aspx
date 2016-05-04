<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="SalesManagement.Sales.Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Information</title>
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
          <li><a href="SalesOrder.aspx">Sales Order</a></li>
          <li><a href="Shipment.aspx">Shipment</a></li>
                </ul>
            </div>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlDataSourceCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [CUSTOMER]" DeleteCommand="DELETE FROM [CUSTOMER] WHERE [Customer_Id] = @Customer_Id" InsertCommand="INSERT INTO [CUSTOMER] ([Customer_Name], [Address], [City], [State], [Zipcode], [Email], [Phone], [Fax]) VALUES (@Customer_Name, @Address, @City, @State, @Zipcode, @Email, @Phone, @Fax)" UpdateCommand="UPDATE [CUSTOMER] SET [Customer_Name] = @Customer_Name, [Address] = @Address, [City] = @City, [State] = @State, [Zipcode] = @Zipcode, [Email] = @Email, [Phone] = @Phone, [Fax] = @Fax WHERE [Customer_Id] = @Customer_Id">
        <DeleteParameters>
            <asp:Parameter Name="Customer_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Customer_Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zipcode" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Customer_Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zipcode" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="Customer_Id" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>

    <div style="margin-top:100px;" align="center">
        <br/>

   <asp:Label ID="lbCustomerHeader" runat="server" Text="Customer Information Management" Font-Bold="true"></asp:Label> <br /> <br />
                       <asp:Panel ID="panelSaveCustomer" Visible="true" runat="server" >
            <asp:Button ID="btnAdd" runat="server" CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="CustomerGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Customer_Id" DataSourceID="SqlDataSourceCustomer" AllowSorting="True"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Customer_Id" HeaderText="ID" ReadOnly="True" SortExpression="Customer_Id" InsertVisible="False" />
                <asp:BoundField DataField="Customer_Name" HeaderText="Name" SortExpression="Customer_Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="Zipcode" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
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

        <asp:Panel ID="panelAddCustomer" Visible="false" runat="server" >
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCustomer" runat="server" Text="Enter New Customer Details" Font-Bold="True" Font-Size="X-Large" Font-Underline ="True"></asp:Label>
            <br/> <br/>
            <asp:Label ID="lbCustomerName" Width="200" Text="Customer Name: " runat="server" />
            <asp:TextBox ID="Customer_Name" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvAllocatesTime" ValidationGroup="addCustomerValidation" runat="server" ControlToValidate="Customer_Name" ErrorMessage="(*) Enter Alphabetic Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addCustomerValidation" ID="revAllocatesTime" runat="server" ControlToValidate="Customer_Name"
                                 ErrorMessage=" (*) eg:First Name and Last Name: Naveen Kumar Duddala, " ForeColor="Red" ValidationExpression="^[a-zA-Z\s]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbAddress" Width="200" Text="Address: " runat="server" />
            <asp:TextBox ID="Address" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="addCustomerValidation" runat="server" ControlToValidate="Address" ErrorMessage="(*) Enter Numeric, Non-Numeric and Comma Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addCustomerValidation" ID="RegularExpressionValidator1" runat="server" ControlToValidate="Address"
                                 ErrorMessage=" (*) eg:7550 Country Club Drive, Apt 4108 " ForeColor="Red" ValidationExpression="^[a-zA-Z\s\d,]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbCity" Width="200" Text="City: " runat="server" />
            <asp:TextBox ID="City" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="addCustomerValidation" runat="server" ControlToValidate="City" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addCustomerValidation" ID="RegularExpressionValidator2" runat="server" ControlToValidate="City"
                                 ErrorMessage=" (*) eg:7550 Country Club Drive, Apt 4108 " ForeColor="Red" ValidationExpression="^[a-zA-Z]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbState" Width="200" Text="State: " runat="server" />
            <asp:TextBox ID="State" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="addCustomerValidation" runat="server" ControlToValidate="State" ErrorMessage="(*) Enter Alphabetic Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addCustomerValidation" ID="RegularExpressionValidator3" runat="server" ControlToValidate="State"
                                 ErrorMessage=" (*) eg:Laredo " ForeColor="Red" ValidationExpression="^[a-zA-Z]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbZipcode" Width="200" Text="Zip Code: " runat="server" />
            <asp:TextBox ID="Zipcode" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="addCustomerValidation" runat="server" ControlToValidate="Zipcode" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addCustomerValidation" ID="RegularExpressionValidator4" runat="server" ControlToValidate="Zipcode"
                                 ErrorMessage=" (*) eg:Laredo " ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbEmail" Width="200" Text="Email Id: " runat="server" />
            <asp:TextBox ID="Email" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="addCustomerValidation" runat="server" ControlToValidate="Email" ErrorMessage="(*) Enter Alphabetic, Numeric and Non-Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addCustomerValidation" ID="RegularExpressionValidator5" runat="server" ControlToValidate="Email"
                                 ErrorMessage=" (*) eg:dnk484@gmail.com " ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbPhoneNumber" Width="200" Text="Phone No: " runat="server" />
            <asp:TextBox ID="Phone" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="addCustomerValidation" runat="server" ControlToValidate="Phone" ErrorMessage="(*) Enter digits Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addCustomerValidation" ID="RegularExpressionValidator6" runat="server" ControlToValidate="Phone"
                                 ErrorMessage=" (*) eg:9562291635 " ForeColor="Red" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbFax" Width="200" Text="Fax: " runat="server" />
            <asp:TextBox ID="Fax" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="addCustomerValidation" runat="server" ControlToValidate="Fax" ErrorMessage="(*) Enter digits Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addCustomerValidation" ID="RegularExpressionValidator7" runat="server" ControlToValidate="Fax"
                                 ErrorMessage=" (*) eg:9562291635 " ForeColor="Red" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" ValidationGroup="addCustomerValidation" Text="Save" OnClick="btnSave_Click" />
            <asp:Button ID="btnCancel" runat="server" CssClass="bg-primary" Text="Cancel" OnClick="btnCancel_Click" /> 
        </asp:Panel>

    
   
    </div>
        
    </form>
</body>
</html>
