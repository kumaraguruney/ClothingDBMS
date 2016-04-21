<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Require.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Require" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Requires </title>
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
        <asp:SqlDataSource ID="SqlRequires" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT Require.Require_ID, Require.Design_ID, Require.RawMaterial1_ID, Require.RawMaterial1_Quantity, Require.RawMaterial2_ID, Require.RawMaterial2_Quantity, Require.RawMaterial3_ID, Require.RawMaterial3_Quantity, Require.RawMaterial4_ID, Require.RawMaterial4_Quantity, ProductDesign.Design_Name, RawMaterial1.RawMaterial_Name AS RM1_Name, RawMaterial2.RawMaterial_Name AS RM2_Name, RawMaterial3.RawMaterial_Name AS RM3_Name, RawMaterial4.RawMaterial_Name AS RM4_Name FROM Require LEFT OUTER JOIN ProductDesign ON Require.Design_ID = ProductDesign.Design_ID LEFT OUTER JOIN RawMaterial AS RawMaterial1 ON RawMaterial1.RawMaterial_ID = Require.RawMaterial1_ID LEFT OUTER JOIN RawMaterial AS RawMaterial2 ON RawMaterial2.RawMaterial_ID = Require.RawMaterial2_ID LEFT OUTER JOIN RawMaterial AS RawMaterial3 ON RawMaterial3.RawMaterial_ID = Require.RawMaterial3_ID LEFT OUTER JOIN RawMaterial AS RawMaterial4 ON RawMaterial4.RawMaterial_ID = Require.RawMaterial4_ID ORDER BY ProductDesign.Design_Name" DeleteCommand="DELETE FROM [Require] WHERE [Require_ID] = @Require_ID" InsertCommand="INSERT INTO [Require] ([Design_ID], [RawMaterial1_ID], [RawMaterial1_Quantity], [RawMaterial2_ID], [RawMaterial2_Quantity], [RawMaterial3_ID], [RawMaterial3_Quantity], [RawMaterial4_ID], [RawMaterial4_Quantity]) VALUES (@Design_ID, @RawMaterial1_ID, @RawMaterial1_Quantity, @RawMaterial2_ID, @RawMaterial2_Quantity, @RawMaterial3_ID, @RawMaterial3_Quantity, @RawMaterial4_ID, @RawMaterial4_Quantity)" UpdateCommand="UPDATE [Require] SET [Design_ID] = @Design_ID, [RawMaterial1_ID] = @RawMaterial1_ID, [RawMaterial1_Quantity] = @RawMaterial1_Quantity, [RawMaterial2_ID] = @RawMaterial2_ID, [RawMaterial2_Quantity] = @RawMaterial2_Quantity, [RawMaterial3_ID] = @RawMaterial3_ID, [RawMaterial3_Quantity] = @RawMaterial3_Quantity, [RawMaterial4_ID] = @RawMaterial4_ID, [RawMaterial4_Quantity] = @RawMaterial4_Quantity WHERE [Require_ID] = @Require_ID">
            <DeleteParameters>
                <asp:Parameter Name="Require_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial1_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial1_Quantity" Type="Int16" />
                <asp:Parameter Name="RawMaterial2_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial2_Quantity" Type="Int16" />
                <asp:Parameter Name="RawMaterial3_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial3_Quantity" Type="Int16" />
                <asp:Parameter Name="RawMaterial4_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial4_Quantity" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial1_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial1_Quantity" Type="Int16" />
                <asp:Parameter Name="RawMaterial2_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial2_Quantity" Type="Int16" />
                <asp:Parameter Name="RawMaterial3_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial3_Quantity" Type="Int16" />
                <asp:Parameter Name="RawMaterial4_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial4_Quantity" Type="Int16" />
                <asp:Parameter Name="Require_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource ID="SqlRawmaterial" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_Name]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDesign" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT * FROM [ProductDesign] ORDER BY [Design_Name]"></asp:SqlDataSource>
            <div align="center">
                <br />
                <asp:Label ID="lbRequireHeader" runat="server" Text="Product Requirement - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btaddProductRequire" runat="server" Text="Add" OnClick="btaddProductRequire_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvProductRequire" runat="server">
                    <asp:GridView ID="gvProductRequire" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlRequires" AutoGenerateColumns="False" DataKeyNames="Require_ID" >
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField  DataField="Require_ID" HeaderText="Require ID" ReadOnly="true" />
                            <asp:BoundField  DataField="Design_ID" HeaderText="Design ID" Visible="false" />
                            <asp:TemplateField HeaderText="Design Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropDesign" runat="server" DataSourceID="SqlDesign" SelectedValue='<%# Bind("Design_ID") %>' DataTextField="Design_Name" DataValueField="Design_ID"></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDesignName" runat="server" Text='<%# Bind("Design_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RM1 ID" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRM1ID" runat="server" Text='<%# Bind("RawMaterial1_ID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRawMaterial_ID" runat="server" Text='<%# Bind("RawMaterial1_ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RM1 Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropRawmaterial1" runat="server" DataSourceID="SqlRawmaterial" SelectedValue='<%# Bind("Rawmaterial1_ID") %>' DataTextField="Rawmaterial_Name" DataValueField="Rawmaterial_ID"></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRM1Name" runat="server" Text='<%# Bind("RM1_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RM1 Qty">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRM1Qty" runat="server" Text='<%# Bind("RawMaterial1_Quantity") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRM1Qty" runat="server" Text='<%# Bind("RawMaterial1_Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField  DataField="RawMaterial2_ID" HeaderText="RM2 ID" Visible="False" />
                            <asp:TemplateField HeaderText="RM2 Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropRawmaterial2" runat="server" DataSourceID="SqlRawmaterial" SelectedValue='<%# Bind("Rawmaterial2_ID") %>' AppendDataBoundItems="true" DataTextField="Rawmaterial_Name" DataValueField="Rawmaterial_ID">
                                    <asp:ListItem Text="-- Select Raw Material2 --" Value="" > </asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRM2_Name" runat="server" Text='<%# Bind("RM2_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RM2 Qty">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRM2_Qty" runat="server" Text='<%# Bind("RawMaterial2_Quantity") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRM2_Qty" runat="server" Text='<%# Bind("RawMaterial2_Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField  DataField="RawMaterial3_ID" HeaderText="RM3 ID" Visible="false" />
                            <asp:TemplateField HeaderText="RM3 Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropRawmaterial3" runat="server" DataSourceID="SqlRawmaterial" SelectedValue='<%# Bind("Rawmaterial3_ID") %>' AppendDataBoundItems="true" DataTextField="Rawmaterial_Name" DataValueField="Rawmaterial_ID">
                                    <asp:ListItem Text="-- Select Raw Material3 --" Value="" > </asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRM3_Name" runat="server" Text='<%# Bind("RM3_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RM3 Qty">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRM3_Qty" runat="server" Text='<%# Bind("RawMaterial3_Quantity") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRM3_Qty" runat="server" Text='<%# Bind("RawMaterial3_Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField  DataField="RawMaterial4_ID" HeaderText="RM4 ID" Visible="False" />
                            <asp:TemplateField HeaderText="RM4 Name">
                                <EditItemTemplate>
                                   <asp:DropDownList ID="dropRawmaterial4" runat="server" DataSourceID="SqlRawmaterial" SelectedValue='<%# Bind("Rawmaterial4_ID") %>' AppendDataBoundItems="true" DataTextField="Rawmaterial_Name" DataValueField="Rawmaterial_ID">
                                    <asp:ListItem Text="-- Select Raw Material4 --" Value="" > </asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRM4_Name" runat="server" Text='<%# Bind("RM4_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RM4 Qty">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRM4_Qty" runat="server" Text='<%# Bind("RawMaterial4_Quantity") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRM4_Qty" runat="server" Text='<%# Bind("RawMaterial4_Quantity") %>'></asp:Label>
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
                <asp:Panel ID="PaneladdProductRequire" Visible="false" runat="server">
                    
                <asp:Label ID="lbProductRequireaddTitle" Text="Add Required Raw Material(s) for particular Design into Database" runat="server" /><br /> <br />
                    <div class="form-group form-horizontal col-md-8" >
                    <asp:Label ID="lblRequireDesign" Width="200" Text="Design: " runat="server" />
                    <asp:DropDownList ID="dropDesign" runat="server" DataSourceID="SqlDesign" DataTextField="Design_Name" DataValueField="Design_ID">
                    </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvdropDesign" ValidationGroup="addProductRequireValidation" runat="server" ControlToValidate="dropDesign" ErrorMessage="(*) Must have one Design Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblRequireRawmaterial1" Width="200" Text="Raw Material1: " runat="server" />
                    <asp:DropDownList ID="dropRawmaterial1" runat="server" DataSourceID="SqlRawmaterial" DataTextField="Rawmaterial_Name" DataValueField="Rawmaterial_ID"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvProductRequiredRM1" ValidationGroup="addProductRequireValidation" runat="server" ControlToValidate="dropRawmaterial1" ErrorMessage="(*) Must have one Raw Material Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lbProductRequireRawmaterial1Qty" Width="200" Text="Raw Material1 Quantity: " runat="server" />
                    <asp:TextBox ID="txtProductRequireRawmaterial1Qty" runat="server" ></asp:TextBox><br/>
                    <asp:RequiredFieldValidator ID="rfvProductRequiredRawmaterial1Qty" ValidationGroup="addProductRequireValidation" runat="server" ControlToValidate="txtProductRequireRawmaterial1Qty" ErrorMessage="(*) Must have Quantity" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblRequireRawmaterial2" Width="200" Text="Raw Material2: " runat="server" />
                    <asp:DropDownList ID="dropRawmaterial2" runat="server" DataSourceID="SqlRawmaterial" AppendDataBoundItems="true" DataTextField="Rawmaterial_Name" DataValueField="Rawmaterial_ID">
                        <asp:ListItem Text="-- Select Raw Material2 --" Value="-1" > </asp:ListItem>
                    </asp:DropDownList><br /> <br />
                    <asp:Label ID="lblProductRequiredRawmaterial2" Width="200" Text="Raw Material2 Quantity: " runat="server" />
                    <asp:TextBox ID="txtProductRequiredRawmaterial2Qty" runat="server" ></asp:TextBox><br /> <br />
                    <asp:Label ID="lblRequireRawmaterial3" Width="200" Text="Raw Material3: " runat="server" />
                    <asp:DropDownList ID="dropRawmaterial3" runat="server" DataSourceID="SqlRawmaterial" DataTextField="Rawmaterial_Name" AppendDataBoundItems="true" DataValueField="Rawmaterial_ID">
                        <asp:ListItem Text="-- Select Raw Material3 --" Value="-1" ></asp:ListItem>
                    </asp:DropDownList><br /> <br />
                    <asp:Label ID="lblProductRequiredRawmaterial3" Width="200" Text="Raw Material3 Quantity: " runat="server" />
                    <asp:TextBox ID="txtProductRequiredRawmaterial3Qty" runat="server" ></asp:TextBox><br /> <br />
                    <asp:Label ID="lblRequiredRawmaterial4" Width="200" Text="Raw Material4: " runat="server" />
                    <asp:DropDownList ID="dropRawmaterial4" runat="server" AppendDataBoundItems="true" DataSourceID="SqlRawmaterial" DataTextField="Rawmaterial_Name" DataValueField="Rawmaterial_ID">
                        <asp:ListItem Text="-- Select Raw Material4 --" Value="-1"> </asp:ListItem>
                    </asp:DropDownList><br /> <br />
                    <asp:Label ID="lblProductRequiredRawmaterial4" Width="200" Text="Raw Material4 Quantity: " runat="server" />
                    <asp:TextBox ID="txtProductRequiredRawmaterial4Qty" runat="server" ></asp:TextBox><br /> <br />
                    <asp:Button ID="btnSaveProductRequire" ValidationGroup="addProductRequireValidation" runat="server" Text="Save" OnClick="btnSaveProductRequire_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelProductRequire" runat="server" Text="Cancel" OnClick="btnCancelProductRequire_Click"/>
                        </div>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>

