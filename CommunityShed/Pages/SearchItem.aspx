<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchItem.aspx.cs" Inherits="CommunityShed.Pages.SearchItem" %>
<%@ import namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
         <div>  
            <asp:label id="ToolNameLabel" runat="server"  text="Name: " />
            <asp:textbox id="ToolNameInput" runat="server" />
        </div> 

        <div>
            <asp:Button ID="SearchButton" runat="server" Text ="Search" OnClick="SearchButton_Click"/>
        </div>
        <div>
            <asp:DropDownList ID="CategoryList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="ToolTypeDataSource" DataTextField="Type" DataValueField="Id">
                <asp:ListItem Value ="-1">Tool Type</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="ToolTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CommunityShed %>" SelectCommand="SELECT [Id], [Type] FROM [Categories]"></asp:SqlDataSource>
        </div>

         <div>
            <asp:DropDownList ID="RangeList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="RangeTypeDataSource" DataTextField="Age" DataValueField="Id">
                <asp:ListItem Value ="-1">Range</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="RangeTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CommunityShed %>" SelectCommand="SELECT [Id], [Age] FROM [AgeRange]"></asp:SqlDataSource>
        </div>
    <asp:repeater id="ItemsList" runat="server" itemtype="DataRow">
            <headertemplate>
                <table class="table table-sm table-striped table-hover" >
                    <tr>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Owner</th>
                        <th>&nbsp;</th>
                    </tr>
            </headertemplate>
            <itemtemplate>
                <tr>
                    <td><%# Item.Field<string>("Name") %></td>
                    <td><%# Item.Field<string>("Type") %></td>
                     <td><%# Item.Field<string>("FullName") %></td>
                </tr>
            </itemtemplate>
            <footertemplate>
                </table>
            </footertemplate>
        </asp:repeater>
</asp:Content>
