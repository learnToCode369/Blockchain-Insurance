<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="customer.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 8px;
            align-content:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-left: 590px">
        <h2>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">ADD NEW CUSTOMER</asp:LinkButton></h2>
    </div>
    <div style="margin-left: 308px; width: 743px; align-content:center;height: 175px">
        <asp:GridView ID="GridView1" runat="server" OnRowCommand="RowCommand" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" Width="743px" 
            >
            <Columns>
                <%--<asp:BoundField HeaderText="PASSWORD" DataField="password" />--%>
                <asp:BoundField HeaderText="ID" DataField="cust_id" />
                <asp:BoundField HeaderText="NAME" DataField="cust_name" />
                <asp:BoundField HeaderText="ADDRESS" DataField="address" />
                <asp:BoundField HeaderText="CONTACT NUMBER" DataField="phno" />
                <asp:BoundField HeaderText="EMAIL ID" DataField="emailId" />
                <asp:ButtonField Text="EDIT" CommandName="Edit_" />
                <asp:ButtonField Text="DELETE" CommandName="Delete_" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    </div>
    <br />
    <div style="margin-left: 560px">
        <table runat="server" id="tbl1" style="font-size: large; height: 361px;">
            <tr>
                <td>
                    ID
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" ReadOnly="true" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    NAME
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    ADDRESS
                </td>
                <td>
                    :
                </td>
                <td>
                    <%--             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>--%>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="TextBox8" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    PHONE NO
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="10"></asp:TextBox>
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                </td>
                <td class="style3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox6"
                        ErrorMessage="Enter proper phone no" ForeColor="Red" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    EMAIL ID
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
                </td>
                <td class="style3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox7"
                        ErrorMessage="Enter proper email id" ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="SUBMIT" OnClick="Button1_Click" class="btn btn-outline-primary" />
                    <asp:Button ID="Button2" runat="server" Text="UPDATE" OnClick="Button2_Click" class="btn btn-outline-primary" />
                </td>
            </tr>
        </table>
    </div>
    <br />
</asp:Content>
