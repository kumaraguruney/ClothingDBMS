<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quotation.aspx.cs" Inherits="SalesManagement.Sales.Quotation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quotation Information</title>
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
                <asp:SqlDataSource ID="SqlDataSourceCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [CUSTOMER] ORDER BY [Customer_Name]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [QUOTATION]" DeleteCommand="DELETE FROM [QUOTATION] WHERE [Quotation_Number] = @Quotation_Number" InsertCommand="INSERT INTO [QUOTATION] ([Quotation_Date], [Customer_Id], [Product_Id], [Quantity]) VALUES (@Quotation_Date, @Customer_Id, @Product_Id, @Quantity)" UpdateCommand="UPDATE [QUOTATION] SET [Quotation_Date] = @Quotation_Date, [Customer_Id] = @Customer_Id, [Product_Id] = @Product_Id, [Quantity] = @Quantity WHERE [Quotation_Number] = @Quotation_Number">
            <DeleteParameters>
                <asp:Parameter Name="Quotation_Number" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Quotation_Date" Type="DateTime" />
                <asp:Parameter Name="Customer_Id" Type="Int16" />
                <asp:Parameter Name="Product_Id" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Quotation_Date" Type="DateTime" />
                <asp:Parameter Name="Customer_Id" Type="Int16" />
                <asp:Parameter Name="Product_Id" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Quotation_Number" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <div style="margin-top:100px;"  align="center">
        <br/>
    <asp:Label ID="lblQuotation" runat="server" Text="Quotation Data Management" Font-Bold="true"></asp:Label>  <br /> <br />
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server">
        <asp:Button ID="btnAdd" runat="server"   CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
        <asp:GridView ID="GridViewQuotation" runat="server" AutoGenerateColumns="False" DataKeyNames="Quotation_Number" DataSourceID="SqlDataSourceQuotation" AllowSorting="True">
            <Columns>
                <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation Number" ReadOnly="True" SortExpression="Quotation_Number" InsertVisible="False" />
                <asp:BoundField DataField="Quotation_Date" HeaderText="Quotation Date" SortExpression="Quotation_Date" />

                <asp:TemplateField HeaderText="Customer ID" SortExpression="Customer_Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropCustomerId" runat="server" DataSourceID="SqlDataSourceCustomer" DataTextField="Customer_Id" DataValueField="Customer_Id" SelectedValue='<%# Bind("Customer_Id") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCustomerId" runat="server" Text='<%# Bind("Customer_Id") %>'></asp:Label>
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

                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
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

    
    
          <asp:Panel ID="panelAddQuotation" Visible="false" runat="server">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="lblQuotationTitle" Text="Enter New Quotation Information" runat="server" Font-Bold="True"/><br /> <br />

                          <asp:Label ID="lbQuantity" Width="200" Text="Quantity: " runat="server" />
            <asp:TextBox ID="Quantity" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvAllocatesTime" ValidationGroup="addQuotationValidation" runat="server" ControlToValidate="Quantity" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addQuotationValidation" ID="revAllocatesTime" runat="server" ControlToValidate="Quantity"
                 ErrorMessage=" (*) eg:200, " ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator><br/>

                    <asp:Label ID="lblProductId" Width="200" Text="Product ID: " runat="server" />
                    <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlDataSourceProduct" DataTextField="Product_Description" DataValueField="Product_ID">
                         <asp:ListItem Text="-- Product ID --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvProductId" ValidationGroup="addQuotationValidation" runat="server" ControlToValidate="dropProductId" ErrorMessage="(*) One Product ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />


           <asp:Label ID="lblDate" Width="200" Text="Quotation Date: " runat="server" />
            <asp:TextBox ID="Quotation_Date" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="addQuotationValidation" runat="server" ControlToValidate="Quotation_Date" ErrorMessage="(*) Enter Month/Date/Year Format" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addQuotationValidation" ID="RegularExpressionValidator1" runat="server" ControlToValidate="Quotation_Date"
                                 ErrorMessage=" (*) eg:03/25/1989, " ForeColor="Red" ValidationExpression="^[0-9/]*$"></asp:RegularExpressionValidator>
					<br /> <br />

             
                     <asp:Label ID="lblCustomerId" Width="200" Text="Customer ID: " runat="server" />
                    <asp:DropDownList ID="dropCustomerId" runat="server" DataSourceID="SqlDataSourceCustomer" DataTextField="Customer_Id" DataValueField="Customer_Id">
                        <asp:ListItem Text="-- Customer ID --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvCustomerId" ValidationGroup="addQuotationValidation" runat="server" ControlToValidate="dropCustomerId" ErrorMessage="(*) One Customer ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
 
                    <br /> <br /> 
        <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" ValidationGroup="addQuotationValidation" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server"  CssClass="bg-primary" Text="Cancel" OnClick="btnCancel_Click" /> 
         <br/>
     </asp:Panel>

       </div>
   </form>
</body>
</html>
