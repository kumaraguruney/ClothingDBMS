<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Product" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Design - Management</title>
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
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Design_ID, Product.Product_ID, Product.Size, Product.Color, Product.Product_Description, Code.Code_Description AS Product_Size, Code_1.Code_Description AS Product_Color, Design.Design_Name + ', ' + Code_2.Code_Description AS Name FROM Product LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS Code_1 ON Code_1.Code_ID = Product.Color LEFT OUTER JOIN Design ON Product.Design_ID = Design.Design_ID LEFT OUTER JOIN Code AS Code_2 ON Code_2.Code_ID = Design.Design_Section ORDER BY Design.Design_Name" DeleteCommand="DELETE FROM [Product] WHERE [Product_ID] = @Product_ID" InsertCommand="INSERT INTO [Product] ([Design_ID], [Size], [Color], [Product_Description]) VALUES (@Design_ID, @Size, @Color, @Product_Description)" UpdateCommand="UPDATE [Product] SET [Design_ID] = @Design_ID, [Size] = @Size, [Color] = @Color, [Product_Description] = @Product_Description WHERE [Product_ID] = @Product_ID">
            <DeleteParameters>
                <asp:Parameter Name="Product_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="Size" Type="Int16" />
                <asp:Parameter Name="Color" Type="Int16" />
                <asp:Parameter Name="Product_Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="Size" Type="Int16" />
                <asp:Parameter Name="Color" Type="Int16" />
                <asp:Parameter Name="Product_Description" Type="String" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlCodeSize" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Code_ID, Code_Type, Code_Description FROM Code WHERE (Code_Type = 'SIZE')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCodeColor" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Code_ID, Code_Type, Code_Description FROM Code WHERE (Code_Type = 'COLOR')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDesign" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Design.Design_ID, Design.Design_Is_Active, Design.Design_Name + ', ' + Code.Code_Description AS Name, Design.Design_Section FROM Design LEFT OUTER JOIN Code ON Design.Design_Section = Code.Code_ID WHERE (Design.Design_Is_Active = 'true') ORDER BY Design.Design_Name"></asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbProductHeader" runat="server" Text="Product - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddProduct" runat="server" Text="Add" OnClick="btnaddProduct_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvProduct" runat="server">
                    <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProduct" AutoGenerateColumns="False" DataKeyNames="Product_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Product_ID" HeaderText="Product ID" InsertVisible="False" ReadOnly="True" SortExpression="Product_ID" />
                            <asp:TemplateField HeaderText="Design Name" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropDesignName" runat="server" DataSourceID="SqlDesign" DataTextField="Name" DataValueField="Design_ID" SelectedValue='<%# Bind("Design_ID") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDesignName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Size" SortExpression="Product_Size">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropSize" runat="server" DataSourceID="SqlCodeSize" DataTextField="Code_Description" DataValueField="Code_ID" SelectedValue='<%# Bind("Size") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSize" runat="server" Text='<%# Bind("Product_Size") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Color" SortExpression="Product_Color">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropColor" runat="server" DataSourceID="SqlCodeColor" DataTextField="Code_Description" DataValueField="Code_ID" SelectedValue='<%# Bind("Color") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblColor" runat="server" Text='<%# Bind("Product_Color") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Product_Description" HeaderText="Product Description" SortExpression="Product_Description" />
                             <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                 </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <EditRowStyle BackColor="Yellow"/>
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdProduct" Visible="false" runat="server">
                <asp:Label ID="lbProductaddTitle" Text="Add Product to Database" runat="server" /><br /> <br />
                    <div class="form-group form-horizontal col-md-8" >
                        <asp:Label ID="lbProductName" Width="200" align="right" Text="Design Name: " runat="server" />
                        <asp:DropDownList ID="dropDesignName" Width="200" runat="server" DataSourceID="SqlDesign" DataTextField="Name" DataValueField="Design_ID"/><br />
                        <asp:RequiredFieldValidator ID="rfvProductName" ValidationGroup="addProductValidation" runat="server" ControlToValidate="dropDesignName" ErrorMessage="(*) Must have Design Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="lblProductSize" Width="200"  align="right" Text="Size: " runat="server" />
                        <asp:DropDownList ID="dropProductSize" runat="server" Width="200" DataSourceID="SqlCodeSize" DataTextField="Code_Description" DataValueField="Code_ID" /><br />
                        <asp:RequiredFieldValidator ID="rfvdropsize" ValidationGroup="addProductValidation" runat="server" ControlToValidate="dropProductSize" ErrorMessage="(*) Must have a Size" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="lblProductColor" Width="200" align="right" Text="Color: " runat="server" />
                        <asp:DropDownList ID="dropProductColor" runat="server" Width="200" DataSourceID="SqlCodeColor" DataTextField="Code_Description" DataValueField="Code_ID" /><br />
                        <asp:RequiredFieldValidator ID="rfvdropColor" ValidationGroup="addProductValidation" runat="server" ControlToValidate="dropProductColor" ErrorMessage="(*) Must have a Color" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="lbProductDescription" align="right" Width="200" Text="Description: " runat="server" />
                        <asp:TextBox ID="txtProductDescription" Width="200"  ValidationGroup="addProductValidation" runat="server" ></asp:TextBox><br />
                        <br /> <br />
                        <asp:Button ID="btnSaveProductDesign" ValidationGroup="addProductValidation" runat="server" Text="Save" OnClick="btnSaveProduct_Click"/> &nbsp;&nbsp;
                        <asp:Button ID="btnCancelProductDesign" runat="server" Text="Cancel" OnClick="btnCancelProduct_Click"/>
                    </div>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>

