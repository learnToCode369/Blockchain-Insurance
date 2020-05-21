<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="laser.aspx.cs" Inherits="UserForm_laser" %>

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
      <div style="margin-left: 280px; width: 743px; align-content:center;height: 500px">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" Width="743px" 
            >
            <Columns>
                <%--<asp:BoundField HeaderText="PASSWORD" DataField="password" />--%>
                 <asp:BoundField HeaderText="log_id" DataField="log_id" />
                <asp:BoundField HeaderText="hash" DataField="hash" />
               <%-- <asp:BoundField HeaderText="Type" DataField="Type" />
                <asp:BoundField HeaderText="date_a_paid" DataField="date_a_paid" DataFormatString="{0:d}"/>--%>
             <%--   <asp:BoundField HeaderText="START DATE" DataField="start_date" DataFormatString="{0:d}"/>
                <asp:BoundField HeaderText="END DATE" DataField="end_date" DataFormatString="{0:d}"/>--%>
                  <asp:HyperLinkField DataNavigateUrlFields="log_id" HeaderText="Action" DataNavigateUrlFormatString="show4.aspx?amp&msg=delete&log_id={0}"
                            Text="View" ItemStyle-HorizontalAlign="Center" />
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

