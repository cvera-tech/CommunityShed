<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LabeledTextBox.ascx.cs" Inherits="LibraryApplication.Controls.LabeledTextBox" %>

<div class ="form-group">
    <asp:Label ID="ControlLabel" runat="server"
        AssociatedControlID="ControlTextBox" />
    <asp:TextBox ID="ControlTextBox" runat="server" CssClass="form-control" />
    <asp:RequiredFieldValidator ID="ControlValidator" runat="server"
        ControlToValidate="ControlTextBox"
        EnableClientScript="true"
        Display="Dynamic"
        ErrorMessage="Field required."
        Text="*" 
        Enabled="false" />
</div>
