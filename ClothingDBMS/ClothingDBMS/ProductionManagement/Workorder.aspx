<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Workorder.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Workorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Work Order Information</title>
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
        <asp:SqlDataSource ID="SqlWorkorder" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" DeleteCommand="DELETE FROM [WorkOrder] WHERE [WorkOrder_ID] = @WorkOrder_ID" InsertCommand="INSERT INTO [WorkOrder] ([CreatedDate], [DueDate], [Submitted_By], [Product_Quantity], [Design_ID]) VALUES (@CreatedDate, @DueDate, @Submitted_By, @Product_Quantity, @Design_ID)" SelectCommand="SELECT WorkOrder.WorkOrder_ID, WorkOrder.CreatedDate, WorkOrder.DueDate, WorkOrder.Submitted_By, WorkOrder.Product_Quantity, WorkOrder.Design_ID, ProductDesign.Design_Name FROM WorkOrder LEFT OUTER JOIN ProductDesign ON ProductDesign.Design_ID = WorkOrder.Design_ID ORDER BY ProductDesign.Design_Name" UpdateCommand="UPDATE [WorkOrder] SET [CreatedDate] = @CreatedDate, [DueDate] = @DueDate, [Submitted_By] = @Submitted_By, [Product_Quantity] = @Product_Quantity, [Design_ID] = @Design_ID WHERE [WorkOrder_ID] = @WorkOrder_ID">
            <DeleteParameters>
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CreatedDate" Type="DateTime" />
                <asp:Parameter Name="DueDate" Type="DateTime" />
                <asp:Parameter Name="Submitted_By" Type="String" />
                <asp:Parameter Name="Product_Quantity" Type="Int32" />
                <asp:Parameter Name="Design_ID" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CreatedDate" Type="DateTime" />
                <asp:Parameter Name="DueDate" Type="DateTime" />
                <asp:Parameter Name="Submitted_By" Type="String" />
                <asp:Parameter Name="Product_Quantity" Type="Int32" />
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDesign" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT * FROM [ProductDesign] ORDER BY [Design_Name]"></asp:SqlDataSource>
<div align="center">
                <br />
                <asp:Label ID="lbWorkOrderHeader" runat="server" Text="Work Order - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddWorkOrder" runat="server" Text="Add" OnClick="btnaddWorkOrder_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvWorkOrder" runat="server">
                    <asp:GridView ID="gvWorkOrder" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlWorkorder" AutoGenerateColumns="False" DataKeyNames="WorkOrder_ID">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
                            <asp:BoundField DataField="WorkOrder_ID" HeaderText="WorkOrder_ID" ReadOnly="True" SortExpression="WorkOrder_ID" InsertVisible="False" />
                            <asp:TemplateField HeaderText="Design Name" SortExpression="Design_Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropDesign" runat="server" DataSourceID="SqlDesign" SelectedValue='<%# Bind("Design_ID") %>' DataTextField="Design_Name" DataValueField="Design_ID"></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDesignName" runat="server" Text='<%# Bind("Design_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:BoundField DataField="Product_Quantity" HeaderText="Product_Quantity" SortExpression="Product_Quantity" />
                            <asp:BoundField DataField="CreatedDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="CreatedDate" SortExpression="CreatedDate" />
                            <asp:BoundField DataField="DueDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="DueDate" SortExpression="DueDate" />
                            <asp:BoundField DataField="Submitted_By" HeaderText="Submitted_By" SortExpression="Submitted_By" />
                            <asp:BoundField DataField="Design_ID" HeaderText="Design_ID" SortExpression="Design_ID" Visible="false" />
                              <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdWorkorder" Visible="false" runat="server">
                <asp:Label ID="lblWorkorderaddTitle" Text="Add Workorder into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblRequireDesign" Width="150" Text="Design: " runat="server" />
                    <asp:DropDownList ID="dropDesign" runat="server" DataSourceID="SqlDesign" DataTextField="Design_Name" DataValueField="Design_ID">
                    </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvdropDesign" ValidationGroup="addWorkorderValidation" runat="server" ControlToValidate="dropDesign" ErrorMessage="(*) Must have one Design Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblProductQuantity" Width="150" Text="Product Quantity: " runat="server" />
                    <asp:TextBox ID="txtProductQuantity" ValidationGroup="addWorkorderValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvProductQuantity" ValidationGroup="addWorkorderValidation" runat="server" ControlToValidate="txtProductQuantity" ErrorMessage="(*) Must have Quantity" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblWorkorderDueDate" Width="150" Text="Due Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtWorkorderDueDate" runat="server"></asp:TextBox><br />
                    <asp:Label ID="lblWorkorderSubmittedBy" Width="150" Text="Submitted By: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtWorkorderSubmittedBy" runat="server"></asp:TextBox><br />
                     <asp:RequiredFieldValidator ID="rfvWorkorderSubmittedBy" ValidationGroup="addWorkorderValidation" runat="server" ControlToValidate="txtWorkorderSubmittedBy" ErrorMessage="(*) Must be filled" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <br /> <br />
                    <asp:Button ID="btnSaveWorkOrder" ValidationGroup="addEmployeeValidation" runat="server" Text="Save" OnClick="btnSaveWorkOrder_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelWorkOrder" runat="server" Text="Cancel" OnClick="btnCancelWorkOrder_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
