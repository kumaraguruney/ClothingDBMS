<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="SalesManagement.Sales.Payment1" %>

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
        <asp:Label ID="lblPayment" runat="server" Text="Payment Management" Font-Bold="true"></asp:Label>
         <asp:SqlDataSource ID="SqlDataSourcePayment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PAYMENT]" DeleteCommand="DELETE FROM [PAYMENT] WHERE [Payment_Id] = @Payment_Id" InsertCommand="INSERT INTO [PAYMENT] ([Paymeny_Date], [Acct_Id], [Status_Info]) VALUES (@Paymeny_Date, @Acct_Id, @Status_Info)" UpdateCommand="UPDATE [PAYMENT] SET [Paymeny_Date] = @Paymeny_Date, [Acct_Id] = @Acct_Id, [Status_Info] = @Status_Info WHERE [Payment_Id] = @Payment_Id">
             <DeleteParameters>
                 <asp:Parameter Name="Payment_Id" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Paymeny_Date" Type="DateTime" />
                 <asp:Parameter Name="Acct_Id" Type="Int16" />
                 <asp:Parameter Name="Status_Info" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Paymeny_Date" Type="DateTime" />
                 <asp:Parameter Name="Acct_Id" Type="Int16" />
                 <asp:Parameter Name="Status_Info" Type="String" />
                 <asp:Parameter Name="Payment_Id" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
    
        <asp:Panel ID="panelAddPayment" Visible="false" runat="server">
                    <asp:Label ID="lblAcctId" Width="200" Text="Account ID: " runat="server" />
                    <asp:DropDownList ID="dropAcctId" runat="server" DataSourceID="SqlDataSource" DataTextField="Acct_Id" DataValueField="Acct_Id"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvAcctId" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropAcctId" ErrorMessage="(*) One Account ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
            
                    <br /> <br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /> 
            <br/>     
         Account ID: <asp:TextBox ID="Acct_Id" runat="server" style="margin-top: 0px"></asp:TextBox>
         Status Info: <asp:TextBox ID="Status_Info" runat="server" style="margin-top: 0px"></asp:TextBox>          
        </asp:Panel>
    
    </div>
        <asp:Panel ID="panelSavePayment" Visible="true" runat="server">
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="GridViewPayment" runat="server" AutoGenerateColumns="False" DataKeyNames="Payment_Id" DataSourceID="SqlDataSourcePayment" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Payment_Id" HeaderText="Payment_Id" ReadOnly="True" SortExpression="Payment_Id" InsertVisible="False" />
                <asp:BoundField DataField="Paymeny_Date" HeaderText="Paymeny_Date" SortExpression="Paymeny_Date" />
                <asp:BoundField DataField="Acct_Id" HeaderText="Acct_Id" SortExpression="Acct_Id" />
                <asp:BoundField DataField="Status_Info" HeaderText="Status_Info" SortExpression="Status_Info" />
            </Columns>
        </asp:GridView>
            </asp:Panel>
       
    </form>
</body>
</html>
