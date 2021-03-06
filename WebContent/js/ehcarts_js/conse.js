function conse(jsonObject) {

	var myChart = echarts.init(document.getElementById('conse'));

	var data = [];
	var small4rdata = [];
	var big16rdata = [];
	for (var i = 0; i < jsonObject.length; i++) {
		small4rdata.push(jsonObject[i].small4r + jsonObject[i].middle8r);
		big16rdata.push(jsonObject[i].big16r);
		data.push(jsonObject[i].bonus)
	}

	option = {
		backgroundColor : "#344b58",
		"title" : {
			"text" : "ボーナス集計",
			x : "4%",

			textStyle : {
				color : '#fff',
				fontSize : '22'
			},
		},
		"tooltip" : {
			"trigger" : "axis",
			"axisPointer" : {
				"type" : "shadow",
				textStyle : {
					color : "#fff"
				}

			},
		},
		"grid" : {
			"borderWidth" : 0,
			"top" : 110,
			"bottom" : 95,
			textStyle : {
				color : "#fff"
			}
		},
		"legend" : {
			x : '4%',
			top : '11%',
			textStyle : {
				color : '#90979c',
			},
			"data" : ['middle', 'other' ,  'big']
		},

		"calculable" : true,
		"xAxis" : [ {
			"type" : "category",
			"axisLine" : {
				lineStyle : {
					color : '#90979c'
				}
			},
			"splitLine" : {
				"show" : false
			},
			"axisTick" : {
				"show" : false
			},
			"splitArea" : {
				"show" : false
			},
			"axisLabel" : {
				"interval" : 0,

			},
			"data" : data,
		} ],
		"yAxis" : [ {
			"type" : "value",
			"splitLine" : {
				"show" : false
			},
			"axisLine" : {
				lineStyle : {
					color : '#90979c'
				}
			},
			"axisTick" : {
				"show" : false
			},
			"axisLabel" : {
				"interval" : 0,

			},
			"splitArea" : {
				"show" : false
			},

		} ],
		"dataZoom" : [
				{
					"show" : true,
					"height" : 30,
					"xAxisIndex" : [ 0 ],
					bottom : 30,
					"start" : 10,
					"end" : 80,
					handleIcon : 'path://M306.1,413c0,2.2-1.8,4-4,4h-59.8c-2.2,0-4-1.8-4-4V200.8c0-2.2,1.8-4,4-4h59.8c2.2,0,4,1.8,4,4V413z',
					handleSize : '110%',
					handleStyle : {
						color : "#d3dee5",

					},
					textStyle : {
						color : "#fff"
					},
					borderColor : "#90979c"

				}, {
					"type" : "inside",
					"show" : true,
					"height" : 15,
					"start" : 1,
					"end" : 35
				} ],
		"series" : [{
			"name" : "other",
			"type" : "bar",
			"stack" : "bonus",
			"itemStyle" : {
				"normal" : {
					"color" : "rgba(51, 51, 255,1)",
					"barBorderRadius" : 0,
					"label" : {
						"show" : true,
						"position" : "insideTop",
						formatter : function(p) {
							return p.value > 0 ? (p.value) : '';
						}
					}
				}
			},
			"data" : small4rdata
		},{
			"name" : "big",
			"type" : "bar",
			"stack" : "bonus",
			"barMaxWidth" : 35,
			"barGap" : "10%",
			"itemStyle" : {
				"normal" : {
					"color" : "rgba(255, 255, 0,1)",
					"label" : {
						"show" : true,
						"textStyle" : {
							"color" : "#fff"
						},
						"position" : "top",
						formatter : function(p) {
							return p.value > 0 ? (p.value) : '';
						}
					}
				}
			},
			"data" : big16rdata
		} ]
	};
	myChart.setOption(option);
}