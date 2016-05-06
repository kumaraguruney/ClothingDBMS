<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Goods_Receipt.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Goods_Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Goods Receipt</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlGoods_Receipt" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [goods_receipt]"></asp:SqlDataSource>
    

    <div align="center">
        <asp:Label ID="lblGoodsReceipt" runat="server" Text="Goods Receipt Details"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnAddGoodsReceipt" runat="server" Text="Add" OnClick="btnAddGoodsReceipt_Click" />
        <br />
        <br />
        <asp:Panel ID="pnlGoodsReceipt" runat="server">
            <asp:GridView ID="gvGoods_Receipt" runat="server" AutoGenerateColumns="False" DataSourceID="SqlGoods_Receipt">
            </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="pnlAddGoodsReceipt" Visible="false" runat="server">
            <asp:Label ID="lblAddGoodsTitle" runat="server" Text="Add a Goods Receipt into the Database"></asp:Label><br />
            <br />
            <asp:Label ID="lblPurchaseOrderID" runat="server" Text="Purchase Order ID"></asp:Label>
            <asp:TextBox ID="txtPurchase_Order_ID" runat="server"></asp:TextBox><br />
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
