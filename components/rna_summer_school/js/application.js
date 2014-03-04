$(function() {
  if (!location.host.match(/localhost/)) {
    $.stellar({
      responsive: true
    });

    $("#parallax_mouse").parallax({});
  }
});
