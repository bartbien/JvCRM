<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/chart/js/Chart.js"></script>

<div style="padding: 5px; width: 100%;">
	<canvas id="canvas" height="450" width="600"></canvas>
</div>
<div style="padding: 5px; width: 100%;">
	<canvas id="canvas2" height="450" width="600"></canvas>
</div>

<script>
	
	var data = ${json};
	
	function getPositions(property)
	{
		var result = new Array();
		
		for(var i = 0; i < data.length; ++i)
			result[i] = data[i][property];
		
		return result;
	}
	
	/* function getAverageSalaries()
	{
		var result = new Array();
		
		for(var i = 0; i < data.length; ++i)
			result[i] = data[i].averageSalaries;
		
		return result;
	} */
	
	var barChartData = {
		labels : getPositions('position'),
		datasets : [
			{
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,0.8)",
				highlightFill: "rgba(220,220,220,0.75)",
				highlightStroke: "rgba(220,220,220,1)",
				data : getPositions('averageSalary')
			},
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,0.8)",
				highlightFill : "rgba(151,187,205,0.75)",
				highlightStroke : "rgba(151,187,205,1)",
				data : getPositions('minSalary')
			},
			{
				fillColor : "rgba(255,206,201,0.5)",
				strokeColor : "rgba(235,187,185,0.8)",
				highlightFill : "rgba(245,193,191,0.75)",
				highlightStroke : "rgba(249,197,192,1)",
				data : getPositions('maxSalary')
			}
		]
	}
	var barChartData2 = {
			labels : getPositions('position'),
			datasets : [
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,0.8)",
					highlightFill : "rgba(151,187,205,0.75)",
					highlightStroke : "rgba(151,187,205,1)",
					data : getPositions('count')
				}
			]

		}
	
	window.onload = function(){
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myBar = new Chart(ctx).Bar(barChartData, {
			responsive : true
		});
		
		var ctx2 = document.getElementById("canvas2").getContext("2d");
		window.myBar2 = new Chart(ctx2).Bar(barChartData2, {
			responsive : true
		});
	}

</script>