$(document).on('ready page:load', function () {
  $(function() {
    $("#book_transaction_return_date, #book_transaction_issue_date").datetimepicker({
      showButtonPanel: true,
      dateFormat: 'dd/mm/yy',
      showOn: "button",
      buttonImage: "/calendar.gif",
      buttonImageOnly: true
    });
  });
});
