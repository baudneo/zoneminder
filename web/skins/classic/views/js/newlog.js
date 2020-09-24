var table = $j('#logTable');

/*
This is the format of the json object sent by bootstrap-table

var params =
{
"type":"get",
"data":
  {
  "search":"some search text",
  "sort":"DateTime",
  "order":"asc",
  "offset":0,
  "limit":25
  "filter":
    {
    "message":"some advanced search text"
    "level":"some more advanced search text"
    }
  },
"cache":true,
"contentType":"application/json",
"dataType":"json"
};
*/

// Called by bootstrap-table to retrieve zm log data
function ajaxRequest(params) {
  $j.getJSON(thisUrl + '?view=request&request=newlog&task=query', params.data)
      .done(function(data) {
        //console.log('Ajax parameters: ' + JSON.stringify(params));
        // rearrange the result into what bootstrap-table expects
        params.success({total: data.total, totalNotFiltered: data.totalNotFiltered, rows: data.rows});
        updateHeaderStats(data);
      })
      .fail(logAjaxFail);
}

function updateHeaderStats(data) {
  var pageNum = table.bootstrapTable('getOptions').pageNumber;
  var pageSize = table.bootstrapTable('getOptions').pageSize;
  var startRow = ( (pageNum - 1 ) * pageSize ) + 1;
  var stopRow = pageNum * pageSize;
  var newClass = (data.logstate == 'ok') ? 'text-success' : (data.logstate == 'alert' ? 'text-warning' : ((data.logstate == 'alarm' ? 'text-danger' : '')));

  $j('#logState').text(data.logstate);
  $j('#logState').removeClass('text-success');
  $j('#logState').removeClass('text-warning');
  $j('#logState').removeClass('text-danger');
  $j('#logState').addClass(newClass);

  $j('#totalLogs').text(data.total);
  $j('#availLogs').text(data.totalNotFiltered);
  $j('#lastUpdate').text(data.updated);
  $j('#displayLogs').text(startRow + ' to ' + stopRow);
}

function initPage() {
  var backBtn = $j('#backBtn');

  // Init the bootstrap-table with custom icons
  table.bootstrapTable({icons: icons});

  // Assign inf, err, fat, dbg color classes to the rows in the table
  table.on('post-body.bs.table', function(data) {
    $j('#logTable tr').each(function(ndx, row) {
      var row = $j(row);
      var level = row.find('td:eq(4)').text();

      if (( level == 'FAT' ) || ( level == 'PNC' )) {
        row.addClass('bg-danger');
        row.addClass('font-weight-bold');
      } else if ( level == 'ERR' ) {
        row.addClass('bg-danger');
      } else if ( level == 'WAR' ) {
        row.addClass('bg-warning');
      } else if ( level == 'DBG' ) {
        row.addClass('bg-info');
        row.addClass('font-italic');
      }
    });
  });

  // Don't enable the back button if there is no previous zm page to go back to
  backBtn.prop('disabled', !document.referrer.length);

  // Manage the BACK button
  document.getElementById("backBtn").addEventListener("click", function onBackClick(evt) {
    evt.preventDefault();
    window.history.back();
  });

  // Manage the REFRESH Button
  document.getElementById("refreshBtn").addEventListener("click", function onRefreshClick(evt) {
    evt.preventDefault();
    window.location.reload(true);
  });
}

$j(document).ready(function() {
  initPage();
});
