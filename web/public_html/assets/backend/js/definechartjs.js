//ChartJS
let chartColors = [
	'#C55A11',
	'#03A9F3',
	'#ff9800c5',
	'#6f42c1',
	'#3c8dbc',
	'#4CAE50',
	'#d2d6de'
];

//Draw StackedBar ChartJs
const drawStackedBarChart = (selector, title = false, labelob = [], response) => {
	if ($(selector).length) {
		let datasets = [];
		labelob.forEach((item, index) => {
			datasets.push({
				label: labelob[index],
				backgroundColor: chartColors[index],
				borderColor: chartColors[index],
				pointRadius: false,
				pointColor: '#3b8bba',
				pointStrokeColor: chartColors[index],
				pointHighlightFill: '#fff',
				pointHighlightStroke: chartColors[index],
				data: response.data[index]
			});
		});

		let areaChartData = {
			labels: response.label,
			datasets: datasets
		}

		let barChartData = jQuery.extend(true, {}, areaChartData)

		let stackedBarChartCanvas = $(selector).get(0).getContext('2d')
		let stackedBarChartData = jQuery.extend(true, {}, barChartData)

		let stackedBarChartOptions = {
			responsive: true,
			maintainAspectRatio: false,
			scales: {
				xAxes: [{
					stacked: true,
				}],
				yAxes: [{
					stacked: true
				}]
			},
			plugins: {
				datalabels: {
					color: '#fff',
					display: true,
					align: 'center',
					anchor: 'center'
				}
			},
			title: {
				display: title ? true : false,
				text: title
			}
		}

		let stackedBarChart = new Chart(stackedBarChartCanvas, {
			type: 'bar',
			data: stackedBarChartData,
			options: stackedBarChartOptions
		})
	}
}
const drawStackedBarChartAjax = (selector, title = false, labelob = [], linkApi = false, ) => {
	if ($(selector).length) {
		if (linkApi) {
			$.ajax({
				type: "GET",
				url: linkApi,
				data: null,
				dataType: "json",
				success: function (response) {
					drawStackedBarChart(selector, title, labelob, response);
				}
			});
		} else {
			response = {
				data: [],
				label: []
			}
			labelob.forEach((item, index) => {
				response.data[index] = [];
				for (let i = 0; i < 6; i++) {
					response.data[index][i] = getRandomInt(100);
				}
			});
			for (let i = 0; i < 6; i++) {
				response.label.push('Label ' + i);
			}
			console.log(response);
			
			drawStackedBarChart(selector, title, labelob, response);
		}
	}
}
//Draw Bar ChartJs
const drawBarChart = (selector, title = false, labelob = [], response, options = false) => {
	if ($(selector).length) {
		let datasets = [];
		labelob.forEach((item, index) => {
			datasets.push({
				label: labelob[index],
				backgroundColor: chartColors[index],
				borderColor: chartColors[index],
				pointRadius: false,
				pointColor: '#3b8bba',
				pointStrokeColor: chartColors[index],
				pointHighlightFill: '#fff',
				pointHighlightStroke: chartColors[index],
				data: response.data[index]
			});
		});

		let areaChartData = {
			labels: response.label,
			datasets: datasets
		}

		let barChartData = jQuery.extend({}, areaChartData)
		let barChartOptions = {
			responsive: true,
			maintainAspectRatio: false,
			datasetFill: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					},
				}]
			},
			plugins: {
				datalabels: {
					display: true,
					color: '#fff'
				}
			},
			title: {
				display: title ? true : false,
				text: title
			}
		}

		let barChartCanvas = $(selector).get(0).getContext('2d')
		let barChart = new Chart(barChartCanvas, {
			type: 'bar',
			data: barChartData,
			options: options ? $.extend(barChartOptions, options) : barChartOptions
		})
	}
}
const drawBarChartAjax = (selector, title = false, labelob = [], linkApi = false, options = false) => {
	if ($(selector).length) {
		if (linkApi) {
			$.ajax({
				type: "GET",
				url: linkApi,
				data: null,
				dataType: "json",
				success: function (response) {
					if(response){
						drawBarChart(selector, title, labelob, response, options);
					}else{
						drawBarChart(selector, title, labelob, {data: [],label: []},options);
					}
				}
			});
		} else {
			response = {
				data: [],
				label: []
			}
			labelob.forEach((item, index) => {
				response.data[index] = [];
				for (let i = 0; i < 6; i++) {
					response.data[index][i] = getRandomInt(100);
				}
			});
			for (let i = 0; i < 6; i++) {
				response.label.push('Label ' + i);
			}
			drawBarChart(selector, title, labelob, response);
		}
	}
}
//Draw Pie / Donut ChartJs
const drawChartPieDonut = (selector, title, response, type = 'pie') => {
	if ($(selector).length) {
		let color = [];
		response.label.forEach((el, index) => {
			response.label[index] = response.label[index] + ` (${response.data[index]})`;
			color[index] = chartColors[index];
		});
		let data = {
			labels: response.label,
			datasets: [{
				data: response.data,
				backgroundColor: color,
			}]
		}
		let pieDonutChartCanvas = $(selector).get(0).getContext('2d');
		let pieDonutChart = new Chart(pieDonutChartCanvas, {
			type: type, //doughnut
			data: data,
			options: {
				maintainAspectRatio: false,
				responsive: true,
				plugins: {
					datalabels: {
						display: false
					}
				},
				title: {
					display: title ? true : false,
					text: title
				}
			}
		})
	}
}
const drawChartPieDonutAjax = (selector, title, linkApi = false, type = 'pie') => {
	if ($(selector).length) {
		if (linkApi) {
			$.ajax({
				type: "GET",
				url: linkApi,
				data: null,
				dataType: "json",
				success: function (response) {
					if(response){
						drawChartPieDonut(selector, title, response, type)
					}else{						
						drawChartPieDonut(selector, title, {data: [],label: []}, type)
					}
				}
			});
		} else {
			response = {
				data: [],
				label: []
			}
			for (let i = 0; i < 7; i++) {
				response.label[i] = 'Label ' + i;
				response.data[i] = getRandomInt(100);
			}
			drawChartPieDonut(selector, title, response, type)
		}
	}
}
//Braw Line ChartJS
const drawLineChart = (selector, title = false, labelob = [], response) => {
	if ($(selector).length) {
		let datasets = [];
		labelob.forEach((item, index) => {
			datasets.push({
				label: labelob[index],
				backgroundColor: chartColors[index],
				fill: false,
				borderColor: chartColors[index],
				data: response.data[index]
			});
		});

		let areaChartData = {
			labels: response.label,
			datasets: datasets
		}

		let lineChartData = jQuery.extend(true, {}, areaChartData)
		let lineChartOptions = {
			maintainAspectRatio: false,
			responsive: true,
			scales: {
				xAxes: [{
					gridLines: {
						display: false,
					}
				}],
				yAxes: [{
					gridLines: {
						display: false,
					}
				}]
			},
			title: {
				display: title ? true : false,
				text: title
			}
		}

		let lineChartCanvas = $(selector).get(0).getContext('2d')
		let lineChart = new Chart(lineChartCanvas, {
			type: 'line',
			data: lineChartData,
			options: lineChartOptions
		})
	}
}
const drawLineChartAjax = (selector, title = false, labelob = [], linkApi = false, ) => {
	if ($(selector).length) {
		if (linkApi) {
			$.ajax({
				type: "GET",
				url: linkApi,
				data: null,
				dataType: "json",
				success: function (response) {
					if(response){
						drawLineChart(selector, title, labelob, response);
					}else{
						drawLineChart(selector, title, labelob, {data: [],label: []});
					}

				}
			});
		} else {
			response = {
				data: [],
				label: []
			}
			labelob.forEach((item, index) => {
				response.data[index] = [];
				for (let i = 0; i < 6; i++) {
					response.data[index][i] = getRandomInt(100);
				}
			});
			for (let i = 0; i < 6; i++) {
				response.label.push('Label ' + i);
			}
			drawLineChart(selector, title, labelob, response);
		}
	}
}