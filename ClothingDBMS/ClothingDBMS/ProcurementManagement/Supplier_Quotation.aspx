<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplier_Quotation.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Supplier_Quotation" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier_Quotation Details</title>
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
        <asp:SqlDataSource ID="SqlSupplier_Quotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [supplier_quotation] ORDER BY [quotation_id]" DeleteCommand="DELETE FROM [supplier_quotation] WHERE [quotation_id] = @quotation_id" InsertCommand="INSERT INTO [supplier_quotation] ([Supplier_id]) VALUES (@Supplier_id)" UpdateCommand="UPDATE [supplier_quotation] SET [Supplier_id] = @Supplier_id WHERE [quotation_id] = @quotation_id">
            <DeleteParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Supplier_id" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Supplier_id" Type="Int16" />
                <asp:Parameter Name="quotation_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
        <asp:SqlDataSource ID="SqlSupplier_Quotation0" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [supplier_quotation] ORDER BY [quotation_id]" DeleteCommand="DELETE FROM [supplier_quotation] WHERE [quotation_id] = @quotation_id" InsertCommand="INSERT INTO [supplier_quotation] ([Supplier_id]) VALUES (@Supplier_id)" UpdateCommand="UPDATE [supplier_quotation] SET [Supplier_id] = @Supplier_id WHERE [quotation_id] = @quotation_id">
            <DeleteParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Supplier_id" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Supplier_id" Type="Int16" />
                <asp:Parameter Name="quotation_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

                <br />
                <asp:Label ID="lbSupplier_QuotationHeader" runat="server" Text="Supplier_Quotation Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddSupplier_Quotation" runat="server" Text="Add" OnClick="btnaddSupplier_Quotation_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvSupplier_Quotation" runat="server">
                    <asp:GridView ID="gvSupplier_Quotation" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlSupplier_Quotation" AutoGenerateColumns="False" DataKeyNames="quotation_id">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="quotation_id" HeaderText="quotation_id" ReadOnly="True" SortExpression="quotation_id" InsertVisible="False" />
                            <asp:BoundField DataField="Supplier_id" HeaderText="Supplier_id" SortExpression="Supplier_id" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdSupplier_Quotation" Visible="false" runat="server">
                <asp:Label ID="lbSupplier_QuotationaddTitle" Text="Add Supplier_Quotation into Database" runat="server" /><br /> <br />
                    <br />
                    <br />
                    <asp:Label ID="lblSupplier_Name" runat="server" Text="Supplier_Name" Width="150px"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownSupplier_Name" runat="server" DataSourceID="SqlSupplier" DataTextField="Name" DataValueField="Supplier_id" Height="28px" Width="300px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveSupplier_Quotation" runat="server" Text="Save" OnClick="btnSaveSupplier_Quotation_Click" ValidationGroup="addSupplier_QuotationValidation"/>
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCancelSupplier_Quotation" runat="server" OnClick="btnCancelSupplier_Quotation_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
