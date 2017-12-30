using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsUserControls.components
{
    public partial class ucDataTable : System.Web.UI.UserControl
    {
        public String IDTabla { get; set; }
        public bool SeleccionSimple { get; set; }
        public bool SeleccionMultiple { get; set; }

        /// <summary>
        /// Evento que indica que se ha seleccionado una fila
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public delegate void RowSelectionHandler(object sender, Row_Selection_EventArgs e);
        // Declare the event.
        public event RowSelectionHandler EventRowSelection;
        private void ThrowEventRowSelection(object sender, Row_Selection_EventArgs e)
        {
            if (EventRowSelection != null)
            {
                //lanza el evento
                EventRowSelection(sender, e);
            }
        }

        public class Row_Selection_EventArgs : EventArgs
        {
            public string IDRow_Selection { get; set; }
            public Row_Selection_EventArgs(string iID_Seleccionado)
            {
                this.IDRow_Selection = iID_Seleccionado;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);

            StringBuilder sb = new StringBuilder();
            sb.Append("$(function () {");

            sb.Append("if (! $.fn.dataTable.isDataTable( '#" + this.IDTabla + "' ) ) {");

            sb.Append("var table = $('#" + this.IDTabla + "').dataTable({");
            sb.Append(" stateSave: true");

            if (this.SeleccionSimple)
                sb.Append(", select: { style: 'single' }");

            sb.Append("});"); // var table =

            sb.Append("}"); // if (! $.fn.dataTable.isDataTable( '#" + this.IDTabla + "' ) ) {
            sb.Append("else alert('DataTable already bound to #" + this.IDTabla + "');");

            sb.Append("});"); // $(function () {

            string txt = sb.ToString();

            string fileName = Path.GetTempFileName();
            Console.WriteLine("Temp file = " + fileName);
            using (StreamWriter sw = new StreamWriter(fileName))
            {
                sw.WriteLine(sb.ToString());
            }

            //registrar script
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), IDTabla, sb.ToString(), true);
        }

        protected void btnHiddenSeleccion_Click(object sender, EventArgs e)
        {

        }
    }
}