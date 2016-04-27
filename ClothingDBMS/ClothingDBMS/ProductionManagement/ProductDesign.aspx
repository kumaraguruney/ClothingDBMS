<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDesign.aspx.cs" Inherits="ProductionManagement.ProductionManagement.ProductDesign" %>


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
        <asp:SqlDataSource ID="SqlDesign" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT ProductDesign.Design_ID, ProductDesign.Product_ID, ProductDesign.Size, ProductDesign.Color, ProductDesign.Design_Description, Code.Code_Description AS Design_Size, Code_1.Code_Description AS Design_Color, Product.Product_Name + ', ' + Code_2.Code_Description AS Name FROM ProductDesign LEFT OUTER JOIN Code ON Code.Code_ID = ProductDesign.Size LEFT OUTER JOIN Code AS Code_1 ON Code_1.Code_ID = ProductDesign.Color LEFT OUTER JOIN Product ON ProductDesign.Product_ID = Product.Product_ID LEFT OUTER JOIN Code AS Code_2 ON Code_2.Code_ID = Product.Product_Section ORDER BY Product.Product_Name" DeleteCommand="DELETE FROM [ProductDesign] WHERE [Design_ID] = @Design_ID" InsertCommand="INSERT INTO [ProductDesign] ([Product_ID], [Size], [Color], [Design_Description]) VALUES (@Product_ID, @Size, @Color, @Design_Description)" UpdateCommand="UPDATE [ProductDesign] SET [Product_ID] = @Product_ID, [Size] = @Size, [Color] = @Color, [Design_Description] = @Design_Description WHERE [Design_ID] = @Design_ID">
            <DeleteParameters>
                <asp:Parameter Name="Design_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_ID" Type="String" />
                <asp:Parameter Name="Size" Type="Int16" />
                <asp:Parameter Name="Color" Type="Int16" />
                <asp:Parameter Name="Design_Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_ID" Type="String" />
                <asp:Parameter Name="Size" Type="Int16" />
                <asp:Parameter Name="Color" Type="Int16" />
                <asp:Parameter Name="Design_Description" Type="String" />
                <asp:Parameter Name="Design_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlCodeSize" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Code_ID, Code_Type, Code_Description FROM Code WHERE (Code_Type = 'SIZE')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCodeColor" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Code_ID, Code_Type, Code_Description FROM Code WHERE (Code_Type = 'COLOR')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Product.Product_Is_Active, Product.Product_Name + ', ' + Code.Code_Description AS Name, Product.Product_Section FROM Product LEFT OUTER JOIN Code ON Product.Product_Section = Code.Code_ID WHERE (Product.Product_Is_Active = 'true') ORDER BY Product.Product_Name"></asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbProductDesignHeader" runat="server" Text="Product Design - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btaddProductdesign" runat="server" Text="Add" OnClick="btaddProductdesign_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvProductDesign" runat="server">
                    <asp:GridView ID="gvProductDesign" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDesign" AutoGenerateColumns="False" DataKeyNames="Design_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Design_ID" HeaderText="Design_ID" InsertVisible="False" ReadOnly="True" SortExpression="Design_ID" />
                            <asp:TemplateField HeaderText="Product_Name" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropProductName" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID" SelectedValue='<%# Bind("Product_ID") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Size" SortExpression="Design_Size">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropSize" runat="server" DataSourceID="SqlCodeSize" DataTextField="Code_Description" DataValueField="Code_ID" SelectedValue='<%# Bind("Size") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSize" runat="server" Text='<%# Bind("Design_Size") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Color" SortExpression="Design_Color">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropColor" runat="server" DataSourceID="SqlCodeColor" DataTextField="Code_Description" DataValueField="Code_ID" SelectedValue='<%# Bind("Color") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblColor" runat="server" Text='<%# Bind("Design_Color") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Design_Description" HeaderText="Design_Description" SortExpression="Design_Description" />
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
                <asp:Panel ID="PaneladdProductdesign" Visible="false" runat="server">
                <asp:Label ID="lbProductdesignaddTitle" Text="Add Design into Database" runat="server" /><br /> <br />
                    <div class="form-group form-horizontal col-md-8" >
                        <asp:Label ID="lbProductDesignName" Width="200" align="right" Text="Product Name: " runat="server" />
                        <asp:DropDownList ID="dropProductName" Width="200" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID"/><br />
                        <asp:RequiredFieldValidator ID="rfvProductDesignName" ValidationGroup="addProductDesignValidation" runat="server" ControlToValidate="dropProductName" ErrorMessage="(*) Must have Product Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="lblProductDesignSize" Width="200"  align="right" Text="Size: " runat="server" />
                        <asp:DropDownList ID="dropProductSize" runat="server" Width="200" DataSourceID="SqlCodeSize" DataTextField="Code_Description" DataValueField="Code_ID" /><br />
                        <asp:RequiredFieldValidator ID="rfvdropsize" ValidationGroup="addProductDesignValidation" runat="server" ControlToValidate="dropProductSize" ErrorMessage="(*) Must have a Size" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="lblProductDesignColor" Width="200" align="right" Text="Color: " runat="server" />
                        <asp:DropDownList ID="dropProductColor" runat="server" Width="200" DataSourceID="SqlCodeColor" DataTextField="Code_Description" DataValueField="Code_ID" /><br />
                        <asp:RequiredFieldValidator ID="rfvdropColor" ValidationGroup="addProductDesignValidation" runat="server" ControlToValidate="dropProductColor" ErrorMessage="(*) Must have a Color" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="lbProductDesignDescription" align="right" Width="200" Text="Description: " runat="server" />
                        <asp:TextBox ID="txtProductDesignDescription" Width="200"  ValidationGroup="addProductDesignValidation" runat="server" ></asp:TextBox><br />
                        <br /> <br />
                        <asp:Button ID="btnSaveProductDesign" ValidationGroup="addProductDesignValidation" runat="server" Text="Save" OnClick="btnSaveProductDesign_Click"/> &nbsp;&nbsp;
                        <asp:Button ID="btnCancelProductDesign" runat="server" Text="Cancel" OnClick="btnCancelProductDesign_Click"/>
                    </div>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>

