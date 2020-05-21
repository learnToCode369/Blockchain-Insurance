<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="New_Policy.aspx.cs" Inherits="faculty_New_Policy" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
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
        height: 45px;
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
    .auto-style42 {
        width: 138px;
        height: 45px;
    }
    .auto-style43 {
        width: 92px;
        height: 45px;
    }
    .auto-style44 {
        height: 8px;
        text-align: right;
        width: 539px;
    }
    .auto-style45 {
        height: 8px;
        width: 138px;
    }
    .auto-style46 {
        height: 8px;
        width: 92px;
    }
    </style>
        </head>

    </html>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="height: 202px; font-size: large;">
             <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>     
        <tr>
            <td class="auto-style21">
                <asp:Label ID="Policy_Holder_Name" runat="server" Text="Policy Holder Name:"></asp:Label>
            </td>
            <td class="auto-style22">
                <asp:TextBox ID="TextBox1" runat="server" Height="35px" Width="250px"></asp:TextBox>

            </td>
            <td class="auto-style23">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style33">
                <asp:Label ID="Age" runat="server" Text="Age:"></asp:Label>
            </td>
            <td class="auto-style34">
                <asp:TextBox ID="TextBox2" runat="server" Height="35px" Width="250px"></asp:TextBox>
            </td>
            <td class="auto-style35">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="auto-style44">
                <asp:Label ID="Policy_Type" runat="server" Text="Policy Type:"></asp:Label>
            </td>
            <td class="auto-style45">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="35px" Width="250px">
                        
                    </asp:DropDownList>
               </td>
            <td class="auto-style46">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Policy" runat="server" Text="Policy:"></asp:Label>
            </td>
            <td class="auto-style25">
                <asp:DropDownList ID="DropDownList2" runat="server" Height="35px" Width="250px">
                       
                    </asp:DropDownList>
                </td>
            <td class="auto-style26">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DropDownList2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Purchase_Date" runat="server" Text="Purchase Date:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox3" runat="server" Height="35px" Width="250px" ></asp:TextBox>
              <cc1:CalendarExtender ID="CalendarExtender1" runat="server"  TargetControlID="TextBox3" ></cc1:CalendarExtender>
            </td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                
            </td>
        </tr>
        <tr>
            <td class="auto-style39">
                <asp:Label ID="Contact_Number" runat="server" Text="Contact Number:"></asp:Label>
            </td>
            <td class="auto-style40">
                <asp:TextBox ID="TextBox4" runat="server" Height="35px" Width="250px"></asp:TextBox>
            </td>
            <td class="auto-style41">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style27">
                <asp:Label ID="Premium_Amount" runat="server" Text="Premium Amount:"></asp:Label>
            </td>
            <td class="auto-style28">
                <asp:TextBox ID="TextBox5" runat="server" Height="35px" Width="250px"></asp:TextBox>
            </td>
            <td class="auto-style29">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Start_Date" runat="server" Text="Start Date:"></asp:Label>
            </td>
            <td class="auto-style42">
               
                <asp:TextBox ID="TextBox6" runat="server" Height="35px" Width="250px"></asp:TextBox>
               <cc1:CalendarExtender ID="CalendarExtender2" runat="server"  TargetControlID="TextBox6" ></cc1:CalendarExtender>
            </td>
            <td class="auto-style43">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="End_Date" runat="server" Text="End Date:"></asp:Label>
            </td>
            <td class="auto-style9">
              
                <asp:TextBox ID="TextBox7" runat="server" Height="35px" Width="250px"></asp:TextBox>
                  <cc1:CalendarExtender ID="CalendarExtender3" runat="server"  TargetControlID="TextBox7" ></cc1:CalendarExtender>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    

                
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="End_Date0" runat="server" Text="Upload Aadhaar card:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:FileUpload ID="FileUpload1" runat="server" Height="35px" Width="250px" />
            </td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="End_Date1" runat="server" Text="Upload Form:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:FileUpload ID="FileUpload2" runat="server" Height="35px" Width="250px" />
            </td>
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
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="Add_Policy" runat="server" style="text-align: left" Text="Add Policy" OnClick="Add_Policy_Click" class="btn btn-outline-primary" Width="250px" />
            </td>
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

