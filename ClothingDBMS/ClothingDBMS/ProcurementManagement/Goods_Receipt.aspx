<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Goods_Receipt.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Goods_Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Goods Receipt</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [goods_receipt]"></asp:SqlDataSource>
    

    <div align="center">
        <asp:Label ID="lblGoodsReceipt" runat="server" Text="Goods Receipt Details"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnAddGoodsReceipt" runat="server" Text="Add" OnClick="btnAddGoodsReceipt_Click" />
        <br />
        <br />
        <asp:Panel ID="pnlGoodsReceipt" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="receipt_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="receipt_id" HeaderText="receipt_id" InsertVisible="False" ReadOnly="True" SortExpression="receipt_id" />
                    <asp:BoundField DataField="purchase_order_id" HeaderText="purchase_order_id" SortExpression="purchase_order_id" />
                    <asp:BoundField DataField="receipt_date" HeaderText="receipt_date" SortExpression="receipt_date" />
                    <asp:BoundField DataField="supplier_name" HeaderText="supplier_name" SortExpression="supplier_name" />
                    <asp:BoundField DataField="delivery_location" HeaderText="delivery_location" SortExpression="delivery_location" />
                    <asp:BoundField DataField="item_code" HeaderText="item_code" SortExpression="item_code" />
                    <asp:BoundField DataField="delivered_quantity" HeaderText="delivered_quantity" SortExpression="delivered_quantity" />
                    <asp:BoundField DataField="ordered_quantity" HeaderText="ordered_quantity" SortExpression="ordered_quantity" />
                    <asp:BoundField DataField="unit_price" HeaderText="unit_price" SortExpression="unit_price" />
                    <asp:BoundField DataField="total_price" HeaderText="total_price" SortExpression="total_price" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="pnlAddGoodsReceipt" Visible="false" runat="server">
            <asp:Label ID="lblAddGoodsTitle" runat="server" Text="Add a Goods Receipt into the Database"></asp:Label><br />
            <br />
            <asp:Label ID="lblPurchaseOrderID" runat="server" Text="Purchase Order ID"></asp:Label>
            <asp:TextBox ID="txtPurchaseOrderID" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblReceiptDate" runat="server" Text="Receipt Date:"></asp:Label>
            <asp:TextBox ID="txtReceiptDate" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblSupplierName" runat="server" Text="Supplier Name:"></asp:Label>
            <asp:TextBox ID="txtSupplierName" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblDeliverLocation" runat="server" Text="Delivery Location:"></asp:Label>
            <asp:TextBox ID="txtDeliveryLocation" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblItemCode" runat="server" Text="Item Code:"></asp:Label>
            <asp:TextBox ID="txtItemCode" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblDeliveredQty" runat="server" Text="Delivered Quantity:"></asp:Label>
            <asp:TextBox ID="txtDeliveredQty" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblOrderedQty" runat="server" Text="Ordered Quantity:"></asp:Label>
            <asp:TextBox ID="txtOrderedQty" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price:"></asp:Label>
            <asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price:"></asp:Label>
            <asp:TextBox ID="txtTotalPrice" runat="server"></asp:TextBox><br />

            <asp:Button ID="btnAddGoodsReceiptDB" runat="server" Text="Add" OnClick="btnAddGoodsReceiptDB_Click" />
            <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" OnClick="btnCancelAdd_Click" />
        </asp:Panel>
    </div>
        </form>
</body>
</html>
