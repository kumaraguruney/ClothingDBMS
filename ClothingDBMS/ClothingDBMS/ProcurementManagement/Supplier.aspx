<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Supplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier Details</title>
</head>
<body>
    <form id="form1" runat="server">
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
        <asp:SqlDataSource ID="SqlSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Supplier] ORDER BY [Name]" DeleteCommand="DELETE FROM [Supplier] WHERE [Supplier_id] = @Supplier_id" InsertCommand="INSERT INTO [Supplier] ([Name], [Address]) VALUES (@Name, @Address)" UpdateCommand="UPDATE [Supplier] SET [Name] = @Name, [Address] = @Address WHERE [Supplier_id] = @Supplier_id">
            <DeleteParameters>
                <asp:Parameter Name="Supplier_id" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Supplier_id" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbSupplierHeader" runat="server" Text="Supplier Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddSupplier" runat="server" Text="Add" OnClick="btnaddSupplier_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvSupplier" runat="server">
                    <asp:GridView ID="gvSupplier" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlSupplier" AutoGenerateColumns="False" DataKeyNames="Supplier_id">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Supplier_id" HeaderText="Supplier_id" ReadOnly="True" SortExpression="Supplier_id" InsertVisible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                             <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdSupplier" Visible="false" runat="server">
                <asp:Label ID="lbSupplieraddTitle" Text="Add Supplier into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbSupplierName" Width="150px" Text="Supplier Name: " runat="server" />
                    <asp:TextBox ID="txtSupplierName" ValidationGroup="addSupplierValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvSupplierName" ValidationGroup="addSupplierValidation" runat="server" ControlToValidate="txtSupplierName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblSupplierAddress" Width="150" Text="Address: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtSupplierAddress" runat="server"></asp:TextBox><br />
                    <br />
                    <br />
                    <br /> <br />
                    <asp:Button ID="btnSaveSupplier" ValidationGroup="addSupplierValidation" runat="server" Text="Save" OnClick="btnSaveSupplier_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelSupplier" runat="server" Text="Cancel" OnClick="btnCancelSupplier_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>




