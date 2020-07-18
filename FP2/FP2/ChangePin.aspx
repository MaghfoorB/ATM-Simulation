<%@ Page Title="Privacy Settings" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ChangePin.aspx.cs" Inherits="FP2.ChangePin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">

        <div class="row">

            <div class="col-sm-3">
            </div>

            <div class="col-sm-6">


                <p style="margin: 20px 0px 0px 270px; color: #4CAF50; font-size: 20px">Change Pin</p>
                <div style="margin: 20px 0px 0px 180px">

                    <asp:TextBox ID="TextBox1" TextMode="Password" style="margin: 0px 0px 0px 55px;" runat="server" class=" txtbox txtCSS" placeholder="Enter Old Pin"></asp:TextBox><br />
                    <br />
                    <asp:TextBox ID="TextBox2" TextMode="Password" style="margin: 0px 0px 0px 55px;" runat="server" class=" txtbox txtCSS" placeholder="Enter New Pin"></asp:TextBox><br />
                    <br />
                    <asp:TextBox ID="TextBox3" TextMode="Password" style="margin: 0px 0px 0px 55px;" runat="server" class=" txtbox txtCSS" placeholder="Confirm New Pin"></asp:TextBox><br />
                    <br />
                    <asp:Label ID="label3" style="margin: 0px 0px 0px 75px;" runat="server" ></asp:Label>
                    <br />
                    <asp:Button ID="Button5" OnClick="change_pin_bal" runat="server" class="button  button2" Style="padding: 15px" Text="Change" />

                </div>
            </div>

        </div>
    </div>

</asp:Content>
