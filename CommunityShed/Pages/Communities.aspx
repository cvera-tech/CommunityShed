<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Communities.aspx.cs" Inherits="CommunityShed.Pages.Communities" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <asp:Panel ID="SwitchCommunitiesPanel" runat="server">
        <asp:Button ID="UserCommunitiesButton" runat="server"
            Text="View Your Communities"
            OnCommand="UserCommunitiesButton_Command" />
        <asp:Button ID="AllCommunitiesButton" runat="server"
            Text="View All Communities"
            OnCommand="AllCommunitiesButton_Command" />
    </asp:Panel>
    <asp:Panel ID="UserCommunitiesPanel" runat="server"
        Visible="true">
        <h1>Your Communities</h1>
        <asp:Repeater ID="UserCommunitiesRepeater" runat="server">
            <HeaderTemplate>
                <table>
                    <thead>
                        <tr>
                            <th>Community Name</th>
                            <th>Open</th>
                            <th>Your Role(s)</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel>
    <asp:Panel ID="AllCommunitiesPanel" runat="server">
        <h1>All Communities</h1>
        <asp:Repeater ID="AllCommunitiesRepeater" runat="server" ItemType="DataRow">
            <HeaderTemplate>
                <table>
                    <thead>
                        <tr>
                            <th>Community Name</th>
                            <th>Open</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HyperLink runat="server"
                            Text='<%# Item.Field<string>("Name") %>'
                            NavigateUrl='<%# Item.Field<int>("Id") %>' />
                    </td>
                    <td>
                        <asp:CheckBox runat="server"
                            Checked='<%# Item.Field<bool>("Availability") %>'
                            Enabled="false" />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel>
</asp:Content>
