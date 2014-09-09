// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require jquery-ui
//= require jquery-ui-timepicker-addon
//= require bootstrap
//= require_tree .
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
