<html lang="en">
<head>
    <title id='Description'>jqxChart Line Series Example</title>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/res/chartjqx/chartXml/jqx.base.css" />
<script type="text/javascript" src="${ pageContext.request.contextPath }/res/chartjqx/chartXml/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/res/chartjqx/chartXml/jqxcore.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/res/chartjqx/chartXml/jqxdata.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/res/chartjqx/chartXml/jqxchart.core.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/res/chartjqx/chartXml/jqxdraw.js"></script>

<!-- Ajax and XML get data from server url: '${ pageContext.request.contextPath }/res/chartjqx/orders.xml' -->

<script type="text/javascript">
$(document).ready(function () {
    // prepare the data
    var source = { datafields: [{ name: 'Date', type: 'date' },{ name: 'Quantity' },{ name: 'Description' }],
        root: "Orders",
        record: "Order",
        datatype: "xml",
        url: "${ pageContext.request.contextPath }/res/chartjqx/chartXml/orders.xml"
    }
    var dataAdapter = new $.jqx.dataAdapter(source);
    // prepare jqxChart settings
    var settings = {
        title: "Order Details",
        showLegend: true,
        source: dataAdapter,
        categoryAxis: {
            type: 'date',
            baseUnit: 'month',
            dataField: 'Date',
            formatFunction: function (value) {
                var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                return months[new Date(value).getMonth()];
            },
            showGridLines: true
        },
        colorScheme: 'scheme04',
        seriesGroups:[{
            type: 'line',
            valueAxis:{
                displayValueAxis: true,
                axisSize: 'auto',
                tickMarksColor: '#888888'
            },
            series: [{ dataField: 'Quantity', displayText: 'Quantity' }]
        }]
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
