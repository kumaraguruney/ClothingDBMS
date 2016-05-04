<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Purchase_Order.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.WebForm1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purchase_Order Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <nav>
    <div class="nav-wrapper">
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../Index.aspx">Home</a></li>
        <li><a href="Default.aspx">Production Management - Home</a></li>
        <li><a href="Allocates.aspx">Allocates Management</a></li>
          <li><a href="Employee.aspx">Employee Management</a></li>
          <li><a href="Includes.aspx">Includes Management</a></li>
          <li><a href="Machinery.aspx">Machinery Management</a></li>
          <li><a href="Product.aspx">Product Management</a></li>
          <li><a href="ProductDesign.aspx">Product Design Management</a></li>
          <li><a href="Rawmaterial.aspx">Rawmaterial Management</a></li>
          <li><a href="Require.aspx">Require Management</a></li>
          <li><a href="Workorder.aspx">WorkOrder Management</a></li>
          <li><a href="WorkSchedule.aspx">WorkSchedule Management</a></li>
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlPurchase_Order" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [purchase_order] ORDER BY [purchase_order_id]" DeleteCommand="DELETE FROM [purchase_order] WHERE [purchase_order_id] = @purchase_order_id" InsertCommand="INSERT INTO [purchase_order] ([Purchase_date], [supplier_name], [supplier_description], [supplier_id], [RawMaterial_description], [quantity], [unit_price], [total], [shipping_address]) VALUES (@Purchase_date, @supplier_name, @supplier_description, @supplier_id, @RawMaterial_description, @quantity, @unit_price, @total, @shipping_address)" UpdateCommand="UPDATE [purchase_order] SET [Purchase_date] = @Purchase_date, [supplier_name] = @supplier_name, [supplier_description] = @supplier_description, [supplier_id] = @supplier_id, [RawMaterial_description] = @RawMaterial_description, [quantity] = @quantity, [unit_price] = @unit_price, [total] = @total, [shipping_address] = @shipping_address WHERE [purchase_order_id] = @purchase_order_id">
            <DeleteParameters>
                <asp:Parameter Name="purchase_order_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Purchase_date" DbType="Date" />
                <asp:Parameter Name="supplier_name" Type="String" />
                <asp:Parameter Name="supplier_description" Type="String" />
                <asp:Parameter Name="supplier_id" Type="Int16" />
                <asp:Parameter Name="RawMaterial_description" Type="String" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="unit_price" Type="Decimal" />
                <asp:Parameter Name="total" Type="Decimal" />
                <asp:Parameter Name="shipping_address" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Purchase_date" DbType="Date" />
                <asp:Parameter Name="supplier_name" Type="String" />
                <asp:Parameter Name="supplier_description" Type="String" />
                <asp:Parameter Name="supplier_id" Type="Int16" />
                <asp:Parameter Name="RawMaterial_description" Type="String" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="unit_price" Type="Decimal" />
                <asp:Parameter Name="total" Type="Decimal" />
                <asp:Parameter Name="shipping_address" Type="String" />
                <asp:Parameter Name="purchase_order_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbPurchase_OrderHeader" runat="server" Text="Purchase_Order Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddPurchase_Order" runat="server" Text="Add" OnClick="btnaddPurchase_Order_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvPurchase_Order" runat="server">
                    <asp:GridView ID="gvPurchase_Order" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlPurchase_Order" AutoGenerateColumns="False" DataKeyNames="purchase_order_id">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="purchase_order_id" HeaderText="purchase_order_id" ReadOnly="True" SortExpression="purchase_order_id" InsertVisible="False" />
                            <asp:BoundField DataField="Purchase_date" HeaderText="Purchase_date" SortExpression="Purchase_date" />
                             <asp:BoundField DataField="supplier_name" HeaderText="supplier_name" SortExpression="supplier_name" />
                            <asp:BoundField DataField="supplier_description" HeaderText="supplier_description" SortExpression="supplier_description" />
                            <asp:BoundField DataField="supplier_id" HeaderText="supplier_id" SortExpression="supplier_id" />
                            <asp:BoundField DataField="RawMaterial_description" HeaderText="RawMaterial_description" SortExpression="RawMaterial_description" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                            <asp:BoundField DataField="unit_price" HeaderText="unit_price" SortExpression="unit_price" />
                            <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
                            <asp:BoundField DataField="shipping_address" HeaderText="shipping_address" SortExpression="shipping_address" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdPurchase_Order" Visible="false" runat="server">
                <asp:Label ID="lbPurchase_OrderaddTitle" Text="Add Purchase_Order into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbPurchase_OrderName" Width="150px" Text="Purchase_Date: " runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtPurchase_Date" runat="server" ValidationGroup="addPurchase_OrderValidation"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblPurchase_OrderAddress" runat="server" Text="Quantity: " Width="150px"></asp:Label>
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSavePurchase_Order" runat="server" Text="Save" OnClick="btnSavePurchase_Order_Click" ValidationGroup="addPurchase_OrderValidation"/>
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCancelPurchase_Order" runat="server" OnClick="btnCancelPurchase_Order_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
