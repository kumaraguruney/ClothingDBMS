<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductInventory.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.ProductInventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}*,:after,:before{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}</style>
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
        <asp:SqlDataSource ID="SqlProductInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [ProductInventory] ORDER BY [Inventory_ID]" DeleteCommand="DELETE FROM [ProductInventory] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [ProductInventory] ([Entry_ID], [Inventory_ID], [Product_ID], [Product_SKU], [Design_ID], [Manufactured_Date], [Created_Date]) VALUES (@Entry_ID, @Inventory_ID, @Product_ID, @Product_SKU, @Design_ID, @Manufactured_Date, @Created_Date)" UpdateCommand="UPDATE [ProductInventory] SET [Inventory_ID] = @Inventory_ID, [Product_ID] = @Product_ID, [Product_SKU] = @Product_SKU, [Design_ID] = @Design_ID, [Manufactured_Date] = @Manufactured_Date, [Created_Date] = @Created_Date WHERE [Entry_ID] = @Entry_ID">
            <DeleteParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Entry_ID" Type="Int32" />
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
                <asp:Parameter Name="Product_SKU" Type="Int32" />
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="Manufactured_Date" Type="DateTime" />
                <asp:Parameter Name="Created_Date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
                <asp:Parameter Name="Product_SKU" Type="Int32" />
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="Manufactured_Date" Type="DateTime" />
                <asp:Parameter Name="Created_Date" Type="DateTime" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
                <br />
                <asp:Label ID="lblProductInventory" runat="server" Text="Product Inventory Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvProductInventory" runat="server" style="margin-top: 0px">
                     <asp:Button ID="btnaddProductInventory" runat="server" Text="Add" OnClick="btnaddInventory_Click"/>
                    <asp:GridView ID="gvProductInventory" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProductInventory" AutoGenerateColumns="False" DataKeyNames="Entry_ID">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Entry_ID" HeaderText="Entry_ID" ReadOnly="True" SortExpression="Entry_ID" />
                            <asp:BoundField DataField="Inventory_ID" HeaderText="Inventory_ID" SortExpression="Inventory_ID" />
                             <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
                            <asp:BoundField DataField="Product_SKU" HeaderText="Product_SKU" SortExpression="Product_SKU" />
                            <asp:BoundField DataField="Design_ID" HeaderText="Design_ID" SortExpression="Design_ID" />
                            <asp:BoundField DataField="Manufactured_Date" HeaderText="Manufactured_Date" SortExpression="Manufactured_Date" />
                            <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" SortExpression="Created_Date" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdProductInventory" Visible="false" runat="server">
                <asp:Label ID="lblProductInventoryDetails" Text="Enter Product Inventory Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblAllocatesInventoryID" runat="server" Text="Inventory ID:" Width="200px" />
                    <asp:TextBox ID="ProductInventoryTextBox" runat="server" Width="199px"></asp:TextBox>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblProductID" runat="server" Text="Product ID:" Width="200px" />
                    <asp:TextBox ID="ProductIDTextBox" runat="server" Width="199px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblDesignID" Width="200px" Text="Design ID:" runat="server" />
                    <asp:TextBox ID="DesignIDTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                     <asp:Label ID="lblManufacturedDate" Width="150" Text="Manufactured Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="ManufacturedDateTextBox" ReadOnly="false" Width="230" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgManufacturedDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgManufacturedDate_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calManufacturedDate" runat="server" OnSelectionChanged="calManufactured_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                     <asp:Label ID="lblCreatedDate" Width="150" Text="Created Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="CreatedDateTextBox" ReadOnly="false" Width="230" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgCreatedDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgCreatedDate_Click" Width="25px" />
                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                        <asp:Calendar ID="calCreatedDate" runat="server" OnSelectionChanged="calCreatedDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Label ID="lblProductSKU" runat="server" Text="Product SKU:" Width="200px" />
                    <asp:TextBox ID="ProductSKUTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveProductInventory" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveInventory_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelProductInventory" runat="server" Text="Cancel" OnClick="btnCancelInventory_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
