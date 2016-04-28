<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Require.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Require" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Requires </title>
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
        <asp:SqlDataSource ID="SqlRequires" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Require.Require_ID, Require.Product_ID, Require.RawMaterial_ID, Require.RawMaterial_Quantity, Design.Design_Name + ', ' + code_1.Code_Description + ', ' + Code.Code_Description + ', ' + code_3.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Product_Name, RawMaterial.RawMaterial_Name + ', ' + code_2.Code_Description + ', ' + ISNULL(RawMaterial.RawMaterial_Description, ' ') AS Rawmaterial_Name FROM Require LEFT OUTER JOIN Product ON Require.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Design.Design_Section LEFT OUTER JOIN RawMaterial ON Require.RawMaterial_ID = Require.RawMaterial_ID LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = RawMaterial.RawMaterial_Color ORDER BY Design.Design_Name" DeleteCommand="DELETE FROM [Require] WHERE [Require_ID] = @Require_ID" InsertCommand="INSERT INTO Require(Product_ID, RawMaterial_ID, RawMaterial_Quantity) VALUES (@Product_ID, @RawMaterial_ID, @RawMaterial_Quantity)" UpdateCommand="UPDATE Require SET Product_ID = @Product_ID, RawMaterial_ID = @RawMaterial_ID, RawMaterial_Quantity = @RawMaterial_Quantity WHERE (Require_ID = @Require_ID)">
            <DeleteParameters>
                <asp:Parameter Name="Require_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_ID" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial_Quantity" Type="Byte" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_ID" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial_Quantity" Type="Byte" />
                <asp:Parameter Name="Require_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlRequireDrop" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT Require.Product_ID, Design.Design_Name + ', ' + code_1.Code_Description + ', ' + Code.Code_Description + ', ' + code_3.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Product_Name FROM Require LEFT OUTER JOIN Product ON Require.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Design.Design_Section ORDER BY Product_Name" />
        
        <asp:SqlDataSource ID="SqlRawmaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT RawMaterial.RawMaterial_ID, RawMaterial.RawMaterial_Name + ',' + Code.Code_Description + ', ' + RawMaterial.RawMaterial_Description AS RawMaterial_Name FROM RawMaterial LEFT OUTER JOIN Code ON Code.Code_ID = RawMaterial.RawMaterial_Color"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Product.Design_ID, Product.Size, Product.Color, Product.Product_Description, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>
            <div align="center">
                <br />
                <asp:Label ID="lbRequireHeader" runat="server" Text="Product Requirement - Management" Font-Bold="true"></asp:Label> <br /> <br />
                
                <asp:Panel ID="PanelgvProductRequire" runat="server">
                    <asp:Label ID="lblRequiresFilter" runat="server" Text="Please Select a Design and Click Filter: " Font-Bold="true"></asp:Label>
                <asp:DropDownList ID="droprequire" width="300" DataSourceID="SqlRequireDrop" AppendDataBoundItems="true" DataTextField="Product_Name"  DataValueField="Product_ID" runat="server">
                <asp:ListItem Text="--- Please Select a Design ---" Value="-1"></asp:ListItem>
                </asp:DropDownList> &nbsp; &nbsp; <asp:Button ID="btnProductRequirefilter" runat="server" Text="Filter" OnClick="btnProductRequirefilter_Click"/> &nbsp; &nbsp; <asp:Button ID="btnProductRequireClear" runat="server" Text="Clear" OnClick="btnProductRequireClear_Click"/> &nbsp;&nbsp;
                <asp:Button ID="btaddProductRequire" runat="server" Text="Add" OnClick="btaddProductRequire_Click"/>
                <br /> <br />
                    <asp:GridView ID="gvProductRequire" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlRequires" AutoGenerateColumns="False" DataKeyNames="Require_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" >
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Require_ID" HeaderText="Require_ID" InsertVisible="False" ReadOnly="true" SortExpression="Require_ID" />
                            <asp:TemplateField HeaderText="Product_Name" SortExpression="Product_Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropProductName" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID" SelectedValue='<%# Bind("Product_ID") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RawMaterial_Name" SortExpression="RawMaterial_Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropRawMaterialName" runat="server" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID" SelectedValue='<%# Bind("RawMaterial_ID") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRawMaterialName" runat="server" Text='<%# Bind("RawMaterial_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RawMaterial_Quantity" HeaderText="RawMaterial_Quantity" SortExpression="RawMaterial_Quantity" />
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <EditRowStyle BackColor="Yellow" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdProductRequire" Visible="false" runat="server">
                    
                <asp:Label ID="lbProductRequireaddTitle" Text="Add Required Raw Material(s) for particular Design into Database" runat="server" /><br /> <br />
                    <div class="form-group form-horizontal col-md-8" >
                    <asp:Label ID="lblRequireProduct" Width="200" Text="Product: " runat="server" />
                    <asp:DropDownList ID="dropProduct" runat="server" width="350" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID">
                    </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvdropProduct" ValidationGroup="addProductRequireValidation" runat="server" ControlToValidate="dropProduct" ErrorMessage="(*) Must have one Design Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblRequireRawmaterial" Width="200" Text="Raw Material : " runat="server" />
                    <asp:DropDownList ID="dropRawmaterial"  width="350" runat="server" DataSourceID="SqlRawmaterial" DataTextField="Rawmaterial_Name" DataValueField="Rawmaterial_ID"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvProductRequiredRM" ValidationGroup="addProductRequireValidation" runat="server" ControlToValidate="dropRawmaterial" ErrorMessage="(*) Must have one Raw Material Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblRawmaterialQty" Width="200" Text="RawMaterial Quantity: " runat="server" />
                    <asp:TextBox ID="txtRawmaterialQty" width="350" ValidationGroup="addProductRequireValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvRawmaterialQty" width="350" ValidationGroup="addProductRequireValidation" runat="server" ControlToValidate="txtRawmaterialQty" ErrorMessage="(*) Must have Quantity filled" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                        <br /> <br />
                    <asp:Button ID="btnSaveProductRequire" ValidationGroup="addProductRequireValidation" runat="server" Text="Save" OnClick="btnSaveProductRequire_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelProductRequire" runat="server" Text="Cancel" OnClick="btnCancelProductRequire_Click"/>
                        </div>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>

