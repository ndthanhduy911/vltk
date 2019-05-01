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
			width: "80%",
			title: "Thư viện",
			zIndex: 99999,
			create: function (event, ui) {
				$(this).elfinder({
					resizable: false,
					url: "/elfinder/php/connector.minimal.php",
					commandsOptions: {
						getfile: {
							oncomplete: 'destroy'
						}
					},
					getFileCallback: function (file) {
						file.url = file.url.replace("/elfinder/php/../../", fontendUrl+'/');
						let url = file.url;
						$('#showImg').attr('src' , url);
						$('#uploadImageValue').val(url);
						elfNode.dialog('close');
						elfInsrance.disable();
					}
				}).elfinder('instance')
			}
		}).parent().css({'zIndex':'11000','top':'100px', 'position' : 'fixed'});
	});

	$('.date-basic').datepicker({
		format: "dd/mm/yyyy",
		autoclose: true,
		todayHighlight: true
	});
})();