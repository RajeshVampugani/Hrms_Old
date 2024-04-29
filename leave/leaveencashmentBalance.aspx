﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="leaveencashmentBalance.aspx.cs" Inherits="leave_leaveencashmentBalance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../icomoon/style.css" rel="stylesheet" />
    <!-- Bootstrap css -->
    <link href="../css/main.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" style="background-color:white">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="dashboard-wrapper" style="margin-left: 0px;background-color:white">
            <div class="main-container">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row-fluid">
                            <div class="span12">
                                <div class="widget no-margin">
                                    <div class="widget-header">
                                        <div class="title">
                                            Leave Card Balance
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div id="dt_example" class="example_alt_pagination">
                                            <asp:GridView ID="balancegrid" runat="server"
                                                AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-checkable table-responsive datatable" OnPreRender="balancegrid_PreRender"
                                                DataSourceID="SqlDataSource1">
                                                <RowStyle Height="5px" />

                                                <Columns>
                                                    <asp:TemplateField HeaderText="Leave" HeaderStyle-Width="25%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="l1" runat="server" Text='<%# Bind("leavename")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Entitled Days" HeaderStyle-Width="25%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="l2" runat="server" Text='<%# Bind("entitled_days")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Used" HeaderStyle-Width="25%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="l3" runat="server" Text='<%# Bind("used") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Encashment Available" HeaderStyle-Width="25%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="l4" runat="server" Text='<%# Bind("balance") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" runat="server" SelectCommand="sp_leave_encashment_myballeave" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                    <asp:ControlParameter ControlID="hidd_empcode" Name="empcode" PropertyName="Value"
                                                        Type="String" />
                                                     <asp:ControlParameter ControlID="hidd_period" Name="periodid" PropertyName="Value"
                                                        Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:HiddenField ID="hidd_empcode" runat="server" />
                                             <asp:HiddenField ID="hidd_period" runat="server" />
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                
                                </div>
                            </div>
                            <div class="span12">
                                <div class="widget no-margin">
                                        <div class="widget-header">
                                        <div class="title">
                                            Leave Card History
                                        </div>
                                    </div>
                                       <div class="widget-body">
                                        <div id="Div1" >
                                            <asp:GridView ID="GridView1" runat="server"
                                                AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-checkable table-responsive datatable" OnPreRender="GridView1_PreRender"
                                                >
                                                <RowStyle Height="5px" />

                                                <Columns>
                                                    <asp:TemplateField HeaderText="Leave" HeaderStyle-Width="25%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="leave1" runat="server" Text='<%# Bind("leavename")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Entitled Days" HeaderStyle-Width="25%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="entitle1" runat="server" Text='<%# Bind("entitled_days")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Used" HeaderStyle-Width="25%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblused" runat="server" Text='<%# Bind("used") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Encashment Available" HeaderStyle-Width="25%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblencashed" runat="server" Text='<%# Bind("balance") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Encashed Days" HeaderStyle-Width="25%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblencashdone" runat="server" Text='<%# Bind("Encasheddays") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                          <%--  <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" runat="server" SelectCommand="sp_leave_encashment_History" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                    <asp:ControlParameter ControlID="hidd_empcode" Name="empcode" PropertyName="Value"
                                                        Type="String" />
                                                     <asp:ControlParameter ControlID="hidd_period" Name="periodid" PropertyName="Value"
                                                        Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                             <asp:HiddenField ID="HiddenField2" runat="server" />--%>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
