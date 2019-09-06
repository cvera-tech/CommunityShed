<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoanApplication.aspx.cs" Inherits="CommunityShed.Pages.LoanApplication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div>
        <asp:Label ID ="LenderNameDisplay" runat ="Server"></asp:Label>
        <asp:Label ID ="ToolDetailLabel" runat ="Server" Text ="Tools Details:"></asp:Label>
    </div>
    <div>
        <div>
         <asp:Label ID ="ToolNameDisplay" runat ="Server"></asp:Label>
        </div>
        <div>
         <asp:Label ID ="ToolsWarningDisplay" runat ="Server"></asp:Label>
        </div>
        <div>
         <asp:Label ID ="ToolsAgeDisplay" runat ="Server"></asp:Label>
        </div>
         
    </div>

    <asp:Button ID="SubmitLoan" runat="server" Text ="Search" OnClick="SubmitLoan_Click"/>
   <%-- <asp:DropDownList id="DaySelector"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="Selection_Change"
                    runat="server">
                  <asp:ListItem Value="1"> 1 </asp:ListItem>
                  <asp:ListItem Value="2"> 2 </asp:ListItem>
                  <asp:ListItem Value="3"> 3 </asp:ListItem>
                  <asp:ListItem Value="4"> 4 </asp:ListItem>
                  <asp:ListItem Value="5"> 5 </asp:ListItem>
                  <asp:ListItem Value="6"> 6 </asp:ListItem>
                  <asp:ListItem Value="7"> 7 </asp:ListItem>
               </asp:DropDownList>--%>
</asp:Content>
