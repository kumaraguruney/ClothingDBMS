<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Code.aspx.cs" Inherits="ClothingDBMS.Code" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Code</title>
</head>
<body>
    <form id="form1" runat="server">
        <nav>
    <div class="nav-wrapper">
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../Index.aspx">Home</a></li>
          <li><a href="Code.aspx">Code</a>
      </ul>
    </div>
  </nav>
        <asp:SqlDataSource ID="SqlCode" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Code] ORDER BY [Code_Type]" DeleteCommand="DELETE FROM [Code] WHERE [Code_ID] = @Code_ID" InsertCommand="INSERT INTO [Code] ([Code_Type], [Code_Description]) VALUES (@Code_Type, @Code_Description)" UpdateCommand="UPDATE [Code] SET [Code_Type] = @Code_Type, [Code_Description] = @Code_Description WHERE [Code_ID] = @Code_ID">
            <DeleteParameters>
                <asp:Parameter Name="Code_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Code_Type" Type="String" />
                <asp:Parameter Name="Code_Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Code_Type" Type="String" />
                <asp:Parameter Name="Code_Description" Type="String" />
                <asp:Parameter Name="Code_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lblCodeHeader" runat="server" Text="Code" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddCode" runat="server" Text="Add" OnClick="btnaddCode_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvCode" runat="server">
                    <asp:GridView ID="gvCode" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlCode" AutoGenerateColumns="False" DataKeyNames="Code_ID">
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Code_ID" HeaderText="Code_ID" ReadOnly="True" SortExpression="Code_ID" />
                            <asp:BoundField DataField="Code_Type" HeaderText="Code_Type" SortExpression="Code_Type" />
                             <asp:BoundField DataField="Code_Description" HeaderText="Code_Description" SortExpression="Code_Description" />
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdCode" Visible="false" runat="server">
                <asp:Label ID="lblCodeaddTitle" Text="Add Employee into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblCodeType" Width="150" Text="Code Type: " runat="server" />
                    <asp:TextBox ID="txtCodeType" ValidationGroup="addCodeValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvCodeType" ValidationGroup="addCodeValidation" runat="server" ControlToValidate="txtCodeType" ErrorMessage="(*) Must have some Type Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblCodeDescription" Width="150" Text="Code Description: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtCodeDescription" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvCodeDescription" ValidationGroup="addCodeValidation" runat="server" ControlToValidate="txtCodeDescription" ErrorMessage="(*) Must have some Code Description" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    
                    <br /> <br />
                    <asp:Button ID="btnSaveCode" ValidationGroup="addCodeValidation" runat="server" Text="Save" OnClick="btnSaveCode_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelCode" runat="server" Text="Cancel" OnClick="btnCancelCode_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>




