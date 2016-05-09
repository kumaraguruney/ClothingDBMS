<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Requires.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Requires" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <form id="form1" runat="server">
            <div id="custom-bootstrap-menu" class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
            <div class="navbar-header page-scroll">
                <a class="navbar-brand" href="../Index.aspx">NTL</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="page-scroll" href="Default.aspx">Procurement Management - Home</a> </li>
                    <li><a class="page-scroll" href="Supplier.aspx">Supplier</a> </li>
                    <li><a class="page-scroll" href="Supplier_Quotation.aspx">Supplier Quotation</a> </li>
                    <li><a class="page-scroll" href="provides.aspx">Provides</a> </li>
                    <li><a class="page-scroll" href="Orders.aspx">Orders</a> </li>
                    <li><a class="page-scroll" href="Purchase_Order.aspx">Purchase Order</a> </li>
                    <li><a class="page-scroll" href="Goods_Receipt.aspx">Goods Receipts</a> </li>
                    <li><a class="page-scroll" href="Updates.aspx">Updates</a> </li>
                    <li><a class="page-scroll" href="ProcuredRawMaterial.aspx">Procured Raw Material</a> </li>
                    
                   
                </ul>
            </div>
        </div>
    </div>


        <asp:SqlDataSource ID="SqlRequires" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Requires] ORDER BY [Require_ID]" DeleteCommand="DELETE FROM [Requires] WHERE [Require_ID] = @Require_ID" InsertCommand="INSERT INTO [Requires] ([WorkOrder_ID], [RawMaterial_ID]) VALUES (@WorkOrder_ID, @RawMaterial_ID)" UpdateCommand="UPDATE [Requires] SET [WorkOrder_ID] = @WorkOrder_ID, [RawMaterial_ID] = @RawMaterial_ID WHERE [Require_ID] = @Require_ID">
            <DeleteParameters>
                <asp:Parameter Name="Require_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="Require_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div style="margin-top:200px;" align="center">
        <asp:SqlDataSource ID="SqlWorkOrder_ID" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [WorkOrder] ORDER BY [WorkOrder_ID]" DeleteCommand="DELETE FROM [WorkOrder] WHERE [WorkOrder_ID] = @WorkOrder_ID" InsertCommand="INSERT INTO [WorkOrder] ([Product_ID], [CreatedDate], [DueDate], [Submitted_By], [Product_Quantity], [Is_WorkScheduled]) VALUES (@Product_ID, @CreatedDate, @DueDate, @Submitted_By, @Product_Quantity, @Is_WorkScheduled)" UpdateCommand="UPDATE [WorkOrder] SET [Product_ID] = @Product_ID, [CreatedDate] = @CreatedDate, [DueDate] = @DueDate, [Submitted_By] = @Submitted_By, [Product_Quantity] = @Product_Quantity, [Is_WorkScheduled] = @Is_WorkScheduled WHERE [WorkOrder_ID] = @WorkOrder_ID">
            <DeleteParameters>
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_ID" Type="Int16" />
                <asp:Parameter Name="CreatedDate" Type="String" />
                <asp:Parameter Name="DueDate" Type="String" />
                <asp:Parameter Name="Submitted_By" Type="String" />
                <asp:Parameter Name="Product_Quantity" Type="Int32" />
                <asp:Parameter Name="Is_WorkScheduled" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_ID" Type="Int16" />
                <asp:Parameter Name="CreatedDate" Type="String" />
                <asp:Parameter Name="DueDate" Type="String" />
                <asp:Parameter Name="Submitted_By" Type="String" />
                <asp:Parameter Name="Product_Quantity" Type="Int32" />
                <asp:Parameter Name="Is_WorkScheduled" Type="Boolean" />
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlRawMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [RawMaterial] ORDER BY [RawMaterial_ID]">
        </asp:SqlDataSource>

                <br />
                <asp:Label ID="lbRequiresHeader" runat="server" Text="Requires Details" Font-Bold="True"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddRequires" runat="server" Text="Add" OnClick="btnaddRequires_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvRequires" runat="server">
                    
                    <asp:GridView ID="gvRequires" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlRequires" AutoGenerateColumns="False" DataKeyNames="Require_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Require_ID" HeaderText="Require_ID" SortExpression="Require_ID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="WorkOrder_ID" HeaderText="WorkOrder_ID" SortExpression="WorkOrder_ID" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" SortExpression="RawMaterial_ID" />
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
                        <EditRowStyle BackColor="Yellow"/>
                    </asp:GridView>
                   </asp:Panel>

                <asp:Panel ID="PaneladdRequires" runat="server" Visible="false">
                        <asp:Label ID="lbUpdatesaddTitle" runat="server" Text="Add Updates into Database" />
                        <br />
                        <asp:Label ID="lbWorkOrder_ID" runat="server" Text="WorkOrder_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownQWorkOrder_ID" runat="server" DataSourceID="SqlWorkOrder_ID" DataTextField="WorkOrder_ID" DataValueField="WorkOrder_ID" Height="29px" Width="151px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="rfvPrvd_id" runat="server" ControlToValidate="DropDownQWorkOrder_ID" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="lbRawMaterial_ID" runat="server" Text="RawMaterial_ID: " Width="150px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownRawMaterial_ID" runat="server" DataSourceID="SqlRawMaterial" DataTextField="RawMaterial_Name" DataValueField="RawMaterial_ID" Height="29px" Width="151px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnSaveRequires" runat="server" OnClick="btnSaveRequires_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelRequires" runat="server" OnClick="btnCancelRequires_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>

</body>
</html>
