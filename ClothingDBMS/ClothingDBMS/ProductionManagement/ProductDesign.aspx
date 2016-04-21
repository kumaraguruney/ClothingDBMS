<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDesign.aspx.cs" Inherits="ProductionManagement.ProductionManagement.ProductDesign" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Design - Management</title>
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
        <asp:SqlDataSource ID="SqlDesign" runat="server" ConnectionString="<%$ ConnectionStrings:ClothingDatabase %>" SelectCommand="SELECT * FROM [ProductDesign] ORDER BY [Design_Name]" DeleteCommand="DELETE FROM [ProductDesign] WHERE [Design_ID] = @Design_ID" InsertCommand="INSERT INTO [ProductDesign] ([Section], [Size], [Color], [Design_Name]) VALUES (@Section, @Size, @Color, @Design_Name)" UpdateCommand="UPDATE [ProductDesign] SET [Section] = @Section, [Size] = @Size, [Color] = @Color, [Design_Name] = @Design_Name WHERE [Design_ID] = @Design_ID">
            <DeleteParameters>
                <asp:Parameter Name="Design_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Section" Type="String" />
                <asp:Parameter Name="Size" Type="String" />
                <asp:Parameter Name="Color" Type="String" />
                <asp:Parameter Name="Design_Name" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Section" Type="String" />
                <asp:Parameter Name="Size" Type="String" />
                <asp:Parameter Name="Color" Type="String" />
                <asp:Parameter Name="Design_Name" Type="String" />
                <asp:Parameter Name="Design_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbProductDesignHeader" runat="server" Text="Product Design - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btaddProductdesign" runat="server" Text="Add" OnClick="btaddProductdesign_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvProductDesign" runat="server">
                    <asp:GridView ID="gvProductDesign" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDesign" AutoGenerateColumns="False" DataKeyNames="Design_ID">
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Design_ID" HeaderText="Design ID" InsertVisible="False" ReadOnly="True" SortExpression="Design_ID" />
                            <asp:BoundField DataField="Design_Name" HeaderText="Design Name" SortExpression="Design_Name" />
                             <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                            <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color" />
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdProductdesign" Visible="false" runat="server">
                <asp:Label ID="lbProductdesignaddTitle" Text="Add Design into Database" runat="server" /><br /> <br />
                    <div class="form-group form-horizontal col-md-8" >
                        <asp:Label ID="lbProductDesignName" Width="200" Text="Product Design Name: " runat="server" />
                        <asp:TextBox ID="txtProductDesignName" ValidationGroup="addProductDesignValidation" runat="server" ></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvProductDesignName" ValidationGroup="addProductDesignValidation" runat="server" ControlToValidate="txtProductDesignName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="lbProductDesignSection" Width="200" Text="Section: " runat="server" />
                        <asp:TextBox ID="txtProductDesignSection" ValidationGroup="addProductDesignValidation" runat="server" ></asp:TextBox><br />
                        <asp:Label ID="lblProductDesignSize" Width="200" Text="Size: " runat="server" />
                        <asp:TextBox ID="txtProductDesignSize" ValidationGroup="addProductDesignValidation" runat="server" ></asp:TextBox><br />
                        <asp:Label ID="lblProductDesignColor" Width="200" Text="Color: " runat="server" />
                        <asp:TextBox ID="txtProductDesignColor" ValidationGroup="addProductDesignValidation" runat="server" ></asp:TextBox><br />
                        <br /> <br />
                        <asp:Button ID="btnSaveProductDesign" ValidationGroup="addProductDesignValidation" runat="server" Text="Save" OnClick="btnSaveProductDesign_Click"/> &nbsp;&nbsp;
                        <asp:Button ID="btnCancelProductDesign" runat="server" Text="Cancel" OnClick="btnCancelProductDesign_Click"/>
                    </div>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>

