<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductStockUpdate.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.ProductStockUpdate" %>

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
          <li><a href="StockMovement.aspx">Stock Movement</a></li>
          <li><a href="StockUpdate.aspx">Stock Update</a></li>
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlStockUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [StockUpdate] ORDER BY [StockMovement_ID]" DeleteCommand="DELETE FROM [StockUpdate] WHERE [StockUpdate_ID] = @StockUpdate_ID" InsertCommand="INSERT INTO [StockUpdate] ([StockMovement_ID]) VALUES (@StockMovement_ID)" UpdateCommand="UPDATE [StockUpdate] SET [StockMovement_ID] = @StockMovement_ID WHERE [StockUpdate_ID] = @StockUpdate_ID">
            <DeleteParameters>
                <asp:Parameter Name="StockUpdate_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StockMovement_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StockMovement_ID" Type="Int32" />
                <asp:Parameter Name="StockUpdate_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Stock Update Details" Font-Bold="True"></asp:Label> <br /> <br />
             
                <br /> <br />
                <asp:Panel ID="PanelgvStockUpdate" runat="server">
                     <asp:Button ID="btnaddStockUpdate" runat="server" Text="Add" OnClick="btnaddStockUpdate_Click"/>
                    <asp:GridView ID="gvStockUpdate" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlStockUpdate" AutoGenerateColumns="False" DataKeyNames="StockUpdate_ID">
                        <Columns>
                            <asp:BoundField DataField="StockUpdate_ID" HeaderText="StockUpdate_ID" ReadOnly="True" SortExpression="StockUpdate_ID" InsertVisible="False" />
                            <asp:BoundField DataField="StockMovement_ID" HeaderText="StockMovement_ID" SortExpression="StockMovement_ID" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdStockUpdate" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesInventoryDetails" Text="Enter Stock Update Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblAllocatesStockUpdateID" runat="server" Text="Stock Update ID:" Width="200px" />
                    <asp:TextBox ID="StockUpdateTextBox" runat="server" Width="199px"></asp:TextBox>
                        
                    <br />
                    <br />
                    <asp:Label ID="lblIncludesStockMovementID" Width="200px" Text="Stock Movement ID:" runat="server" />
                    <asp:TextBox ID="StockMovementTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveStockUpdate" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveStockUpdate_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelStockUpdate" runat="server" Text="Cancel" OnClick="btnCancelStockUpdate_Click"/>
                   
                    </asp:Panel>
        </div>
    </form>
    
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
