<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestDataTableSelectWithRowId.aspx.cs" Inherits="WebFormsUserControls.TestDataTableSelectWithRowId" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1" />
	<title>DataTables example - Retain selection on reload</title>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.2.4/css/select.dataTables.min.css" />
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" />
	<style type="text/css" class="init">
	
	#events {
		margin-bottom: 1em;
		padding: 1em;
		background-color: #f6f6f6;
		border: 1px solid #999;
		border-radius: 3px;
		height: 100px;
		overflow: auto;
	}

	</style>

	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js">
	</script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js">
	</script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/select/1.2.4/js/dataTables.select.min.js">
	</script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js">
	</script>
	<script type="text/javascript" class="init">

		$(document).ready(function () {
			var table = $('#example').DataTable({
				"ajax": "objects.txt",
				"deferRender": true,
				"columns": [
					{ "data": "name" },
					{ "data": "position" },
					{ "data": "office" },
					{ "data": "extn" },
					{ "data": "start_date" },
					{ "data": "salary" }
				],
				"rowId": "extn",
				"select": true,
				"dom": "Bfrtip",
				"buttons": [
					{
						text: "Reload table",
						action: function () {
							table.ajax.reload();
						}
					}
				]
			});

			$('#example').DataTable()
				.on('select', function (e, dt, type, indexes) {
					var rowData = table.rows(indexes).data().toArray();
					events.prepend('<div><b>' + type + ' selection</b> - ' + JSON.stringify(rowData) + '</div>');
				})
				.on('deselect', function (e, dt, type, indexes) {
					var rowData = table.rows(indexes).data().toArray();
					events.prepend('<div><b>' + type + ' <i>de</i>selection</b> - ' + JSON.stringify(rowData) + '</div>');
				});
		});

	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
		</div>
		<div id="events">
			Event summary - new events added at the top
		</div>
		<table id="example" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Name</th>
					<th>Position</th>
					<th>Office</th>
					<th>Extn.</th>
					<th>Start date</th>
					<th>Salary</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Name</th>
					<th>Position</th>
					<th>Office</th>
					<th>Extn.</th>
					<th>Start date</th>
					<th>Salary</th>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>
