<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Updates.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.WebForm3" %>

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
        <asp:SqlDataSource ID="SqlOrders" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Orders] ORDER BY [purchase_order_id]">
        </asp:SqlDataSource>

            <div align="center">
        <asp:SqlDataSource ID="SqlPurchaseOrder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [purchase_order] ORDER BY [purchase_order_id]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_ID]">
        </asp:SqlDataSource>

                <br />
                <asp:Label ID="lbUpdatesHeader" runat="server" Text="Updates Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddOrders" runat="server" Text="Add" OnClick="btnaddOrders_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvOrders" runat="server">
                    
                    <asp:GridView ID="gvOrders" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlOrders" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="RawMaterial_id" HeaderText="RawMaterial_id" SortExpression="RawMaterial_id" />
                            <asp:BoundField DataField="purchase_order_id" HeaderText="purchase_order_id" SortExpression="purchase_order_id" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdOrders" runat="server" Visible="false">
                        <asp:Label ID="lbUpdatesaddTitle" runat="server" Text="Add Updates into Database" />
                        <br />
                        <asp:Label ID="lbPrvd_id" runat="server" Text="Purchase_Order_ID: " Width="150px" />
                        <asp:DropDownList ID="PurchaseOrderIDDropDownList" runat="server" Height="29px" Width="151px" DataSourceID="SqlPurchaseOrder" DataTextField="purchase_order_id" DataValueField="purchase_order_id">
                        </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvPrvd_id" runat="server" ControlToValidate="PurchaseOrderIDDropDownList" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="lbRawMaterial_ID" runat="server" Text="RawMaterial_ID: " Width="150px" />
                        <asp:DropDownList ID="RMIDDropDownList" runat="server" Height="29px" Width="151px" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID">
                        </asp:DropDownList>
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
