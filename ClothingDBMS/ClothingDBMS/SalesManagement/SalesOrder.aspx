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
            
            <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
       
        <asp:SqlDataSource ID="SqlDataSourceSalesOrder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [SALES_ORDER]" DeleteCommand="DELETE FROM [SALES_ORDER] WHERE [Sorder_Number] = @Sorder_Number" InsertCommand="INSERT INTO [SALES_ORDER] ([Sorder_Date], [Quotation_Number], [Late_Fee], [Due_Date]) VALUES (@Sorder_Date, @Quotation_Number, @Late_Fee, @Due_Date)" UpdateCommand="UPDATE [SALES_ORDER] SET [Sorder_Date] = @Sorder_Date, [Quotation_Number] = @Quotation_Number, [Late_Fee] = @Late_Fee, [Due_Date] = @Due_Date WHERE [Sorder_Number] = @Sorder_Number">
            <DeleteParameters>
                <asp:Parameter Name="Sorder_Number" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Sorder_Date" Type="String" />
                <asp:Parameter Name="Quotation_Number" Type="Int32" />
                <asp:Parameter Name="Late_Fee" Type="Int32" />
                <asp:Parameter Name="Due_Date" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Sorder_Date" Type="String" />
                <asp:Parameter Name="Quotation_Number" Type="Int32" />
                <asp:Parameter Name="Late_Fee" Type="Int32" />
                <asp:Parameter Name="Due_Date" Type="String" />
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


              <br />
                    <br />

              <br />
             <br />
             <br />
             <br />

              <asp:Label ID="lblSODate" Width="200" Text="Sales Order Date: " runat="server" />
                    <asp:TextBox ID="txtSODate" runat="server" ReadOnly="false" Width="230"></asp:TextBox>
             &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calingSODate_Click" Width="25px" />
             <asp:Panel ID="calpanel1" runat="server" Visible="false">
                 <asp:Calendar ID="calSODate" runat="server" OnSelectionChanged="calSODate_SelectionChanged"></asp:Calendar>
                 <br />
             </asp:Panel>
             <br />
                    <br />
             <asp:Label ID="lbLateFee" runat="server" Text="Late Fee ($): " Width="200" />
             <asp:TextBox ID="LateFee" runat="server" style="margin-top: 0px"></asp:TextBox>
             <br />
                    <asp:RequiredFieldValidator ID="rfvSalesOrder" ValidationGroup="addSalesOrderValidation" runat="server" ControlToValidate="LateFee" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br />
 
                    <asp:RegularExpressionValidator ID="revAllocatesTime" runat="server" ControlToValidate="LateFee" ErrorMessage=" (*) eg:200, " ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="addSalesOrderValidation"></asp:RegularExpressionValidator>
 
                    <br /> <br />             

                 <br />
             <br />
             <br/>
             <asp:Label ID="lblDueDate" runat="server" Text="Due Date: " Width="200"></asp:Label>
             <asp:TextBox ID="txtSODueDate" runat="server" ReadOnly="false" Width="230"></asp:TextBox>
             &nbsp;<asp:ImageButton ID="calingSODueDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calingSODueDate_Click" Width="25px" />
             <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calDueDate" runat="server" OnSelectionChanged="calSODueDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
            <br /> <br /> 

             <asp:Button ID="btnSave" runat="server" CssClass="bg-primary" OnClick="btnSave_Click" Text="Save" ValidationGroup="addQuotationValidation" />
             <asp:Button ID="btnCancel" runat="server" CssClass="bg-primary" OnClick="btnCancel_Click" Text="Cancel" />
             <br />
          
         </asp:Panel> 
        <asp:Panel ID="panelSaveSalesOrder" Visible="true" runat="server" >
            <asp:Button ID="btnAdd" runat="server" CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="GridViewSalesOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="Sorder_Number" DataSourceID="SqlDataSourceSalesOrder" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <Columns>
                    
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    
                    <asp:BoundField DataField="Sorder_Number" HeaderText="Sorder_Number" InsertVisible="False" ReadOnly="True" SortExpression="Sorder_Number" />
                    <asp:BoundField DataField="Sorder_Date" HeaderText="Sorder_Date" SortExpression="Sorder_Date" />

                    <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation_Number" SortExpression="Quotation_Number" />

                    <asp:BoundField DataField="Late_Fee" HeaderText="Late_Fee" SortExpression="Late_Fee" />
                    <asp:BoundField DataField="Due_Date" HeaderText="Due_Date" SortExpression="Due_Date" />
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
