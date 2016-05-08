<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="ProductionManagement.ProductionManagement.Product" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Design - Management</title>
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
                    <li><a class="page-scroll" href="Rawmaterial.aspx">Raw Material</a> </li>
                    <li><a class="page-scroll" href="Product.aspx">Product</a> </li>
                    <li><a class="page-scroll" href="Design.aspx">Design</a> </li>
                    <li><a class="page-scroll" href="Workorder.aspx">Work Order</a> </li>
                    <li><a class="page-scroll" href="WorkSchedule.aspx">Work Schedule</a> </li>
                    <li><a class="page-scroll" href="FinishedProduct.aspx">Finished Products</a> </li>
                    <li><a class="page-scroll" href="Machinery.aspx">Machinery</a> </li>
                    <li><a class="page-scroll" href="Employee.aspx">Employee</a> </li>
                </ul>
            </div>
        </div>
    </div>

        <asp:SqlDataSource ID="SqlRequires" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Require.Require_ID, Require.Product_ID, Require.RawMaterial_ID, Require.RawMaterial_Quantity, Design.Design_Name + ', ' + code_1.Code_Description + ', ' + Code.Code_Description + ', ' + code_3.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Product_Name, RawMaterial.RawMaterial_Name + ', ' + code_2.Code_Description + ', ' + ISNULL(RawMaterial.RawMaterial_Description, ' ') AS Rawmaterial_Name FROM Require LEFT OUTER JOIN Product ON Require.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Design.Design_Section LEFT OUTER JOIN RawMaterial ON Require.RawMaterial_ID = Require.RawMaterial_ID LEFT OUTER JOIN Code AS code_2 ON code_2.Code_ID = RawMaterial.RawMaterial_Color ORDER BY Design.Design_Name" DeleteCommand="DELETE FROM [Require] WHERE [Require_ID] = @Require_ID" InsertCommand="INSERT INTO Require(Product_ID, RawMaterial_ID, RawMaterial_Quantity) VALUES (@Product_ID, @RawMaterial_ID, @RawMaterial_Quantity)" UpdateCommand="UPDATE Require SET Product_ID = @Product_ID, RawMaterial_ID = @RawMaterial_ID, RawMaterial_Quantity = @RawMaterial_Quantity WHERE (Require_ID = @Require_ID)">
            <DeleteParameters>
                <asp:Parameter Name="Require_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_ID" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial_Quantity" Type="Byte" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_ID" />
                <asp:Parameter Name="RawMaterial_ID" Type="Int16" />
                <asp:Parameter Name="RawMaterial_Quantity" Type="Byte" />
                <asp:Parameter Name="Require_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlRequireDrop" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT DISTINCT Require.Product_ID, Design.Design_Name + ', ' + code_1.Code_Description + ', ' + Code.Code_Description + ', ' + code_3.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Product_Name FROM Require LEFT OUTER JOIN Product ON Require.Product_ID = Product.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_3 ON code_3.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Design.Design_Section ORDER BY Product_Name" />
        
        <asp:SqlDataSource ID="SqlRawmaterial" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT RawMaterial.RawMaterial_ID, RawMaterial.RawMaterial_Name + ',' + Code.Code_Description + ', ' + RawMaterial.RawMaterial_Description AS RawMaterial_Name FROM RawMaterial LEFT OUTER JOIN Code ON Code.Code_ID = RawMaterial.RawMaterial_Color"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProducts" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Product_ID, Product.Design_ID, Product.Size, Product.Color, Product.Product_Description, Design.Design_Name + ', ' + code_2.code_description + ', ' + Code.Code_Description + ', ' + code_1.Code_Description + ', ' + ISNULL(Product.Product_Description, ' ') AS Name FROM Product LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS code_1 ON code_1.Code_ID = Product.Color LEFT OUTER JOIN Code AS code_2 ON code_2.code_id = Design.Design_Section"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Product.Design_ID, Product.Product_ID, Product.Size, Product.Color, Product.Product_Description, Code.Code_Description AS Product_Size, Code_1.Code_Description AS Product_Color, Design.Design_Name + ', ' + Code_2.Code_Description AS Name FROM Product LEFT OUTER JOIN Code ON Code.Code_ID = Product.Size LEFT OUTER JOIN Code AS Code_1 ON Code_1.Code_ID = Product.Color LEFT OUTER JOIN Design ON Product.Design_ID = Design.Design_ID LEFT OUTER JOIN Code AS Code_2 ON Code_2.Code_ID = Design.Design_Section ORDER BY Design.Design_Name" DeleteCommand="DELETE FROM [Product] WHERE [Product_ID] = @Product_ID" InsertCommand="INSERT INTO [Product] ([Design_ID], [Size], [Color], [Product_Description]) VALUES (@Design_ID, @Size, @Color, @Product_Description)" UpdateCommand="UPDATE [Product] SET [Design_ID] = @Design_ID, [Size] = @Size, [Color] = @Color, [Product_Description] = @Product_Description WHERE [Product_ID] = @Product_ID">
            <DeleteParameters>
                <asp:Parameter Name="Product_ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="Size" Type="Int16" />
                <asp:Parameter Name="Color" Type="Int16" />
                <asp:Parameter Name="Product_Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Design_ID" Type="Int16" />
                <asp:Parameter Name="Size" Type="Int16" />
                <asp:Parameter Name="Color" Type="Int16" />
                <asp:Parameter Name="Product_Description" Type="String" />
                <asp:Parameter Name="Product_ID" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlCodeSize" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Code_ID, Code_Type, Code_Description FROM Code WHERE (Code_Type = 'SIZE')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCodeColor" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Code_ID, Code_Type, Code_Description FROM Code WHERE (Code_Type = 'COLOR')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDesign" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Design.Design_ID, Design.Design_Is_Active, Design.Design_Name + ', ' + Code.Code_Description AS Name, Design.Design_Section FROM Design LEFT OUTER JOIN Code ON Design.Design_Section = Code.Code_ID WHERE (Design.Design_Is_Active = 'true') ORDER BY Design.Design_Name"></asp:SqlDataSource>

            <div style="margin-top:100px;" align="center">
                <br />
                <asp:Label ID="lbProductHeader" runat="server" Text="Product - Management" Font-Bold="true"></asp:Label> <br /> <br />
                <asp:Button ID="btnaddProduct" runat="server" CssClass="bg-primary" Text="Add" OnClick="btnaddProduct_Click"/>
                <br /> <br />
                <asp:Panel ID="PanelgvProduct" runat="server">
                    <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlProduct" AutoGenerateColumns="False" DataKeyNames="Product_ID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Product_ID" HeaderText="Product ID" InsertVisible="False" ReadOnly="True" SortExpression="Product_ID" />
                            <asp:TemplateField HeaderText="Design Name" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropDesignName" runat="server" DataSourceID="SqlDesign" DataTextField="Name" DataValueField="Design_ID" SelectedValue='<%# Bind("Design_ID") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDesignName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Size" SortExpression="Product_Size">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropSize" runat="server" DataSourceID="SqlCodeSize" DataTextField="Code_Description" DataValueField="Code_ID" SelectedValue='<%# Bind("Size") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSize" runat="server" Text='<%# Bind("Product_Size") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Color" SortExpression="Product_Color">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropColor" runat="server" DataSourceID="SqlCodeColor" DataTextField="Code_Description" DataValueField="Code_ID" SelectedValue='<%# Bind("Color") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblColor" runat="server" Text='<%# Bind("Product_Color") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Product_Description" HeaderText="Product Description" SortExpression="Product_Description" />
                            <asp:TemplateField HeaderText="RM Required"  ShowHeader="False">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="lnkRequireds" runat="server" CausesValidation="False" ToolTip=" click to check the Raw Material Required for this Product" OnClick="lnkRequireds_Click"  Text="RM"></asp:LinkButton>
                                 </ItemTemplate>
                                
                            </asp:TemplateField>
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
                <asp:Panel ID="PaneladdProduct" Visible="false" runat="server">
                <asp:Label ID="lbProductaddTitle" Text="Add Product to Database" runat="server" /><br /> <br />
                    <div class="form-group form-horizontal col-md-8" >
                        <asp:Label ID="lbDesignName" Width="200" align="right" Text="Design Name: " runat="server" />
                        <asp:DropDownList ID="dropDesignName" Width="200" runat="server" AppendDataBoundItems="true" EnableViewState="false" DataSourceID="SqlDesign" DataTextField="Name" DataValueField="Design_ID">
                            <asp:ListItem Text="-- Select a Design --" Value="-1"></asp:ListItem>
                        </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvProductName" ValidationGroup="addProductValidation" InitialValue="-1" runat="server" ControlToValidate="dropDesignName" ErrorMessage="(*) Must have Design Name" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="lblProductSize" Width="200"  align="right" Text="Size: " runat="server" />
                        <asp:DropDownList ID="dropProductSize" AppendDataBoundItems="true" EnableViewState="false" runat="server" Width="200" DataSourceID="SqlCodeSize" DataTextField="Code_Description" DataValueField="Code_ID" >
                            <asp:ListItem Text="-- Size --" Value="-1"></asp:ListItem>
                        </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvdropsize" ValidationGroup="addProductValidation" InitialValue="-1" runat="server" ControlToValidate="dropProductSize" ErrorMessage="(*) Must have a Size" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="lblProductColor" Width="200" align="right" Text="Color: " runat="server" />
                        <asp:DropDownList ID="dropProductColor" runat="server" AppendDataBoundItems="true" EnableViewState="false" Width="200" DataSourceID="SqlCodeColor" DataTextField="Code_Description" DataValueField="Code_ID" >
                            <asp:ListItem Text="-- Color --" Value="-1"></asp:ListItem>
                        </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="rfvdropColor" ValidationGroup="addProductValidation" InitialValue="-1" runat="server" ControlToValidate="dropProductColor" ErrorMessage="(*) Must have a Color" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="lbProductDescription" align="right" Width="200" Text="Description: " runat="server" />
                        <asp:TextBox ID="txtProductDescription" Width="200"  ValidationGroup="addProductValidation" runat="server" ></asp:TextBox><br />
                        <asp:RegularExpressionValidator ValidationGroup="addProductValidation" ID="revProductDescription" runat="server" ControlToValidate="txtProductDescription"
                                 ErrorMessage=" * max 50 characters" ForeColor="Red" ValidationExpression="[a-zA-Z0-9- ]{1,50}$"></asp:RegularExpressionValidator><br />
                        <br /> <br />
                        <asp:Button ID="btnSaveProductDesign" CssClass="bg-primary" ValidationGroup="addProductValidation" runat="server" Text="Save" OnClick="btnSaveProduct_Click"/> &nbsp;&nbsp;
                        <asp:Button ID="btnCancelProductDesign" CssClass="bg-primary" runat="server" Text="Cancel" OnClick="btnCancelProduct_Click"/>
                    </div>
                    </asp:Panel>



        </div>

    </form>
</body>
</html>

