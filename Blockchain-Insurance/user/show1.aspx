<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="show1.aspx.cs" Inherits="user_show1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style type="text/css">
        .style1
        {
            width: 8px;
        }
    .auto-style2 {
        height: 14px;
        width: 92px;
    }
    .auto-style3 {
        text-align: right;
        width: 539px;
    }
    .auto-style4 {
        height: 14px;
        text-align: right;
        width: 539px;
    }
    .auto-style5 {
        width: 138px;
    }
    .auto-style6 {
        height: 14px;
        width: 138px;
    }
    .auto-style7 {
        width: 539px;
        text-align: right;
    }
    .auto-style8 {
        text-align: right;
        width: 539px;
        height: 26px;
    }
    .auto-style9 {
        width: 138px;
        height: 26px;
    }
    .auto-style10 {
        height: 26px;
        width: 92px;
    }
    .auto-style11 {
        width: 92px;
    }
    .auto-style21 {
        width: 539px;
        text-align: right;
        height: 34px;
    }
    .auto-style22 {
        width: 138px;
        height: 34px;
    }
    .auto-style23 {
        width: 92px;
        height: 34px;
    }
    .auto-style24 {
        width: 539px;
        text-align: right;
        height: 31px;
    }
    .auto-style25 {
        width: 138px;
        height: 31px;
    }
    .auto-style26 {
        width: 92px;
        height: 31px;
    }
    .auto-style27 {
        text-align: right;
        width: 539px;
        height: 30px;
    }
    .auto-style28 {
        width: 138px;
        height: 30px;
    }
    .auto-style29 {
        width: 92px;
        height: 30px;
    }
    .auto-style33 {
        text-align: right;
        width: 539px;
        height: 29px;
    }
    .auto-style34 {
        width: 138px;
        height: 29px;
    }
    .auto-style35 {
        width: 92px;
        height: 29px;
    }
    .auto-style36 {
        height: 22px;
        text-align: right;
        width: 539px;
    }
    .auto-style37 {
        height: 22px;
        width: 138px;
    }
    .auto-style38 {
        height: 22px;
        width: 92px;
    }
    .auto-style39 {
        text-align: right;
        width: 539px;
        height: 25px;
    }
    .auto-style40 {
        width: 138px;
        height: 25px;
    }
    .auto-style41 {
        width: 92px;
        height: 25px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="height: 202px; font-size: large">
                 
        <tr>
            <td class="auto-style21">
                <asp:Label ID="Policy_Holder_Name" runat="server" Text="Policy Holder Name:"></asp:Label>
            </td>
            <td class="auto-style22">
                <asp:TextBox ID="txtname" runat="server" Height="35px" Width="250px" ReadOnly="True" ></asp:TextBox>
            </td>
            <td class="auto-style23">
                
            </td>
        </tr>
        <tr>
            <td class="auto-style33">
                <asp:Label ID="Age" runat="server" Text="Age:"></asp:Label>
            </td>
            <td class="auto-style34">
                <asp:TextBox ID="txtage" runat="server" Height="35px" Width="250px" ReadOnly="True" ></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td class="auto-style36">
                <asp:Label ID="Policy_Type" runat="server" Text="Policy Type:"></asp:Label>
            </td>
            <td class="auto-style37">
                <asp:TextBox ID="txtpolicytype" runat="server" Height="35px" Width="250px" ReadOnly="True" ></asp:TextBox>
                &nbsp;</td>
          
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Policy" runat="server" Text="Policy:"></asp:Label>
            </td>
            <td class="auto-style25">
                <asp:TextBox ID="txtpolicy" runat="server" Height="35px" Width="250px" ReadOnly="True" ></asp:TextBox>
                </td>
          
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Purchase_Date" runat="server" Text="Purchase Date:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txt_p_date" runat="server" Height="35px" Width="250px" ReadOnly="True" ></asp:TextBox>
            </td>
        
        </tr>
        <tr>
            <td class="auto-style39">
                <asp:Label ID="Contact_Number" runat="server" Text="Contact Number:"></asp:Label>
            </td>
            <td class="auto-style40">
                <asp:TextBox ID="txt_con" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
            </td>
       
        </tr>
        <tr>
            <td class="auto-style27">
                <asp:Label ID="Premium_Amount" runat="server" Text="Premium Amount:"></asp:Label>
            </td>
            <td class="auto-style28">
                <asp:TextBox ID="txtpre" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
            </td>
         
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Start_Date" runat="server" Text="Start Date:"></asp:Label>
            </td>
            <td class="auto-style5">
               
                <asp:TextBox ID="txtstart" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
            </td>
         
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="End_Date" runat="server" Text="End Date:"></asp:Label>
            </td>
            <td class="auto-style9">
              
                <asp:TextBox ID="txtenddate" runat="server" Height="35px" Width="250px" ReadOnly="True"></asp:TextBox>
            </td>
         
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td style="text-align: left" class="auto-style5">
                &nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

