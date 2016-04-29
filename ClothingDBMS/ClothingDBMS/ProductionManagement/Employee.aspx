﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Management</title>
<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="Kumaraguru" />
    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="../css/the-big-picture.css" rel="stylesheet" />
    <link href="../css/font-icon.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <link href="../css/flexslider.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/animate.min.css" rel="stylesheet" type="text/css" />
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
            <div id="custom-bootstrap-menu" class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <a class="navbar-brand" href="#">Naveen Textile Limited</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="page-scroll" href="../Index.aspx">Home</a> </li>
                    <li><a class="page-scroll" href="Default.aspx">Production - Home</a> </li>
                    <li><a class="page-scroll" href="Allocates.aspx">Allocates</a> </li>
                    <li><a class="page-scroll" href="Employee.aspx">Employee</a> </li>
                    <li><a class="page-scroll" href="Includes.aspx">Includes</a> </li>
                    <li><a class="page-scroll" href="Machinery.aspx">Machinery</a> </li>
                    <li><a class="page-scroll" href="Product.aspx">Product</a> </li>
                    <li><a class="page-scroll" href="Design.aspx">Design</a> </li>
                    <li><a class="page-scroll" href="Rawmaterial.aspx">Rawmaterial</a> </li>
                    <li><a class="page-scroll" href="Require.aspx">Require</a> </li>
                    <li><a class="page-scroll" href="Workorder.aspx">WorkOrder</a> </li>
                    <li><a class="page-scroll" href="WorkSchedule.aspx">WorkSchedule</a> </li>
                </ul>
            </div>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Employee] ORDER BY [Employee_Name]" DeleteCommand="DELETE FROM [Employee] WHERE [Employee_ID] = @Employee_ID" InsertCommand="INSERT INTO [Employee] ([Employee_Name], [Address], [Contact_Number], [Date_of_Birth]) VALUES (@Employee_Name, @Address, @Contact_Number, @Date_of_Birth)" UpdateCommand="UPDATE [Employee] SET [Employee_Name] = @Employee_Name, [Address] = @Address, [Contact_Number] = @Contact_Number, [Date_of_Birth] = @Date_of_Birth WHERE [Employee_ID] = @Employee_ID">
            <DeleteParameters>
                <asp:Parameter Name="Employee_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Employee_Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Contact_Number" Type="String" />
                <asp:Parameter Name="Date_of_Birth" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Employee_Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Contact_Number" Type="String" />
                <asp:Parameter Name="Date_of_Birth" Type="String" />
                <asp:Parameter Name="Employee_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div align="center">
                <br />
                <asp:Label ID="lbEmployeeHeader" runat="server" Text="Employee- Management" Font-Bold="true"></asp:Label> <br /> <br />
                
                <asp:Panel ID="PanelgvEmployee" runat="server">
                    <asp:Button ID="btnaddEmployee" runat="server" OnClick="btnaddEmployee_Click" Text="Add" /><br /> <br />
                    <asp:GridView ID="gvEmployee" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlEmployee" AutoGenerateColumns="False" DataKeyNames="Employee_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" ReadOnly="True" SortExpression="Employee_ID" />
                            <asp:BoundField DataField="Employee_Name" HeaderText="Employee_Name" SortExpression="Employee_Name" />
                             <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Contact_Number" HeaderText="Contact_Number" SortExpression="Contact_Number" />
                            <asp:BoundField DataField="Date_of_Birth" HeaderText="Date_of_Birth" SortExpression="Date_of_Birth" />
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
                <asp:Panel ID="PaneladdEmployee" Visible="false" runat="server">
                <asp:Label ID="lbEmployeeaddTitle" Text="Add Employee into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lbEmployeeName" Width="150" Text="Employee Name: " runat="server" />
                    <asp:TextBox ID="txtEmployeeName" ValidationGroup="addEmployeeValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvEmployeeName" ValidationGroup="addEmployeeValidation" runat="server" ControlToValidate="txtEmployeeName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblEmployeeAddress" Width="150" Text="Address: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtEmployeeAddress" runat="server"></asp:TextBox><br />
                    <asp:Label ID="lblEmployeeContactNumber" Width="150" Text="Contact Number: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtEmployeeContactNumber" runat="server"></asp:TextBox><br />
                    <asp:Label ID="lblEmployeeDOB" Width="150" Text="Date of Birth: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtEmployeeDOB" runat="server"></asp:TextBox><asp:Calendar ID="calDateofBirth" OnSelectionChanged="calDateofBirth_SelectionChanged" runat="server"></asp:Calendar><br />
                    <br /> <br />
                    <asp:Button ID="btnSaveEmployee" ValidationGroup="addEmployeeValidation" runat="server" Text="Save" OnClick="btnSaveEmployee_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelEmployee" runat="server" Text="Cancel" OnClick="btnCancelEmployee_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>



