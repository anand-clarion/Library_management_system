$(document).ready(function() { 
  $("a").tooltip();
  $(function() {
    $("#active_button").on("click", function() {
      var id = $('#active_button').val();
      var table_name = $('#active_button').attr("table");
      if($("#active_button").text() == "Deactivate") {
        $('#active_button').text("Activate")
        deactivate(id, table_name) 
      }
      else {
        $("#active_button").text("Deactivate")
        var id = $('#active_button').val();
        var table_name = $('#active_button').attr("table");
        activate(id, table_name);
      }
    }); 
  });
});

function deactivate(id, table_name)
{
  $.ajax({
    url: "/deactivate",
    type: "GET",
    data: { "id" : id, "table_name" : table_name }
  });
} 

function activate(id, table_name)
{
  $.ajax({
    url: "/activate",
    type: "GET",
    data: { "id" : id, "table_name" : table_name }
  });
} 





