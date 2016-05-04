<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Workschedule.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Workschedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Work Schedule - Management</title>
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
        <asp:SqlDataSource ID="SqlWorkOrder" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT WorkOrder.WorkOrder_ID, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name FROM WorkOrder LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section ORDER BY WorkOrder.Product_ID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Employee] ORDER BY [Employee_Name]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWorkSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Workschedule.Workschedule_ID, Workschedule.WorkOrder_ID, Workschedule.WorkScheduled_By, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Employee.Employee_Name FROM Workschedule LEFT OUTER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Workschedule.WorkScheduled_By ORDER BY Name" DeleteCommand="DELETE FROM [Workschedule] WHERE [Workschedule_ID] = @Workschedule_ID" InsertCommand="INSERT INTO [Workschedule] ([WorkOrder_ID],  [WorkScheduled_By]) VALUES (@WorkOrder_ID, @WorkScheduled_By)" UpdateCommand="UPDATE [Workschedule] SET [WorkOrder_ID] = @WorkOrder_ID,  [WorkScheduled_By] = @WorkScheduled_By WHERE [Workschedule_ID] = @Workschedule_ID">
            <DeleteParameters>
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
                <asp:Parameter Name="WorkScheduled_By" Type="Byte" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="WorkOrder_ID" Type="Int16" />
                <asp:Parameter Name="WorkScheduled_By" Type="Byte" />
                <asp:Parameter Name="Workschedule_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div style="margin-top:100px;" align="center">
                <br />
                <asp:Label ID="lblWorkSchedule" runat="server" Text="Work Schedule - Management" Font-Bold="true"></asp:Label> <br /> <br />
                
                <asp:Panel ID="PanelgvWorkSchedule" runat="server">
                    <asp:Button ID="btaddWorkSchedule" CssClass="bg-primary" runat="server" Text="Add" OnClick="btaddWorkSchedule_Click"/>
                <br /> <br />
                    <asp:GridView ID="gvWorkSchedule" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlWorkSchedule" AutoGenerateColumns="False" DataKeyNames="Workschedule_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Workschedule_ID" HeaderText="Workschedule ID" InsertVisible="False" ReadOnly="True" SortExpression="Workschedule_ID" />
                            <asp:TemplateField HeaderText="WorkOrder " SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropWorkOrder" runat="server" DataSourceID="SqlWorkOrder" DataTextField="Name" DataValueField="WorkOrder_ID" SelectedValue='<%# Bind("WorkOrder_ID") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblWorkOrder" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="WorkScheduled_By" SortExpression="WorkScheduled By">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropEmployee" runat="server" DataSourceID="SqlEmployee" DataTextField="Employee_Name" DataValueField="Employee_ID" SelectedValue='<%# Bind("WorkScheduled_By") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblWorkScheduledBy" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <EditRowStyle BackColor="Yellow" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                   </asp:Panel>
                <asp:Panel ID="PaneladdWorkSchedule" Visible="false" runat="server">
                <asp:Label ID="lbProductaddWorkSchedule" Text="Add Work Schedule into Database" runat="server" /><br /> <br />
                    <asp:Label ID="lblWorkOrderName" Width="150" Text=" Work Order: " runat="server" />
                    <asp:DropDownList ID="dropaddWorkOrder" AppendDataBoundItems="true" EnableViewState="false" runat="server" Width="250" DataSourceID="SqlWorkOrder" DataTextField="Name" DataValueField="WorkOrder_ID">
                        <asp:ListItem Text="-- Work Order--" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvdropWorkOrder" InitialValue="-1" ValidationGroup="addWorkScheduleValidation" runat="server" ControlToValidate="dropaddWorkOrder" ErrorMessage="(*) Must have one WorkOrder Selected" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <br />
                    <asp:Label ID="lblWorkScheduledBy" Width="150" Text="Scheduled By: " runat="server"></asp:Label>
                    <asp:DropDownList ID="dropaddScheduledBy" AppendDataBoundItems="true" EnableViewState="true" runat="server" Width="250" DataSourceID="SqlEmployee" DataTextField="Employee_Name" DataValueField="Employee_ID">
                    <asp:ListItem Text="-- ScheduledBy --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br /><br />
                     <asp:RequiredFieldValidator ID="rfvWorkScheduledBy" InitialValue="-1" ValidationGroup="addWorkScheduleValidation" runat="server" ControlToValidate="dropaddScheduledBy" ErrorMessage="(*) Must be filled" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <br /> <br />
                    <asp:Button ID="btnSaveWorkSchedule" CssClass="bg-primary" ValidationGroup="addWorkScheduleValidation" runat="server" Text="Save" OnClick="btnSaveWorkSchedule_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelWorkSchedule" CssClass="bg-primary" runat="server" Text="Cancel" OnClick="btnCancelWorkSchedule_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>


