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
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT * FROM [Product] ORDER BY [Product_Name]" DeleteCommand="DELETE FROM [Product] WHERE [Product_ID] = @Product_ID" InsertCommand="INSERT INTO [Product] ([Product_Name]) VALUES (@Product_Name)" UpdateCommand="UPDATE [Product] SET [Product_Name] = @Product_Name WHERE [Product_ID] = @Product_ID">
            <DeleteParameters>
                <asp:Parameter Name="Product_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_Name" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_Name" Type="String" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbProductHeader" runat="server" Text="Product - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btaddProduct" runat="server" Text="Add" OnClick="btaddProduct_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvProduct" runat="server">
                    <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProduct" AutoGenerateColumns="False" DataKeyNames="Product_ID">
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Product_ID" HeaderText="Product ID" InsertVisible="False" ReadOnly="True" SortExpression="Product_ID" />
                            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" SortExpression="Product_Name" />
                             <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdProduct" Visible="false" runat="server">
                <asp:Label ID="lbProductaddTitle" Text="Add Product into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbProductName" Text="Product Name: " runat="server" />
                    <asp:TextBox ID="txtProductName" ValidationGroup="addProductValidation" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProductName" ValidationGroup="addProductValidation" runat="server" ControlToValidate="txtProductName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br /> <br />
                    <asp:Button ID="btnSaveProduct" ValidationGroup="addProductValidation" runat="server" Text="Save" OnClick="btnSaveProduct_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelProduct" runat="server" Text="Cancel" OnClick="btnCancelProduct_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>

