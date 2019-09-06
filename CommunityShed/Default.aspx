<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CommunityShed.Default" %>
<%@ import namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h1>Your Requests</h1> 
    <div>
    <asp:repeater id="ItemsList" runat="server" itemtype="DataRow">
            <headertemplate>
                <table class="table table-sm table-striped table-hover" >
                    <thead class="thead-dark">
                        <tr>
                            <th>Tool</th>
                            <th>Requestor</th>
                            <th>Date Requested</th>
                            <th>Duration</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
            </headertemplate>
            <itemtemplate>
                <tr>
                    <td><%# Item.Field<string>("itemName") %></td>
                    <td><%# Item.Field<string>("FullName") %></td>
                    <td><%# Item.Field<string>("reqDate") %></td>
                    <td><%# Item.Field<string>("DurationTime") %></td>
      
                    <td><asp:hyperlink runat="server" navigateurl='<%# $"~/Pages/LoanApplication.aspx?ID={Item.Field<int>("ItemId")}" %>' text="Accept" /></td>
                    <td><asp:hyperlink runat="server" navigateurl='<%# $"~/Pages/LoanApplication.aspx?ID={Item.Field<int>("ItemId")}" %>' text="Deny" /></td>
                </tr>
            </itemtemplate>
            <footertemplate>
                </table>
            </footertemplate>
        </asp:repeater>
        </div> 
</asp:Content>
