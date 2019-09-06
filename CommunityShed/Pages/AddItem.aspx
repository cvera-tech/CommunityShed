<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="CommunityShed.AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <h2>Add Item</h2>
    <fieldset>
        <div>
            <asp:label id="ItemNameLabel" runat="server"  text="Name: " />
            <asp:textbox id="ItemNameInput" runat="server" />
        </div>

        <div>
            <asp:DropDownList ID="CategoryList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="ToolTypeDataSource" DataTextField="Type" DataValueField="Id">
                <asp:ListItem>Tool Type</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="ToolTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CommunityShed %>" SelectCommand="SELECT [Id], [Type] FROM [Categories]"></asp:SqlDataSource>
        </div>

        <div>
            <asp:DropDownList ID="PersonList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="PersonListDataSource" DataTextField="name" DataValueField="cid">
                <asp:ListItem>Select your person</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="PersonListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CommunityShed %>" SelectCommand="SELECT cp.id AS cid, p.FirstName + ' ' + p.LastName AS [name]
                FROM Person p JOIN CommunityPerson cp ON p.Id = cp.PersonId">
            </asp:SqlDataSource>
       
        </div>
        <div>  
       
            <asp:label id="WarningsLabel" runat="server"  text="Warnings: " />
            <asp:textbox id="WarningInput" runat="server" />
       
        </div> 

        <div>
            <asp:DropDownList ID="RangeList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="RangeTypeDataSource" DataTextField="Age" DataValueField="Id">
                <asp:ListItem>Range</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="RangeTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CommunityShed %>" SelectCommand="SELECT [Id], [Age] FROM [AgeRange]"></asp:SqlDataSource>
        </div>
       
        <div>
             <asp:button id="Save" runat="server" text="Save" OnClick="AddItem_Click" />
        </div>
    </fieldset>
</asp:Content>
