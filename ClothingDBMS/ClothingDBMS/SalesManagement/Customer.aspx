<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="SalesManagement.Sales.Customer" %>

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
          
        <asp:Panel ID="panelAddCustomer" Visible="false" runat="server" Height="266px">
        <asp:Label ID="lblCustomer" runat="server" Text="Customer Management" Font-Bold="true"></asp:Label>
            <br/>
            <asp:Label ID="lbCustomerName" Width="200" Text="Customer Name: " runat="server" />
            <asp:TextBox ID="Customer_Name" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvAllocatesTime" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="Customer_Name" ErrorMessage="(*) Enter Alphabetic Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addAllocatesValidation" ID="revAllocatesTime" runat="server" ControlToValidate="Customer_Name"
                                 ErrorMessage=" (*) eg:First Name and Last Name: Naveen Kumar Duddala, " ForeColor="Red" ValidationExpression="^[a-zA-Z\s]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbAddress" Width="200" Text="Address: " runat="server" />
            <asp:TextBox ID="Address" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="Customer_Name" ErrorMessage="(*) Enter Numeric, Non-Numeric and Comma Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addAllocatesValidation" ID="RegularExpressionValidator1" runat="server" ControlToValidate="Address"
                                 ErrorMessage=" (*) eg:7550 Country Club Drive, Apt 4108 " ForeColor="Red" ValidationExpression="^[a-zA-Z\s\d,]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbCity" Width="200" Text="City: " runat="server" />
            <asp:TextBox ID="City" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="Customer_Name" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addAllocatesValidation" ID="RegularExpressionValidator2" runat="server" ControlToValidate="City"
                                 ErrorMessage=" (*) eg:7550 Country Club Drive, Apt 4108 " ForeColor="Red" ValidationExpression="^[a-zA-Z]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbState" Width="200" Text="State: " runat="server" />
            <asp:TextBox ID="State" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="Customer_Name" ErrorMessage="(*) Enter Alphabetic Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addAllocatesValidation" ID="RegularExpressionValidator3" runat="server" ControlToValidate="State"
                                 ErrorMessage=" (*) eg:Laredo " ForeColor="Red" ValidationExpression="^[a-zA-Z]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbZipcode" Width="200" Text="Zip Code: " runat="server" />
            <asp:TextBox ID="Zipcode" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="Customer_Name" ErrorMessage="(*) Enter Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addAllocatesValidation" ID="RegularExpressionValidator4" runat="server" ControlToValidate="Zipcode"
                                 ErrorMessage=" (*) eg:Laredo " ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbEmail" Width="200" Text="Email Id: " runat="server" />
            <asp:TextBox ID="Email" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="Customer_Name" ErrorMessage="(*) Enter Alphabetic, Numeric and Non-Numeric Characters Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addAllocatesValidation" ID="RegularExpressionValidator5" runat="server" ControlToValidate="Email"
                                 ErrorMessage=" (*) eg:dnk484@gmail.com " ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbPhoneNumber" Width="150" Text="Phone No: " runat="server" />
            <asp:TextBox ID="Phone" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="Customer_Name" ErrorMessage="(*) Enter digits Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addAllocatesValidation" ID="RegularExpressionValidator6" runat="server" ControlToValidate="Phone"
                                 ErrorMessage=" (*) eg:9562291635 " ForeColor="Red" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Label ID="lbFax" Width="150" Text="Fax: " runat="server" />
            <asp:TextBox ID="Fax" runat="server" style="margin-top: 0px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="Customer_Name" ErrorMessage="(*) Enter digits Only" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addAllocatesValidation" ID="RegularExpressionValidator7" runat="server" ControlToValidate="Fax"
                                 ErrorMessage=" (*) eg:9562291635 " ForeColor="Red" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
					<br /> <br />

            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /> 
        </asp:Panel>
        <asp:Panel ID="panelSaveCustomer" Visible="true" runat="server" Height="51px">
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="CustomerGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Customer_Id" DataSourceID="SqlDataSourceCustomer" Height="219px" style="margin-top: 57px" Width="712px" AllowSorting="True">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Customer_Id" HeaderText="Customer_Id" ReadOnly="True" SortExpression="Customer_Id" InsertVisible="False" />
                <asp:BoundField DataField="Customer_Name" HeaderText="Customer_Name" SortExpression="Customer_Name" />
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
    
   
    </div>
        
    </form>
</body>
</html>
