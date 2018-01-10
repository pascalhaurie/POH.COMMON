namespace POH.Core.DataTable
{
    // To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
    //
    //    var data = DataTable.FromJson(jsonString);

    using Newtonsoft.Json;

    public partial class DataTable
    {
        [JsonProperty("ajax")]
        public string Ajax { get; set; }

        [JsonProperty("deferRender")]
        public bool DeferRender { get; set; }

        [JsonProperty("columns")]
        public Column[] Columns { get; set; }

        [JsonProperty("rowId")]
        public string RowId { get; set; }

        [JsonProperty("select")]
        public bool Select { get; set; }

        [JsonProperty("dom")]
        public string Dom { get; set; }

        [JsonProperty("buttons")]
        public Button[] Buttons { get; set; }
    }

    public partial class Button
    {
        [JsonProperty("text")]
        public string Text { get; set; }
    }

    public partial class Column
    {
        [JsonProperty("data")]
        public string Data { get; set; }
    }

    public partial class DataTable
    {
        public static DataTable FromJson(string json) => JsonConvert.DeserializeObject<DataTable>(json, Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this DataTable self) => JsonConvert.SerializeObject(self, Converter.Settings);
    }

    public class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
        };
    }
}
