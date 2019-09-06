<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CommunityShed.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <asp:Panel ID="LoansPanel" runat="server">
        <h1>Your Borrowed Items</h1>
        <asp:Repeater ID="LoansRepeater" runat="server"></asp:Repeater>
        <asp:Button ID="LoansButton" runat="server"
            Text="View All" 
            OnCommand="LoansButton_Command" />
    </asp:Panel>
    <asp:Panel ID="CommunitiesPanel" runat="server">
        <h1>Your Communities</h1>
        <asp:Repeater ID="CommunitiesRepeater" runat="server"></asp:Repeater>
        <asp:Button ID="CommunitiesButton" runat="server"
            Text="View All" 
            OnCommand="CommunitiesButton_Command" />
    </asp:Panel>
    <asp:Panel ID="ItemsPanel" runat="server">
        <h1>Your Items</h1>
        <asp:Repeater ID="ItemsRepeater" runat="server"></asp:Repeater>
        <asp:Button ID="ItemsButton" runat="server"
            Text="View All" 
            OnCommand="ItemsButton_Command" />
    </asp:Panel>
</asp:Content>
