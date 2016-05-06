<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="SalesManagement.Sales.Payment1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Information</title>
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
        <asp:SqlDataSource ID="SqlDataSourceInvoice" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [INVOICE]"></asp:SqlDataSource>
       
         <asp:SqlDataSource ID="SqlDataSourcePayment" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [PAYMENT]" DeleteCommand="DELETE FROM [PAYMENT] WHERE [Payment_Id] = @Payment_Id" InsertCommand="INSERT INTO [PAYMENT] ([Payment_Date], [Acct_Id], [Status_Info], [Invoice_Number]) VALUES (@Payment_Date, @Acct_Id, @Status_Info, @Invoice_Number)" UpdateCommand="UPDATE [PAYMENT] SET [Payment_Date] = @Payment_Date, [Acct_Id] = @Acct_Id, [Status_Info] = @Status_Info, [Invoice_Number] = @Invoice_Number WHERE [Payment_Id] = @Payment_Id">
             <DeleteParameters>
                 <asp:Parameter Name="Payment_Id" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Payment_Date" Type="String" />
                 <asp:Parameter Name="Acct_Id" Type="Int32" />
                 <asp:Parameter Name="Status_Info" Type="String" />
                 <asp:Parameter Name="Invoice_Number" Type="Int32" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Payment_Date" Type="String" />
                 <asp:Parameter Name="Acct_Id" Type="Int32" />
                 <asp:Parameter Name="Status_Info" Type="String" />
                 <asp:Parameter Name="Invoice_Number" Type="Int32" />
                 <asp:Parameter Name="Payment_Id" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
        <div style="margin-top:100px;" align="center">
        <br/>
        <asp:Label ID="lblPayment" runat="server" Text="Payment Management" Font-Bold="true"></asp:Label>  <br /> <br />
            <asp:Panel ID="panelSavePayment" Visible="true" runat="server">
            <asp:Button ID="btnAdd" CssClass="bg-primary" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="GridViewPayment" runat="server" AutoGenerateColumns="False" DataKeyNames="Payment_Id" DataSourceID="SqlDataSourcePayment" AllowSorting="True"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <Columns>
              
                <asp:BoundField DataField="Payment_Id" HeaderText="Payment Id" ReadOnly="True" SortExpression="Payment_Id" InsertVisible="False" />

                <asp:BoundField DataField="Payment_Date" HeaderText="Payment Date" SortExpression="Payment_Date" />

                <asp:BoundField DataField="Acct_Id" HeaderText="Account Number" SortExpression="Acct_Id" />

                <asp:BoundField DataField="Status_Info" HeaderText="Status Info" SortExpression="Status_Info" />
                 
                               <asp:TemplateField HeaderText="Invoice Number" SortExpression="Invoice_Number">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropInvoiceId" runat="server" DataSourceID="SqlDataSourceInvoice" DataTextField="Invoice_Number" DataValueField="Invoice_Number" SelectedValue='<%# Bind("Invoice_Number") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblInvoiceNumber" runat="server" Text='<%# Bind("Invoice_Number") %>'></asp:Label>
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

    
        <asp:Panel ID="panelAddPayment" Visible="false" runat="server">
            <br /> <br />
                <asp:Label ID="LblInvoice" Width="200" Text="Invoice Number: " runat="server" />
                    <asp:DropDownList ID="DropDownInvoice" runat="server" DataSourceID="SqlDataSourceInvoice" DataTextField="Invoice_Number" DataValueField="Invoice_Number">
                        <asp:ListItem Text="-- Invoice Number --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvInvoiceNum" ValidationGroup="addPaymentValidation" runat="server" ControlToValidate="DropDownInvoice" ErrorMessage="(*) One Invoice Number should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    
            <br /> <br />
                    <asp:Label ID="lblAcctId" Width="200" Text="Account ID: " runat="server" />
       
                    <asp:TextBox ID="Acct_Id" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvAllocatesTime" ValidationGroup="addPaymentValidation" runat="server" ControlToValidate="Acct_Id" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addPaymentValidation" ID="revAllocatesTime" runat="server" ControlToValidate="Acct_Id"
                                 ErrorMessage=" (*) eg:0123456, " ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
					<br /> <br />

          
            <br /> <br />
             <asp:Label ID="lblStatusInfo" Width="200" Text="Payment Status: " runat="server" />
                    <asp:DropDownList ID="PaymentStatus" runat="server" AutoPostBack="True" AppendDataBoundItems ="True">
                         <asp:ListItem Text="-- Payment Status --" Value="-1"></asp:ListItem>
                         <asp:ListItem Text="Paid" Value="Paid"></asp:ListItem>
                        <asp:ListItem Text="UnPaid" Value="UnPaid"></asp:ListItem>
                        <asp:ListItem Text="Partially Paid" Value="Partially Paid"></asp:ListItem>
                        <asp:ListItem Text="Defaulted" Value="Defaulted"></asp:ListItem>
                    </asp:DropDownList>
            <br /> <br />
             <asp:Label ID="lblPaymentDate" Width="200" Text="Payment Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtPayment" ReadOnly="false" Width="230" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton ID="calingPayment" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calingPayment_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calPayment" runat="server" OnSelectionChanged="calPayment_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
        <asp:Button ID="btnSave" CssClass="bg-primary" ValidationGroup="addPaymentValidation" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" CssClass="bg-primary" runat="server" Text="Cancel" OnClick="btnCancel_Click" /> 
            <br/>     
                                
       </asp:Panel>
    


          </div> 
    </form>
</body>
</html>
