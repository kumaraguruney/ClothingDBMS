<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Allocates.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Allocates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Allocation</title>
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
                <a class="navbar-brand" href="../Index.aspx">NTL</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
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
        <asp:SqlDataSource ID="SqlAllocates" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Allocates.Allocates_ID, Allocates.Workschedule_ID, Allocates.Employee_ID, Allocates.Allocated_Time, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Employee.Employee_Name FROM Allocates LEFT OUTER JOIN Workschedule ON Workschedule.Workschedule_ID = Allocates.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Allocates.Employee_ID order by Name" DeleteCommand="DELETE FROM [Allocates] WHERE [Allocates_ID] = @Allocates_ID" InsertCommand="INSERT INTO [Allocates] ([Workschedule_ID], [Employee_ID], [Allocated_Time]) VALUES (@Workschedule_ID, @Employee_ID, @Allocated_Time)" UpdateCommand="UPDATE [Allocates] SET [Workschedule_ID] = @Workschedule_ID, [Employee_ID] = @Employee_ID, [Allocated_Time] = @Allocated_Time WHERE [Allocates_ID] = @Allocates_ID">
            <DeleteParameters>
                <asp:Parameter Name="Allocates_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
                <asp:Parameter Name="Employee_ID" Type="Byte" />
                <asp:Parameter Name="Allocated_Time" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
                <asp:Parameter Name="Employee_ID" Type="Byte" />
                <asp:Parameter Name="Allocated_Time" Type="String" />
                <asp:Parameter Name="Allocates_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlAllocatesdrop" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT distinct Allocates.Workschedule_ID, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name FROM Allocates LEFT OUTER JOIN Workschedule ON Workschedule.Workschedule_ID = Allocates.Workschedule_ID LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Allocates.Employee_ID ORDER BY Name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Employee] ORDER BY [Employee_Name]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWorkSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Workschedule.Workschedule_ID, Workschedule.WorkScheduled_Date, Workschedule.WorkScheduled_To_End, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name FROM Workschedule LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section ORDER BY Name"></asp:SqlDataSource>
            <div style="margin-top:100px;" align="center">
                <br />
                <asp:Label ID="lblAllocates" runat="server" Text="Employee Allocates to Work Schedule" Font-Bold="true"></asp:Label> <br /> <br />
                 <asp:Panel ID="PanelgvAllocates" runat="server">
                      <asp:Label ID="lblAllocatesFilter" runat="server" Text="Please Select a WorkSchedule and Click Filter: " Font-Bold="true"></asp:Label>
                <asp:DropDownList ID="dropAllocatesSearch" width="300" DataSourceID="SqlAllocatesdrop" AppendDataBoundItems="true" DataTextField="Name"  DataValueField="WorkSchedule_ID" runat="server">
                <asp:ListItem Text="--- Please Select a Work Schedule ---" Value="-1"></asp:ListItem>
                </asp:DropDownList> &nbsp; &nbsp; <asp:Button ID="btnAllocatesfilter" runat="server" Text="Filter" CssClass="bg-primary" OnClick="btnAllocatesfilter_Click"/> &nbsp; &nbsp; <asp:Button ID="btnAllocatesClear" runat="server" Text="Clear" CssClass="bg-primary" OnClick="btnAllocatesClear_Click"/> &nbsp;&nbsp;
                 <asp:Button ID="btnaddAllocates" runat="server" CssClass="bg-primary" Text="Add" OnClick="btnaddAllocates_Click"/>
                <br /> <br />

                    <asp:GridView ID="gvAllocates" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlAllocates" AutoGenerateColumns="False" DataKeyNames="Allocates_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Allocates_ID" HeaderText="Allocates ID" ReadOnly="True" SortExpression="Allocates_ID" />
                            <asp:TemplateField HeaderText="Workschedule" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropWorkSchedule" runat="server" DataSourceID="SqlWorkSchedule" DataTextField="Name" DataValueField="WorkSchedule_ID" SelectedValue='<%# Bind("WorkSchedule_ID") %>'/>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblWorkscheduleName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employee Name" SortExpression="Employee_Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropgridEmployee" runat="server" DataSourceID="SqlEmployee" DataTextField="Employee_Name" DataValueField="Employee_ID" SelectedValue='<%# Bind("Employee_ID") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Allocated_Time" HeaderText="Allocated_Time" SortExpression="Allocated_Time" />
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
                <asp:Panel ID="PaneladdAllocates" Visible="false" runat="server">
                <asp:Label ID="lblAllocatesaddTitle" Text=" Allocate Employee to a Work Schedule in the Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblAllocatesEmployee" Width="200" Text="Employee: " runat="server" />
                    <asp:DropDownList ID="dropEmployee" Width="300" runat="server" AppendDataBoundItems="true" EnableViewState="false" DataSourceID="SqlEmployee" DataTextField="Employee_Name" DataValueField="Employee_ID">
                        <asp:ListItem Text="-- Select an Employee --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvWorkschedule" InitialValue="-1" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="dropEmployee" ErrorMessage="(*) One Employee should be selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="lblIncludesWorkscheduleID" Width="200" Text="Workschedule: " runat="server" />
                    <asp:DropDownList ID="dropWorkschedule" Width="300" AppendDataBoundItems="true" EnableViewState="false" runat="server" DataSourceID="SqlWorkSchedule" DataTextField="Name" DataValueField="Workschedule_ID">
                        <asp:ListItem Text="-- Select a WorkSchedule --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropWorkschedule" ValidationGroup="addAllocatesValidation" InitialValue="-1" runat="server" ControlToValidate="dropWorkschedule" ErrorMessage="(*) One Employee should be Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <br />
                     <asp:Label ID="lblAllocatesTime" Width="200" Text="Hours of Operation: " runat="server" />
                    <asp:TextBox ID="txtAllocatesTime" Width="300" ValidationGroup="addAllocatesValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvAllocatesTime" ValidationGroup="addAllocatesValidation" runat="server" ControlToValidate="txtAllocatesTime" ErrorMessage="(*) Must have some hours" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addAllocatesValidation" ID="revAllocatesTime" runat="server" ControlToValidate="txtAllocatesTime"
                                 ErrorMessage=" (*) eg: 8.00 or 3.00" ForeColor="Red" ValidationExpression="^\d+.\d{0,2}$"></asp:RegularExpressionValidator>
						<br /> <br />
                    <asp:Button ID="btnSaveAllocates" CssClass="bg-primary" ValidationGroup="addAllocatesValidation" runat="server" Text="Save" OnClick="btnSaveAllocates_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelAllocates" CssClass="bg-primary" runat="server" Text="Cancel" OnClick="btnCancelAllocates_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>




