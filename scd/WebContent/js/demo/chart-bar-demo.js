console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")

// Set new default font family and font color to mimic Bootstrap's default
// styling
		Chart.defaults.global.defaultFontFamily = 'Nunito',
		'-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
	// * example: number_format(1234.56, 2, ',', ' ');
	// * return: '1 234,56'
	number = (number + '').replace(',', '').replace(' ', '');
	var n = !isFinite(+number) ? 0 : +number, prec = !isFinite(+decimals) ? 0
			: Math.abs(decimals), sep = (typeof thousands_sep === 'undefined') ? ','
			: thousands_sep, dec = (typeof dec_point === 'undefined') ? '.'
			: dec_point, s = '', toFixedFix = function(n, prec) {
		var k = Math.pow(10, prec);
		return '' + Math.round(n * k) / k;
	};
	// Fix for IE parseFloat(0.55).toFixed(0) = 0;
	s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	if (s[0].length > 3) {
		s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	}
	if ((s[1] || '').length < prec) {
		s[1] = s[1] || '';
		s[1] += new Array(prec - s[1].length + 1).join('0');
	}
	return s.join(dec);
}

// DB에서 값 가져오기
var xArry = [];
var yArry = [];
$.ajax({
	url : "getchart.jsp",
	dataType : "json",
	success : function(result) {
		console.log("result.length=>" + result.length)

		if (result.length > 0) {
			$(result).each(function(i, val) {
				var year = val.year;
				var quarter = val.quarter;
				var sosma = val.sosma;
				var scsma = val.scsma;
				console.log("sosma=>" + sosma)
				console.log("scsma=>" + scsma)

				xArry.push(scsma);
				yArry.push(sosma);
				console.log("!xArry.length=>" + xArry.length)
				console.log("!yArry.length=>" + yArry.length)
			});
		}
		drawBarChart();
	}
});

function drawBarChart() {

	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");

	var myBarChart = new Chart(
			ctx,
			{
				type : 'scatter',
				data : {
					labels : xArry,
					datasets : [ {
						label : "Revenue",
						backgroundColor : "#4e73df",
						hoverBackgroundColor : "#2e59d9",
						borderColor : "#4e73df",
						data : yArry,
					} ],
				},
				options : {
					maintainAspectRatio : false,
					layout : {
						padding : {
							left : 10,
							right : 25,
							top : 25,
							bottom : 0
						}
					},
					scales : {
						xAxes : [ {
							time : {
								unit : 'month'
							},
							gridLines : {
								display : false,
								drawBorder : false
							},
							ticks : {
								maxTicksLimit : 6
							},
							maxBarThickness : 25,
						} ],
						yAxes : [ {
							ticks : {
								min : 0,
								max : 150,
								maxTicksLimit : 5,
								padding : 10,
								// Include a dollar sign in the ticks
								callback : function(value, index, values) {
									return '$' + number_format(value);
								}
							},
							gridLines : {
								color : "rgb(234, 236, 244)",
								zeroLineColor : "rgb(234, 236, 244)",
								drawBorder : false,
								borderDash : [ 2 ],
								zeroLineBorderDash : [ 2 ]
							}
						} ],
					},
					legend : {
						display : false
					},
					tooltips : {
						titleMarginBottom : 10,
						titleFontColor : '#6e707e',
						titleFontSize : 14,
						backgroundColor : "rgb(255,255,255)",
						bodyFontColor : "#858796",
						borderColor : '#dddfeb',
						borderWidth : 1,
						xPadding : 15,
						yPadding : 15,
						displayColors : false,
						caretPadding : 10,
						callbacks : {
							label : function(tooltipItem, chart) {
								var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label
										|| '';
								return datasetLabel + number_format(tooltipItem.yLabel);
							}
						}
					},
				}
			});
}
