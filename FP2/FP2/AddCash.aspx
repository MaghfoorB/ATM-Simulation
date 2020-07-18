<%@ Page Title="Add Cash" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddCash.aspx.cs" Inherits="FP2.AddCash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-sm-6">


        <div style="margin: 20px 0px 0px 575px; width: 600px">
            <p style="color: #4CAF50; width: 600px; font-size: 20px">Add Cash in Machine</p>
            <br />
            &nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" class=" txtbox txtCSS" placeholder="Enter Amount"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="label1" runat="server"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="add_cash_bal" class="button  button2" Style="width: 90px; padding: 15px" Text="Confirm" />
            
        </div>
    </div>

</asp:Content>
