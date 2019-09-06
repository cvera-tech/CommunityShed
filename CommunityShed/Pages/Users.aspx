<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="CommunityShed.Pages.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Users</h1>
    <asp:Repeater ID="UsersRepeater" runat="server">
        <HeaderTemplate>
            <table>
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><asp:HyperLink runat="server" 
                            Text="View" />></td>
                    </tr>
                </tbody>
            </table>
        </HeaderTemplate>
        <ItemTemplate>

        </ItemTemplate>
        <FooterTemplate>

        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
