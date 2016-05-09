<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Goods_Receipt.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Goods_Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Goods Receipt</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlGoods_Receipt" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [goods_receipt] ORDER BY [receipt_id]" DeleteCommand="DELETE FROM [goods_receipt] WHERE [receipt_id] = @receipt_id" InsertCommand="INSERT INTO [goods_receipt] ([purchase_order_id], [receipt_date]) VALUES (@purchase_order_id, @receipt_date)" UpdateCommand="UPDATE [goods_receipt] SET [purchase_order_id] = @purchase_order_id, [receipt_date] = @receipt_date WHERE [receipt_id] = @receipt_id">
            <DeleteParameters>
                <asp:Parameter Name="receipt_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="purchase_order_id" Type="Int32" />
                <asp:Parameter Name="receipt_date" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="purchase_order_id" Type="Int32" />
                <asp:Parameter Name="receipt_date" Type="String" />
                <asp:Parameter Name="receipt_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    

        <asp:SqlDataSource ID="SqlPurchase_Order" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [purchase_order] ORDER BY [Purchase_Order_ID]" DeleteCommand="DELETE FROM [purchase_order] WHERE [Purchase_Order_ID] = @Purchase_Order_ID" InsertCommand="INSERT INTO [purchase_order] ([Purchase_Date], [Supplier_ID], [Total], [Shipping_Address]) VALUES (@Purchase_Date, @Supplier_ID, @Total, @Shipping_Address)" UpdateCommand="UPDATE [purchase_order] SET [Purchase_Date] = @Purchase_Date, [Supplier_ID] = @Supplier_ID, [Total] = @Total, [Shipping_Address] = @Shipping_Address WHERE [Purchase_Order_ID] = @Purchase_Order_ID">
            <DeleteParameters>
                <asp:Parameter Name="Purchase_Order_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Purchase_Date" Type="String" />
                <asp:Parameter Name="Supplier_ID" Type="Int16" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="Shipping_Address" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Purchase_Date" Type="String" />
                <asp:Parameter Name="Supplier_ID" Type="Int16" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="Shipping_Address" Type="String" />
                <asp:Parameter Name="Purchase_Order_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    

    <div align="center">
        <asp:Label ID="lblGoodsReceipt" runat="server" Text="Goods Receipt Details"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnAddGoodsReceipt" runat="server" Text="Add" OnClick="btnAddGoodsReceipt_Click" />
        <br />
        <br />
        <asp:Panel ID="pnlGoodsReceipt" runat="server">
            <asp:GridView ID="gvGoods_Receipt" runat="server" AutoGenerateColumns="False" DataSourceID="SqlGoods_Receipt" DataKeyNames="receipt_id">
                <Columns>
                    <asp:BoundField DataField="receipt_id" HeaderText="receipt_id" InsertVisible="False" ReadOnly="True" SortExpression="receipt_id" />
                    <asp:BoundField DataField="purchase_order_id" HeaderText="purchase_order_id" SortExpression="purchase_order_id" />
                    <asp:BoundField DataField="receipt_date" HeaderText="receipt_date" SortExpression="receipt_date" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="pnlAddGoodsReceipt" Visible="false" runat="server">
            <asp:Label ID="lblAddGoodsTitle" runat="server" Text="Add a Goods Receipt into the Database"></asp:Label><br />
            <br />
            <asp:Label ID="lblPurchaseOrder_ID" runat="server" Text="Purchase Order ID"></asp:Label>
            &nbsp;<asp:DropDownList ID="DropDownPurchaseOrder_ID" runat="server" DataSourceID="SqlPurchase_Order" DataTextField="Purchase_Order_ID" DataValueField="Supplier_ID" Height="28px" Width="300px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblReceiptDate" runat="server" Text="Receipt Date:"></asp:Label>
            <asp:TextBox ID="txtReceiptDate" runat="server"></asp:TextBox><br />
            <br />
            <br />

            <asp:Button ID="btnAddGoodsReceiptDB" runat="server" Text="Save" OnClick="btnSaveGoods_Receipt_Click" />
            <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" OnClick="btnCancelGoods_Receipt_Click" />
        </asp:Panel>
    </div>
        </form>
</body>
</html>
