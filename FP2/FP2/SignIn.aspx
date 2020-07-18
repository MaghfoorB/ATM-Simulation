<%@ Page Title="Sign-In" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="FP2.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="div1">
        Account Number:
    <asp:TextBox ID="accountno" runat="server"></asp:TextBox>
        <br />
        <br />
        PIN:
    <asp:TextBox ID="pin" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="errorMessage" runat="server"></asp:Label>
        <br />
        <asp:Button ID="submit" runat="server" OnClick="authenticate_bal" Text="Log In" />
    </div>

</asp:Content>
