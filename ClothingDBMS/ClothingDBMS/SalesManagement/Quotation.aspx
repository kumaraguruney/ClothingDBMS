<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quotation.aspx.cs" Inherits="SalesManagement.Sales.Quotation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
                <nav>
    <div class="nav-wrapper">
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../Index.aspx">Home</a></li>
        <li><a href="Default.aspx">Sales Managment - Home</a></li>
        <li><a href="Customer.aspx">Customer Management</a></li>
          <li><a href="Invoice.aspx">Invoice Management</a></li>
          <li><a href="Payment.aspx">Payment Management</a></li>
          <li><a href="Quotation.aspx">Quotation Management</a></li>
          <li><a href="SalesOrder.aspx">Sales Order Management</a></li>
          <li><a href="Shipment.aspx">Shipment Management</a></li>
       </ul>
    </div>
  </nav>
        <div align="center">
        <br/>
        <asp:Label ID="lblQuotation" runat="server" Text="Quotation Management" Font-Bold="true"></asp:Label>
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
    <asp:Panel ID="panelAddQuotation" Visible="false" runat="server" Height="134px">
            Quantity: <asp:TextBox ID="Quantity" runat="server" style="margin-top: 0px"></asp:TextBox> 
                    <asp:Label ID="lblProductId" Width="200" Text="Product ID: " runat="server" />
                    <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlDataSource" DataTextField="Product_Id" DataValueField="Product_Id"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvProductId" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropProductId" ErrorMessage="(*) One Product ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                     <asp:Label ID="lblCustomerId" Width="200" Text="Customer ID: " runat="server" />
                    <asp:DropDownList ID="dropCustomerId" runat="server" DataSourceID="SqlDataSourceCustomer" DataTextField="Customer_Id" DataValueField="Customer_Id"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvCustomerId" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropCustomerId" ErrorMessage="(*) One Customer ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
 
                    <br /> <br /> 
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /> 
         <br/>
     </asp:Panel>
        <asp:Panel ID="panelSaveQuotation" Visible="true" runat="server" Height="51px">
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
        <asp:GridView ID="GridViewQuotation" runat="server" AutoGenerateColumns="False" DataKeyNames="Quotation_Number" DataSourceID="SqlDataSourceQuotation" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation_Number" ReadOnly="True" SortExpression="Quotation_Number" InsertVisible="False" />
                <asp:BoundField DataField="Quotation_Date" HeaderText="Quotation_Date" SortExpression="Quotation_Date" />
                <asp:BoundField DataField="Customer_Id" HeaderText="Customer_Id" SortExpression="Customer_Id" />
                <asp:BoundField DataField="Product_Id" HeaderText="Product_Id" SortExpression="Product_Id" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            </Columns>
        </asp:GridView>
        </asp:Panel>
       </div>
   </form>
</body>
</html>
