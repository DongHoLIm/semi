<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../src/jquery.jqplot.js"></script>
<script type="text/javascript" src="../src/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="../src/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript" src="../src/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="../src/plugins/jqplot.pointLabels.js"></script>
<link rel="stylesheet" type="text/css" href="../src/jquery.jqplot.css" />

<script type="text/javascript" src="plugins/jqplot.logAxisRenderer.min.js"></script>
<script type="text/javascript" src="plugins/jqplot.canvasTextRenderer.min.js"></script>
<script type="text/javascript" src="plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
<script type="text/javascript" src="plugins/jqplot.canvasAxisTickRenderer.min.js"></script>
<script type="text/javascript" src="plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="plugins/jqplot.barRenderer.min.js"></script>


</head>
<header><%@ include file="../hfl/managerHeader.jsp" %></header>
<body>
	<form>
		<table border="1">
			
		</table>
	</form>
<script>
$(document).ready(function(){
        var s1 = [2, 6, 7, 10];
        var s2 = [7, 5, 3, 2];
        var ticks = ['a', 'b', 'c', 'd'];
         
        plot2 = $.jqplot('chart2', [s1, s2], {
            seriesDefaults: {
                renderer:$.jqplot.BarRenderer,
                pointLabels: { show: true }
            },
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    ticks: ticks
                }
            }
        });
     
        $('#chart2').bind('jqplotDataHighlight', 
            function (ev, seriesIndex, pointIndex, data) {
                $('#info2').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
            }
        );
             
        $('#chart2').bind('jqplotDataUnhighlight', 
            function (ev) {
                $('#info2').html('Nothing');
            }
        );
    });
</script>
</body>
</html>