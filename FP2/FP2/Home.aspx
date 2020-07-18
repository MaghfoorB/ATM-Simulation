<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FP2.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3">
                <asp:Button ID="cw" PostBackUrl="~/CashWithdrawal.aspx" cssclass="button button2" Text="Cash Withdrawal" runat="server" />
            </div>
            <div class="col-sm-6">
                <p style="margin: 20px 0px 0px 120px; color: #4CAF50; font-size: 40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Welcome</p>         
            </div>
            <div class="col-sm-3">
                <asp:Button ID ="tf" PostBackUrl="~/TransferFunds.aspx" style="float: right" CssClass="button button2" Text="Transfer Money" runat="server" />
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3">
                <asp:Button ID="cb" PostBackUrl="~/Balance.aspx" CssClass="button button2" Text="Check Balance" runat="server"/>
            </div>
            <div class="col-sm-6">
            </div>
            <div class="col-sm-3">
                <asp:Button ID="cp" PostBackUrl="~/ChangePin.aspx" class="button button2" style="float: right" Text="Change Pin" runat="server" />
            </div>
            
            <div class="col-sm-3">
                <asp:Button ID="tr" PostBackUrl="~/Transactions.aspx" class="button button2" style="float: right; margin: 30px;" Text="Last Month Transactions" runat="server" />
            </div>

        </div>
        
    </div>

   


</asp:Content>
