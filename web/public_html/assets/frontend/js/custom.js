/*
 * Version: 2.1
 */

// Notify Plugin - Code for the demo site of HtmlCoder
// You can delete the code below
//-----------------------------------------------
(function($) {

	"use strict";

	$(document).ready(function() {

		$('body').overlayScrollbars({});
		
		if (($(".main-navigation.onclick").length>0) && $(window).width() > 991 ){
			$.notify({
				// options
				message: 'The Dropdowns of the Main Menu, are now open with click on Parent Items. Click "Home" to checkout this behavior.'
			},{
				// settings
				type: 'info',
				delay: 10000,
				offset : {
					y: 150,
					x: 20
				}
			});
		};
		if (!($(".main-navigation.animated").length>0) && $(window).width() > 991 && $(".main-navigation").length>0){
			$.notify({
				// options
				message: 'The animations of main menu are disabled.'
			},{
				// settings
				type: 'info',
				delay: 10000,
				offset : {
					y: 150,
					x: 20
				}
			}); // End Notify Plugin - The above code (from line 14) is used for demonstration purposes only

		};

		$('#langid a').click(function (e) { 
			e.preventDefault();
			let langid = $(this).attr('data-id');
			changeLang(langid);
		});

		if($(window).width() < 720){
			$('.slider-revolution-5-container .slider-banner-fullwidth .slider-content').each(function (index, element) {
				$(this).html(trimText($(this).text(), 100));
			});
		}
		$('.dropdown-menu > li > a.active').parents('.dropdown-menu').prev('a.nav-link').addClass('active').parent('.nav-item.dropdown').addClass('show active');

		if($(window).width() > 1024){
			$('.os-viewport:eq(0)').scroll(function(e){
				e.preventDefault();
				let crollHeight = $(this).scrollTop();
				if(crollHeight > 120){
					$('.submenu').addClass('fixed-top');
					$('#main').css('margin-top',120);
					$(".scrollToTop").addClass("fadeToTop");
					$(".scrollToTop").removeClass("fadeToBottom");
					$('body').addClass('fixed-header-on');
				}else{
					$('.submenu').removeClass('fixed-top');
					$('#main').css('margin-top',0);
					$(".scrollToTop").removeClass("fadeToTop");
					$(".scrollToTop").addClass("fadeToBottom");
					$('body').removeClass('fixed-header-on');
				}
			});
		}
	
		$(".scrollToTop").click(function() {
			$('.os-viewport:eq(0)').animate({scrollTop:0},500);
		}); 

		if($('#tabMajors').length){
			$('.os-viewport:eq(0)').animate({scrollTop:600},500);
		}
	});

})(jQuery);
