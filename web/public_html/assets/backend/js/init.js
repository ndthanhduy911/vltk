$(document).ready(function () {
	inputFilterLoader();
	select2Loader();
	dateRangePickerLoader();
	numberLoaderList();
	bsCustomFileInput.init();

	$('.nav-sidebar li.nav-item.has-treeview').each((index, elemnt) => {
		if (!$('ul.nav-treeview li', elemnt).length) {
			$(elemnt).remove();
		}
	});

	$('body').overlayScrollbars({});
	$('.modal').overlayScrollbars({});


	$('#btnLogOut').click(function (e) {
		e.preventDefault();
		let link = $(this).attr('data-href');
		showSweetAlert(() => {
			window.location.href = link;
		}, 'Bạn có chắc muốn đăng xuất ?')
	});
	$('[data-toggle="tooltip"]').tooltip();
});