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
          <li><a href="ProductInventory.aspx">ProductInventory</a></li>
          <li><a href="RMInventory.aspx">RMInventory</a></li>
          <li><a href="StockMovement.aspx">Stock Movement</a></li>
          <li><a href="StockUpdate.aspx">Stock Update</a></li>
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlProductInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [ProductInventory] ORDER BY [Product_ID]" DeleteCommand="DELETE FROM [ProductInventory] WHERE [Entry_ID] = @Entry_ID" InsertCommand="INSERT INTO [ProductInventory] ([Entry_ID], [Inventory_ID], [Product_ID], [Product_SKU], [Design_ID], [Manufactured_Date], [Created_Date], [Quantity]) VALUES (@Entry_ID, @Inventory_ID, @Product_ID, @Product_SKU, @Design_ID, @Manufactured_Date, @Created_Date, @Quantity)" UpdateCommand="UPDATE [ProductInventory] SET [Inventory_ID] = @Inventory_ID, [Product_ID] = @Product_ID, [Product_SKU] = @Product_SKU, [Design_ID] = @Design_ID, [Manufactured_Date] = @Manufactured_Date, [Created_Date] = @Created_Date, [Quantity] = @Quantity WHERE [Entry_ID] = @Entry_ID">
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
                <asp:Parameter Name="Quantity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Inventory_ID" Type="Int16" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
                <asp:Parameter Name="Product_SKU" Type="Int32" />
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="Manufactured_Date" Type="DateTime" />
                <asp:Parameter Name="Created_Date" Type="DateTime" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Entry_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Description]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlInventory" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Inventory] ORDER BY [Inventory_Name]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDesign" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Design] ORDER BY [Design_Name]">
        </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblProductInventory" runat="server" Text="Product Inventory Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvProductInventory" runat="server" style="margin-top: 0px">
                     <asp:Button ID="btnaddProductInventory" runat="server" Text="Add" OnClick="btnaddProductInventory_Click"/>
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
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdProductInventory" Visible="false" runat="server">
                <asp:Label ID="lblProductInventoryDetails" Text="Enter Product Inventory Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblAllocatesInventoryID" runat="server" Text="Inventory ID:" Width="200px" />
                    <asp:DropDownList ID="InventoryIDDropDownList" runat="server" DataSourceID="SqlInventory" DataTextField="Inventory_Name" DataValueField="Inventory_ID" Height="20px" Width="185px">
                    </asp:DropDownList>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblProductID" runat="server" Text="Product ID:" Width="200px" />
                    <asp:DropDownList ID="ProductIDDropDownList" runat="server" DataSourceID="SqlProduct" DataTextField="Product_Description" DataValueField="Product_ID" Height="17px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="179px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblDesignID" Width="200px" Text="Design ID:" runat="server" />
                    <asp:DropDownList ID="DesignIDDropDownList" runat="server" DataSourceID="SqlDesign" DataTextField="Design_Name" DataValueField="Design_ID" Height="25px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="180px">
                    </asp:DropDownList>
                    
                    <br />
                    <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Label ID="lblManufacturedDate" Width="150" Text="Manufactured Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="ManufacturedDateTextBox" ReadOnly="false" Width="230" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgManufacturedDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgManufacturedDate_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calManufacturedDate" runat="server" OnSelectionChanged="calManufacturedDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="199px"></asp:TextBox>
                    <br />
                    
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveProductInventory" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveProductInventory_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelProductInventory" runat="server" Text="Cancel" OnClick="btnCancelProductInventory_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
