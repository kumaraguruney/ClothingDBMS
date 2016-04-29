<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Design.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Design" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Management</title>
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
        <asp:SqlDataSource ID="SqlDesign" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Design.Design_ID, Design.Design_Is_Active, Design.Design_Name, Design.Design_Section, Code.Code_Description FROM Design LEFT OUTER JOIN Code ON Code.Code_ID = Design.Design_Section ORDER BY Design.Design_Name" DeleteCommand="DELETE FROM [Design] WHERE [Design_ID] = @Design_ID" InsertCommand="INSERT INTO [Design] ([Design_Is_Active], [Design_Name], [Design_Section]) VALUES (@Design_Is_Active, @Design_Name, @Design_Section)" UpdateCommand="UPDATE [Design] SET [Design_Is_Active] = @Design_Is_Active, [Design_Name] = @Design_Name, [Design_Section] = @Design_Section WHERE [Design_ID] = @Design_ID">
            <DeleteParameters>
                <asp:Parameter Name="Design_ID" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Design_Is_Active" />
                <asp:Parameter Name="Design_Name" />
                <asp:Parameter Name="Design_Section" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Design_Is_Active" />
                <asp:Parameter Name="Design_Name" Type="String" />
                <asp:Parameter Name="Design_Section" Type="Int16" />
                <asp:Parameter Name="Design_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>


            <asp:SqlDataSource ID="SqlSection" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Code_ID, Code_Type, Code_Description FROM Code WHERE (Code_Type = 'SECT') ORDER BY Code_Description"></asp:SqlDataSource>


            <div style="margin-top:100px;" align="center">
                <br />
                <asp:Label ID="lbDesignHeader" runat="server" Text="Design - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Panel ID="PanelgvDesign" runat="server">
                <asp:Button ID="btnaddDesign" runat="server" CssClass="bg-primary" Text="Add" OnClick="btnaddDesign_Click"/>
                <br /> <br />
                
                    <asp:GridView ID="gvDesign" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDesign" AutoGenerateColumns="False" DataKeyNames="Design_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Design_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Design_ID" />
                            <asp:CheckBoxField DataField="Design_Is_Active" HeaderText="Active" ItemStyle-HorizontalAlign="Center" SortExpression="Design_Is_Active">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="Design_Name" HeaderText="Design Name" SortExpression="Design_Name" />
                            <asp:TemplateField HeaderText="Section" SortExpression="Design_Section">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropSection" runat="server" DataSourceID="SqlSection" DataTextField="Code_Description" DataValueField="Code_ID" SelectedValue='<%# Bind("Design_Section") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDesign_Section" runat="server" Text='<%# Bind("Code_Description") %>'></asp:Label>
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
                <asp:Panel ID="PaneladdDesign" Visible="false" runat="server">
                <asp:Label ID="lblDesignaddTitle" Text="Add Design into Database" runat="server" /><br /> <br />
                    <div class="form-inline">
                    <asp:Label ID="lblDesignActive" Text="Design Active: " width="150"  runat="server" />
                    <asp:RadioButtonList ID="rbDesignActive" width="250" RepeatDirection="Horizontal" CssClass="radio" TextAlign="Right" runat="server">
                        <asp:ListItem Value="true" Text="Active &nbsp;"></asp:ListItem>
                        <asp:ListItem Value="false" Text="In-Active "></asp:ListItem>
                    </asp:RadioButtonList><br/>
                    <asp:RequiredFieldValidator ID="rfvDesignActive" width="350" ValidationGroup="addDesignValidation" runat="server" ControlToValidate="rbDesignActive" ErrorMessage="(*) Must be selected" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                        </div>
                    <asp:Label ID="lblDesignName" Text="Design Name: " width="150" runat="server" />
                    <asp:TextBox ID="txtDesignName" width="250" ValidationGroup="addDesignValidation" runat="server" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvDesignName" width="350" ValidationGroup="addDesignValidation" runat="server" ControlToValidate="txtDesignName" ErrorMessage="(*) Must have some Name" ForeColor="Red"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ValidationGroup="addDesignValidation" ID="revDesignName" runat="server" ControlToValidate="txtDesignName"
                                 ErrorMessage=" * max 28 characters" ForeColor="Red" ValidationExpression="[a-zA-Z- ]{1,28}$"></asp:RegularExpressionValidator><br />
                    <asp:Label ID="lblDesignSection" Text="Product Section: " width="150" runat="server" ></asp:Label>
                    <asp:DropDownList ID="dropSection" runat="server" AppendDataBoundItems="true" EnableViewState="false" DataSourceID="SqlSection" width="250" DataTextField="Code_Description" DataValueField="Code_ID">
                         <asp:ListItem Text="-- Section --" Value="-1"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvdropSection" width="350" ValidationGroup="addDesignValidation" InitialValue="-1" runat="server" ControlToValidate="dropSection" ErrorMessage="(*) Must have Section" ForeColor="Red"></asp:RequiredFieldValidator><br /> <br />
                    <asp:Button ID="btnSaveDesign" CssClass="bg-primary" ValidationGroup="addDesignValidation" runat="server" Text="Save" OnClick="btnSaveDesign_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelDesign" CssClass="bg-primary" runat="server" Text="Cancel" OnClick="btnCancelDesign_Click"/>
                    </asp:Panel>

        </div>
    </form>
</body>
</html>

