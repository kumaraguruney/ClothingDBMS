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
        <asp:SqlDataSource ID="SqlMachinery" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Machinery] ORDER BY [Machine_Name]" DeleteCommand="DELETE FROM [Machinery] WHERE [Machine_ID] = @Machine_ID" InsertCommand="INSERT INTO [Machinery] ([Machine_Name], [Machine_Date_Of_Commission], [Machine_Is_Active]) VALUES (@Machine_Name, @Machine_Date_Of_Commission, @Machine_Is_Active)" UpdateCommand="UPDATE [Machinery] SET [Machine_Name] = @Machine_Name, [Machine_Date_Of_Commission] = @Machine_Date_Of_Commission, [Machine_Is_Active] = @Machine_Is_Active WHERE [Machine_ID] = @Machine_ID">
            <DeleteParameters>
                <asp:Parameter Name="Machine_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Machine_Name" Type="String" />
                <asp:Parameter Name="Machine_Date_Of_Commission" Type="DateTime" />
                <asp:Parameter Name="Machine_Is_Active" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Machine_Name" Type="String" />
                <asp:Parameter Name="Machine_Date_Of_Commission" Type="DateTime" />
                <asp:Parameter Name="Machine_Is_Active" Type="Boolean" />
                <asp:Parameter Name="Machine_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbMachineryHeader" runat="server" Text="Machinery - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Panel ID="PanelgvMachinery" runat="server">
                <asp:Button ID="btaddMachinery" runat="server" Text="Add" OnClick="btaddMachinery_Click"/>
                <br /> <br />
                
                    <asp:GridView ID="gvMachinery" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlMachinery" AutoGenerateColumns="False" DataKeyNames="Machine_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:CheckBoxField DataField="Machine_Is_Active" ItemStyle-HorizontalAlign="Center" HeaderText="Active" SortExpression="Machine_Is_Active" />
                            <asp:BoundField DataField="Machine_ID" HeaderText="Machine ID" ItemStyle-HorizontalAlign="Left" ReadOnly="True" SortExpression="Machine_ID" />
                            <asp:BoundField DataField="Machine_Name" HeaderText="Machine Name" ItemStyle-HorizontalAlign="Center" SortExpression="Machine_Name" />
                             <asp:BoundField DataField="Machine_Date_Of_Commission" DataFormatString="{0:MM/dd/yyyy}" ItemStyle-HorizontalAlign="Center" HeaderText="Machine DOC" SortExpression="Machine_Date_Of_Commission" />
                            
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
                <asp:Panel ID="PaneladdMachinery" Visible="false" runat="server">
                <asp:Label ID="lbMachineryaddTitle" Text="Add Machinery into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblMachineActive" Text="Machine Active: " width="150"  runat="server" />
                    <asp:RadioButtonList ID="rbMachineActive" width="250" RepeatDirection="Horizontal" CssClass="in-line" TextAlign="Right" runat="server">
                        <asp:ListItem Value="true" Text="Active"></asp:ListItem>
                        <asp:ListItem Value="false" Text="In-Active"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="rfvMachineActive" width="350" ValidationGroup="addMachineryValidation" runat="server" ControlToValidate="rbMachineActive" ErrorMessage="(*) Must be selected" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    
                    <asp:Label ID="lbMachineryName" Text="Machine Name: " runat="server" />
                    <asp:TextBox ID="txtMachineryName" ValidationGroup="addMachineryValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvMachineryName" ValidationGroup="addMachineryValidation" runat="server" ControlToValidate="txtMachineryName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblMachineDOC" Width="150" Text="Date of Commission: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtMachineDOC" ValidationGroup="addMachineryValidation" runat="server"></asp:TextBox><asp:Calendar ID="calMachineDOC" OnSelectionChanged="calMachineDOC_SelectionChanged" runat="server"></asp:Calendar><br />
                    <asp:RequiredFieldValidator ID="rfvMachineDOC" ValidationGroup="addMachineryValidation" runat="server" ControlToValidate="txtMachineDOC" ErrorMessage="(*) Must have a Date of Commission" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                    <asp:Button ID="btnSaveMachinery" ValidationGroup="addMachineryValidation" runat="server" Text="Save" OnClick="btnSaveMachinery_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelMachinery" runat="server" Text="Cancel" OnClick="btnCancelMachinery_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>


