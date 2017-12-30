<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDataTable.ascx.cs" Inherits="WebFormsUserControls.components.ucDataTable" %>

<asp:UpdatePanel ID="upnUcListaDataTable" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <ContentTemplate>

        <asp:HiddenField ID="hdnIDSeleccion" Value="" runat="server" />
        <asp:Button ID="btnHiddenSeleccion" runat="server" Style="display: none" Text="btnHiddenSeleccion" OnClick="btnHiddenSeleccion_Click" />

    </ContentTemplate>
</asp:UpdatePanel>
