<html lang="en">
<head>
    <title id='Description'>jqxChart Line Series Example</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/res/chartjqx/chartJson/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="${ pageContext.request.contextPath }/res/chartjqx/chartJson/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${ pageContext.request.contextPath }/res/chartjqx/chartJson/jqxcore.js"></script>
    <script type="text/javascript" src="${ pageContext.request.contextPath }/res/chartjqx/chartJson/jqxdata.js"></script>
    <script type="text/javascript" src="${ pageContext.request.contextPath }/res/chartjqx/chartJson/jqxchart.core.js"></script>
    <script type="text/javascript" src="${ pageContext.request.contextPath }/res/chartjqx/chartJson/jqxdraw.js"></script>
    <script type="text/javascript">

	$(document).ready(function () {

		var source =
		{
			 datatype: "json",
			 datafields: [
				{ name: 'Country' },
				{ name: 'Population' },
				{ name: 'Percent' }
			],
			url: '${ pageContext.request.contextPath }/res/chartjqx/chartJson/data.json'
		};

	   var dataAdapter = new $.jqx.dataAdapter(source,
		{
			autoBind: true,
			async: false,
			downloadComplete: function () { },
			loadComplete: function () { },
			loadError: function () { }
		});

		 var settings = {
                title: "Salary stats",
                description: "Money is nothing without knowledge",
                showLegend: true,
                enableAnimations: true,
                padding: { left: 5, top: 5, right: 5, bottom: 5 },
                titlePadding: { left: 90, top: 0, right: 0, bottom: 10 },
                source: dataAdapter,
                xAxis:
                    {
                        dataField: 'Country',
                        showGridLines: true
                    },
                colorScheme: 'scheme05',
                seriesGroups:
                    [
                        {
                            type: 'column',
                            //columnsGapPercent: 50,
                            valueAxis:
                            {
                               // unitInterval: 5000,
                                displayValueAxis: true,
                                description: 'Money'
                            },
                            series: [
                                    { dataField: 'Population', displayText: 'Greedy people'},
									{ dataField: 'Percent', displayText: 'Poor but happy'}
                                ]
                        }

                    ]
            };

		// setup the chart
		$('#jqxChart').jqxChart(settings);
	});

    </script>
</head>
<body class='default'>
    <div id='jqxChart' style="width: 680px; height: 400px">
    </div>
</body>
</html>