<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinishedProduct.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.FinishedProduct" %>

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
          <li><a href="ProductStockUpdate.aspx">Product Stock Update</a></li>
          <li><a href="RMStockUpdate.aspx">RM Stock Update</a></li>
        
          
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlFinishedProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [FinishedProduct] ORDER BY [Batch_ID]" DeleteCommand="DELETE FROM [FinishedProduct] WHERE [Batch_ID] = @Batch_ID" InsertCommand="INSERT INTO [FinishedProduct] ([Product_ID], [Manufactured_Date], [Quantity], [Is_Stock_Piled]) VALUES (@Product_ID, @Manufactured_Date, @Quantity, @Is_Stock_Piled)" UpdateCommand="UPDATE [FinishedProduct] SET [Product_ID] = @Product_ID, [Manufactured_Date] = @Manufactured_Date, [Quantity] = @Quantity, [Is_Stock_Piled] = @Is_Stock_Piled WHERE [Batch_ID] = @Batch_ID">
            <DeleteParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_ID" Type="Int32" />
                <asp:Parameter Name="Manufactured_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Is_Stock_Piled" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_ID" Type="Int32" />
                <asp:Parameter Name="Manufactured_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Is_Stock_Piled" Type="Boolean" />
                <asp:Parameter Name="Batch_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>
                <br />
                <asp:Label ID="lblFinishedProduct" runat="server" Text="Finished Product Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvFinishedProduct" runat="server" style="margin-top: 0px">
                     <asp:Button ID="btnaddFinishedProduct" runat="server" Text="Add" OnClick="btnaddFinishedProduct_Click"/>
                    <asp:GridView ID="gvFinishedProduct" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlFinishedProduct" AutoGenerateColumns="False" DataKeyNames="Batch_ID">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Batch_ID" HeaderText="Batch_ID" ReadOnly="True" SortExpression="Batch_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
                             <asp:BoundField DataField="Manufactured_Date" HeaderText="Manufactured_Date" SortExpression="Manufactured_Date" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:CheckBoxField DataField="Is_Stock_Piled" HeaderText="Is_Stock_Piled" SortExpression="Is_Stock_Piled" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdFinishedProduct" Visible="false" runat="server">
                <asp:Label ID="lblFinishedProductDetails" Text="Enter Finished Product Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblProductID" runat="server" Text="Product:" Width="200px" />
                    <asp:DropDownList ID="dropaddProduct" Width="250px" AppendDataBoundItems="True" EnableViewState="False" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID">
                    </asp:DropDownList>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblManufacturedDate" runat="server" Text="Manufactured Date:" Width="200px" />
                    <asp:TextBox ID="ManufacturedDateTextBox" runat="server" Width="199px"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgManufacturedDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgManufacturedDate_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calManufacturedDate" runat="server" OnSelectionChanged="calManufacturedDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveFinishedProduct" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveFinishedProduct_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelFinishedProduct" runat="server" Text="Cancel" OnClick="btnCancelFinishedProduct_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
