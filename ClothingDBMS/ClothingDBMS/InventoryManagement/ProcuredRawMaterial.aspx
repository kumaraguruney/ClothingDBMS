<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcuredRawMaterial.aspx.cs" Inherits="ClothingDBMS.InventoryManagement.ProcuredRawMaterial" %>

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
        <asp:SqlDataSource ID="SqlProcuredRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT ProcuredRawMaterial.RM_Batch_ID, ProcuredRawMaterial.RawMaterial_ID, ProcuredRawMaterial.Procured_Date, ProcuredRawMaterial.Quantity, ProcuredRawMaterial.Is_Stock_Piled, RawMaterial.RawMaterial_Name + ', ' + RawMaterial.RawMaterial_Description AS RawMaterialName FROM ProcuredRawMaterial LEFT OUTER JOIN RawMaterial ON RawMaterial.RawMaterial_ID = ProcuredRawMaterial.RawMaterial_ID ORDER BY ProcuredRawMaterial.RM_Batch_ID" DeleteCommand="DELETE FROM [ProcuredRawMaterial] WHERE [RM_Batch_ID] = @RM_Batch_ID" InsertCommand="INSERT INTO [ProcuredRawMaterial] ([RawMaterial_ID], [Procured_Date], [Quantity], [Is_Stock_Piled]) VALUES (@RawMaterial_ID, @Procured_Date, @Quantity, @Is_Stock_Piled)" UpdateCommand="UPDATE [ProcuredRawMaterial] SET [RawMaterial_ID] = @RawMaterial_ID, [Procured_Date] = @Procured_Date, [Quantity] = @Quantity, [Is_Stock_Piled] = @Is_Stock_Piled WHERE [RM_Batch_ID] = @RM_Batch_ID">
            <DeleteParameters>
                <asp:Parameter Name="RM_Batch_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="Procured_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Is_Stock_Piled" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="Procured_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Is_Stock_Piled" Type="Boolean" />
                <asp:Parameter Name="RM_Batch_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <div align="center">
        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT RawMaterial.RawMaterial_ID, RawMaterial.RawMaterial_Name + ',' + Code.Code_Description + ', ' + RawMaterial.RawMaterial_Description AS RawMaterial_Name FROM RawMaterial LEFT OUTER JOIN Code ON Code.Code_ID = RawMaterial.RawMaterial_Color"></asp:SqlDataSource>
                <br />
                <asp:Label ID="lblProcuredRawMaterial" runat="server" Text="Procured Raw Material Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvProcuredRawMaterial" runat="server" style="margin-top: 0px">
                    <asp:Button ID="btnaddProcuredRawMaterial" runat="server" Text="Add" OnClick="btnaddProcuredRawMaterial_Click"/>
                    <asp:GridView ID="gvProcuredRawMaterial" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProcuredRawMaterial" AutoGenerateColumns="False" DataKeyNames="RM_Batch_ID">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="RM_Batch_ID" HeaderText="RM_Batch_ID" ReadOnly="True" SortExpression="RM_Batch_ID" InsertVisible="False" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" SortExpression="RawMaterial_ID" />
                             <asp:BoundField DataField="RawMaterialName" HeaderText="RawMaterialName" ReadOnly="True" SortExpression="RawMaterialName" />
                             <asp:BoundField DataField="Procured_Date" HeaderText="Procured_Date" SortExpression="Procured_Date" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdProcuredRawMaterial" Visible="false" runat="server">
                <asp:Label ID="lblFinishedProductDetails" Text="Enter Procured Raw Material Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblRawMaterialID" runat="server" Text="Raw Material:" Width="200px" />
                    <asp:DropDownList ID="dropaddRawMaterial" Width="250px" AppendDataBoundItems="True" EnableViewState="False" runat="server" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID">
                    </asp:DropDownList>
                        
                    <br />
                        
                    <br />
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="199px"></asp:TextBox>
                    
                    <br />
                    <br />
                    <asp:Label ID="lblProcuredDate" runat="server" Text="Procured Date:" Width="200px" />
                    <asp:TextBox ID="ProcuredDateTextBox" runat="server" Width="199px"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgProcuredDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgProcuredDate_Click" Width="25px" />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calProcuredDate" OnSelectionChanged="calProcuredDate_SelectionChanged" runat="server"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnMoveProcuredRawMaterial" ValidationGroup="addAllocatesValidation" runat="server" Text="Move" OnClick="btnMoveProcuredRawMaterial_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelProcuredRawMaterial" runat="server" Text="Cancel" OnClick="btnCancelProcuredRawMaterial_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
