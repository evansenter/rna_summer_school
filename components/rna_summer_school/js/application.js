$(function() {
  if (!location.host.match(/localhost/)) {
    $.stellar({
      responsive: true
    });
  }

  $(".calendar_entry").each(function() {
    $(this).click(function() {
      $("#" + $(this).data("modalId")).modal();
    });
  });
});
