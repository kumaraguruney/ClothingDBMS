<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RawMaterial.aspx.cs" Inherits="ProductionManagement.ProductionManagement.RawMaterial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Raw Material Management</title>
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
        <asp:SqlDataSource ID="SqlRawmaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT RawMaterial.RawMaterial_ID, RawMaterial.RawMaterial_Name, RawMaterial.RawMaterial_Color, RawMaterial.RawMaterial_Description, Code.Code_Description FROM RawMaterial LEFT OUTER JOIN Code ON Code.Code_ID = RawMaterial.RawMaterial_Color ORDER BY RawMaterial.RawMaterial_Name" DeleteCommand="DELETE FROM [RawMaterial] WHERE [RawMaterial_ID] = @RawMaterial_ID" InsertCommand="INSERT INTO [RawMaterial] ([RawMaterial_Name], [RawMaterial_Color], [RawMaterial_Description]) VALUES (@RawMaterial_Name, @RawMaterial_Color, @RawMaterial_Description)" UpdateCommand="UPDATE [RawMaterial] SET [RawMaterial_Name] = @RawMaterial_Name, [RawMaterial_Color] = @RawMaterial_Color, [RawMaterial_Description] = @RawMaterial_Description WHERE [RawMaterial_ID] = @RawMaterial_ID">
            <DeleteParameters>
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RawMaterial_Name" Type="String" />
                <asp:Parameter Name="RawMaterial_Color" Type="Int16" />
                <asp:Parameter Name="RawMaterial_Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RawMaterial_Name" Type="String" />
                <asp:Parameter Name="RawMaterial_Color" Type="Int16" />
                <asp:Parameter Name="RawMaterial_Description" Type="String" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCodeColor" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Code_ID, Code_Type, Code_Description FROM Code WHERE (Code_Type = 'COLOR') ORDER BY Code_Type"></asp:SqlDataSource>
            <div align="center">
                <br />
                <asp:Label ID="lbRawmaterialHeader" runat="server" Text="Raw Material - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btaddRawmaterial" runat="server" Text="Add" OnClick="btaddRawmaterial_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvRawmaterial" runat="server">
                    <asp:GridView ID="gvRawmaterial" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlRawmaterial" AutoGenerateColumns="False" DataKeyNames="RawMaterial_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" InsertVisible="False" ReadOnly="True" SortExpression="RawMaterial_ID" Visible="true" />
                            <asp:BoundField DataField="RawMaterial_Name" HeaderText="RawMaterial_Name" SortExpression="RawMaterial_Name" />
                            <asp:TemplateField HeaderText="RawMaterial_Color" SortExpression="RawMaterial_Color">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropRawmaterialcolor" runat="server" DataSourceID="SqlCodeColor" DataTextField="Code_Description" DataValueField="Code_ID" SelectedValue='<%# Bind("RawMaterial_Color") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRawmaterialcolor" runat="server" Text='<%# Bind("Code_Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RawMaterial_Description" HeaderText="RawMaterial_Description" SortExpression="RawMaterial_Description" />
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
                <asp:Panel ID="PaneladdRawMaterial" Visible="false" runat="server">
                <asp:Label ID="lbRawmaterialaddTitle" Text="Add Raw Material into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbRawmaterialName" Width="150" Text="Raw Material Name: " runat="server" />
                    <asp:TextBox ID="txtRawmaterialName" Width="200" ValidationGroup="addRawmaterailValidation" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRawmaterialName" Width="300" ValidationGroup="addRawmaterailValidation" runat="server" ControlToValidate="txtRawmaterialName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblRawmaterialColor" Width="150" Text="Raw Material Color: " runat="server" />
                    <asp:DropDownList ID="dropRawmaterialcolor" Width="200" runat="server" DataSourceID="SqlCodeColor" DataTextField="Code_Description" DataValueField="Code_ID">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvRawmaterialColor" Width="300" ValidationGroup="addRawmaterailValidation" runat="server" ControlToValidate="dropRawmaterialcolor" ErrorMessage="(*) Must have some Color" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblRawmaterialDescription" Width="150" Text="Raw Material Description: " runat="server" />
                    <asp:TextBox ID="txtRawmaterialDescription" Width="200" ValidationGroup="addRawmaterailValidation" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRawmaterialDescription" Width="300" ValidationGroup="addRawmaterailValidation" runat="server" ControlToValidate="txtRawmaterialDescription" ErrorMessage="(*) Must have some Description" ForeColor="Red"></asp:RequiredFieldValidator><br />

                    <asp:Button ID="btnSaveRawmaterial" ValidationGroup="addRawmaterailValidation" runat="server" Text="Save" OnClick="btnSaveRawmaterial_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelRawmaterial" runat="server" Text="Cancel" OnClick="btnCancelRawmaterial_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
