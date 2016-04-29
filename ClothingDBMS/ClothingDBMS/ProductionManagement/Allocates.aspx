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
        <asp:SqlDataSource ID="SqlAllocates" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Allocates.Allocates_ID, Allocates.Workschedule_ID, Allocates.Employee_ID, Allocates.Allocated_Time, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Employee.Employee_Name FROM Allocates LEFT OUTER JOIN Workschedule ON Workschedule.Workschedule_ID = Allocates.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Allocates.Employee_ID order by Name" DeleteCommand="DELETE FROM [Allocates] WHERE [Allocates_ID] = @Allocates_ID" InsertCommand="INSERT INTO [Allocates] ([Workschedule_ID], [Employee_ID], [Allocated_Time]) VALUES (@Workschedule_ID, @Employee_ID, @Allocated_Time)" UpdateCommand="UPDATE [Allocates] SET [Workschedule_ID] = @Workschedule_ID, [Employee_ID] = @Employee_ID, [Allocated_Time] = @Allocated_Time WHERE [Allocates_ID] = @Allocates_ID">
            <DeleteParameters>
                <asp:Parameter Name="Allocates_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
                <asp:Parameter Name="Employee_ID" Type="Byte" />
                <asp:Parameter Name="Allocated_Time" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
                <asp:Parameter Name="Employee_ID" Type="Byte" />
                <asp:Parameter Name="Allocated_Time" Type="String" />
                <asp:Parameter Name="Allocates_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlAllocatesdrop" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Allocates.Workschedule_ID, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name FROM Allocates LEFT OUTER JOIN Workschedule ON Workschedule.Workschedule_ID = Allocates.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Allocates.Employee_ID ORDER BY Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Employee] ORDER BY [Employee_Name]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWorkSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Workschedule.Workschedule_ID, Workschedule.WorkScheduled_Date, Workschedule.WorkScheduled_To_End, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name FROM Workschedule LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section ORDER BY Name"></asp:SqlDataSource>
            <div align="center">
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Employee Allocates to Work Schedule" Font-Bold="true"></asp:Label> <br /> <br />
                 <asp:Panel ID="PanelgvAllocates" runat="server">
                      <asp:Label ID="lblAllocatesFilter" runat="server" Text="Please Select a WorkSchedule and Click Filter: " Font-Bold="true"></asp:Label>
                <asp:DropDownList ID="dropAllocatesSearch" width="300" DataSourceID="SqlAllocatesdrop" AppendDataBoundItems="true" DataTextField="Name"  DataValueField="WorkSchedule_ID" runat="server">
                <asp:ListItem Text="--- Please Select a Work Schedule ---" Value="-1"></asp:ListItem>
                </asp:DropDownList> &nbsp; &nbsp; <asp:Button ID="btnAllocatesfilter" runat="server" Text="Filter" OnClick="btnAllocatesfilter_Click"/> &nbsp; &nbsp; <asp:Button ID="btnAllocatesClear" runat="server" Text="Clear" OnClick="btnAllocatesClear_Click"/> &nbsp;&nbsp;
                 <asp:Button ID="btnaddAllocates" runat="server" Text="Add" OnClick="btnaddAllocates_Click"/>
                <br /> <br />

                    <asp:GridView ID="gvAllocates" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlAllocates" AutoGenerateColumns="False" DataKeyNames="Allocates_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Allocates_ID" HeaderText="Allocates_ID" ReadOnly="True" SortExpression="Allocates_ID" />
                            <asp:TemplateField HeaderText="Workschedule" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropWorkSchedule" runat="server" DataSourceID="SqlWorkSchedule" DataTextField="Name" DataValueField="WorkSchedule_ID" SelectedValue='<%# Bind("WorkSchedule_ID") %>'/>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblWorkscheduleName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employee Name" SortExpression="Employee_Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropgridEmployee" runat="server" DataSourceID="SqlEmployee" DataTextField="Employee_Name" DataValueField="Employee_ID" SelectedValue='<%# Bind("Employee_ID") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Allocated_Time" HeaderText="Allocated_Time" SortExpression="Allocated_Time" />
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
                <asp:Panel ID="PaneladdAllocates" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesaddTitle" Text=" Allocate Employee to a Work Schedule in the Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblAllocatesEmployee" Width="200" Text="Employee: " runat="server" />
                    <asp:DropDownList ID="dropEmployee" Width="300" runat="server" DataSourceID="SqlEmployee" DataTextField="Employee_Name" DataValueField="Employee_ID"></asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvWorkschedule" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropEmployee" ErrorMessage="(*) One Employee should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblIncludesWorkscheduleID" Width="200" Text="Workschedule: " runat="server" />
                    <asp:DropDownList ID="dropWorkschedule" Width="300" runat="server" DataSourceID="SqlWorkSchedule" DataTextField="Name" DataValueField="Workschedule_ID"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropWorkschedule" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropWorkschedule" ErrorMessage="(*) One Employee should be Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <br />
                     <asp:Label ID="lblAllocatesTime" Width="200" Text="Hours of Operation: " runat="server" />
                    <asp:TextBox ID="txtAllocatesTime" Width="300" ValidationGroup="addAllocatesValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvAllocatesTime" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="txtAllocatesTime" ErrorMessage="(*) Must have some hours" ForeColor="Red"></asp:RequiredFieldValidator><br /> <br /> <br />
                    <asp:Button ID="btnSaveAllocates" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveAllocates_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelAllocates" runat="server" Text="Cancel" OnClick="btnCancelAllocates_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>




