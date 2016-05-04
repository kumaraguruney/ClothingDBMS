<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Updates.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Updates" %>

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
        <asp:SqlDataSource ID="SqlUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Updates] ORDER BY [Update_id]" DeleteCommand="DELETE FROM [Updates] WHERE [Update_id] = @Update_id" InsertCommand="INSERT INTO [Updates] ([receipt_id], [inventory_id]) VALUES (@receipt_id, @inventory_id)" UpdateCommand="UPDATE [Updates] SET [receipt_id] = @receipt_id, [inventory_id] = @inventory_id WHERE [Update_id] = @Update_id">
            <DeleteParameters>
                <asp:Parameter Name="Update_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="receipt_id" Type="Int32" />
                <asp:Parameter Name="inventory_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="receipt_id" Type="Int32" />
                <asp:Parameter Name="inventory_id" Type="Int32" />
                <asp:Parameter Name="Update_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbUpdatesHeader" runat="server" Text="Updates Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddUpdates" runat="server" Text="Add" OnClick="btnaddSupplier_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvUpdates" runat="server">
                    <asp:Panel ID="PaneladdUpdates" runat="server" Visible="false">
                        <asp:Label ID="lbUpdatesaddTitle" runat="server" Text="Add Updates into Database" />
                        <br />
                        <asp:Label ID="lbUpdate_id" runat="server" Text="Update_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtUpdate_id" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <asp:Label ID="lbReceipt_ID" runat="server" Text="Receipt_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtReceipt_ID" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <asp:Label ID="lbInventory_ID" runat="server" Text="Inventory_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtInventory_ID" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvUpdate_id" runat="server" ControlToValidate="txtSupplierName" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveUpdates" runat="server" OnClick="btnSaveSupplier_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelUpdates" runat="server" OnClick="btnCancelSupplier_Click" Text="Cancel" />
                    </asp:Panel>
                    <asp:GridView ID="gvUpdates" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="Update" AutoGenerateColumns="False" DataKeyNames="Update_id">
                        <Columns>
                            <asp:BoundField DataField="Update_id" HeaderText="Update_id" SortExpression="Update_id" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="receipt_id" HeaderText="receipt_id" SortExpression="receipt_id" />
                            <asp:BoundField DataField="inventory_id" HeaderText="inventory_id" SortExpression="inventory_id" />
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
    <form id="form4" runat="server">
    <div>
    
    </div>
    </form>
    <form id="form5" runat="server">
    <div>
    
    </div>
    </form>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
