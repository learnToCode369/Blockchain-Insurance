<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="show2.aspx.cs" Inherits="user_show2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style type="text/css">
        .style1
        {
            width: 8px;
            
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            text-align: right;
            width: 173px;
        }
        .auto-style4 {
            height: 23px;
            text-align: right;
            width: 173px;
        }
        .auto-style5 {
            width: 173px;
        }
        .auto-style6 {
            width: 127px;
        }
        .auto-style7 {
            height: 23px;
            width: 127px;
        }
        .auto-style8 {
            text-align: right;
            width: 173px;
            height: 44px;
        }
        .auto-style9 {
            width: 127px;
            height: 44px;
        }
        .auto-style10 {
            height: 44px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left: 440px">

        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="policy_number" runat="server" Text="Policy Number:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtpolicynumber" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="policy_type" runat="server" Text="Policy Type:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtploicytype" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="policy" runat="server" Text="Policy:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtpolicy" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="contact_number" runat="server" Text="Contact Number:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtcontactnumber" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="email_id" runat="server" Text="Email-ID:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtemail_id" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="claim_amount" runat="server" Text="Claim_Amount:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtcmlaimamount" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="end_date" runat="server" Text="End_Date:"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtend_date" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
               <%-- <td class="auto-style6">
                    <asp:Button ID="apply_for_claim" runat="server" Text="Back" Width="166px"  class="btn btn-outline-primary" Height="35px"/>
                </td>--%>
                <td>&nbsp;</td>
            </tr>
        </table>

</div>
</asp:Content>

