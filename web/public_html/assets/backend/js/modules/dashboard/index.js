drawBarChartAjax('#assetUseBarChart', false, ['Tổng TS', 'TS thêm mới', 'TS ghi giảm'], '/adcp/dashboard/assetbarchart', {
	scales: {
		yAxes: [{
			ticks: {
				beginAtZero: true
			},
			scaleLabel: {
				display: true,
				labelString: 'Số lượng'
			}
		}]
	},
	plugins: {
		datalabels: {
			display: true,
			color: '#fff',
			rotation: -90,
		}
	},
});

drawChartPieDonutAjax('#assetPieChart', false, '/adcp/dashboard/assetpiechart');

drawBarChartAjax('#assetBarChartDepartment', false, ['TS đang sử dụng', 'TS chưa sử dụng'], '/adcp/dashboard/assetbardeptchart');

drawBarChartAjax('#assetCostsBarChartOne', false, ['Tổng TS', 'TS thêm mới', 'TS ghi giảm'], '/adcp/dashboard/assetbarchart', {
	scales: {
		yAxes: [{
			ticks: {
				beginAtZero: true
			},
			scaleLabel: {
				display: true,
				labelString: 'Số lượng'
			}
		}]
	},
	plugins: {
		datalabels: {
			display: true,
			color: '#fff',
			rotation: -90,
		}
	},
});

drawBarChartAjax('#assetCostsBarChartTwo', false, ['Tổng nguyên giá', 'Còn lại', 'Khấu hao/hao mòn'], '/adcp/dashboard/costsbarchart2',{
	scales: {
		yAxes: [{
			ticks: {
				beginAtZero: true
			},
			scaleLabel: {
				display: true,
				labelString: '(triệu đồng)'
			}
		}]
	},
	plugins: {
		datalabels: {
			display: true,
			color: '#fff',
			rotation: -90,
		}
	},
})

drawLineChartAjax('#assetUseLineChartOne', false, ['Tổng', 'Tăng', 'Giảm'], '/adcp/dashboard/assetlinechart1')

drawLineChartAjax('#assetUseLineChartTwo', false, ['Tổng', 'Tăng', 'Giảm'], '/adcp/dashboard/assetlinechart2')

let data8 = {
	label: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
	data: [
		[100, 120, 180, 140, 190, 160, 170, 150, 130, 160, 210, 220],
		[60, 60, 30, 40, 50, 20, 70, 10, 20, 90, 40, 50],
	]
}
drawBarChart('#upgradeBarChartOne', false, ['Nâng cấp', 'Sửa chửa'], data8)
// drawBarChartAjax('#upgradeBarChartOne',false,['Nâng cấp','Sửa chửa'])
let data9 = {
	label: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
	data: [
		[100, 120, 180, 160, 210, 220],
		[60, 60, 20, 70, 40, 50],
	]
}
drawBarChart('#upgradeBarChartTwo', false, ['Nâng cấp', 'Sửa chửa'], data9)
// drawBarChartAjax('#upgradeBarChartTwo',false,['Nâng cấp','Sửa chửa'])
let data10 = {
	label: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
	data: [
		[100, 120, 180, 140, 190, 160, 170, 150, 130, 160, 210, 220]
	]
}
drawLineChart('#purchaseLineChartOne', false, ['Mua sắm'], data10)
// drawLineChartAjax('#purchaseLineChartOne',false,['Mua sắm'])
let data11 = {
	label: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
	data: [
		[100, 150, 130, 120, 70, 90]
	]
}
drawLineChart('#purchaseLineChartTwo', false, ['Mua sắm'], data11)
// drawLineChartAjax('#purchaseLineChartTwo',false,['Mua sắm'])

drawBarChartAjax('#checksBarChart', false, ['Nhập', 'Xuất'], '/adcp/dashboard/checkbarchart')

drawChartPieDonutAjax('#checkInDoughnutChart', false, '/adcp/dashboard/checkinpiechart', 'doughnut');

drawBarChartAjax('#checkYearsBarChart', false, ['Nhập', 'Xuất'], '/adcp/dashboard/checkyearbarchart');

drawChartPieDonutAjax('#checkOutDoughnutChart', false, '/adcp/dashboard/checkoutpiechart', 'doughnut');

drawBarChartAjax('#assetUpBarChart', false, ['Tăng'], '/adcp/dashboard/upbarchart')

drawChartPieDonutAjax('#assetUpDoughnutChart', false, '/adcp/dashboard/uppiechart', 'doughnut');

drawBarChartAjax('#assetUpDeptBarChart', false, ['Tăng'], '/adcp/dashboard/uplinechart')

drawBarChartAjax('#assetDownBarChart', false, ['Tăng'], '/adcp/dashboard/downbarchart')

drawChartPieDonutAjax('#assetDownDoughnutChart', false, '/adcp/dashboard/downpiechart', 'doughnut');

drawBarChartAjax('#assetDownDeptBarChart', false, ['Giảm'], '/adcp/dashboard/downlinechart')

drawBarChartAjax('#assetDownBarChart', false, ['Thanh lý', 'Tiêu hủy',['Khác']], '/adcp/dashboard/downbarchart')

drawChartPieDonutAjax('#assetDownDoughnutChart', false, '/adcp/dashboard/downpiechart', 'doughnut');

drawLineChartAjax('#assetDownLineChart', false, ['Thanh lý', 'Tiêu hủy', 'Khác'], '/adcp/dashboard/downlinechart')

$('#dashboardTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	// e.relatedTarget
	let typeTab = $(e.target).data('tab');
	window.history.pushState({}, "", webAdminUrl + '?tab=' + typeTab);
});

for (let index = 1; index <= 8; index++) {
	if($(`.sortDbBoxTab${index}`).length){
		// console.log(index);
		$(`.sortDbBoxTab${index}`).sortable({
			placeholder: 'sort-highlight',
			connectWith: `.sortDbBoxTab${index}`,
			handle: '.inner',
			forcePlaceholderSize: true,
			zIndex: 999999
		});
		$(`.sortDbBoxTab${index} .inner`).css('cursor', 'move');
	}

	if($(`.sortDbTab${index}`).length){
		$(`.sortDbTab${index}`).sortable({
			placeholder: 'sort-highlight',
			connectWith: `.sortDbTab${index}`,
			handle: '.card-header',
			forcePlaceholderSize: true,
			zIndex: 999999
		})
		$(`.sortDbTab${index} .card-header`).css('cursor', 'move')
	}
}

const autoHeightChart = () => {
	let height = $(window).height();
	let headerHight = $('.main-header').height();
	let headerHight2 = $('#singleCore .content-header').height();
	let footerHight = $('.main-footer').height();
	if(height){
		if (height > 950){
			$('.chart-hieight').css('height','220px');
		}else if(height > 800 && height < 950){
			let be = (height - headerHight - headerHight2 - footerHight - 314)/2;
			console.log(be);
			$('.chart-hieight').css('height',be);
		}else{
			$('.chart-hieight').css('height','220px');
		}
	}
}

autoHeightChart()



// // jQuery UI sortable for the todo list
// $('.todo-list').sortable({
// 	placeholder: 'sort-highlight',
// 	handle: '.handle',
// 	forcePlaceholderSize: true,
// 	zIndex: 999999
// })