$(function() {
  if (!location.host.match(/localhost/)) {
    $.stellar({
      responsive: true
    });
  }

  $(".calendar_entry").each(function() {
    // if ($(this).data("modalId") != "to_be_announced") {
      $(this).click(function() {
        $("#" + $(this).data("modalId")).modal();
      });
    // }
  });
});
