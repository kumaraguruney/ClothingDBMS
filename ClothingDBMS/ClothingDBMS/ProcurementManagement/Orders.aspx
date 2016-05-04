<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.WebForm3" %>

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
        <asp:SqlDataSource ID="Orders" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Orders] ORDER BY [purchase_order_id]">
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbOrdersHeader" runat="server" Text="Orders Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddOrders" runat="server" Text="Add" OnClick="btnaddSupplier_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvSupplies" runat="server">
                    <asp:Panel ID="PaneladdOrders" runat="server" Visible="false">
                        <asp:Label ID="lbOrdersaddTitle" runat="server" Text="Add Orders into Database" />
                        <br />
                        <asp:Label ID="lbPrvd_id" runat="server" Text="Purchase_Order_ID: " Width="150px" />
                        <br />
                        <asp:TextBox ID="txtPurchase_Order_id" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvPrvd_id" runat="server" ControlToValidate="txtSupplierName" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveOrders" runat="server" OnClick="btnSaveSupplier_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelOrders" runat="server" OnClick="btnCancelSupplier_Click" Text="Cancel" />
                    </asp:Panel>
                    <asp:GridView ID="gvSupplies" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="Orders" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="RawMaterial_id" HeaderText="RawMaterial_id" SortExpression="RawMaterial_id" />
                            <asp:BoundField DataField="purchase_order_id" HeaderText="purchase_order_id" SortExpression="purchase_order_id" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
        </div>
    </form>
    <form id="form3" runat="server">
    <div>
    
    </div>
    </form>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
