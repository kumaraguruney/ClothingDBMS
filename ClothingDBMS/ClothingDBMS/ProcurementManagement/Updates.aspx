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
        <asp:SqlDataSource ID="SqlUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Updates] ORDER BY [Update_id]" DeleteCommand="DELETE FROM [Updates] WHERE [Update_id] = @Update_id" InsertCommand="INSERT INTO [Updates] ([receipt_id], [Entry_id], [Remaining_Qty], [Received_Qty]) VALUES (@receipt_id, @Entry_id, @Remaining_Qty, @Received_Qty)" UpdateCommand="UPDATE [Updates] SET [receipt_id] = @receipt_id, [Entry_id] = @Entry_id, [Remaining_Qty] = @Remaining_Qty, [Received_Qty] = @Received_Qty WHERE [Update_id] = @Update_id">
            <DeleteParameters>
                <asp:Parameter Name="Update_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="receipt_id" Type="Int32" />
                <asp:Parameter Name="Entry_id" Type="Int32" />
                <asp:Parameter Name="Remaining_Qty"  />
                <asp:Parameter Name="Received_Qty"  />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="receipt_id" Type="Int32" />
                <asp:Parameter Name="Entry_id" Type="Int32" />
                <asp:Parameter Name="Remaining_Qty" Type="Int32" />
                <asp:Parameter Name="Received_Qty" Type="Int32" />
                <asp:Parameter Name="Update_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
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

        <asp:SqlDataSource ID="SqlStock_Pile" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockPile] ORDER BY [Entry_ID]" DeleteCommand="DELETE FROM [StockPile] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [StockPile] ([Batch_ID], [Warehouse_ID], [Location_ID], [Quantity], [Created_Date], [Is_Product]) VALUES (@Batch_ID, @Warehouse_ID, @Location_ID, @Quantity, @Created_Date, @Is_Product)" UpdateCommand="UPDATE [StockPile] SET [Batch_ID] = @Batch_ID, [Warehouse_ID] = @Warehouse_ID, [Location_ID] = @Location_ID, [Quantity] = @Quantity, [Created_Date] = @Created_Date, [Is_Product] = @Is_Product WHERE [Entry_ID] = @Entry_ID">
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
                <asp:Label ID="lbUpdatesHeader" runat="server" Text="Updates Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddUpdates" runat="server" Text="Add" OnClick="btnaddUpdates_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvUpdates" runat="server">
                   
                    <asp:GridView ID="gvUpdates" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlUpdate" AutoGenerateColumns="False" DataKeyNames="Update_id">
                        <Columns>
                            <asp:BoundField DataField="Update_id" HeaderText="Update_id" SortExpression="Update_id" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="receipt_id" HeaderText="receipt_id" SortExpression="receipt_id" />
                            <asp:BoundField DataField="Entry_id" HeaderText="Entry_id" SortExpression="Entry_id" />
                            <asp:BoundField DataField="Remaining_Qty" HeaderText="Remaining_Qty" SortExpression="Remaining_Qty" />
                            <asp:BoundField DataField="Received_Qty" HeaderText="Received_Qty" SortExpression="Received_Qty" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                 <asp:Panel ID="PaneladdUpdates" runat="server" Visible="false">
                        <asp:Label ID="lbUpdatesaddTitle" runat="server" Text="Add Updates into Database" />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <asp:Label ID="lbReceipt_ID" runat="server" Text="Receipt_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownReceipt_ID" runat="server" DataSourceID="SqlGoods_Receipt" DataTextField="receipt_id" DataValueField="receipt_id" Height="27px" Width="333px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="lbIEntry_ID" runat="server" Text="Entry_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownEntry_ID" runat="server" DataSourceID="SqlStock_Pile" DataTextField="Entry_ID" DataValueField="Entry_ID" Height="25px" Width="326px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="lblReceived_Qty" runat="server" Text="Received_Qty: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtReceived_Qty" runat="server" ValidationGroup="addSupplierValidation" Height="35px" Width="299px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lbRemaining_Qty" runat="server" Text="Remaining_Qty: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtRemaining_Qty" runat="server" Height="35px" ValidationGroup="addSupplierValidation" Width="312px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvUpdate_id" runat="server" ControlToValidate="txtRemaining_Qty" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveUpdates" runat="server" OnClick="btnSaveUpdates_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelUpdates" runat="server" OnClick="btnCancelUpdates_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
