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
        <asp:SqlDataSource ID="SqlRawmaterial" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_Name]" DeleteCommand="DELETE FROM [RawMaterial] WHERE [RawMaterial_ID] = @RawMaterial_ID" InsertCommand="INSERT INTO [RawMaterial] ([RawMaterial_Name]) VALUES (@RawMaterial_Name)" UpdateCommand="UPDATE [RawMaterial] SET [RawMaterial_Name] = @RawMaterial_Name WHERE [RawMaterial_ID] = @RawMaterial_ID">
            <DeleteParameters>
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RawMaterial_Name" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RawMaterial_Name" Type="String" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbRawmaterialHeader" runat="server" Text="Raw Material - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btaddRawmaterial" runat="server" Text="Add" OnClick="btaddRawmaterial_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvRawmaterial" runat="server">
                    <asp:GridView ID="gvRawmaterial" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlRawmaterial" AutoGenerateColumns="False" DataKeyNames="RawMaterial_ID">
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial ID" InsertVisible="False" ReadOnly="True" Visible="true" SortExpression="RawMaterial_ID" />
                            <asp:BoundField DataField="RawMaterial_Name" HeaderText="RawMaterial Name" SortExpression="RawMaterial_Name" />
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdRawMaterial" Visible="false" runat="server">
                <asp:Label ID="lbRawmaterialaddTitle" Text="Add Raw Material into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbRawmaterialName" Text="Raw Material Name: " runat="server" />
                    <asp:TextBox ID="txtRawmaterialName" ValidationGroup="addRawmaterailValidation" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRawmaterialName" ValidationGroup="addRawmaterailValidation" runat="server" ControlToValidate="txtRawmaterialName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                    <asp:Button ID="btnSaveRawmaterial" ValidationGroup="addRawmaterailValidation" runat="server" Text="Save" OnClick="btnSaveRawmaterial_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelRawmaterial" runat="server" Text="Cancel" OnClick="btnCancelRawmaterial_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
