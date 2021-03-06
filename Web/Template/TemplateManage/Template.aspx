﻿<%@ Page Title="模版管理" Language="C#" MasterPageFile="~/Admin/ManagerPage.master" AutoEventWireup="true"
    CodeFile="Template.aspx.cs" Inherits="Common_Template" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="C">
    <div class="toolbar">
        <XCL:LinkBox ID="lbAdd" runat="server" BoxHeight="328px" BoxWidth="440px" Url="TemplateForm.aspx"
            IconLeft="~/Admin/images/icons/new.gif" EnableViewState="false"><b>添加模版</b></XCL:LinkBox>
        关键字：<asp:TextBox ID="txtKey" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="查询" />
    </div>
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
        DataSourceID="ods" AllowPaging="True" AllowSorting="True" CssClass="m_table"
        PageSize="8" CellPadding="0" GridLines="None" EnableModelValidation="True">
        <Columns>
            <%--<asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="cb" runat="server" />
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>--%>
            <asp:BoundField DataField="ID" HeaderText="编号" SortExpression="ID" InsertVisible="False"
                ReadOnly="True">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="key" />
            </asp:BoundField>
            <asp:BoundField DataField="FullParentPath" HeaderText="父路径" SortExpression="ParentID" />
            <asp:BoundField DataField="Name" HeaderText="名称" SortExpression="Name" />
            <asp:BoundField DataField="UserName" HeaderText="用户" SortExpression="UserName" />
            <asp:BoundField DataField="CreateTime" HeaderText="创建时间" SortExpression="CreateTime"
                DataFormatString="{0:yyyy-MM-dd HH:mm:ss}">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
            </asp:BoundField>
            <asp:BoundField DataField="LastModify" HeaderText="最后修改" SortExpression="LastModify"
                DataFormatString="{0:yyyy-MM-dd HH:mm:ss}">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="TemplateItem.aspx?TemplateID={0}"
                HeaderText="编辑模版项" Text="编辑模版项" />
            <XCL:LinkBoxField HeaderText="添加子模版" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="TemplateForm.aspx?ParentID={0}"
                Height="400px" Text="添加子模版" Width="370px" Title="添加子模版">
                <ItemStyle HorizontalAlign="Center" />
            </XCL:LinkBoxField>
            <XCL:LinkBoxField HeaderText="编辑" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="TemplateForm.aspx?ID={0}"
                Height="328px" Text="编辑" Width="440px" Title="编辑模版">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
            </XCL:LinkBoxField>
            <asp:TemplateField ShowHeader="False" HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                        OnClientClick='return confirm("确定删除吗？")' Text="删除"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            没有符合条件的数据！
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ods" runat="server" EnablePaging="True" SelectCountMethod="SearchCount"
        SelectMethod="Search" SortParameterName="orderClause" EnableViewState="false">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtKey" Name="key" PropertyName="Text" Type="String" />
            <asp:Parameter Name="orderClause" Type="String" />
            <asp:Parameter Name="startRowIndex" Type="Int32" />
            <asp:Parameter Name="maximumRows" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <XCL:GridViewExtender ID="gvExt" runat="server">
    </XCL:GridViewExtender>
</asp:Content>
