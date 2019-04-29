(function () {
	"use strict";

	var treeviewMenu = $('.app-menu');

	// Toggle Sidebar
	$('[data-toggle="sidebar"]').click(function (event) {
		event.preventDefault();
		$('.app').toggleClass('sidenav-toggled');
	});

	// Activate sidebar treeview toggle
	$("[data-toggle='treeview']").click(function (event) {
		event.preventDefault();
		if (!$(this).parent().hasClass('is-expanded')) {
			treeviewMenu.find("[data-toggle='treeview']").parent().removeClass('is-expanded');
		}
		$(this).parent().toggleClass('is-expanded');
	});

	// Set initial active toggle
	$("[data-toggle='treeview.'].is-expanded").parent().toggleClass('is-expanded');

	//Activate bootstrip tooltips
	$("[data-toggle='tooltip']").tooltip();

	$('.select2-basic').select2();

	if ($('#editor').length) {
		initSample();
	}

	$('#uploadImage').on('click', function (e) {
		e.preventDefault();
		var elfNode = $('<div \>');
		elfNode.dialog({
			modal: true,
			width: '80%',
			top: '50px',
			title: 'Thư viện',
			create: function (event, ui) {
				var startPathHash = '';
				let elfInsrance = $(this).elfinder({
					startPathHash: startPathHash,
					useBrowserHistory: false,
					resizable: false,
					width: '100%',
					onlyMimes: ['image'],
					url: '/elfinder/php/connector.minimal.php',
					lang: 'vi',
					getFileCallback: function (file) {
						file.url = file.url.replace("/elfinder/php/../../", fontendUrl + '/');
						var url = file.url;
						var dialog = CKEDITOR.dialog.getCurrent();
						if (dialogName == 'image') {
							var urlObj = 'txtUrl'
						}
						dialog.setValueOf(dialog._.currentTabId, urlObj, url);
						elfNode.dialog('close');
						elfInsrance.disable();
					}
				}).elfinder('instance');
			},
			// open: function () {
			// 	elfNode.find('div.elfinder-toolbar input').blur();
			// 	setTimeout(function () {
			// 		elfInsrance.enable();
			// 	}, 100);
			// },
			// resizeStop: function () {
			// 	elfNode.trigger('resize');
			// }
		}).parent().css({
			'zIndex': '11000',
			'top'	: '100px',
			'position': 'fixed'
		});
	});
})();