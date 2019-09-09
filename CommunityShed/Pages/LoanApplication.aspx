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
    <div>  
    <asp:Label ID ="DurationLabel" Text ="Choose duration:" runat="server"></asp:Label> 
    <asp:DropDownList id="DaySelector"
                    runat="server">
                  <asp:ListItem Value="1"> 1 day </asp:ListItem>
                  <asp:ListItem Value="2"> 2 days </asp:ListItem>
                  <asp:ListItem Value="3"> 3 days </asp:ListItem>
                  <asp:ListItem Value="4"> 4 days</asp:ListItem>
                  <asp:ListItem Value="5"> 5 days</asp:ListItem>
                  <asp:ListItem Value="6"> 6 days </asp:ListItem>
                  <asp:ListItem Value="7"> 7 days </asp:ListItem>
               </asp:DropDownList>
        </div> 
</asp:Content>
