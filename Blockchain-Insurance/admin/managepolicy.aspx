<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="managepolicy.aspx.cs" Inherits="admin_managepolicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 8px;
            align-content:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left: 590px">
        <h2>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">MANAGE POLICY</asp:LinkButton></h2>
    </div>
    <div style="margin-left: 308px; width: 743px; align-content:center;height: 150px">
        <asp:GridView ID="GridView1" runat="server" OnRowCommand="RowCommand" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" Width="743px" style="margin-left: 0px" 
            >
            <Columns>
                <%--<asp:BoundField HeaderText="PASSWORD" DataField="password" />--%>
                 <asp:BoundField HeaderText="ID" DataField="manage_id" />
                <asp:BoundField HeaderText="POLICY TYPE" DataField="policy_type" />
                <asp:BoundField HeaderText="POLICY" DataField="policy" />
                <asp:BoundField HeaderText="DESCRIPTION" DataField="description" />
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
                    &nbsp;</td>
                <td>
                    :</td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                 
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    POLICY_TYPE
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="132px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    POLICY
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" Width="134px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="DropDownList2"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    DESCRIPTION
                </td>
                <td>
                    :
                </td>
                <td>
                    <%--             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>--%>
                    <asp:TextBox ID="TextBox8" runat="server" Height="79px" TextMode="MultiLine" Width="232px"></asp:TextBox>
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="TextBox8" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="ADD POLICY" class="btn btn-outline-primary"  OnClick="Button1_Click" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="UPDATE POLICY" class="btn btn-outline-primary"  OnClick="Button2_Click"  />
                </td>
            </tr>
        </table>
    </div>
    <br />
</asp:Content>

