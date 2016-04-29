<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Machinery.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Machinery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Machinery Management</title>
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
        <asp:SqlDataSource ID="SqlMachinery" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [Machinery] ORDER BY [Machine_Name]" DeleteCommand="DELETE FROM [Machinery] WHERE [Machine_ID] = @Machine_ID" InsertCommand="INSERT INTO [Machinery] ([Machine_Name], [Machine_Date_Of_Commission], [Machine_Is_Active]) VALUES (@Machine_Name, @Machine_Date_Of_Commission, @Machine_Is_Active)" UpdateCommand="UPDATE [Machinery] SET [Machine_Name] = @Machine_Name, [Machine_Date_Of_Commission] = @Machine_Date_Of_Commission, [Machine_Is_Active] = @Machine_Is_Active WHERE [Machine_ID] = @Machine_ID">
            <DeleteParameters>
                <asp:Parameter Name="Machine_ID" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Machine_Name" Type="String" />
                <asp:Parameter Name="Machine_Date_Of_Commission" Type="DateTime" />
                <asp:Parameter Name="Machine_Is_Active" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Machine_Name" Type="String" />
                <asp:Parameter Name="Machine_Date_Of_Commission" Type="DateTime" />
                <asp:Parameter Name="Machine_Is_Active" Type="Boolean" />
                <asp:Parameter Name="Machine_ID" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <div style="margin-top:100px;" align="center">
                <br />
                <asp:Label ID="lbMachineryHeader" runat="server" Text="Machinery - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Panel ID="PanelgvMachinery" runat="server">
                <asp:Button ID="btaddMachinery" runat="server" CssClass="bg-primary" Text="Add" OnClick="btaddMachinery_Click"/>
                <br /> <br />
                
                    <asp:GridView ID="gvMachinery" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlMachinery" AutoGenerateColumns="False" DataKeyNames="Machine_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:CheckBoxField DataField="Machine_Is_Active" ItemStyle-HorizontalAlign="Center" HeaderText="Active" SortExpression="Machine_Is_Active" />
                            <asp:BoundField DataField="Machine_ID" HeaderText="Machine ID" ItemStyle-HorizontalAlign="Left" ReadOnly="True" SortExpression="Machine_ID" />
                            <asp:BoundField DataField="Machine_Name" HeaderText="Machine Name" ItemStyle-HorizontalAlign="Center" SortExpression="Machine_Name" />
                             <asp:BoundField DataField="Machine_Date_Of_Commission" DataFormatString="{0:MM/dd/yyyy}" ItemStyle-HorizontalAlign="Center" HeaderText="Machine DOC" SortExpression="Machine_Date_Of_Commission" />
                            
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
                <asp:Panel ID="PaneladdMachinery" Visible="false" runat="server">
                <asp:Label ID="lbMachineryaddTitle" Text="Add Machinery into Database" runat="server" /><br /> <br />
                    <div class="form-inline">
                    <asp:Label ID="lblMachineActive" Text="Machine Active: " width="150"  runat="server" />
                    <asp:RadioButtonList ID="rbMachineActive" width="250" RepeatDirection="Horizontal" CssClass="radio" TextAlign="Right" runat="server">
                        <asp:ListItem Value="true" Text="Active &nbsp"></asp:ListItem>
                        <asp:ListItem Value="false" Text="In-Active"></asp:ListItem>
                    </asp:RadioButtonList>
                        </div>
                    <asp:RequiredFieldValidator ID="rfvMachineActive" width="350" ValidationGroup="addMachineryValidation" runat="server" ControlToValidate="rbMachineActive" ErrorMessage="(*) Must be selected" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    
                    <asp:Label ID="lbMachineryName" Width="150" Text="Machine Name: " runat="server" />
                    <asp:TextBox ID="txtMachineryName" Width="250" ValidationGroup="addMachineryValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvMachineryName" ValidationGroup="addMachineryValidation" runat="server" ControlToValidate="txtMachineryName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ValidationGroup="addMachineryValidation" ID="revMachineryName" runat="server" ControlToValidate="txtMachineryName"
                                 ErrorMessage=" * max 20 characters" ForeColor="Red" ValidationExpression="[a-zA-Z0-9- ]{1,20}$"></asp:RegularExpressionValidator><br />

                    <asp:Label ID="lblMachineDOC" Width="150" Text="Date of Commission: " runat="server"></asp:Label>
                    <asp:TextBox ID="txtMachineDOC" ReadOnly="true" Width="230" ValidationGroup="addMachineryValidation" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton ID="coeMachineDOC" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="coeMachineDOC_Click" Width="25px" /><br />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                    <asp:Calendar ID="calMachineDOC" OnSelectionChanged="calMachineDOC_SelectionChanged" runat="server"></asp:Calendar><br />
                        </asp:Panel>
                    <asp:RequiredFieldValidator ID="rfvMachineDOC" ValidationGroup="addMachineryValidation" runat="server" ControlToValidate="txtMachineDOC" ErrorMessage="(*) Must have a Date of Commission" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                    <asp:Button ID="btnSaveMachinery" CssClass="bg-primary" ValidationGroup="addMachineryValidation" runat="server" Text="Save" OnClick="btnSaveMachinery_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelMachinery" runat="server" CssClass="bg-primary" Text="Cancel" OnClick="btnCancelMachinery_Click"/>
                    </asp:Panel>
        </div>
    </form>
</body>
</html>


