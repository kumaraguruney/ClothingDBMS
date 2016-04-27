<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Sales.Sales.Customer" %>

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
        <asp:Label ID="lblCustomer" runat="server" Text="Customer Management" Font-Bold="true"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSourceCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [CUSTOMER]">
        </asp:SqlDataSource>
        
        <asp:Panel ID="panelAddCustomer" Visible="false" runat="server" Height="266px">
        
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /> 
            <br/>
            <asp:Label ID="lbCusttomerName" Width="150" Text="Customer Name: " runat="server" />
            <asp:TextBox ID="Customer_Name" runat="server" style="margin-top: 0px"></asp:TextBox><br />
            <asp:Label ID="lbAddress" Width="150" Text="Address: " runat="server" />
            <asp:TextBox ID="Address" runat="server" style="margin-top: 0px"></asp:TextBox><br />
            <asp:Label ID="lbCity" Width="150" Text="City: " runat="server" />
            <asp:TextBox ID="City" runat="server" style="margin-top: 0px"></asp:TextBox><br />
            <asp:Label ID="lbState" Width="150" Text="State: " runat="server" />
            <asp:TextBox ID="State" runat="server" style="margin-top: 0px"></asp:TextBox><br />
            <asp:Label ID="lbZipcode" Width="150" Text="Zip Code: " runat="server" />
            <asp:TextBox ID="Zipcode" runat="server" style="margin-top: 0px"></asp:TextBox><br />
            <asp:Label ID="lbEmail" Width="150" Text="Email Id: " runat="server" />
            <asp:TextBox ID="Email" runat="server" style="margin-top: 0px"></asp:TextBox><br />
            <asp:Label ID="lbEmployeeName" Width="150" Text="Phone No: " runat="server" />
            <asp:TextBox ID="Phone" runat="server" style="margin-top: 0px"></asp:TextBox><br />
            <asp:Label ID="Label1" Width="150" Text="Fax: " runat="server" />
            <asp:TextBox ID="Fax" runat="server" style="margin-top: 0px"></asp:TextBox><br />
        </asp:Panel>
        <asp:Panel ID="panelSaveCustomer" Visible="true" runat="server" Height="51px">
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="CustomerGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Customer_Id" DataSourceID="SqlDataSourceCustomer" Height="219px" style="margin-top: 57px" Width="712px" AllowSorting="True">
            <Columns>
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
        </asp:GridView>
        </asp:Panel>
    
   
    </div>
        
    </form>
</body>
</html>
