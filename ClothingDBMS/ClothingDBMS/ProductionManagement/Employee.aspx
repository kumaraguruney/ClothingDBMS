<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Management</title>
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
        <asp:SqlDataSource ID="SqlEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Employee] ORDER BY [Employee_Name]" DeleteCommand="DELETE FROM [Employee] WHERE [Employee_ID] = @Employee_ID" InsertCommand="INSERT INTO [Employee] ([Employee_Name], [Address], [Contact_Number], [Date_of_Birth]) VALUES (@Employee_Name, @Address, @Contact_Number, @Date_of_Birth)" UpdateCommand="UPDATE [Employee] SET [Employee_Name] = @Employee_Name, [Address] = @Address, [Contact_Number] = @Contact_Number, [Date_of_Birth] = @Date_of_Birth WHERE [Employee_ID] = @Employee_ID">
            <DeleteParameters>
                <asp:Parameter Name="Employee_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Employee_Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Contact_Number" Type="String" />
                <asp:Parameter Name="Date_of_Birth" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Employee_Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Contact_Number" Type="String" />
                <asp:Parameter Name="Date_of_Birth" Type="String" />
                <asp:Parameter Name="Employee_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbEmployeeHeader" runat="server" Text="Employee- Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddEmployee" runat="server" Text="Add" OnClick="btnaddEmployee_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvEmployee" runat="server">
                    <asp:GridView ID="gvEmployee" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlEmployee" AutoGenerateColumns="False" DataKeyNames="Employee_ID">
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" ReadOnly="True" SortExpression="Employee_ID" />
                            <asp:BoundField DataField="Employee_Name" HeaderText="Employee_Name" SortExpression="Employee_Name" />
                             <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Contact_Number" HeaderText="Contact_Number" SortExpression="Contact_Number" />
                            <asp:BoundField DataField="Date_of_Birth" HeaderText="Date_of_Birth" SortExpression="Date_of_Birth" />
                             <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdEmployee" Visible="false" runat="server">
                <asp:Label ID="lbEmployeeaddTitle" Text="Add Employee into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbEmployeeName" Width="150" Text="Employee Name: " runat="server" />
                    <asp:TextBox ID="txtEmployeeName" ValidationGroup="addEmployeeValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvEmployeeName" ValidationGroup="addEmployeeValidation" runat="server" ControlToValidate="txtEmployeeName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblEmployeeAddress" Width="150" Text="Address: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtEmployeeAddress" runat="server"></asp:TextBox><br />
                    <asp:Label ID="lblEmployeeContactNumber" Width="150" Text="Contact Number: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtEmployeeContactNumber" runat="server"></asp:TextBox><br />
                    <asp:Label ID="lblEmployeeDOB" Width="150" Text="Date of Birth: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtEmployeeDOB" runat="server"></asp:TextBox><br />
                    <br /> <br />
                    <asp:Button ID="btnSaveEmployee" ValidationGroup="addEmployeeValidation" runat="server" Text="Save" OnClick="btnSaveEmployee_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelEmployee" runat="server" Text="Cancel" OnClick="btnCancelEmployee_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>



