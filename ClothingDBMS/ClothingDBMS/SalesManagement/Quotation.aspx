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
            <asp:SqlDataSource ID="SqlDataSourceQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [QUOTATION] ORDER BY [Quotation_Number]">
        </asp:SqlDataSource>


        <div style="margin-top:100px;"  align="center">
        <br/>
    <asp:Label ID="lblQuotation" runat="server" Text="Quotation Data Management" Font-Bold="true"></asp:Label>  <br /> <br />
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server">
        <asp:Button ID="btnAdd" runat="server"   CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
        <asp:GridView ID="GridViewQuotation" runat="server" AutoGenerateColumns="False" DataKeyNames="Quotation_Number" DataSourceID="SqlDataSourceQuotation" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation_Number" ReadOnly="True" SortExpression="Quotation_Number" InsertVisible="False" />
                <asp:BoundField DataField="Quotation_Date" HeaderText="Quotation_Date" SortExpression="Quotation_Date" />

                <asp:BoundField DataField="Customer_Id" HeaderText="Customer_Id" SortExpression="Customer_Id" />
               <asp:TemplateField HeaderText="Convert to SO" ShowHeader="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkConverttoSO" runat="server" CausesValidation="False"  OnClick="btnConverttoSOQuotation_Click" Text="Convert to SO"></asp:LinkButton>
                                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Open" ShowHeader="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkOpen" runat="server" CausesValidation="False"  OnClick="btnOpenQuotation_Click" Text="Open"></asp:LinkButton>
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
                    <asp:RequiredFieldValidator ID="rfvAllocatesTime" ValidationGroup="addQuotationValidation" runat="server" ControlToValidate="Quantity" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;
              <asp:RegularExpressionValidator ID="revAllocatesTime" runat="server" ControlToValidate="Quantity" ErrorMessage=" (*) eg:200, " ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="addQuotationValidation"></asp:RegularExpressionValidator>
              <br/>
              <asp:Label ID="lblProductId" runat="server" Text="Product ID: " Width="200" />
              <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlDataSourceProduct" DataTextField="Product_Description" DataValueField="Product_ID">
                  <asp:ListItem Text="-- Product ID --" Value="-1"></asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="rfvProductId" runat="server" ControlToValidate="dropProductId" ErrorMessage="(*) One Product ID should be selected" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              <br />
              <asp:Label ID="lblCustomerId" runat="server" Text="Customer ID: " Width="200" />
              <asp:DropDownList ID="dropCustomerId" runat="server" DataSourceID="SqlDataSourceCustomer" DataTextField="Customer_Id" DataValueField="Customer_Id">
                  <asp:ListItem Text="-- Customer ID --" Value="-1"></asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="rfvCustomerId" runat="server" ControlToValidate="dropCustomerId" ErrorMessage="(*) One Customer ID should be selected" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              <br />
              <br />
              <br />
              <asp:Label ID="lblQuotationDate" runat="server" Text="Quotation Date: " Width="150"></asp:Label>
              <asp:TextBox ID="txtQuotation" runat="server" ReadOnly="false" Width="230"></asp:TextBox>
              &nbsp;<asp:ImageButton ID="calingQuotation" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calingQuotation_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calQuotation" runat="server" OnSelectionChanged="calQuotation_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />

        <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" ValidationGroup="addQuotationValidation" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server"  CssClass="bg-primary" Text="Cancel" OnClick="btnCancel_Click" /> 
         <br/>
     </asp:Panel>

       </div>
   </form>
</body>
</html>
