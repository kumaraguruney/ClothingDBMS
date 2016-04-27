<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Management</title>
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
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Product.Product_Is_Active, Product.Product_Name, Product.Product_Section, Code.Code_Description FROM Product LEFT OUTER JOIN Code ON Code.Code_ID = Product.Product_Section ORDER BY Product.Product_Name" DeleteCommand="DELETE FROM [Product] WHERE [Product_ID] = @Product_ID" InsertCommand="INSERT INTO [Product] ([Product_Is_Active], [Product_Name], [Product_Section]) VALUES (@Product_Is_Active, @Product_Name, @Product_Section)" UpdateCommand="UPDATE [Product] SET [Product_Is_Active] = @Product_Is_Active, [Product_Name] = @Product_Name, [Product_Section] = @Product_Section WHERE [Product_ID] = @Product_ID">
            <DeleteParameters>
                <asp:Parameter Name="Product_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_Is_Active" Type="Boolean" />
                <asp:Parameter Name="Product_Name" Type="String" />
                <asp:Parameter Name="Product_Section" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_Is_Active" Type="Boolean" />
                <asp:Parameter Name="Product_Name" Type="String" />
                <asp:Parameter Name="Product_Section" Type="Int16" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>


            <asp:SqlDataSource ID="SqlSection" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Code_ID, Code_Type, Code_Description FROM Code WHERE (Code_Type = 'SECT') ORDER BY Code_Description"></asp:SqlDataSource>


            <div align="center">
                <br />
                <asp:Label ID="lbProductHeader" runat="server" Text="Product - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btaddProduct" runat="server" Text="Add" OnClick="btaddProduct_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvProduct" runat="server">
                    <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProduct" AutoGenerateColumns="False" DataKeyNames="Product_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Product_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Product_ID" />
                            <asp:CheckBoxField DataField="Product_Is_Active" HeaderText="Active" ItemStyle-HorizontalAlign="Center" SortExpression="Product_Is_Active">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" SortExpression="Product_Name" />
                            <asp:TemplateField HeaderText="Product Section" SortExpression="Product_Section">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropSection" runat="server" DataSourceID="SqlSection" DataTextField="Code_Description" DataValueField="Code_ID" SelectedValue='<%# Bind("Product_Section") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblProduct_Section" runat="server" Text='<%# Bind("Code_Description") %>'></asp:Label>
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
                <asp:Label ID="lbProductaddTitle" Text="Add Product into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblProductActive" Text="Product Active: " width="150"  runat="server" />
                    <asp:RadioButtonList ID="rbProductActive" width="250" RepeatDirection="Horizontal" CssClass="inline" TextAlign="Right" runat="server">
                        <asp:ListItem Value="true" Text="Active"></asp:ListItem>
                        <asp:ListItem Value="false" Text="In-Active"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="rfvProductActive" width="350" ValidationGroup="addProductValidation" runat="server" ControlToValidate="rbProductActive" ErrorMessage="(*) Must be selected" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:Label ID="lbProductName" Text="Product Name: " width="150" runat="server" />
                    <asp:TextBox ID="txtProductName" width="250" ValidationGroup="addProductValidation" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProductName" width="350" ValidationGroup="addProductValidation" runat="server" ControlToValidate="txtProductName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:Label ID="lblProductSection" Text="Product Section: " width="150" runat="server" ></asp:Label>
                    <asp:DropDownList ID="dropSection" runat="server" DataSourceID="SqlSection" width="250" DataTextField="Code_Description" DataValueField="Code_ID"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvdropSection" width="350" ValidationGroup="addProductValidation" runat="server" ControlToValidate="dropSection" ErrorMessage="(*) Must have Section" ForeColor="Red"></asp:RequiredFieldValidator><br /> <br />
                    <asp:Button ID="btnSaveProduct" ValidationGroup="addProductValidation" runat="server" Text="Save" OnClick="btnSaveProduct_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelProduct" runat="server" Text="Cancel" OnClick="btnCancelProduct_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>

