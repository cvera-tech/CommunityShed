<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CommunityShed.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
        <h1>Welcome To CommunityShed</h1>
        <div class ="col-3">
        <div>
            <asp:Label ID="BadLoginMessage" runat="server" 
                ForeColor="Red"
                Text="Invalid user name or password"
                Visible="false" />
        </div>
        <fieldset>
            <asp:ValidationSummary runat="server"
                ValidationGroup="Login" />
            <uc:TextBox ID="UsernameTextBox" runat="server"
                Label="Username: "
                Required="true"
                RequiredErrorMessage="Username required."
                ValidationGroup="Login" placeholder="Username" class="form-control"/>
            <uc:TextBox ID="PasswordTextBox" runat="server"
                Label="Password: "
                TextMode="Password"
                Required="true"
                RequiredErrorMessage="Password required."
                ValidationGroup="Login" />
            <div>
                <asp:Button ID="SubmitButton" runat="server"
                    Text="Submit"
                    OnCommand="SubmitButton_Command"
                    ValidationGroup="Login" CssClass="btn btn-primary" />
            </div>

        </fieldset>
            </div>
    </asp:Content>
