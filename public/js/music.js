var ctx = document.getElementById("linechart").getContext("2d");
var myNewChart = new Chart(ctx).Line(music.music, {
  bezierCurve: false,
  scaleOverride : true,
  scaleSteps : 15,
  scaleStepWidth : 10,
  scaleStartValue : 0,
});

$('.demo.menu .item').tab();
