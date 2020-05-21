<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="view_claim.aspx.cs" Inherits="admin_view_claim" %>

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
  <div style="margin-left: 280px; width: 743px; align-content:center;height: 550px">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" Width="743px"  OnRowCommand="GridView2_RowCommand">
            <Columns>
                <%--<asp:BoundField HeaderText="PASSWORD" DataField="password" />--%>
                 <asp:BoundField HeaderText="CUSTOMER ID" DataField="cust_id" />
                <asp:BoundField HeaderText="POLICY NUMBER" DataField="policy_number" />
                <asp:BoundField HeaderText="POLICY TYPE" DataField="policy_type" />
                <asp:BoundField HeaderText="POLICY" DataField="policy" />
                <asp:BoundField HeaderText="EMAIL ID" DataField="emailId" />
                <asp:BoundField HeaderText="CLAIM AMOUNT" DataField="claim_amount" />
             <%--<asp:ButtonField Text="ACCEPT" CommandName="Accept_" />--%>
               <%-- <asp:ButtonField Text="REJECT" CommandName="Reject_" />--%>
                 <%--  <asp:ButtonField Text="ACCEPT" runat="server"/>
                <asp:ButtonField Text="REJECT" runat="server"/>--%>
                     <asp:HyperLinkField DataNavigateUrlFields="cust_id" HeaderText="Action" DataNavigateUrlFormatString="accept.aspx?amp&msg=delete&cust_id={0}"
                            Text="Accept" ItemStyle-HorizontalAlign="Center" />
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
</asp:Content>

