<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesOrder.aspx.cs" Inherits="SalesManagement.Sales.SalesOrder" %>

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

        <asp:SqlDataSource ID="SqlDataSourceSalesOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [SALES_ORDER]" DeleteCommand="DELETE FROM [SALES_ORDER] WHERE [Sorder_Number] = @Sorder_Number" InsertCommand="INSERT INTO [SALES_ORDER] ([Sorder_Date], [Quotation_Number], [Quantity], [Product_Id], [Design_Id], [Late_Fee], [Due_Date]) VALUES (@Sorder_Date, @Quotation_Number, @Quantity, @Product_Id, @Design_Id, @Late_Fee, @Due_Date)" UpdateCommand="UPDATE [SALES_ORDER] SET [Sorder_Date] = @Sorder_Date, [Quotation_Number] = @Quotation_Number, [Quantity] = @Quantity, [Product_Id] = @Product_Id, [Design_Id] = @Design_Id, [Late_Fee] = @Late_Fee, [Due_Date] = @Due_Date WHERE [Sorder_Number] = @Sorder_Number">
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
        <div align="center">
        <br/>
        <asp:Label ID="lblSalesOrder" runat="server" Text="Sales Order Management" Font-Bold="true"></asp:Label>
    

        <asp:Panel ID="panelAddSalesOrder" Visible="false" runat="server" Height="134px"> 
              <asp:Label ID="lblQuotationNumber" Width="200" Text="Quotation Number: " runat="server" />
                    <asp:DropDownList ID="dropQuotationNumber" runat="server" DataSourceID="SqlDataSourceQuotation" DataTextField="Quotation_Number" DataValueField="Quotation_Number"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvQuotationNumber" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropQuotationNumber" ErrorMessage="(*) One Quotation Number should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                     <asp:Label ID="lblProductId" Width="200" Text="Product ID: " runat="server" />
                    <asp:DropDownList ID="dropProductId" runat="server" DataSourceID="SqlDataSource" DataTextField="Product_Id" DataValueField="Product_Id"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvProductId" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropProductId" ErrorMessage="(*) One Product ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
              <asp:Label ID="DesignId" Width="200" Text="Design ID: " runat="server" />
                    <asp:DropDownList ID="dropDesignId" runat="server" DataSourceID="SqlDataSource" DataTextField="Design_Id" DataValueField="Design_Id"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvDesignId" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropDesignId" ErrorMessage="(*) One Design ID should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
 
                    <br /> <br />             
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /> 
            <br/>
            Late Fee: <asp:TextBox ID="Late_Fee" runat="server" style="margin-top: 0px"></asp:TextBox>
            Due Date: <asp:TextBox ID="Due_Date" runat="server" style="margin-top: 0px"></asp:TextBox>
            <br/>
         </asp:Panel> 
        <asp:Panel ID="panelSaveSalesOrder" Visible="true" runat="server" Height="51px">
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:GridView ID="GridViewSalesOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="Sorder_Number" DataSourceID="SqlDataSourceSalesOrder" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Sorder_Number" HeaderText="Sorder_Number" InsertVisible="False" ReadOnly="True" SortExpression="Sorder_Number" />
                    <asp:BoundField DataField="Sorder_Date" HeaderText="Sorder_Date" SortExpression="Sorder_Date" />
                    <asp:BoundField DataField="Quotation_Number" HeaderText="Quotation_Number" SortExpression="Quotation_Number" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Product_Id" HeaderText="Product_Id" SortExpression="Product_Id" />
                    <asp:BoundField DataField="Design_Id" HeaderText="Design_Id" SortExpression="Design_Id" />
                    <asp:BoundField DataField="Late_Fee" HeaderText="Late_Fee" SortExpression="Late_Fee" />
                    <asp:BoundField DataField="Due_Date" HeaderText="Due_Date" SortExpression="Due_Date" />
                </Columns>
        </asp:GridView>
      </asp:Panel>
                </div>
    </form>
</body>
</html>
