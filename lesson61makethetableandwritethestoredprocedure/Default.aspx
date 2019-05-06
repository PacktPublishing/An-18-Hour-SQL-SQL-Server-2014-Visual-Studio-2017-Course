<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.12.4.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="main" style="position:absolute">
            <%-- After video: added div with check box to enable collapsing/expanding of main div --%>
            <div>
                <asp:CheckBox ID="chkHideShowAll" AutoPostBack="true" runat="server" OnCheckedChanged="chkHideShowAll_CheckedChanged" />Data Entry Box

            </div>
            <%-- After video: wrapped everything in a panel to make it all collapsible --%>
            <asp:panel ID="innerDiv" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            Enter Name:<asp:TextBox ID="txtName" runat="server" CssClass="boxes"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="txtName" ErrorMessage="Must Enter Name"></asp:RequiredFieldValidator>
            <br />



            Enter Email:<asp:TextBox ID="txtEmail" runat="server" CssClass="boxes"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="txtEmail" ErrorMessage="Must Enter Email"></asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ControlToValidate="txtEmail" ErrorMessage="Must Enter Valid Email"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>


            <br />

                Enter Date:<asp:TextBox ID="txtDate" runat="server" CssClass="boxes" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="txtDate" ErrorMessage="Must Enter Date "></asp:RequiredFieldValidator>



            <asp:CheckBox ID="CheckBox1" 
                runat="server" 
                AutoPostBack="true"
                Text="Check to show calendar." 
                OnCheckedChanged="CheckBox1_CheckedChanged" />



            <br />
            <asp:updatepanel runat="server">
                <ContentTemplate>
                     <asp:Calendar 
                     ID="Calendar1" 
                     runat="server" 
                                  OnSelectionChanged="Calendar1_SelectionChanged"
                     Visible="False" >

                 </asp:Calendar> 
                </ContentTemplate>
            </asp:updatepanel>
                

          
           


            <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                OnClick="btnSubmit_Click" />
                  <%-- Solution to question in video: 
                         1. Must make Email field into Editable Template 
                         2. Must add requglar expression validator to email field 
                         3. Must add a validation group to separate boxes in Grid from text 
                            boxes above the grid
                         3. put email box, regular expression validator 2 and ShowDeleteButton in same
                            validation group to ensure the grid is validated separately from the boxes above the grid
                         4. Also add another required field validator to email field in grid view or the program
                            will crash, since nulls are not allowed in the table
                        --%>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                AllowSorting="True" AutoGenerateColumns="False"
                DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" ValidationGroup="Grid" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    
                    <asp:TemplateField HeaderText="Email" SortExpression="Email" ValidateRequestMode="Enabled">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" 

                                runat="server" 
                                Text='<%# Bind("Email") %>'
                                ValidationGroup="Grid">

                            </asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator2" 
                                runat="server"  
                                ControlToValidate="TextBox1" 
                                ErrorMessage="Incorrect Format" 
                                ValidationGroup="Grid"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                               </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator 
                                ID="gwEmailBoxValidator" 
                                runat="server" 
                                ControlToValidate="TextBox1"
                                ValidationGroup="Grid"
                                ErrorMessage="Must Enter Value"
                                ></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DateAdded" HeaderText="DateAdded" SortExpression="DateAdded" />
                </Columns>
            </asp:GridView>



            <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:personTableConnectionString %>" 
                DeleteCommand="DELETE FROM [PersonTable] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [PersonTable] ([Name], [Email], [DateAdded]) VALUES (@Name, @Email, @DateAdded)" 
                SelectCommand="SELECT [Id], [Name], [Email], [DateAdded] FROM [PersonTable]"
                UpdateCommand="UPDATE [PersonTable] SET [Name] = @Name, [Email] = @Email, [DateAdded] = @DateAdded WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter DbType="Date" Name="DateAdded" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter DbType="Date" Name="DateAdded" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            </asp:panel>
        </div>
        
    </form>
    <%-- Note that I have removed the $(function() {...}) from around the jQuery --%>
    <%-- It's not necessary because the jQuery is on the bottom --%>
    <script>
        $("#main").draggable()
        var topLeft = JSON.parse(localStorage.getItem('div'))
        $("#main").css(topLeft)
        $(window).on('beforeunload', function () {
            var pos = $("#main").position()
            localStorage.setItem('div', JSON.stringify(pos))
        });
    </script>
      <%-- After video: If the jQuery above does not work, try rewriting it as shown below. --%>
      <%--Put the $(window).on... call first --%>
      <%-- <script> 
        $("#main").draggable()
      
        $(window).on('beforeunload', function () {
            var pos = $("#main").position()
            localStorage.setItem('div', JSON.stringify(pos))
        });
        var topLeft = JSON.parse(localStorage.getItem('div'))
        $("#main").css(topLeft)

    </script> --%>
</body>
</html>

