$(document).on('ready page:load', function () {
  $(function() {
    $(".active_button_class").on("click", function() {
      var id = $(this).val();
      var table_name =  $(this).attr("table");
      if ($(this).text() == "Deactivate") {
        $.ajax({
          url: "/deactivate",
          type: "GET",
          data: { "id" : id, "table_name" : table_name }
        });
        $(this).text("Activate");
      }
      else {
        $.ajax({
          url: "/activate",
          type: "GET",
          data: { "id" : id, "table_name" : table_name }
        });
      $(this).text("Deactivate")
      }
    });
  });
});