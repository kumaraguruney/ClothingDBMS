﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplier_Quotation.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Supplier_Quotation" %>
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
        <li><a href="Default.aspx">Production Management - Home</a></li>
        <li><a href="Allocates.aspx">Allocates Management</a></li>
          <li><a href="Employee.aspx">Employee Management</a></li>
          <li><a href="Includes.aspx">Includes Management</a></li>
          <li><a href="Machinery.aspx">Machinery Management</a></li>
          <li><a href="Product.aspx">Product Management</a></li>
          <li><a href="ProductDesign.aspx">Product Design Management</a></li>
          <li><a href="Rawmaterial.aspx">Rawmaterial Management</a></li>
          <li><a href="Require.aspx">Require Management</a></li>
          <li><a href="Workorder.aspx">WorkOrder Management</a></li>
          <li><a href="WorkSchedule.aspx">WorkSchedule Management</a></li>
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlSupplier_Quotation" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [supplier_quotation] ORDER BY [item_code]" DeleteCommand="DELETE FROM [supplier_quotation] WHERE [quotation_id] = @quotation_id" InsertCommand="INSERT INTO [supplier_quotation] ([item_code], [unit_price]) VALUES (@item_code, @unit_price)" UpdateCommand="UPDATE [supplier_quotation] SET [item_code] = @item_code, [unit_price] = @unit_price WHERE [quotation_id] = @quotation_id">
            <DeleteParameters>
                <asp:Parameter Name="quotation_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="item_code" Type="String" />
                <asp:Parameter Name="unit_price" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="item_code" Type="String" />
                <asp:Parameter Name="unit_price" Type="Decimal" />
                <asp:Parameter Name="quotation_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbSupplier_QuotationHeader" runat="server" Text="Supplier_Quotation Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddSupplier_Quotation" runat="server" Text="Add" OnClick="btnaddSupplier_Quotation_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvSupplier_Quotation" runat="server">
                    <asp:GridView ID="gvSupplier_Quotation" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlSupplier_Quotation" AutoGenerateColumns="False" DataKeyNames="quotation_id">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="quotation_id" HeaderText="quotation_id" ReadOnly="True" SortExpression="quotation_id" InsertVisible="False" />
                            <asp:BoundField DataField="item_code" HeaderText="item_code" SortExpression="item_code" />
                             <asp:BoundField DataField="unit_price" HeaderText="unit_price" SortExpression="unit_price" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdSupplier_Quotation" Visible="false" runat="server">
                <asp:Label ID="lbSupplier_QuotationaddTitle" Text="Add Supplier_Quotation into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbSupplier_QuotationName" Width="150px" Text="Item_Code: " runat="server" />
                    <asp:TextBox ID="txtSupplier_QuotationName" ValidationGroup="addSupplier_QuotationValidation" runat="server" ></asp:TextBox><br />
                    <br />
                    <asp:Label ID="lblSupplier_QuotationAddress" Width="150px" Text="Unit Price: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtSupplier_QuotationAddress" runat="server"></asp:TextBox><br />
                    <br />
                    <br />
                    <br /> <br />
                    <asp:Button ID="btnSaveSupplier_Quotation" ValidationGroup="addSupplier_QuotationValidation" runat="server" Text="Save" OnClick="btnSaveSupplier_Quotation_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelSupplier_Quotation" runat="server" Text="Cancel" OnClick="btnCancelSupplier_Quotation_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>