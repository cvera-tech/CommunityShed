<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CommunityShed.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Login</h1>
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
                ValidationGroup="Login" />
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
                    ValidationGroup="Login" />
            </div>
        </fieldset>
    </form>
</body>
</html>
