<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCommunity.aspx.cs" Inherits="CommunityShed.Pages.AddCommunity" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h1>Add Community</h1>
    <fieldset>
        <uc:TextBox ID="NameTextBox" runat="server"
            Label="Name: "
            Required="true"
            RequiredErrorMessage="Name required."
            ValidationGroup="AddCommunity" />
        <div>
        <asp:Label runat="server"
            Text="Open: "
            AssociatedControlID="AvailabilityCheckBox" />
        <asp:CheckBox ID="AvailabilityCheckBox" runat="server" />

        </div>
        <div>
            <asp:Button ID="SubmitButton" runat="server"
                Text="Submit"
                OnCommand="SubmitButton_Command" />
        </div>
    </fieldset>
</asp:Content>
