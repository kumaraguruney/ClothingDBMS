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
        <asp:SqlDataSource ID="SqlProvides" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [provides] ORDER BY [Prvd_id]" DeleteCommand="DELETE FROM [provides] WHERE [Prvd_id] = @Prvd_id" InsertCommand="INSERT INTO [provides] ([quotation_id], [RawMaterial_ID], [Quantity], [Unit_Price]) VALUES (@quotation_id, @RawMaterial_ID, @Quantity, @Unit_Price)" UpdateCommand="UPDATE [provides] SET [quotation_id] = @quotation_id, [RawMaterial_ID] = @RawMaterial_ID, [Quantity] = @Quantity, [Unit_Price] = @Unit_Price WHERE [Prvd_id] = @Prvd_id">
            <DeleteParameters>
                <asp:Parameter Name="Prvd_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Unit_Price" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Unit_Price" Type="Int32" />
                <asp:Parameter Name="Prvd_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
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

        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_ID]">
        </asp:SqlDataSource>

                <br />
                <asp:Label ID="lblProvidesHeader" runat="server" Text="Provides Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddProvides" runat="server" Text="Add" OnClick="btnaddOrders_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvProvides" runat="server">
                    
                    <asp:GridView ID="gvProvides" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProvides" AutoGenerateColumns="False" DataKeyNames="Prvd_id">
                        <Columns>
                            <asp:BoundField DataField="Prvd_id" HeaderText="Prvd_id" SortExpression="Prvd_id" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="quotation_id" HeaderText="quotation_id" SortExpression="quotation_id" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" SortExpression="RawMaterial_ID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Unit_Price" HeaderText="Unit_Price" SortExpression="Unit_Price" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdProvides" runat="server" Visible="false">
                        <asp:Label ID="lbUpdatesaddTitle" runat="server" Text="Add Updates into Database" />
                        <br />
                        <asp:Label ID="lbQuotation_ID" runat="server" Text="Quotation_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownQuotation_ID" runat="server" DataSourceID="SqlSupplier_Quotation" DataTextField="quotation_id" DataValueField="quotation_id" Height="29px" Width="151px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="rfvPrvd_id" runat="server" ControlToValidate="PurchaseOrderIDDropDownList" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="lblRawMaterial_Name" runat="server" Text="RawMaterial_Name: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownRawMaterial_ID" runat="server" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID" Height="29px" Width="151px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="lblUnit_Price" runat="server" Text="Unit_Price: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtUnit_Price" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtQuantity" runat="server" ValidationGroup="addSupplierValidation"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveProvides" runat="server" OnClick="btnSaveOrders_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelProvides" runat="server" OnClick="btnCancelOrders_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
    
    