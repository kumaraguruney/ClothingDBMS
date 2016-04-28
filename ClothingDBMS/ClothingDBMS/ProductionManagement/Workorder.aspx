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
        <asp:SqlDataSource ID="SqlWorkorder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" DeleteCommand="DELETE FROM [WorkOrder] WHERE [WorkOrder_ID] = @WorkOrder_ID" InsertCommand="INSERT INTO [WorkOrder] ([CreatedDate], [DueDate], [Submitted_By], [Product_Quantity], [Product_ID]) VALUES (@CreatedDate, @DueDate, @Submitted_By, @Product_Quantity, @Product_ID)" SelectCommand="SELECT WorkOrder.WorkOrder_ID, WorkOrder.CreatedDate, WorkOrder.DueDate, WorkOrder.Submitted_By, WorkOrder.Product_Quantity, WorkOrder.Product_ID, Design.Design_Name + ', ' + code_2.Code_Description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS ProductName FROM WorkOrder LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = Design.Design_Section ORDER BY Design.Design_Name" UpdateCommand="UPDATE [WorkOrder] SET [CreatedDate] = @CreatedDate, [DueDate] = @DueDate, [Submitted_By] = @Submitted_By, [Product_Quantity] = @Product_Quantity, [Product_ID] = @Product_ID WHERE [WorkOrder_ID] = @WorkOrder_ID">
            <DeleteParameters>
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CreatedDate" Type="DateTime" />
                <asp:Parameter Name="DueDate" Type="DateTime" />
                <asp:Parameter Name="Submitted_By" Type="String" />
                <asp:Parameter Name="Product_Quantity" Type="Int32" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CreatedDate" Type="DateTime" />
                <asp:Parameter Name="DueDate" Type="DateTime" />
                <asp:Parameter Name="Submitted_By" Type="String" />
                <asp:Parameter Name="Product_Quantity" Type="Int32" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>
<div align="center">
                <br />
                <asp:Label ID="lbWorkOrderHeader" runat="server" Text="Work Order - Management" Font-Bold="true"></asp:Label> <br /> <br />
                
                <asp:Panel ID="PanelgvWorkOrder" runat="server">
                    <asp:Button ID="btnaddWorkOrder" runat="server" Text="Add" OnClick="btnaddWorkOrder_Click"/>
                <br /> <br />
                    <asp:GridView ID="gvWorkOrder" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlWorkorder" AutoGenerateColumns="False" DataKeyNames="WorkOrder_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="WorkOrder_ID" HeaderText="WorkOrder_ID" InsertVisible="False" ReadOnly="True" SortExpression="WorkOrder_ID" />
                            <asp:TemplateField HeaderText="Product Name" SortExpression="ProductName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropProduct" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID" SelectedValue='<%# Bind("Product_ID") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Product_Quantity" HeaderText="Product_Quantity" SortExpression="Product_Quantity" />
                            <asp:BoundField DataField="CreatedDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="CreatedDate" SortExpression="CreatedDate" />
                            <asp:BoundField DataField="DueDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="DueDate" SortExpression="DueDate" />
                            <asp:BoundField DataField="Submitted_By" HeaderText="Submitted_By" SortExpression="Submitted_By" />
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
                <asp:Panel ID="PaneladdWorkorder" Visible="false" runat="server">
                <asp:Label ID="lblWorkorderaddTitle" Text="Add Workorder into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblRequireDesign" Width="150" Text="Product: " runat="server" />
                    <asp:DropDownList ID="dropaddProduct" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Product_ID">
                    </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvdropDesign" ValidationGroup="addWorkorderValidation" runat="server" ControlToValidate="dropaddProduct" ErrorMessage="(*) Must have one Design Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblProductQuantity" Width="150" Text="Product Quantity: " runat="server" />
                    <asp:TextBox ID="txtProductQuantity" ValidationGroup="addWorkorderValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvProductQuantity" ValidationGroup="addWorkorderValidation" runat="server" ControlToValidate="txtProductQuantity" ErrorMessage="(*) Must have Quantity" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblWorkorderDueDate" Width="150" Text="Due Date: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtWorkorderDueDate" runat="server"></asp:TextBox><asp:Calendar ID="calWorkorderdue" OnSelectionChanged="calWorkorderdue_SelectionChanged" runat="server"></asp:Calendar>
                    <br />
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
