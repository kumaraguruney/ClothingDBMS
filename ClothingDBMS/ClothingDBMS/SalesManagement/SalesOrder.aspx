<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesOrder.aspx.cs" Inherits="SalesManagement.Sales.SalesOrder" %>

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
          <li><a href="SalesOrder.aspx">Sales Order</a></li>
          <li><a href="Shipment.aspx">Shipment</a></li>
                </ul>
            </div>
 </div>
    </div>
                 <asp:SqlDataSource ID="SqlDataSourceQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [QUOTATION] ORDER BY [Quotation_Number]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDesign" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Design] ORDER BY [Design_Name]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
       
        <asp:SqlDataSource ID="SqlDataSourceSalesOrder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [SALES_ORDER]" DeleteCommand="DELETE FROM [SALES_ORDER] WHERE [Sorder_Number] = @Sorder_Number" InsertCommand="INSERT INTO [SALES_ORDER] ([Sorder_Date], [Quotation_Number], [Quantity], [Product_Id], [Design_Id], [Late_Fee], [Due_Date]) VALUES (@Sorder_Date, @Quotation_Number, @Quantity, @Product_Id, @Design_Id, @Late_Fee, @Due_Date)" UpdateCommand="UPDATE [SALES_ORDER] SET [Sorder_Date] = @Sorder_Date, [Quotation_Number] = @Quotation_Number, [Quantity] = @Quantity, [Product_Id] = @Product_Id, [Design_Id] = @Design_Id, [Late_Fee] = @Late_Fee, [Due_Date] = @Due_Date WHERE [Sorder_Number] = @Sorder_Number">
            <DeleteParameters>
                <asp:Parameter Name="Sorder_Number" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Sorder_Date" Type="DateTime" />
                <asp:Parameter Name="Quotation_Number" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Product_Id" Type="Int32" />
                <asp:Parameter Name="Design_Id" Type="Int32" />
                <asp:Parameter Name="Late_Fee" Type="Int16" />
                <asp:Parameter Name="Due_Date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Sorder_Date" Type="DateTime" />
                <asp:Parameter Name="Quotation_Number" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Product_Id" Type="Int32" />
                <asp:Parameter Name="Design_Id" Type="Int32" />
                <asp:Parameter Name="Late_Fee" Type="Int16" />
                <asp:Parameter Name="Due_Date" Type="DateTime" />
                <asp:Parameter Name="Sorder_Number" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div style="margin-top:100px;" align="center">
        <br/>
        <asp:Label ID="lblSalesOrder" runat="server" Text="Sales Order Management" Font-Bold="true"></asp:Label><br /> <br />
    

        <asp:Panel ID="panelAddSalesOrder" Visible="false" runat="server"> 
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="lblSalesOrderTitle" Text="Enter New Sales Order Information" runat="server" Font-Bold="True"/><br /> <br />

              <asp:Label ID="lblQuotationNumber" Width="200" Text="Quotation Number: " runat="server" />
                    <asp:DropDownList ID="dropQuotationNumber" runat="server" DataSourceID="SqlDataSourceQuotation" DataTextField="Quotation_Number" DataValueField="Quotation_Number">
                        <asp:ListItem Text="-- Quotation ID --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvQuotationNumber" ValidationGroup="addQuotationValidation" runat="server" ControlToValidate="dropQuotationNumber" ErrorMessage="(*) One Quotation Number should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />

              <asp:Label ID="lblProductId" Width="200" Text="Product ID: " runat="server" />
                    <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlDataSourceProduct" DataTextField="Product_Id" DataValueField="Product_Id">
                        <asp:ListItem Text="-- Product ID --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvProductId" ValidationGroup="addQuotationValidation" runat="server" ControlToValidate="dropProductId" ErrorMessage="(*) One Product ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />

              <asp:Label ID="DesignId" Width="200" Text="Design ID: " runat="server" />
                    <asp:DropDownList ID="dropDesignId" runat="server" DataSourceID="SqlDataSourceDesign" DataTextField="Design_Name" DataValueField="Design_ID">
                        <asp:ListItem Text="-- Design ID --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvDesignId" ValidationGroup="addQuotationValidation" runat="server" ControlToValidate="dropDesignId" ErrorMessage="(*) One Design ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
 
                    <br /> <br />             

            <asp:Label ID="lbLateFee" Width="200" Text="Late Fee ($): " runat="server" />
            <asp:TextBox ID="LateFee" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvAllocatesTime" ValidationGroup="addSalesOrderValidation" runat="server" ControlToValidate="LateFee" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addSalesOrderValidation" ID="revAllocatesTime" runat="server" ControlToValidate="LateFee"
                                 ErrorMessage=" (*) eg:200, " ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lblDueDate" Width="200" Text="Due Date: " runat="server" />
            <asp:TextBox ID="DueDate" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="addSalesOrderValidation" runat="server" ControlToValidate="DueDate" ErrorMessage="(*) Enter Month/Date/Year Format" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addSalesOrderValidation" ID="RegularExpressionValidator1" runat="server" ControlToValidate="DueDate"
                                 ErrorMessage=" (*) eg:03/25/1989, " ForeColor="Red" ValidationExpression="^[0-9/]*$"></asp:RegularExpressionValidator>
					<br /> <br />
        <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" ValidationGroup="addQuotationValidation"  Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" CssClass="bg-primary" Text="Cancel" OnClick="btnCancel_Click" /> 
            <br/>
          
         </asp:Panel> 
        <asp:Panel ID="panelSaveSalesOrder" Visible="true" runat="server" >
            <asp:Button ID="btnAdd" runat="server" CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="GridViewSalesOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="Sorder_Number" DataSourceID="SqlDataSourceSalesOrder" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <Columns>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                    
                    <asp:BoundField DataField="Sorder_Number" HeaderText="Sales order Number" InsertVisible="False" ReadOnly="True" SortExpression="Sorder_Number" />
                    <asp:BoundField DataField="Sorder_Date" HeaderText="Sorder Date" SortExpression="Sorder_Date" />

                     <asp:TemplateField HeaderText="Quotation Number" SortExpression="Quotation_Number">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropQuotationNumber" runat="server" DataSourceID="SqlDataSourceQuotation" DataTextField="Quotation_Number" DataValueField="Quotation_Number" SelectedValue='<%# Bind("Quotation_Number") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblQuotationNumber" runat="server" Text='<%# Bind("Quotation_Number") %>'></asp:Label>
                                </ItemTemplate>
                     </asp:TemplateField>

                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />

                <asp:TemplateField HeaderText="Product ID" SortExpression="Product_Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlDataSourceProduct" DataTextField="Product_Id" DataValueField="Product_Id" SelectedValue='<%# Bind("Product_Id") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblProductId" runat="server" Text='<%# Bind("Product_Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

           
                <asp:TemplateField HeaderText="Design ID" SortExpression="Design_Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropDesignId" runat="server" DataSourceID="SqlDataSourceDesign" DataTextField="Design_Id" DataValueField="Design_Id" SelectedValue='<%# Bind("Design_Id") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDesignId" runat="server" Text='<%# Bind("Design_Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                    <asp:BoundField DataField="Late_Fee" HeaderText="Late Fee" SortExpression="Late_Fee" />
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
