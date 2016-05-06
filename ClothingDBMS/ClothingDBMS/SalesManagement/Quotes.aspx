<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quotes.aspx.cs" Inherits="ClothingDBMS.SalesManagement.Quotes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                <asp:SqlDataSource ID="SqlQotes" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [QUOTES] ORDER BY [QUOTES_ID]" DeleteCommand="DELETE FROM [QUOTES] WHERE [QUOTES_ID] = @QUOTES_ID" InsertCommand="INSERT INTO [QUOTES] ([QOquantity], [Product_ID], [Quotation_Number]) VALUES (@QOquantity, @Product_ID, @Quotation_Number)" UpdateCommand="UPDATE [QUOTES] SET [QOquantity] = @QOquantity, [Product_ID] = @Product_ID, [Quotation_Number] = @Quotation_Number WHERE [QUOTES_ID] = @QUOTES_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="QOquantity" Type="Int16" />
                        <asp:Parameter Name="Product_ID" Type="Int16" />
                        <asp:Parameter Name="Quotation_Number" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="QOquantity" Type="Int16" />
                        <asp:Parameter Name="Product_ID" Type="Int16" />
                        <asp:Parameter Name="Quotation_Number" Type="Int32" />
                        <asp:Parameter Name="QUOTES_ID" Type="Int32" />
                    </UpdateParameters>
          </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [QUOTES]" DeleteCommand="DELETE FROM [QUOTES] WHERE [Quotation_Number] = @Quotation_Number" InsertCommand="INSERT INTO [QUOTES] ([QUOTES_ID], [QOquantity], [Product_Id], [Quotation_Number]) VALUES (@QUOTES_ID, @QOquantity, @Product_Id, @Quotation_Number)" UpdateCommand="UPDATE [QUOTATION] SET [Quotation_Date] = @Quotation_Date, [Customer_Id] = @Customer_Id, [Product_Id] = @Product_Id, [Quantity] = @Quantity WHERE [Quotation_Number] = @Quotation_Number">
         
        </asp:SqlDataSource>


        <div style="margin-top:100px;"  align="center">
        <br/>
    <asp:Label ID="lblQuotation" runat="server" Text="Quotes Data Management" Font-Bold="True"></asp:Label>  <br /> <br />
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server">
        <asp:Button ID="btnAdd" runat="server"   CssClass="bg-primary" Text="Add" OnClick="btnAdd_Click" />
        <asp:GridView ID="GridViewQuotation" runat="server" AutoGenerateColumns="False" DataKeyNames="QUOTES_ID" DataSourceID="SqlQotes" AllowSorting="True" OnSelectedIndexChanged="GridViewQuotation_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="QUOTES_ID" HeaderText="QUOTES_ID" ReadOnly="True" SortExpression="QUOTES_ID" InsertVisible="False" />
                <asp:BoundField DataField="QOquantity" HeaderText="QOquantity" SortExpression="QOquantity" />

                <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
                <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation_Number" SortExpression="Quotation_Number" />
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
              <asp:Label ID="lblCustomerId" runat="server" Text="Quotation Number:" Width="200px" />
              <asp:DropDownList ID="dropQotationNum" runat="server" DataSourceID="SqlDataSourceCustomer" DataTextField="Customer_Id" DataValueField="Customer_Id">
                  <asp:ListItem Text="-- Customer ID --" Value="-1"></asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="rfvCustomerId" runat="server" ControlToValidate="dropQotationNum" ErrorMessage="(*) One Customer ID should be selected" ForeColor="Red" ValidationGroup="addQuotationValidation"></asp:RequiredFieldValidator>
              <br />
              <br />
              <br />
              &nbsp;<asp:Panel ID="calpanel" runat="server" Visible="false">
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
