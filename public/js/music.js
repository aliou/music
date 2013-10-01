var ctx_linechart = document.getElementById("linechart").getContext("2d");
var linechart = new Chart(ctx_linechart).Line(song_count.music, {
  bezierCurve: false,
  scaleOverride : true,
  scaleSteps : 15,
  scaleStepWidth : 10,
  scaleStartValue : 0,
});

$('.demo.menu .item').tab();
