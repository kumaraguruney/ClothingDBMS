<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Purchase_Order.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Purchase_Order" %>
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
        <asp:SqlDataSource ID="SqlPurchase_Order" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [purchase_order] ORDER BY [Purchase_Date]" DeleteCommand="DELETE FROM [purchase_order] WHERE [Purchase_Order_ID] = @Purchase_Order_ID" InsertCommand="INSERT INTO [purchase_order] ([Purchase_Date], [Supplier_Name], [Supplier_Description], [Supplier_ID], [RawMaterial_ID], [Quantity], [Unit_Price], [Total], [Shipping_Address]) VALUES (@Purchase_Date, @Supplier_Name, @Supplier_Description, @Supplier_ID, @RawMaterial_ID, @Quantity, @Unit_Price, @Total, @Shipping_Address)" UpdateCommand="UPDATE [purchase_order] SET [Purchase_Date] = @Purchase_Date, [Supplier_Name] = @Supplier_Name, [Supplier_Description] = @Supplier_Description, [Supplier_ID] = @Supplier_ID, [RawMaterial_ID] = @RawMaterial_ID, [Quantity] = @Quantity, [Unit_Price] = @Unit_Price, [Total] = @Total, [Shipping_Address] = @Shipping_Address WHERE [Purchase_Order_ID] = @Purchase_Order_ID">
            <DeleteParameters>
                <asp:Parameter Name="Purchase_Order_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Purchase_Date" DbType="Date" />
                <asp:Parameter Name="Supplier_Name" Type="String" />
                <asp:Parameter Name="Supplier_Description" Type="String" />
                <asp:Parameter Name="Supplier_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Unit_Price" Type="Decimal" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="Shipping_Address" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Purchase_Date" DbType="Date" />
                <asp:Parameter Name="Supplier_Name" Type="String" />
                <asp:Parameter Name="Supplier_Description" Type="String" />
                <asp:Parameter Name="Supplier_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Unit_Price" Type="Decimal" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="Shipping_Address" Type="String" />
                <asp:Parameter Name="Purchase_Order_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbPurchase_OrderHeader" runat="server" Text="Purchase_Order Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddPurchase_Order" runat="server" Text="Add" OnClick="btnaddPurchase_Order_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvPurchase_Order" runat="server">
                    <asp:GridView ID="gvPurchase_Order" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlPurchase_Order" AutoGenerateColumns="False" DataKeyNames="Purchase_Order_ID">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Purchase_Order_ID" HeaderText="Purchase_Order_ID" ReadOnly="True" SortExpression="Purchase_Order_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Purchase_Date" HeaderText="Purchase_Date" SortExpression="Purchase_Date" />
                             <asp:BoundField DataField="Supplier_Name" HeaderText="Supplier_Name" SortExpression="Supplier_Name" />
                            <asp:BoundField DataField="Supplier_Description" HeaderText="Supplier_Description" SortExpression="Supplier_Description" />
                            <asp:BoundField DataField="Supplier_ID" HeaderText="Supplier_ID" SortExpression="Supplier_ID" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" SortExpression="RawMaterial_ID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Unit_Price" HeaderText="Unit_Price" SortExpression="Unit_Price" />
                            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                            <asp:BoundField DataField="Shipping_Address" HeaderText="Shipping_Address" SortExpression="Shipping_Address" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="pnlAddPurchase_Order" Visible="false" runat="server">
                <asp:Label ID="lbPurchase_OrderaddTitle" Text="Add Purchase_Order into Database" runat="server" />
                    <br />
                    <br />
                    <asp:Label ID="lblPurchase_Date" Width="149px" Text="Purchase_Date: " runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtPurchase_Date" runat="server" ValidationGroup="addPurchase_OrderValidation" Width="274px"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblSupplier_Name" runat="server" Text="Supplier Name: " Width="259px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownSupplier_Name" runat="server" Height="28px" Width="300px">
                    </asp:DropDownList>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Label ID="lblSupplier_ID" runat="server" Text="Supplier_ID " Width="149px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownSupplier_ID" runat="server" Height="28px" Width="300px">
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="lblRawMaterial_ID" runat="server" Text="RawMaterial_ID" Width="149px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="DropDownRawMaterial_ID" runat="server" Height="28px" Width="300px">
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity: " Width="150px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtQuantity" runat="server" Height="33px" Width="300px"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblUnit_Price" runat="server" Text="Unit_Price: " Width="150px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtUnit_Price" runat="server" Height="33px" Width="300px"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblTotal" runat="server" Text="Total: " Width="150px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtTotal" runat="server" Height="33px" Width="300px"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblShipping_Address" runat="server" Text="Shipping Address: " Width="237px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtShipping_Address" runat="server" Height="33px" Width="300px"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSavePurchase_Order" runat="server" OnClick="btnSavePurchase_Order_Click" Text="Save" ValidationGroup="addPurchase_OrderValidation" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCancelPurchase_Order" runat="server" OnClick="btnCancelPurchase_Order_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
