<%@ Page Title="Transfer Money" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TransferFunds.aspx.cs" Inherits="FP2.TransferFunds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">

        <div class="row">

            <div class="col-sm-3">

                <!--<asp:Button ID="Button4" runat="server" class="button button2" Text="Rs. 1000" />-->

            </div>

            <div class="col-sm-6">

                <p style="margin: 20px 0px 0px 140px; color: #4CAF50; font-size: 20px">Enter Account No of Recipient and Amount</p>
                <div style="margin: 20px 0px 0px 220px">

                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" class=" txtbox txtCSS" placeholder="Enter Account number"></asp:TextBox><br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" class=" txtbox txtCSS" placeholder="Enter Amount"></asp:TextBox><br />
                    <br />
                    &nbsp;
                    <asp:Label ID ="emessage" runat="server" ></asp:Label>
                    <br />
                    <asp:Button ID="Button5" runat="server" OnClick="validate" class="button  button2" Style="width: 100px; padding: 15px" Text="Proceed" />
                    <asp:Button ID="Button6" runat="server" class="button button2" Style="width: 100px; padding: 15px" Text="Reset" />
                    
                </div>
            </div>

            <div class="col-sm-3">

                <%--<asp:Button ID="Button3" runat="server" class="button button2" Style="float: right" Text="Rs. 5000" />--%>

            </div>

        </div>
    </div>

    <div class="container-fluid">

        <div class="row">

            <div class="col-sm-3">

                <%--<asp:Button ID="Button2" runat="server" class="button button2" Text="Rs. 15000" />--%>

            </div>


            <div class="col-sm-6">
            </div>

            <div class="col-sm-3">


                <%--<asp:Button ID="Button1" runat="server" class="button button2" Style="float: right" Text="Rs. 20000" />--%>

            </div>

        </div>

    </div>



</asp:Content>
