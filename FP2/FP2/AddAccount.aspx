<%@ Page Title="Add Account" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="FP2.AddAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container-fluid">
            <div class="row">

      
                <div class="col-sm-6">

                    <p style="margin: 0px 0px 0px 500px; width: 600px; color: #4CAF50; font-size: 20px">Enter information in the fields below.</p>
                    <div style="margin:20px 0px 0px 560px; width: 797px;">
                        
                        <asp:TextBox ID="TextBox1" runat="server" class =" txtbox txtCSS"  placeholder ="User ID"></asp:TextBox> <br /> 
                        <br />
                        <asp:TextBox ID="TextBox2" runat="server" class =" txtbox txtCSS"  placeholder ="New Account Number"></asp:TextBox> <br />
                        <br />
                        <asp:TextBox ID="TextBox3" runat="server" class =" txtbox txtCSS"  placeholder ="Balance"></asp:TextBox> <br />
                        <br />
                        <asp:Label ID="label1" runat="server" ></asp:Label>
                        <br />
                        <asp:Button ID="Button4" runat="server" OnClick="add_user_bal" class="button  button2" Style="width: 96px; padding:15px "  Text="Save" />
                        <asp:Button ID="Button5" runat="server" class="button button2"  style="width: 96px; padding:15px " Text="Reset" />
                       
                    </div>
                </div>

            </div>
        </div>
</asp:Content>
