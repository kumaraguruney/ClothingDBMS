<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RMInventory.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.RMInventory" %>

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
        <li><a href="Default.aspx">Inventory Management - Home</a></li>
        <li><a href="Warehouse.aspx">Warehouse Details</a></li>
          <li><a href="Inventory.aspx">Inventory Details</a></li>
          <li><a href="ProductInventory.aspx">ProductInventory</a></li>
          <li><a href="RMInventory.aspx">RMInventory</a></li>
          <li><a href="StockMovement.aspx">Stock Movement</a></li>
          <li><a href="StockUpdate.aspx">Stock Update</a></li>
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlRMInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RMInventory] ORDER BY [Inventory_ID]" DeleteCommand="DELETE FROM [RMInventory] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [RMInventory] ([Entry_ID], [Inventory_ID], [RM_ID], [Procurement_Date]) VALUES (@Entry_ID, @Inventory_ID, @RM_ID, @Procurement_Date)" UpdateCommand="UPDATE [RMInventory] SET [Inventory_ID] = @Inventory_ID, [RM_ID] = @RM_ID, [Procurement_Date] = @Procurement_Date WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="RM_ID" Type="Int16" />
                <asp:Parameter Name="Procurement_Date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="RM_ID" Type="Int16" />
                <asp:Parameter Name="Procurement_Date" Type="DateTime" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
                <br />
                <asp:Label ID="lblProductInventory" runat="server" Text="RM Inventory Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvRMInventory" runat="server" style="margin-top: 0px">
                     <asp:Button ID="btnaddRMInventory" runat="server" Text="Add" OnClick="btnaddRMInventory_Click"/>
                    <asp:GridView ID="gvProductInventory" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlRMInventory" AutoGenerateColumns="False" DataKeyNames="Entry_ID">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" ReadOnly="True" SortExpression="Entry_ID" />
                            <asp:BoundField DataField="Inventory_ID" HeaderText="Inventory_ID" SortExpression="Inventory_ID" />
                             <asp:BoundField DataField="RM_ID" HeaderText="RM_ID" SortExpression="RM_ID" />
                            <asp:BoundField DataField="Procurement_Date" HeaderText="Procurement_Date" SortExpression="Procurement_Date" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdRMInventory" Visible="false" runat="server">
                <asp:Label ID="lblRMInventoryDetails" Text="Enter RM Inventory Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblRMInventoryID" runat="server" Text="Inventory ID:" Width="200px" />
                    <asp:TextBox ID="RMInventoryTextBox" runat="server" Width="199px"></asp:TextBox>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblRMID" runat="server" Text="RM ID:" Width="200px" />
                    <asp:TextBox ID="RMIDTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblProcurementDate" runat="server" Text="Procurement Date:" Width="200px" />
                    <asp:TextBox ID="ProcurementDateTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveRMInventory" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveRMInventory_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelRMInventory" runat="server" Text="Cancel" OnClick="btnCancelRMInventory_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
