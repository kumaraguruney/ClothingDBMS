<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Includes.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Includes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Includes Management</title>
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
        <asp:SqlDataSource ID="SqlIncludes" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT Includes.Includes_ID, Includes.Machine_ID, Includes.Workschedule_ID, Machinery.Machine_Name, ProductDesign.Design_Name FROM Includes LEFT OUTER JOIN Machinery ON Machinery.Machine_ID = Includes.Machine_ID LEFT OUTER JOIN Workschedule ON Includes.Workschedule_ID = Workschedule.Workschedule_ID LEFT OUTER JOIN WorkOrder ON WorkOrder.WorkOrder_ID = Workschedule.WorkOrder_ID LEFT OUTER JOIN ProductDesign ON ProductDesign.Design_ID = WorkOrder.Design_ID ORDER BY Machinery.Machine_Name" DeleteCommand="DELETE FROM [Includes] WHERE [Includes_ID] = @Includes_ID" InsertCommand="INSERT INTO [Includes] ([Machine_ID], [Workschedule_ID]) VALUES (@Machine_ID, @Workschedule_ID)" UpdateCommand="UPDATE [Includes] SET [Machine_ID] = @Machine_ID, [Workschedule_ID] = @Workschedule_ID WHERE [Includes_ID] = @Includes_ID">
            <DeleteParameters>
                <asp:Parameter Name="Includes_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Machine_ID" Type="Byte" />
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Machine_ID" Type="Byte" />
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
                <asp:Parameter Name="Includes_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlMachines" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT * FROM [Machinery]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWorkSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT Workschedule.Workschedule_ID, Workschedule.WorkOrder_ID, WorkOrder.Design_ID, ProductDesign.Design_Name FROM Workschedule LEFT OUTER JOIN WorkOrder ON WorkOrder.WorkOrder_ID = Workschedule.WorkOrder_ID LEFT OUTER JOIN ProductDesign ON ProductDesign.Design_ID = WorkOrder.Design_ID ORDER BY Workschedule.WorkOrder_ID"></asp:SqlDataSource>
            <div align="center">
                <br />
                <asp:Label ID="lblIncludes" runat="server" Text="Assign Machines to the Work Schedule" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddIncludes" runat="server" Text="Add" OnClick="btnaddIncludes_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvIncludes" runat="server">
                    <asp:GridView ID="gvIncludes" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlIncludes" AutoGenerateColumns="False" DataKeyNames="Includes_ID">
                        <Columns>
                              <asp:CommandField ShowEditButton="True" HeaderText="Edit"/>
                            <asp:BoundField DataField="Includes_ID" HeaderText="Includes_ID" ReadOnly="True" SortExpression="Includes_ID" />
                            <asp:BoundField DataField="Machine_ID" HeaderText="Machine_ID" Visible="false" SortExpression="Machine_ID" />
                             <asp:BoundField DataField="Workschedule_ID" HeaderText="Workschedule_ID" Visible="false" SortExpression="Workschedule_ID" />
                              <asp:TemplateField HeaderText="Machine_Name" SortExpression="Machine_Name">
                                  <EditItemTemplate>
                                      <asp:DropDownList ID="dropMachines" runat="server" DataSourceID="SqlMachines" SelectedValue='<%# Bind("Machine_ID") %>' DataTextField="Machine_Name" DataValueField="Machine_ID"></asp:DropDownList>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="lblMachine_Name" runat="server" Text='<%# Bind("Machine_Name") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Design_Name" SortExpression="Design_Name">
                                  <EditItemTemplate>
                                      <asp:DropDownList ID="dropWorkschedule" runat="server" DataSourceID="SqlWorkSchedule" SelectedValue='<%# Bind("Workschedule_ID") %>' DataTextField="Design_Name" DataValueField="Workschedule_ID"></asp:DropDownList>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="lblDesign_Name" runat="server" Text='<%# Bind("Design_Name") %>'></asp:Label>
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
                <asp:Panel ID="PaneladdIncludesMachinery" Visible="false" runat="server">
                <asp:Label ID="lblIncludesMachineryaddTitle" Text=" Allocate Machine for Work Schedule Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblIncludesWorkSchedule" Width="200" Text="Work Schedule: " runat="server" />
                    <asp:DropDownList ID="dropWorkschedule" runat="server" DataSourceID="SqlWorkSchedule" DataTextField="Design_Name" DataValueField="Workschedule_ID"></asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvWorkschedule" ValidationGroup="addWorkscheduleValidation" runat="server" ControlToValidate="dropWorkschedule" ErrorMessage="(*) Must have one Work Schedule should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblIncludesMachineID" Width="200" Text="Machine: " runat="server" />
                    <asp:DropDownList ID="dropMachines" runat="server" DataSourceID="SqlMachines" DataTextField="Machine_Name" DataValueField="Machine_ID"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropMachines" ValidationGroup="addWorkscheduleValidation" runat="server" ControlToValidate="dropMachines" ErrorMessage="(*) Must have one Machine should be Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <br /> <br />
                    <asp:Button ID="btnSaveIncludes" ValidationGroup="addEmployeeValidation" runat="server" Text="Save" OnClick="btnSaveIncludes_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelIncludes" runat="server" Text="Cancel" OnClick="btnCancelIncludes_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>




