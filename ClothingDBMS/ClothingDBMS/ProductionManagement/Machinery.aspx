<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Machinery.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Machinery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Machinery Management</title>
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
        <asp:SqlDataSource ID="SqlMachinery" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT * FROM [Machinery] ORDER BY [Machine_Name]" DeleteCommand="DELETE FROM [Machinery] WHERE [Machine_ID] = @Machine_ID" InsertCommand="INSERT INTO [Machinery] ([Machine_Name]) VALUES (@Machine_Name)" UpdateCommand="UPDATE [Machinery] SET [Machine_Name] = @Machine_Name WHERE [Machine_ID] = @Machine_ID">
            <DeleteParameters>
                <asp:Parameter Name="Machine_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Machine_Name" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Machine_Name" Type="String" />
                <asp:Parameter Name="Machine_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbMachineryHeader" runat="server" Text="Machinery - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btaddMachinery" runat="server" Text="Add" OnClick="btaddMachinery_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvMachinery" runat="server">
                    <asp:GridView ID="gvMachinery" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlMachinery" AutoGenerateColumns="False" DataKeyNames="Machine_ID">
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Machine_ID" HeaderText="Machine ID" InsertVisible="False" ReadOnly="True" SortExpression="Machine_ID" />
                            <asp:BoundField DataField="Machine_Name" HeaderText="Machine Name" SortExpression="Machine_Name" />
                             <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdMachinery" Visible="false" runat="server">
                <asp:Label ID="lbMachineryaddTitle" Text="Add Machinery into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbMachineryName" Text="Machine Name: " runat="server" />
                    <asp:TextBox ID="txtMachineryName" ValidationGroup="addMachineryValidation" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMachineryName" ValidationGroup="addMachineryValidation" runat="server" ControlToValidate="txtMachineryName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br /> <br />
                    <asp:Button ID="btnSaveMachinery" ValidationGroup="addMachineryValidation" runat="server" Text="Save" OnClick="btnSaveMachinery_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelMachinery" runat="server" Text="Cancel" OnClick="btnCancelMachinery_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>


