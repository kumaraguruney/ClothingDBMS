<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Warehouse.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.Warehouse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Warehouse Details</title>
</head>
<body style="height: 931px">
    <form id="form1" runat="server">
            <nav>
    <div class="nav-wrapper">
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../Index.aspx">Home</a></li>
        <li><a href="Default.aspx">Production Management - Home</a></li>
        <li><a href="Warehouse.aspx">Warehouse Details</a></li>
          <li><a href="Inventory.aspx">Inventory Details</a></li>
          <li><a href="StockMovement.aspx">Stock Movement</a></li>
          <li><a href="StockUpdate.aspx">Stock Update</a></li>
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Warehouse] ORDER BY [Warehouse_Name]">
        </asp:SqlDataSource>
          <div align="center">
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Warehouse Details" Font-Bold="True"></asp:Label> <br /> <br />
                <%--<asp:Button ID="btnaddAllocates" runat="server" Text="Add" OnClick="btnaddAllocates_Click"/>--%>
                <br /> <br />
                <asp:Panel ID="PanelgvAllocates" runat="server">
                    <asp:GridView ID="gvAllocates" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlWarehouse" AutoGenerateColumns="False" DataKeyNames="Warehouse_ID">
                        <Columns>
                            <asp:BoundField DataField="Warehouse_ID" HeaderText="Warehouse_ID" ReadOnly="True" SortExpression="Warehouse_ID" />
                            <asp:BoundField DataField="Warehouse_Name" HeaderText="Warehouse_Name" SortExpression="Warehouse_Name" />
                             <asp:BoundField DataField="Warehouse_address" HeaderText="Warehouse_address" SortExpression="Warehouse_address" />
                            <asp:BoundField DataField="contact_number" HeaderText="contact_number" SortExpression="contact_number" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdAllocates" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesWarehouseDetails" Text="Enter Warehouse Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblAllocatesWarehouseName" runat="server" Text="Warehouse Name:" Width="200px" />
                    <asp:TextBox ID="WarehouseNameTextBox" runat="server" Width="199px"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropEmployee" ErrorMessage="(*) Must be Provided" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblIncludesWarehouseAddress" Width="200px" Text="Warehouse Address:" runat="server" />
                    <asp:TextBox ID="WarehouseAddressTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblIncludesContactNumber" runat="server" Text="Contact Number:" Width="200px" />
                    <asp:TextBox ID="ContactNumberTextBox" runat="server" Width="199px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dropEmployee" ErrorMessage="(*) Must be Provided" ForeColor="Red" ValidationGroup="addAllocatesValidation"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveWarehouse" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveWarehouse_Click"/> &nbsp;&nbsp;
                    <%--<asp:Button ID="btnCancelAllocates" runat="server" Text="Cancel" OnClick="btnCancelAllocates_Click"/>--%>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>

