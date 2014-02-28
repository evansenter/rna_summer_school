$(function() {
  $.stellar({
    responsive: true
  });

  $("#parallax_mouse").parallax({});

  var options = {
		events_source: "/api/calendar.json",
		view: "week",
		tmpl_path: "bootstrap-calendar/tmpls/",
		tmpl_cache: false,
		day: "2014-07-06",
		onAfterEventsLoad: function(events) {
			if(!events) {
				return;
			}
			var list = $("#eventlist");
			list.html("");

			$.each(events, function(key, val) {
				$(document.createElement("li"))
					.html("<a href='" + val.url + "'>" + val.title + "</a>")
					.appendTo(list);
			});
		},
		onAfterViewLoad: function(view) {
			$(".page-header h3").text(this.getTitle());
			$(".btn-group button").removeClass("active");
			$("button[data-calendar-view='" + view + "']").addClass("active");
		},
		classes: {
			months: {
				general: "label"
			}
		}
	};

	var calendar = $("#calendar").calendar(options);
});
