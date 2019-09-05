<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPerson.aspx.cs" Inherits="CommunityShed.Pages.AddPerson" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <uc:TextBox ID="UsernameTextBox" runat="server"
            Label="Email Address: "
            Required="true"
            RequiredErrorMessage="Email address required."
            ValidationGroup="AddPerson" />

    </fieldset>
</asp:Content>
