<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Workschedule.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Workschedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Work Schedule - Management</title>
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
        <asp:SqlDataSource ID="SqlWorkOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT WorkOrder.WorkOrder_ID, WorkOrder.CreatedDate, WorkOrder.DueDate, WorkOrder.Submitted_By, WorkOrder.Product_Quantity, WorkOrder.Design_ID, ProductDesign.Design_Name FROM WorkOrder LEFT OUTER JOIN ProductDesign ON ProductDesign.Design_ID = WorkOrder.Design_ID ORDER BY ProductDesign.Design_Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWorkSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT Workschedule.Workschedule_ID, Workschedule.WorkOrder_ID, WorkOrder.Design_ID, ProductDesign.Design_Name FROM Workschedule LEFT OUTER JOIN WorkOrder ON WorkOrder.WorkOrder_ID = Workschedule.WorkOrder_ID LEFT OUTER JOIN ProductDesign ON ProductDesign.Design_ID = WorkOrder.Design_ID ORDER BY Workschedule.WorkOrder_ID" DeleteCommand="DELETE FROM [Workschedule] WHERE [Workschedule_ID] = @Workschedule_ID" InsertCommand="INSERT INTO [Workschedule] ([WorkOrder_ID]) VALUES (@WorkOrder_ID)" UpdateCommand="UPDATE [Workschedule] SET [WorkOrder_ID] = @WorkOrder_ID WHERE [Workschedule_ID] = @Workschedule_ID">
            <DeleteParameters>
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lblWorkSchedule" runat="server" Text="Work Schedule - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btaddWorkSchedule" runat="server" Text="Add" OnClick="btaddWorkSchedule_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvWorkSchedule" runat="server">
                    <asp:GridView ID="gvWorkSchedule" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlWorkSchedule" AutoGenerateColumns="False" DataKeyNames="Workschedule_ID">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" HeaderText="Edit"/>
                            <asp:BoundField DataField="Workschedule_ID" HeaderText="Workschedule ID" InsertVisible="False" ReadOnly="True" SortExpression="Workschedule_ID" />
                            <asp:TemplateField HeaderText="WorkOrder ID" SortExpression="WorkOrder_ID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropWorkOrder" SelectedValue='<%# Bind("WorkOrder_ID") %>' runat="server" DataSourceID="SqlWorkOrder" DataTextField="Design_Name" DataValueField="WorkOrder_ID"/>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblWorkOrderID" runat="server" Text='<%# Bind("WorkOrder_ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Design_Name" HeaderText="Design Name" SortExpression="Design_Name" ReadOnly="true" />
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdWorkSchedule" Visible="false" runat="server">
                <asp:Label ID="lbProductaddWorkSchedule" Text="Add Work Schedule into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblWorkOrderName" Text=" Work Order: " runat="server" />
                    <asp:DropDownList ID="dropWorkOrder" runat="server" DataSourceID="SqlWorkOrder" DataTextField="Design_Name" DataValueField="WorkOrder_ID">
                    </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvdropWorkOrder" ValidationGroup="addWorkorderValidation" runat="server" ControlToValidate="dropWorkOrder" ErrorMessage="(*) Must have one WorkOrder Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <br /> <br />
                    <asp:Button ID="btnSaveWorkSchedule" ValidationGroup="addWorkScheduleValidation" runat="server" Text="Save" OnClick="btnSaveWorkSchedule_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelWorkSchedule" runat="server" Text="Cancel" OnClick="btnCancelWorkSchedule_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>


