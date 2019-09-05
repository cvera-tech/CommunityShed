<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPerson.aspx.cs" Inherits="CommunityShed.Pages.AddPerson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h1>Add Person</h1>
    <fieldset>
        <asp:ValidationSummary runat="server"
            ValidationGroup="AddPerson" />
        <uc:TextBox ID="UsernameTextBox" runat="server" 
            Label="Email Address:"
            Required="true"
            RequiredErrorMessage="Email address required. "
            ValidationGroup="AddPerson" />
        <uc:TextBox ID="PasswordTextBox" runat="server" 
            Label="Password: "
            Required="true"
            RequiredErrorMessage="Password required. "
            ValidationGroup="AddPerson" />
        <uc:TextBox ID="FirstNameTextBox" runat="server" 
            Label="First Name: "
            Required="true"
            RequiredErrorMessage="First name required. "
            ValidationGroup="AddPerson" />
        <uc:TextBox ID="LastNameTextBox" runat="server" 
            Label="Last Name: "
            Required="true"
            RequiredErrorMessage="Last name required. "
            ValidationGroup="AddPerson" />
        <div>
            <asp:Button ID="SubmitButton" runat="server"
                Text="Submit"
                OnCommand="SubmitButton_Command"
                ValidationGroup="AddPerson" />
            <asp:Button ID="CancelButton" runat="server"
                Text="Cancel"
                OnCommand="CancelButton_Command" />
        </div>
    </fieldset>
</asp:Content>
