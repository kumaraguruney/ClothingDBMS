﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Requires.aspx.cs" Inherits="ClothingDBMS.ProcurementManagement.Requires" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <nav>
    <div class="nav-wrapper">
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../Index.aspx">Home</a></li>
        <li><a href="Default.aspx">Procurement Management - Home</a></li>
        <li><a href="Supplier.aspx">Supplier</a></li>
          <li><a href="Supplier_Quotation.aspx">Supplier Quotation</a></li>
          
      </ul>
    </div>
  </nav>
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

            <div align="center">
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
                <asp:Button ID="btnaddRequires" runat="server" Text="Add" OnClick="btnaddOrders_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvRequires" runat="server">
                    
                    <asp:GridView ID="gvRequires" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProvides" AutoGenerateColumns="False" DataKeyNames="Require_ID">
                        <Columns>
                            <asp:BoundField DataField="Require_ID" HeaderText="Require_ID" SortExpression="Require_ID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="WorkOrder_ID" HeaderText="WorkOrder_ID" SortExpression="WorkOrder_ID" />
                            <asp:BoundField DataField="RawMaterial_ID" HeaderText="RawMaterial_ID" SortExpression="RawMaterial_ID" />
                        </Columns>
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
                        <asp:RequiredFieldValidator ID="rfvPrvd_id" runat="server" ControlToValidate="PurchaseOrderIDDropDownList" ErrorMessage="(*) Must have some ID" ForeColor="Red" ValidationGroup="addSupplierValidation"></asp:RequiredFieldValidator>
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
                        <asp:Button ID="btnSaveRequires" runat="server" OnClick="btnSaveOrders_Click" Text="Save" ValidationGroup="addSupplierValidation" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancelRequires" runat="server" OnClick="btnCancelOrders_Click" Text="Cancel" />
                    </asp:Panel>
        </div>
    </form>
    
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
