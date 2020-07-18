<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SuspendUser.aspx.cs" Inherits="FP2.SuspendUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-sm-6">

        <p style="margin: 0px 0px 0px 500px; color: #4CAF50; width: 600px; font-size: 20px">Enter Account Number to Delete User</p>
        <div style="margin: 20px 0px 0px 560px; width: 600px;">
            &nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" class=" txtbox txtCSS" placeholder="Account Number"></asp:TextBox>
            <br />
            <asp:Label ID="label1" runat="server"></asp:Label>
            <br />
            <asp:Button ID="Button4" OnClick="suspend_bal" runat="server" class="button  button2" Style="width: 96px; padding: 15px" Text="Confirm" />
            <asp:Button ID="Button5" PostBackUrl="~/Admin.aspx" runat="server" class="button button2" Style="width: 96px; padding: 15px" Text="Cancel" />

        </div>
    </div>

</asp:Content>
