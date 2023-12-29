+++
title = "Imaginary Floats"
date = 2023-07-03

[taxonomies]
tags = ["notready"]
+++


<p>Custom stop points slider:</p>

<input type="range" min="0" max="2" step="1" id="customSlider">

<script>
// Specify the values of the stop points
var stopPoints = [0, 50, 100];

var slider = document.getElementById("customSlider");

slider.oninput = function() {
  var value = stopPoints[this.value];
  console.log("Current slider value: ", value);
}
</script>