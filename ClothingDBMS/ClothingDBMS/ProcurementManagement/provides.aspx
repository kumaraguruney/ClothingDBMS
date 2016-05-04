<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Provides.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.WebForm2" %>

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
        <asp:SqlDataSource ID="Provides" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [provides] ORDER BY [Prvd_id]" DeleteCommand="DELETE FROM [provides] WHERE [Prvd_id] = @Prvd_id" InsertCommand="INSERT INTO [provides] ([quotation_id], [RawMaterial_ID]) VALUES (@quotation_id, @RawMaterial_ID)" UpdateCommand="UPDATE [provides] SET [quotation_id] = @quotation_id, [RawMaterial_ID] = @RawMaterial_ID WHERE [Prvd_id] = @Prvd_id">
            <DeleteParameters>
                <asp:Parameter Name="Prvd_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="Prvd_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbProvidesHeader" runat="server" Text="Provides Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddProvides" runat="server" Text="Add" OnClick="btnaddSupplier_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvSupplies" runat="server">
                    <asp:Panel ID="PaneladdProvides" runat="server" Visible="false">
                        <asp:Label ID="lbProvidesaddTitle" runat="server" Text="Add Provides into Database" />
                        <br />
                        <br />
                        <asp:Label ID="lbPrvd_id" runat="server" Text="Prvd_ID: " Width="150px" />
                        <asp:TextBox ID="txtPrvd_id" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvPrvd_id" runat="server" ControlToValidate="txtSupplierName" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveSupplies" runat="server" OnClick="btnSaveSupplier_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelSupplies" runat="server" OnClick="btnCancelSupplier_Click" Text="Cancel" />
                    </asp:Panel>
                    <asp:GridView ID="gvSupplies" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlSupplier" AutoGenerateColumns="False" DataKeyNames="Prvd_id">
                        <Columns>
                            <asp:BoundField DataField="Prvd_id" HeaderText="Prvd_id" ReadOnly="True" SortExpression="Prvd_id" InsertVisible="False" />
                            <asp:BoundField DataField="quotation_id" HeaderText="quotation_id" SortExpression="quotation_id" />
                             <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" SortExpression="RawMaterial_ID" />
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
