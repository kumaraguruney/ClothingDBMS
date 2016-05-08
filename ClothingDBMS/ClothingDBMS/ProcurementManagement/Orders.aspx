<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <nav>
    <div class="nav-wrapper">
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../Index.aspx">Home</a></li>
        <li><a href="Default.aspx">Procurement Management - Home</a></li>
        <li><a href="Supplier.aspx">Supplier</a></li>
          <li><a href="Supplier_Quotation.aspx">Supplier Quotation</a></li>
          
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlOrders" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Orders] ORDER BY [Order_ID]" DeleteCommand="DELETE FROM [Orders] WHERE [Order_ID] = @Order_ID" InsertCommand="INSERT INTO [Orders] ([RawMaterial_ID], [purchase_order_ID], [Quantity], [Unit_Price], [Entry_ID]) VALUES (@RawMaterial_ID, @purchase_order_ID, @Quantity, @Unit_Price, @Entry_ID)" UpdateCommand="UPDATE [Orders] SET [RawMaterial_ID] = @RawMaterial_ID, [purchase_order_ID] = @purchase_order_ID, [Quantity] = @Quantity, [Unit_Price] = @Unit_Price, [Entry_ID] = @Entry_ID WHERE [Order_ID] = @Order_ID">
            <DeleteParameters>
                <asp:Parameter Name="Order_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="purchase_order_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Unit_Price" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="purchase_order_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Unit_Price" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
                <asp:Parameter Name="Order_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
        <asp:SqlDataSource ID="SqlPurchaseOrder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [purchase_order] ORDER BY [purchase_order_id]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_ID]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlStockPile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockPile] ORDER BY [Entry_ID]" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [StockPile] ([Batch_ID], [Warehouse_ID], [Location_ID], [Quantity], [Created_Date], [Is_Product]) VALUES (@Batch_ID, @Warehouse_ID, @Location_ID, @Quantity, @Created_Date, @Is_Product)" UpdateCommand="UPDATE [StockPile] SET [Batch_ID] = @Batch_ID, [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Quantity] = @Quantity, [Created_Date] = @Created_Date, [Is_Product] = @Is_Product WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
                <asp:Parameter Name="Warehouse_ID" Type="Int32" />
                <asp:Parameter Name="Location_ID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Created_Date" Type="String" />
                <asp:Parameter Name="Is_Product" Type="Boolean" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

                <br />
                <asp:Label ID="lbUpdatesHeader" runat="server" Text="Orders Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddOrders" runat="server" Text="Add" OnClick="btnaddOrders_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvOrders" runat="server">
                    
                    <asp:GridView ID="gvOrders" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlOrders" AutoGenerateColumns="False" DataKeyNames="Order_ID">
                        <Columns>
                            <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" SortExpression="Order_ID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" SortExpression="RawMaterial_ID" />
                            <asp:BoundField DataField="purchase_order_ID" HeaderText="purchase_order_ID" SortExpression="purchase_order_ID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Unit_Price" HeaderText="Unit_Price" SortExpression="Unit_Price" />
                            <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" SortExpression="Entry_ID" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdOrders" runat="server" Visible="false">
                        <asp:Label ID="lbUpdatesaddTitle" runat="server" Text="Add Updates into Database" />
                        <br />
                        <asp:Label ID="lblRawMaterial_Name" runat="server" Text="RawMaterial_Name: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="RawMaterial_IDDropDownList" runat="server" Height="29px" Width="151px" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="lblEntry_ID" runat="server" Text="Entry_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="Entry_IDDropDownList" runat="server" DataSourceID="SqlStockPile" DataTextField="Entry_ID" DataValueField="Entry_ID" Height="29px" Width="151px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="lblPurchase_Order_ID" runat="server" Text="Purchase_Order_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="PurchaseOrder_IDDropDownList" runat="server" Height="29px" Width="151px" DataSourceID="SqlPurchaseOrder" DataTextField="Purchase_Order_ID" DataValueField="Purchase_Order_ID">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="rfvPurchaseOrder_ID" runat="server" ControlToValidate="PurchaseOrder_IDDropDownList" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveOrders" runat="server" OnClick="btnSaveOrders_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelOrders" runat="server" OnClick="btnCancelOrders_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
    
    </body>
</html>
