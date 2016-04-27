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
        <asp:SqlDataSource ID="SqlPurchase_Order" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Purchase_Order] ORDER BY [item_code]" DeleteCommand="DELETE FROM [Purchase_Order] WHERE [quotation_id] = @quotation_id" InsertCommand="INSERT INTO [Purchase_Order] ([item_code], [unit_price]) VALUES (@item_code, @unit_price)" UpdateCommand="UPDATE [Purchase_Order] SET [item_code] = @item_code, [unit_price] = @unit_price WHERE [quotation_id] = @quotation_id">
            <DeleteParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="item_code" Type="String" />
                <asp:Parameter Name="unit_price" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="item_code" Type="String" />
                <asp:Parameter Name="unit_price" Type="Decimal" />
                <asp:Parameter Name="quotation_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbPurchase_OrderHeader" runat="server" Text="Purchase_Order Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddPurchase_Order" runat="server" Text="Add" OnClick="btnaddPurchase_Order_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvPurchase_Order" runat="server">
                    <asp:GridView ID="gvPurchase_Order" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlPurchase_Order" AutoGenerateColumns="False" DataKeyNames="quotation_id">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="quotation_id" HeaderText="quotation_id" ReadOnly="True" SortExpression="quotation_id" InsertVisible="False" />
                            <asp:BoundField DataField="item_code" HeaderText="item_code" SortExpression="item_code" />
                             <asp:BoundField DataField="unit_price" HeaderText="unit_price" SortExpression="unit_price" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdPurchase_Order" Visible="false" runat="server">
                <asp:Label ID="lbPurchase_OrderaddTitle" Text="Add Purchase_Order into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbPurchase_OrderName" Width="150px" Text="Item_Code: " runat="server" />
                    <asp:TextBox ID="txtPurchase_OrderName" ValidationGroup="addPurchase_OrderValidation" runat="server" ></asp:TextBox><br />
                    <br />
                    <asp:Label ID="lblPurchase_OrderAddress" Width="150px" Text="Unit Price: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtPurchase_OrderAddress" runat="server"></asp:TextBox><br />
                    <br />
                    <br />
                    <br /> <br />
                    <asp:Button ID="btnSavePurchase_Order" ValidationGroup="addPurchase_OrderValidation" runat="server" Text="Save" OnClick="btnSavePurchase_Order_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelPurchase_Order" runat="server" Text="Cancel" OnClick="btnCancelPurchase_Order_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
