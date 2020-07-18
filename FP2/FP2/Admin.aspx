<%@ Page Title="Admin-Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="FP2.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">

            <div class="col-sm-6">

                <p style="margin: 0px 0px 0px 500px; color: #4CAF50; font-size: 30px; width: 1113px;">Select one of the options</p>

            </div>            

        </div>

        <br />
                  
        <div class="row">
            <div class="col-sm-3" style="margin: 0px 0px 0px 525px;">

                <asp:Button ID="Button5" PostBackUrl="~/AddAccount.aspx" runat="server" class="button button2" Text="Add Account" />

            </div>

        </div>

        <div class="row">

            <div class="col-sm-3" style="margin: 0px 0px 0px 525px;">

                <asp:Button ID="Button6" PostBackUrl="~/AddCash.aspx" runat="server" class="button button2" Text="Add Cash" />

            </div>
        </div>

        <div class="row">

            <div class="col-sm-3" style="margin: 0px 0px 0px 525px;">

                <asp:Button ID="Button2" PostBackUrl="~/SuspendUser.aspx" runat="server" class="button button2" Text="Suspend Account" />

            </div>

        </div>
        
        <div class="row">

            <div class="col-sm-3" style="margin: 0px 0px 0px 525px;">
                
                <asp:Button ID="Button1" PostBackUrl="~/ChangePin.aspx" runat="server" class="button button2" Text="Change PIN" />
            
            </div>
        </div>

    </div>
</asp:Content>
