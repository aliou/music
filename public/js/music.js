var ctx = document.getElementById("myChart").getContext("2d");
var myNewChart = new Chart(ctx).Line(music.music, {
  bezierCurve: false,
});
