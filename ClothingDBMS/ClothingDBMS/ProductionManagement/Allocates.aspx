<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Allocates.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Allocates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Allocation</title>
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
        <asp:SqlDataSource ID="SqlAllocates" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT Allocates.Allocates_ID, Allocates.Workschedule_ID, Allocates.Employee_ID, Employee.Employee_Name, ProductDesign.Design_Name FROM Allocates LEFT OUTER JOIN Employee ON Employee.Employee_ID = Allocates.Employee_ID LEFT OUTER JOIN Workschedule ON Workschedule.Workschedule_ID = Allocates.Workschedule_ID LEFT OUTER JOIN WorkOrder ON WorkOrder.WorkOrder_ID = Workschedule.WorkOrder_ID LEFT OUTER JOIN ProductDesign ON WorkOrder.Design_ID = ProductDesign.Design_ID ORDER BY Allocates.Workschedule_ID" DeleteCommand="DELETE FROM [Allocates] WHERE [Allocates_ID] = @Allocates_ID" InsertCommand="INSERT INTO [Allocates] ([Workschedule_ID], [Employee_ID]) VALUES (@Workschedule_ID, @Employee_ID)" UpdateCommand="UPDATE [Allocates] SET [Workschedule_ID] = @Workschedule_ID, [Employee_ID] = @Employee_ID WHERE [Allocates_ID] = @Allocates_ID">
            <DeleteParameters>
                <asp:Parameter Name="Allocates_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
                <asp:Parameter Name="Employee_ID" Type="Byte" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
                <asp:Parameter Name="Employee_ID" Type="Byte" />
                <asp:Parameter Name="Allocates_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWorkSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT Workschedule.Workschedule_ID, Workschedule.WorkOrder_ID, WorkOrder.Design_ID, ProductDesign.Design_Name FROM Workschedule LEFT OUTER JOIN WorkOrder ON WorkOrder.WorkOrder_ID = Workschedule.WorkOrder_ID LEFT OUTER JOIN ProductDesign ON ProductDesign.Design_ID = WorkOrder.Design_ID ORDER BY Workschedule.WorkOrder_ID"></asp:SqlDataSource>
            <div align="center">
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Employee Allocates to Work Schedule" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddAllocates" runat="server" Text="Add" OnClick="btnaddAllocates_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvAllocates" runat="server">
                    <asp:GridView ID="gvAllocates" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlAllocates" AutoGenerateColumns="False" DataKeyNames="Allocates_ID">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" HeaderText="Edit"/>
                            <asp:BoundField DataField="Allocates_ID" HeaderText="Allocates_ID" ReadOnly="True" SortExpression="Allocates_ID" />
                            <asp:BoundField DataField="Workschedule_ID" HeaderText="Workschedule_ID" Visible="false" SortExpression="Workschedule_ID" />
                             <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" Visible="false" SortExpression="Employee_ID" />
                            <asp:TemplateField HeaderText="Employee_Name" SortExpression="Employee_Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropEmployee" runat="server" DataSourceID="SqlEmployee" SelectedValue='<%# Bind("Employee_ID") %>' DataTextField="Employee_Name" DataValueField="Employee_ID"></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Design_Name" SortExpression="Design_Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropWorkschedule" runat="server" DataSourceID="SqlWorkSchedule" SelectedValue='<%# Bind("Workschedule_ID") %>' DataTextField="Design_Name" DataValueField="Workschedule_ID"></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDesignName" runat="server" Text='<%# Bind("Design_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdAllocates" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesaddTitle" Text=" Allocate Employee to a Work Schedule in the Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblAllocatesEmployee" Width="200" Text="Employee: " runat="server" />
                    <asp:DropDownList ID="dropEmployee" runat="server" DataSourceID="SqlEmployee" DataTextField="Employee_Name" DataValueField="Employee_ID"></asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvWorkschedule" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropEmployee" ErrorMessage="(*) One Employee should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblIncludesWorkscheduleID" Width="200" Text="Workschedule ID: " runat="server" />
                    <asp:DropDownList ID="dropWorkschedule" runat="server" DataSourceID="SqlWorkSchedule" DataTextField="Design_Name" DataValueField="Workschedule_ID"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropWorkschedule" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropWorkschedule" ErrorMessage="(*) One Employee should be Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <br /> <br />
                    <asp:Button ID="btnSaveAllocates" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveAllocates_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelAllocates" runat="server" Text="Cancel" OnClick="btnCancelAllocates_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>




