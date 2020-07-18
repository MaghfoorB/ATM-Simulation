<%@ Page Title="Cash Withdrawal" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CashWithdrawal.aspx.cs" Inherits="FP2.CashWithdrawal" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cash Withdrawal</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="container-fluid">

        <div class="row">

            <div class="col-sm-3">
                <asp:Button ID="Button4" runat="server" OnClick="validate_Amount_bal2" class="button button2" Text="Rs. 1000" />
            </div>


            <div class="col-sm-6" >

                <p style="margin: 20px 0px 0px 125px; color: #4CAF50; font-size: 20px">Select one of the options OR enter manually</p>
                <div style="margin: 20px 0px 0px 220px">
                    &nbsp;<asp:TextBox ID="TextBox1" runat="server" class=" txtbox txtCSS" placeholder="Enter Amount" Width="198px"></asp:TextBox>
                    <br />
                    <asp:Label ID="label1" runat="server"></asp:Label>
                    <br />
                    <asp:Button ID="Button5" OnClick="validate_amount_bal" runat="server" class="button  button2" Style="width: 100px; padding: 15px" Text="Proceed" />
                    <asp:Button ID="Button6" runat="server" OnClick="reset" class="button button2" Style="width: 100px; padding: 15px" Text="Reset" />

                </div>
            </div>

            <div class="col-sm-3">
                <asp:Button ID="Button3" runat="server" OnClick="validate_Amount_bal2" class="button button2" Style="float: right" Text="Rs. 5000" />
            </div>
            

        </div>
    </div>

    <div class="container-fluid">

        <div class="row">

            <div class="col-sm-3">

                <asp:Button ID="Button2" runat="server" OnClick="validate_Amount_bal2" class="button button2" Text="Rs. 15000" />

            </div>

            <div class="col-sm-6">
            </div>

            <div class="col-sm-3">

                <asp:Button ID="Button1" runat="server" OnClick="validate_Amount_bal2" class="button button2" Style="float: right" Text="Rs. 20000" />

            </div>

        </div>

    </div>

    
</asp:Content>
