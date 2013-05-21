$(document).ready ->
  $.ajax(
    url: '/morris.json'
    method: 'get'
    dataType: 'json'
    success: (data) ->
      svg = d3.select("div#container svg")
      values = d3.values(data)
      console.log values[0]
      svg.selectAll("rect")
        .data(values)
        .enter()
        .append("rect")
        .attr("height", 30)
        .attr("width", 0)
        .transition()
        .duration(3000)
        .attr("width", (value) -> value["value"])
        .attr("y", (value, i) -> i * 40)
        .attr("fill", "purple")
    )