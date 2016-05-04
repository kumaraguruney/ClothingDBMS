<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplies.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Material_Transaction" %>

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
        <asp:SqlDataSource ID="SqlSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [supplies] ORDER BY [Supplier_id]">
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbSuppliesHeader" runat="server" Text="Supplies Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddSupplies" runat="server" Text="Add" OnClick="btnaddSupplier_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvSupplies" runat="server">
                    <asp:Panel ID="PaneladdSupplier" runat="server" Visible="false">
                        <asp:Label ID="lbSuppliesaddTitle" runat="server" Text="Add Supplies into Database" />
                        <br />
                        <br />
                        <asp:Label ID="lbSupplier_id" runat="server" Text="Supplier Name: " Width="150px" />
                        <asp:TextBox ID="txtSupplier_id" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvSupplier_id" runat="server" ControlToValidate="txtSupplierName" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblRawmaterial_ID" runat="server" Text="Address: " Width="150px"></asp:Label>
                        <asp:TextBox ID="txtSupplierAddress" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveSupplies" runat="server" OnClick="btnSaveSupplier_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelSupplies" runat="server" OnClick="btnCancelSupplier_Click" Text="Cancel" />
                    </asp:Panel>
                    <asp:GridView ID="gvSupplies" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlSupplier" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Supplier_id" HeaderText="Supplier_id" SortExpression="Supplier_id" />
                            <asp:BoundField DataField="Rawmaterial_ID" HeaderText="Rawmaterial_ID" SortExpression="Rawmaterial_ID" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
        </div>
    </form>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
