<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="show3.aspx.cs" Inherits="user_show3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style type="text/css">
        .style1
        {
            width: 8px;
            align-content:center;
        }
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        text-align: right;
        width: 177px;
    }
    .auto-style3 {
        width: 177px;
    }
    .auto-style4 {
        width: 130px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div style="margin-left: 520px; height: 239px;">
    
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="policy_number" runat="server" Text="POLICY NUMBER:"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtpolicy_number" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="name" runat="server" Text="POLICY HOLDER NAME:"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtname" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="contact_number" runat="server" Text="CONTACT NUMBER:"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtcontact_number" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="email_id" runat="server" Text="EMAIL-ID:"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtemailid" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="claim_amount" runat="server" Text="CLAIM AMOUNT:"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtclaim_amount" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="get_claim_amount" runat="server" Text="GET CLAIM AMOUNT:"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txt_get_amount" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    
</div>
</asp:Content>

