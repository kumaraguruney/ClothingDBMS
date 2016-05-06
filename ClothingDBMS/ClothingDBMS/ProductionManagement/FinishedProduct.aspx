<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinishedProduct.aspx.cs" Inherits="ClothingDBMS.ProductionManagement.FinishedProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <asp:SqlDataSource ID="SqlFinishedProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT * FROM [FinishedProduct] ORDER BY [Batch_ID]" DeleteCommand="DELETE FROM [FinishedProduct] WHERE [Batch_ID] = @Batch_ID" InsertCommand="INSERT INTO [FinishedProduct] ([Product_ID], [Manufactured_Date], [Quantity], [Is_Stock_Piled]) VALUES (@Product_ID, @Manufactured_Date, @Quantity, @Is_Stock_Piled)" UpdateCommand="UPDATE [FinishedProduct] SET [Product_ID] = @Product_ID, [Manufactured_Date] = @Manufactured_Date, [Quantity] = @Quantity, [Is_Stock_Piled] = @Is_Stock_Piled WHERE [Batch_ID] = @Batch_ID">
            <DeleteParameters>
                <asp:Parameter Name="Batch_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_ID" Type="Int32" />
                <asp:Parameter Name="Manufactured_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Is_Stock_Piled" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_ID" Type="Int32" />
                <asp:Parameter Name="Manufactured_Date" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Is_Stock_Piled" Type="Boolean" />
                <asp:Parameter Name="Batch_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Workschedule.Workschedule_ID, Workschedule.WorkOrder_ID, Workschedule.WorkScheduled_By, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Employee.Employee_Name, Workschedule.Is_FinishedProduct_Updated, Product.Product_ID, WorkOrder.Product_Quantity FROM Workschedule INNER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID AND ISNULL(Workschedule.Is_FinishedProduct_Updated, 0) = 'FALSE' LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Workschedule.WorkScheduled_By ORDER BY Name" UpdateCommand="UPDATE Workschedule SET Is_FinishedProduct_Updated = @Is_FinishedProduct_Updated WHERE (Workschedule_ID = @WorkSchedule_ID)">
            <UpdateParameters>
                <asp:Parameter Name="Is_FinishedProduct_Updated" />
                <asp:Parameter Name="WorkSchedule_ID" />
            </UpdateParameters>
            </asp:SqlDataSource>

          <div style="margin-top:100px;" align="center">
        <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:clothingDBMSConnectionString %>" SelectCommand="SELECT Workschedule.Workschedule_ID, Workschedule.WorkOrder_ID, Workschedule.WorkScheduled_By, Design.Design_Name + ' ,' + section.Code_Description + ', ' + color.Code_Description + ', ' + size.Code_Description + ' ,' + ISNULL(Product.Product_Description, ' ') + ', ' + CAST(WorkOrder.Product_Quantity AS varchar(8)) AS Name, Employee.Employee_Name, Workschedule.Is_FinishedProduct_Updated, Product.Product_ID FROM Workschedule INNER JOIN WorkOrder ON Workschedule.WorkOrder_ID = WorkOrder.WorkOrder_ID AND ISNULL(Workschedule.Is_FinishedProduct_Updated, 0) = 'FALSE' LEFT OUTER JOIN Product ON Product.Product_ID = WorkOrder.Product_ID LEFT OUTER JOIN Design ON Design.Design_ID = Product.Design_ID LEFT OUTER JOIN Code AS size ON size.Code_ID = Product.Size LEFT OUTER JOIN Code AS color ON color.Code_ID = Product.Color LEFT OUTER JOIN Code AS section ON section.Code_ID = Design.Design_Section LEFT OUTER JOIN Employee ON Employee.Employee_ID = Workschedule.WorkScheduled_By ORDER BY Name" UpdateCommand="UPDATE Workschedule SET Is_FinishedProduct_Updated = @Is_FinishedProduct_Updated WHERE (Workschedule_ID = @WorkSchedule_ID)">
            <UpdateParameters>
                <asp:Parameter Name="Is_FinishedProduct_Updated" />
                <asp:Parameter Name="WorkSchedule_ID" />
            </UpdateParameters>
              </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblFinishedProduct" runat="server" Text="Finished Product Details" Font-Bold="True"></asp:Label> <br />
                <asp:Panel ID="PanelgvFinishedProduct" runat="server" style="margin-top: 0px">
                       <asp:GridView ID="gvFinishedProduct" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlFinishedProduct" AutoGenerateColumns="False" DataKeyNames="Batch_ID">
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:BoundField DataField="Batch_ID" HeaderText="Batch_ID" ReadOnly="True" SortExpression="Batch_ID" InsertVisible="False" />
                            <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
                             <asp:BoundField DataField="Manufactured_Date" HeaderText="Manufactured_Date" SortExpression="Manufactured_Date" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete"></asp:LinkButton>
                                 </ItemTemplate>
                            </asp:TemplateField>
                        </Columns><FooterStyle BackColor="#CCCCCC" />
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

                <asp:Panel ID="PaneladdFinishedProduct" Visible="true" runat="server">
                <asp:Label ID="lblFinishedProductDetails" Text="Enter Finished Product Details" runat="server" /><br /> <br />
                    <asp:Label ID="lblProductID" runat="server" Text="Product:" Width="200px" />
                    <asp:DropDownList ID="dropaddProduct" Width="250px" AutoPostBack="true" AppendDataBoundItems="True" EnableViewState="False" runat="server" DataSourceID="SqlProduct" DataTextField="Name" DataValueField="Workschedule_ID" OnSelectedIndexChanged="dropaddProduct_SelectedIndexChanged">
                    <asp:ListItem Text="-- Select a Finished Product --" Value="-1"></asp:ListItem>
                    </asp:DropDownList>
                    <br /><asp:RequiredFieldValidator ID="rfvaddProduct" ValidationGroup="addFinishedProductValidation" InitialValue="-1" runat="server" ControlToValidate="dropaddProduct" ErrorMessage="(*) Must select a Product" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <br />
                        
                    <br />
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" Width="200px" />
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="250px" ReadOnly="true"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblManufacturedDate" runat="server" Text="Manufactured Date:" Width="200px" />
                    <asp:TextBox ID="ManufacturedDateTextBox" ReadOnly="true" runat="server" Width="230px"></asp:TextBox>&nbsp;<asp:ImageButton ID="calimgManufacturedDate" runat="server" height="30px" ImageUrl="~/img/calender.png" OnClick="calimgManufacturedDate_Click" Width="25px" />
                    <br /><asp:RequiredFieldValidator ID="rfvManufacturedDateTextBox" ValidationGroup="addFinishedProductValidation"  runat="server" ControlToValidate="ManufacturedDateTextBox" ErrorMessage="(*) Must have a date" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Panel ID="calpanel" runat="server" Visible="false">
                        <asp:Calendar ID="calManufacturedDate" runat="server" OnSelectionChanged="calManufacturedDate_SelectionChanged"></asp:Calendar>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnSaveFinishedProduct" ValidationGroup="addFinishedProductValidation" CssClass="bg-primary" runat="server" Text="Save" OnClick="btnSaveFinishedProduct_Click"/> &nbsp;&nbsp;
                    <asp:Button ID="btnCancelFinishedProduct" runat="server" Text="Cancel"  CssClass="bg-primary" OnClick="btnCancelFinishedProduct_Click"/>
                   
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
