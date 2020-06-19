<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%">
   <!-- <head>
       <meta charset="utf-8">
   </head> -->
   <body style="height: 100%; margin: 0">
       
       <div id="container" style="height: 100%"></div>
       <img src="http://localhost:8080/kkss/image/波形1.jpg">
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
       <script type="text/javascript">
        var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		var base = +new Date(2019, 12, 1);
		var oneDay = 24 * 3600;
		var date = [];

		var data = [Math.random() * 300];

		for (var i = 1; i < 20000; i++) {
			var now = new Date(base += oneDay);
			date.push([now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'));
			data.push(Math.round((Math.random() - 0.5) * 20 + data[i - 1]));
}

		option = {
			tooltip: {
   			trigger: 'axis',
   			position: function (pt) {
       			return [pt[0], '10%'];
   }
},
			title: {
   			left: 'center',
   			text: 'Kuang Shan For Lnu',
},
			toolbox: {
   			feature: {
       			dataZoom: {
           			yAxisIndex: 'none'
       },
       			restore: {},
       			saveAsImage: {}
   }
},
			xAxis: {
   			type: 'category',
   			boundaryGap: false,
   			data: date
},
			yAxis: {
   			type: 'value',
   			boundaryGap: [0, '50%']
},
			dataZoom: [{
   			type: 'inside',
   			start: 0,
   			end: 10
}, {
   			start: 0,
   			end: 10,
   			handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
   			handleSize: '80%',
   			handleStyle: {
      			 	color: '#fff',
       			shadowBlur: 3,
       			shadowColor: 'rgba(0, 0, 0, 0.6)',
       			shadowOffsetX: 2,
       			shadowOffsetY: 2
   }
}],
series: [
   {
       name: '模拟数据',
       type: 'line',
       smooth: true,
       symbol: 'none',
       sampling: 'average',
       itemStyle: {
           color: 'rgb(255, 70, 131)'
       },
       areaStyle: {
           color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
               offset: 0,
               color: 'rgb(255, 158, 68)'
           }, {
               offset: 1,
               color: 'rgb(255, 70, 131)'
           }])
       },
       data: data
   }
]
};
;
		if (option && typeof option === "object") {
			myChart.setOption(option, true); 
}
       </script>
   </body>
</html>