<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemsShipped.aspx.cs" Inherits="ClothingDBMS.SalesManagement.ItemsShipped" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
*{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}</style>
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
                <asp:SqlDataSource ID="SqlContains" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT QUOTES.QUOTES_ID, QUOTES.Product_ID, QUOTES.Quotation_Number, Product.Price, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name, QUOTES.SOquantity * Product.Price AS TotalPrice, QUOTES.SOquantity, QUOTES.QOquantity FROM QUOTES INNER JOIN Product ON QUOTES.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section WHERE (QUOTES.Quotation_Number = @Quotation_Number) ORDER BY QUOTES.QUOTES_ID" DeleteCommand="DELETE FROM [QUOTES] WHERE [QUOTES_ID] = @QUOTES_ID" InsertCommand="INSERT INTO QUOTES(QOquantity, Product_ID, Quotation_Number, SOquantity) VALUES (@QOquantity, @Product_ID, @Quotation_Number, @SOquantity)" UpdateCommand="UPDATE [QUOTES] SET [SOquantity] = @SOquantity WHERE [QUOTES_ID] = @QUOTES_ID" >
                    <DeleteParameters>
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="QOquantity" Type="String" />
                        <asp:Parameter Name="Product_ID" Type="Int16" />
                        <asp:Parameter Name="Quotation_Number" Type="Int32" />
                        <asp:Parameter Name="SOquantity" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Quotation_Number" SessionField="Quotation_number" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SOquantity" />
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </UpdateParameters>
          </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [QUOTES]" DeleteCommand="DELETE FROM [QUOTES] WHERE [Quotation_Number] = @Quotation_Number" InsertCommand="INSERT INTO [QUOTES] ([QUOTES_ID], [QOquantity], [Product_Id], [Quotation_Number]) VALUES (@QUOTES_ID, @QOquantity, @Product_Id, @Quotation_Number)" UpdateCommand="UPDATE [QUOTATION] SET [Quotation_Date] = @Quotation_Date, [Customer_Id] = @Customer_Id, [Product_Id] = @Product_Id, [Quantity] = @Quantity WHERE [Quotation_Number] = @Quotation_Number">
         
        </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>

        <div style="margin-top:100px;"  align="center">
        <br/>
    <asp:Label ID="lblQuotation" runat="server" Text="Shipment Management" Font-Bold="True"></asp:Label>  <br /> <br />
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server">
            &nbsp;<br />
        <asp:GridView ID="GridViewQuotation" runat="server" AutoGenerateColumns="False" DataKeyNames="QUOTES_ID" DataSourceID="SqlContains" AllowSorting="True" OnRowDataBound="girdview_OnRowDataBound">
            <Columns>
                <asp:BoundField DataField="QUOTES_ID" HeaderText="QUOTES_ID" ReadOnly="True" SortExpression="QUOTES_ID" InsertVisible="False" />
                <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" ReadOnly="True" SortExpression="Product_ID" />
                <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation_Number" ReadOnly="True" SortExpression="Quotation_Number" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="SOquantity" HeaderText="SOquantity" SortExpression="SOquantity" />
                <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" SortExpression="Price" />
                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" ReadOnly="True" />
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
            
            <asp:Label ID="lblAmount" Text="Quotation Total:" runat="server" ></asp:Label>
            <asp:Label ID="lblTotalAmount" Text="Quotation Total" runat="server" ></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </asp:Panel>
            
    
    
       </div>
   </form>
</body>
</html>