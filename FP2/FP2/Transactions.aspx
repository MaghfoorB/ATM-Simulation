<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="FP2.Transactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p style="margin: 0px 0px 0px 500px; color: #4CAF50; width: 600px; font-size: 20px">Transfers</p>
    <div>
       
        <asp:GridView ID="grid1" runat="server" style="margin: 0px 0px 0px 500px"></asp:GridView>

    </div>
    <br />
    <br />
    <p style="margin: 0px 0px 0px 500px; color: #4CAF50; width: 600px; font-size: 20px">Withdrawals</p>
    <div>
        <asp:GridView ID="grid2" runat="server" style="margin: 0px 0px 0px 500px"></asp:GridView>

    </div>

</asp:Content>
