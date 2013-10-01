var ctx_linechart = document.getElementById("linechart").getContext("2d");
var linechart = new Chart(ctx_linechart).Line(song_count.music, {
  bezierCurve: false,
  scaleOverride : true,
  scaleSteps : 15,
  scaleStepWidth : 10,
  scaleStartValue : 0,
});

var ctx_doughnut = document.getElementById("doughnut").getContext("2d");
var doughnutchart = new Chart(ctx_doughnut).Doughnut(artist_count, {
  //Boolean - Whether we should show a stroke on each segment
  segmentShowStroke : true,

  //String - The colour of each segment stroke
  segmentStrokeColor : "#fff",

  //Number - The width of each segment stroke
  segmentStrokeWidth : 2,

  //The percentage of the chart that we cut out of the middle.
  percentageInnerCutout : 50,

  //Boolean - Whether we should animate the chart
  animation : true,

  //Number - Amount of animation steps
  animationSteps : 100,

  //String - Animation easing effect
  animationEasing : "easeOutBounce",

  //Boolean - Whether we animate the rotation of the Doughnut
  animateRotate : true,

  //Boolean - Whether we animate scaling the Doughnut from the centre
  animateScale : false,

  //Function - Will fire on animation completion.
  onAnimationComplete : null
});

$('.demo.menu .item').tab();
