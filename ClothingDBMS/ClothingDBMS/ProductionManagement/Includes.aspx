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
        <asp:SqlDataSource ID="SqlIncludes" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Includes.Includes_ID, Includes.Machine_ID, Includes.Workschedule_ID, Includes.Hours_Of_Operation, Workschedule.WorkOrder_ID, Workschedule.WorkScheduled_Date, Workschedule.WorkScheduled_To_End, Workschedule.WorkScheduled_By, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Machinery.Machine_Name FROM Includes LEFT OUTER JOIN Workschedule ON Includes.Workschedule_ID = Workschedule.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Machinery ON Machinery.Machine_ID = Includes.Machine_ID ORDER BY Name" DeleteCommand="DELETE FROM [Includes] WHERE [Includes_ID] = @Includes_ID" InsertCommand="INSERT INTO [Includes] ([Machine_ID], [Workschedule_ID], [Hours_Of_Operation]) VALUES (@Machine_ID, @Workschedule_ID, @Hours_Of_Operation)" UpdateCommand="UPDATE [Includes] SET [Machine_ID] = @Machine_ID, [Workschedule_ID] = @Workschedule_ID, [Hours_Of_Operation] = @Hours_Of_Operation WHERE [Includes_ID] = @Includes_ID">
            <DeleteParameters>
                <asp:Parameter Name="Includes_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Machine_ID" Type="Byte" />
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
                <asp:Parameter Name="Hours_Of_Operation" Type="Byte" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Machine_ID" Type="Byte" />
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
                <asp:Parameter Name="Hours_Of_Operation" Type="Byte" />
                <asp:Parameter Name="Includes_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlIncludesdrop" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Includes.Workschedule_ID FROM Includes LEFT OUTER JOIN Workschedule ON Includes.Workschedule_ID = Workschedule.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Machinery ON Machinery.Machine_ID = Includes.Machine_ID ORDER BY Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlMachines" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Machinery] ORDER BY [Machine_Name]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWorkSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Workschedule.Workschedule_ID, Workschedule.WorkOrder_ID, Workschedule.WorkScheduled_Date, Workschedule.WorkScheduled_To_End, Workschedule.WorkScheduled_By, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Employee.Employee_Name FROM Workschedule LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Workschedule.WorkScheduled_By ORDER BY Name"></asp:SqlDataSource>
            <div align="center">
                <br />
                <asp:Label ID="lblIncludes" runat="server" Text="Assign Machines to the Work Schedule" Font-Bold="true"></asp:Label> <br /> <br />
               
                <asp:Panel ID="PanelgvIncludes" runat="server">
                    <asp:Label ID="lblIncludesFilter" runat="server" Text="Please Select a WorkSchedule and Click Filter: " Font-Bold="true"></asp:Label>
                <asp:DropDownList ID="dropIncludesSearch" width="300" DataSourceID="SqlIncludesDrop" AppendDataBoundItems="true" DataTextField="Name"  DataValueField="WorkSchedule_ID" runat="server">
                <asp:ListItem Text="--- Please Select a Work Schedule ---" Value="-1"></asp:ListItem>
                </asp:DropDownList> &nbsp; &nbsp; <asp:Button ID="btnIncludesfilter" runat="server" Text="Filter" OnClick="btnIncludesfilter_Click"/> &nbsp; &nbsp; <asp:Button ID="btnIncludesClear" runat="server" Text="Clear" OnClick="btnIncludesClear_Click"/> &nbsp;&nbsp;
                     <asp:Button ID="btnaddIncludes" runat="server" Text="Add" OnClick="btnaddIncludes_Click"/>
                <br /> <br />
                    <asp:GridView ID="gvIncludes" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlIncludes" AutoGenerateColumns="False" DataKeyNames="Includes_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Includes_ID" HeaderText="Includes_ID" ReadOnly="True" SortExpression="Includes_ID" />
                              <asp:TemplateField HeaderText="Machine Name" SortExpression="Machine_Name">
                                  <EditItemTemplate>
                                      <asp:DropDownList ID="dropMachine" runat="server" DataSourceID="SqlMachines" DataTextField="Machine_Name" DataValueField="Machine_ID" SelectedValue='<%# Bind("Machine_ID") %>'>
                                    </asp:DropDownList>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="lblMachineName" runat="server" Text='<%# Bind("Machine_Name") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Workschedule Name" SortExpression="Name">
                                  <EditItemTemplate>
                                      <asp:DropDownList ID="dropWorkSchedule" runat="server" DataSourceID="SqlWorkSchedule" DataTextField="Name" DataValueField="WorkSchedule_ID" SelectedValue='<%# Bind("WorkSchedule_ID") %>'>
                                  </asp:DropDownList>
                                          </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="lblWorkSchedule" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                            <asp:BoundField DataField="Hours_Of_Operation" HeaderText="Hours_Of_Operation" SortExpression="Hours_Of_Operation" />
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
                <asp:Panel ID="PaneladdIncludesMachinery" Visible="false" runat="server">
                <asp:Label ID="lblIncludesMachineryaddTitle" Text=" Allocate Machine for Work Schedule Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblIncludesWorkSchedule" Width="200" Text="Work Schedule: " runat="server" />
                    <asp:DropDownList ID="dropaddWorkschedule" Width="300" runat="server" DataSourceID="SqlWorkSchedule" DataTextField="Name" DataValueField="Workschedule_ID"></asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvWorkschedule" ValidationGroup="addWorkscheduleValidation" runat="server" ControlToValidate="dropaddWorkschedule" ErrorMessage="(*) Must have one Work Schedule should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblIncludesMachineID" Width="200" Text="Machine: " runat="server" />
                    <asp:DropDownList ID="dropaddMachines" Width="300" runat="server" DataSourceID="SqlMachines" DataTextField="Machine_Name" DataValueField="Machine_ID"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropMachines" ValidationGroup="addWorkscheduleValidation" runat="server" ControlToValidate="dropaddMachines" ErrorMessage="(*) Must have one Machine should be Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <br />
                    <asp:Label ID="lblIncludesHofOperation" Width="200" Text="Hours of Operation: " runat="server" />
                    <asp:TextBox ID="txtIncludesHofOperation" Width="300" ValidationGroup="addWorkscheduleValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvIncludesHofOperation" ValidationGroup="addWorkscheduleValidation" runat="server" ControlToValidate="txtIncludesHofOperation" ErrorMessage="(*) Must have some hours" ForeColor="Red"></asp:RequiredFieldValidator><br /> <br />
                    <asp:Button ID="btnSaveIncludes" ValidationGroup="addWorkscheduleValidation" runat="server" Text="Save" OnClick="btnSaveIncludes_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelIncludes" runat="server" Text="Cancel" OnClick="btnCancelIncludes_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>




