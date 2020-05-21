<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="user_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="register-box1">
            <div class="register-logo">
              <%--  <a href="../../BusinessAnalysis_Project/FinancialProject_Website/ "><b>upload File</b></a>--%>
            </div>
          <div class="form-group has-feedback">
                                    <center>
     
        <hr />
        <div style="text-align: center; font-size: 20px; width: 70%; padding: 25px;">
            Select File Type : &nbsp;
            <asp:DropDownList ID="ddlFileType" runat="server" Style="width: 150px; font-size: 18px;
                cursor: pointer; background-color: transparent; padding: 5px 10px 5px 10px;">
                  <asp:ListItem Text="select File" Value=""></asp:ListItem>
                <asp:ListItem Text="Insurance Form" Value="pdffile"></asp:ListItem>
            </asp:DropDownList>
            <div style="clear: both; height: 35px;">
            </div>
            <asp:Button ID="btnDownloadFile" runat="server" Text="Download Selected File" Style="font-size: 18px;
                border: 1px solid Black; cursor: pointer; background-color: transparent; padding: 5px 10px 5px 10px;" OnClick="btnDownloadFile_Click"
                />
            <div style="clear: both; height: 35px;">
            </div>
        </div>
    </center>

                   
                    </div>
</asp:Content>

