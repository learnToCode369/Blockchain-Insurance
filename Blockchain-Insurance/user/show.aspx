<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="show.aspx.cs" Inherits="user_show" %>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.7.123, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 8px;
            
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
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
            text-align: right;
            width: 173px;
            height: 23px;
        }
        .auto-style8 {
            width: 127px;
            height: 23px;
        }
        .auto-style9 {
            height: 23px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left: 440px">

        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="policy_number" runat="server" Text="Name:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtname" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    </td>
                <td class="auto-style8">
                    </td>
                <td class="auto-style9">
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="policy_type" runat="server" Text="Address"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtaddress" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
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
                    <asp:Label ID="policy" runat="server" Text="contact number"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtnumber" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
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
                    <asp:Label ID="contact_number" runat="server" Text="Email-id"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtemail" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
           <%-- <tr>
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
                    <asp:TextBox ID="TextBox2" runat="server" Height="35px" Width="250px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
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
                    <asp:TextBox ID="TextBox3" runat="server" Height="35px" Width="250px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
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
                    <asp:TextBox ID="TextBox4" runat="server" Height="35px" Width="250px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="ImageButton1" TargetControlID="TextBox4" ></cc1:CalendarExtender>
                </td>
                <td class="auto-style10">
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                     <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>     
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>--%>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

</div>
</asp:Content>

