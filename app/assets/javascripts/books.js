$(document).on('ready page:load', function () {
  $("input:radio[name=assigned]").on("click", function() {
    var value = $(this).val();
    var book_id = $("#radioid").val();
    $.ajax({
      url: "/update_bookcopies",
      type: "GET",
      data: { "value" : value, "book_id" : book_id}
    });
  });
  $('input[type=radio]').attr('checked',false);
});