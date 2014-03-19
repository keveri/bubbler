DEFAULT_TEMPLATE = %q(
<!DOCTYPE html>
<meta charset="utf-8">

<style>
text {
  font: 10px monospace;
}
h1 {
  color: white;
  font: 3em monospace;
  text-align: center;
}
body {
  background-color: #333;
}
</style>

<body>
{{#names}}
<div id="{{id}}"><h1>{{text}}</h1></div>
{{/names}}
</body>

<script>
{{#graphs}}
var {{name}} = {{{json}}}
{{/graphs}}
</script>

<script src="http://d3js.org/d3.v3.min.js"></script>

<script>
function create_bubble(graph_id, graph_data) {
  var diameter = 960,
      color = d3.scale.category20c();
  
  var bubble = d3.layout.pack()
      .sort(null)
      .size([diameter, diameter])
      .padding(1.5);
  
  var svg = d3.select(graph_id).append("svg")
      .attr("width", diameter)
      .attr("height", diameter)
      .attr("class", "bubble");
  
  var node = svg.selectAll(".node")
      .data(bubble.nodes(graph_data)
      .filter(function(d) { return !d.children; }))
    .enter().append("g")
      .attr("class", "node")
      .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
  
  node.append("title")
      .text(function(d) { return d.path + ": " + d.value + " lines"; });
  
  node.append("circle")
      .attr("r", function(d) { return d.r; })
      .style("fill", function(d) { return color(d.name); });
  
  node.append("text")
      .attr("dy", ".3em")
      .style("text-anchor", "middle")
      .text(function(d) { return d.name.substring(0, d.r / 3); });

  d3.select(self.frameElement).style("height", diameter + "px");
}
</script>

<script>
{{#names}}
create_bubble("#{{id}}", {{id}});
{{/names}}
</script>
)
