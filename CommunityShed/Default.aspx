<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CommunityShed.Default" %>

<%@ Import Namespace="System.Data" %>
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
    <asp:Panel ID="RequestsPanel" runat="server">
        <h1>Your Requests</h1>
        <div>
            <asp:Repeater ID="ItemsList" runat="server" ItemType="DataRow">
                <HeaderTemplate>
                    <table class="table table-sm table-striped table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Tool</th>
                                <th>Requestor</th>
                                <th>Date Requested</th>
                                <th>Duration</th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Item.Field<string>("itemName") %></td>
                        <td><%# Item.Field<string>("FullName") %></td>
                        <td><%# Item.Field<string>("reqDate") %></td>
                        <td><%# Item.Field<string>("DurationTime") %></td>

                        <td>
                            <asp:HyperLink runat="server" NavigateUrl='<%# $"~/Pages/LoanApplication.aspx?ID={Item.Field<int>("ItemId")}" %>' Text="Accept" /></td>
                        <td>
                            <asp:HyperLink runat="server" NavigateUrl='<%# $"~/Pages/LoanApplication.aspx?ID={Item.Field<int>("ItemId")}" %>' Text="Deny" /></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </asp:Panel>
</asp:Content>
