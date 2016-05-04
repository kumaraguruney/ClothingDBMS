<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tracks.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Tracks" %>

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
        <asp:SqlDataSource ID="Track" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Tracks] ORDER BY [Track_ID]" DeleteCommand="DELETE FROM [Tracks] WHERE [Track_ID] = @Track_ID" InsertCommand="INSERT INTO [Tracks] ([Inventory_ID], [RM_ID]) VALUES (@Inventory_ID, @RM_ID)" UpdateCommand="UPDATE [Tracks] SET [Inventory_ID] = @Inventory_ID, [RM_ID] = @RM_ID WHERE [Track_ID] = @Track_ID">
            <DeleteParameters>
                <asp:Parameter Name="Track_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int32" />
                <asp:Parameter Name="RM_ID" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int32" />
                <asp:Parameter Name="RM_ID" Type="Int16" />
                <asp:Parameter Name="Track_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbOrdersHeader" runat="server" Text="Tracks Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddTracks" runat="server" Text="Add" OnClick="btnaddSupplier_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvSupplies" runat="server">
                    <asp:Panel ID="PaneladdTracks" runat="server" Visible="false">
                        <asp:Label ID="lbTracksaddTitle" runat="server" Text="Add Tracks into Database" />
                        <br />
                        <asp:Label ID="lbPrvd_id" runat="server" Text="Track_ID: " Width="150px" />
                        <br />
                        <asp:TextBox ID="txtTrack_id" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvTrack_id" runat="server" ControlToValidate="txtSupplierName" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
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
                    <asp:GridView ID="gvSupplies" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="Orders" AutoGenerateColumns="False" DataKeyNames="Track_ID">
                        <Columns>
                            <asp:BoundField DataField="Track_ID" HeaderText="Track_ID" SortExpression="Track_ID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="Inventory_ID" HeaderText="Inventory_ID" SortExpression="Inventory_ID" />
                            <asp:BoundField DataField="RM_ID" HeaderText="RM_ID" SortExpression="RM_ID" />
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
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
