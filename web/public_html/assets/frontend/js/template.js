/*
 * Version: 2.1
 * File Description: Initializations of plugins
 */
(function($) {

	// USE STRICT
	"use strict";

	$(document).ready(function() {

		if ($('.boxed .fullscreen-bg').length>0) {
			$("body").addClass("transparent-page-wrapper");
		};

		//Show dropdown on hover only for desktop devices
		//-----------------------------------------------
		if ($(window).width() > 975) {
			$('.main-navigation:not(.onclick) .navbar-nav>li.dropdown, .main-navigation:not(.onclick) li.dropdown>ul>li.dropdown').hover(
			function() {
				$(this).addClass('show');
				$(this).find('>.dropdown-menu').addClass('show');
			}, function() {
				$(this).removeClass('show');
				$(this).find('>.dropdown-menu').removeClass('show');
			});

			$('.main-navigation .navbar-nav > li.dropdown > a.nav-link').click(function(e) {
				e.preventDefault();
				window.location.href = $(this).attr('href');
			});
		};

		//Show dropdown on click only for mobile devices
		//-----------------------------------------------
		if ($(window).width() < 974 || $(".main-navigation.onclick").length>0 ) {
			$('.header [data-toggle=dropdown], .header-top [data-toggle=dropdown]').on('click', function(event) {
				// Avoid following the href location when clicking
				event.preventDefault();

				// Avoid having the menu to close when clicking
				event.stopPropagation();

				// close all the siblings
				$(this).parent().siblings().removeClass('show');
				$(this).parent().siblings().find('.dropdown-menu').removeClass('show');

				// close all the submenus of siblings
				$(this).parent().siblings().find('[data-toggle=dropdown]').parent().removeClass('show');

				// opening the one you clicked on
				$(this).parent().toggleClass('show');
				$(this).siblings('.dropdown-menu').toggleClass('show');
			});
		};

		//Transparent Header Calculations
		if ($(".transparent-header").length>0) {
			(function(){
				var trHeaderHeight;
				$(window).on('load', function (e) {
					trHeaderHeight = $("header.header").outerHeight();
					$(".transparent-header .tp-bannertimer").css("marginTop", (trHeaderHeight)+"px");
				});
				var headerTopHeightResize = $(".header-top").outerHeight();
				$(window).resize(function() {
					if ($(this).scrollTop()  < headerTopHeightResize + trHeaderHeight -5) {
						trHeaderHeight = $("header.header").outerHeight();
						$(".transparent-header .tp-bannertimer").css("marginTop", (trHeaderHeight)+"px");
					}
				});
			})();
		}

		if ($(".transparent-header .slideshow").length>0) {
			$(".header-container header.header").addClass("transparent-header-on");
		} else {
			$(".header-container header.header").removeClass("transparent-header-on");
		}

		//Full Width Slider with Transparent Header Calculations
		if ($(".transparent-header .slider-banner-fullwidth-big-height").length>0) {
			if ($(window).width() < 991) {
				$("body").removeClass("transparent-header");
				$(".header-container header.header").removeClass("transparent-header-on");
				$(".tp-bannertimer").css("marginTop", "0px");
				$("body").addClass("slider-banner-fullwidth-big-height-removed");
			} else {
				$("body").addClass("transparent-header");
				$(".header-container header.header").addClass("transparent-header-on");
				$("body").removeClass("slider-banner-fullwidth-big-height-removed");
			}
		};

		if ($(".transparent-header .slider-banner-fullwidth-big-height").length>0 || $(".slider-banner-fullwidth-big-height-removed").length>0) {
			$(window).resize(function() {
				if ($(window).width() < 991) {
					$("body").removeClass("transparent-header");
					$(".header-container header.header").removeClass("transparent-header-on");
					$(".tp-bannertimer").css("marginTop", "0px");
				} else {
					$("body").addClass("transparent-header");
					$(".header-container header.header").addClass("transparent-header-on");
				}
			});
		};

		//Revolution Slider 5
		if ($(".slider-revolution-5-container").length>0) {
			$(".tp-bannertimer").show();

			$('.slider-revolution-5-container .slider-banner-fullwidth').revolution({
				sliderType:"standard",
				sliderLayout:"fullwidth",
				delay:8000,
				gridwidth:1140,
				gridheight:540,
				responsiveLevels:[1199,991,767,480],
				navigation: {
					onHoverStop: "off",
					arrows: {
						style: "hebe",
						enable:true,
						tmp: '',
						left : {
							h_align:"left",
							v_align:"center",
							h_offset:0,
							v_offset:0,
						},
						right : {
							h_align:"right",
							v_align:"center",
							h_offset:0,
							v_offset:0
						}
					},
					bullets:{
						style:"",
						enable:true,
						hide_onleave:true,
						direction:"horizontal",
						space: 3,
						h_align:"center",
						v_align:"bottom",
						h_offset:0,
						v_offset:20
					}
				}
			});

			$('.slider-revolution-5-container .slider-banner-fullwidth-big-height').revolution({
				sliderType:"standard",
				sliderLayout:"fullwidth",
				delay:8000,
				gridwidth:1140,
				gridheight:650,
				responsiveLevels:[1199,991,767,480],
				navigation: {
					onHoverStop: "off",
					arrows: {
						style: "hebe",
						enable:true,
						tmp: '',
						left : {
							h_align:"left",
							v_align:"center",
							h_offset:0,
							v_offset:0,
						},
						right : {
							h_align:"right",
							v_align:"center",
							h_offset:0,
							v_offset:0
						}
					},
					bullets:{
						style:"",
						enable:true,
						hide_onleave:true,
						direction:"horizontal",
						space: 3,
						h_align:"center",
						v_align:"bottom",
						h_offset:0,
						v_offset:20
					}
				}
			});
		};

		//Slick carousel
		//-----------------------------------------------
		if ($('.slick-carousel').length>0) {
			$(".slick-carousel.carousel").slick({
				arrows: false,
				slidesToShow: 4,
				slidesToScroll: 4,
				autoplay: true,
				autoplaySpeed: 3000,
				responsive: [
					{
						breakpoint: 1200,
						settings: {
							slidesToShow: 4,
							slidesToScroll: 4
						}
					},
					{
						breakpoint: 992,
						settings: {
							slidesToShow: 3,
							slidesToScroll: 3
						}
					},
					{
						breakpoint: 768,
						settings: {
							slidesToShow: 2,
							slidesToScroll: 2
						}
					},
					{
						breakpoint: 575,
						settings: {
							slidesToShow: 2,
							slidesToScroll: 2
						}
					}
				]
			});
			$(".slick-carousel.carousel-autoplay").slick({
				arrows: false,
				slidesToShow: 3,
				slidesToScroll: 1,
				autoplay: true,
				autoplaySpeed: 5000,
				responsive: [
					{
						breakpoint: 1200,
						settings: {
							slidesToShow: 3,
							slidesToScroll: 3
						}
					},
					{
						breakpoint: 768,
						settings: {
							slidesToShow: 1,
							slidesToScroll: 1
						}
					},
					{
						breakpoint: 575,
						settings: {
							slidesToShow: 1,
							slidesToScroll: 1
						}
					}
				]
			});
			$(".slick-carousel.clients").slick({
				arrows: false,
				slidesToShow: 6,
				slidesToScroll: 6,
				autoplay: true,
				autoplaySpeed: 5000,
				responsive: [
					{
						breakpoint: 1200,
						settings: {
							slidesToShow: 6,
							slidesToScroll: 6
						}
					},
					{
						breakpoint: 992,
						settings: {
							slidesToShow: 4,
							slidesToScroll: 4
						}
					},
					{
						breakpoint: 768,
						settings: {
							slidesToShow: 2,
							slidesToScroll: 2
						}
					},
					{
						breakpoint: 575,
						settings: {
							slidesToShow: 1,
							slidesToScroll: 1
						}
					}
				]
			});
			
			$(".slick-carousel.carousel-5").slick({
				arrows: false,
				slidesToShow: 5,
				slidesToScroll: 5,
				autoplay: true,
				autoplaySpeed: 5000,
				responsive: [
					{
						breakpoint: 1200,
						settings: {
							slidesToShow: 5,
							slidesToScroll: 5
						}
					},
					{
						breakpoint: 992,
						settings: {
							slidesToShow: 4,
							slidesToScroll: 4
						}
					},
					{
						breakpoint: 768,
						settings: {
							slidesToShow: 2,
							slidesToScroll: 2
						}
					},
					{
						breakpoint: 575,
						settings: {
							slidesToShow: 2,
							slidesToScroll: 2
						}
					}
				]
			});


			$(".slick-carousel.content-slider").slick({
				autoplay: true,
				autoplaySpeed: 5000,
				arrows: false
			});
			$(".slick-carousel.content-slider-with-controls").slick({
				dots: true,
				nextArrow: '<button type="button" class="slick-next">Next</button>',
				prevArrow: '<button type="button" class="slick-prev">Prev</button>'
			});
			$(".slick-carousel.content-slider-with-large-controls").slick({
				dots: true,
				nextArrow: '<button type="button" class="slick-next">Next</button>',
				prevArrow: '<button type="button" class="slick-prev">Prev</button>'
			});
			$(".slick-carousel.content-slider-with-controls-autoplay").slick({
				autoplay: true,
				autoplaySpeed: 5000,
				dots: true,
				nextArrow: '<button type="button" class="slick-next">Next</button>',
				prevArrow: '<button type="button" class="slick-prev">Prev</button>'
			});
			$(".slick-carousel.content-slider-with-large-controls-autoplay").slick({
				autoplay: true,
				autoplaySpeed: 5000,
				dots: true,
				nextArrow: '<button type="button" class="slick-next">Next</button>',
				prevArrow: '<button type="button" class="slick-prev">Prev</button>'
			});

			if ($("*[dir='ltr']").length>0) {
				$('.slick-carousel.content-slider-with-thumbs').slick({
					slidesToShow: 1,
					slidesToScroll: 1,
					arrows: false,
					fade: true,
					asNavFor: '.slick-carousel.content-slider-thumbs'
				});
				$('.slick-carousel.content-slider-thumbs').slick({
					slidesToShow: 4,
					slidesToScroll: 1,
					asNavFor: '.slick-carousel.content-slider-with-thumbs',
					arrows: false,
						focusOnSelect: true
				});
			} else {
				$('.slick-carousel.content-slider-with-thumbs').slick({
					slidesToShow: 1,
					slidesToScroll: 1,
					arrows: false,
					fade: true,
					asNavFor: '.slick-carousel.content-slider-thumbs',
					rtl: true
				});
				$('.slick-carousel.content-slider-thumbs').slick({
					slidesToShow: 4,
					slidesToScroll: 1,
					asNavFor: '.slick-carousel.content-slider-with-thumbs',
					arrows: false,
					rtl: true,
						focusOnSelect: true
				});
			}
		};

		// Magnific popup
		//-----------------------------------------------
		if (($(".popup-img").length > 0) || ($(".popup-iframe").length > 0) || ($(".popup-img-single").length > 0) || $(".slick-carousel--popup-img").length > 0) {
			$(".popup-img").magnificPopup({
				type:"image",
				gallery: {
					enabled: true,
				}
			});
			if ($(".slick-carousel--popup-img").length > 0) {
				$(".slick-carousel").each(function() {
					$(this).find(".slick-slide:not(.slick-cloned) .slick-carousel--popup-img").magnificPopup({
						type:"image",
						gallery: {
							enabled: true,
						}
					});
				});
			}
			$(".popup-img-single").magnificPopup({
				type:"image",
				gallery: {
					enabled: false,
				}
			});
			$('.popup-iframe').magnificPopup({
				disableOn: 700,
				type: 'iframe',
				preloader: false,
				fixedContentPos: false
			});
		};

		// Slider animations
		//-----------------------------------------------
		if ($("[data-caption-effect]").length>0) {
			$("[data-caption-effect]").each(function() {
				$(this).addClass($(this).attr("data-caption-effect"));
			});
		};

		// Text Rotators
		//-----------------------------------------------
		if ($(".text-rotator").length>0) {
			var typed = new Typed('#text-rotator', {
				stringsElement: '#text-rotator-text',
				typeSpeed: 40,
				backSpeed: 30,
				backDelay: 4000,
				smartBackspace: true,
				loop: true
			});
		};

		// Isotope filters
		//-----------------------------------------------
		if ($('.isotope-container').length>0 || $('.masonry-grid').length>0 || $('.masonry-grid-fitrows').length>0 || $('.isotope-container-fitrows').length>0) {
			$('.masonry-grid').isotope({
				itemSelector: '.masonry-grid-item',
				layoutMode: 'masonry'
			});
			$('.masonry-grid-fitrows').isotope({
				itemSelector: '.masonry-grid-item',
				layoutMode: 'fitRows'
			});
			$('.isotope-container').fadeIn();
			var $container = $('.isotope-container').imagesLoaded( function() {
				$container.isotope({
					itemSelector: '.isotope-item',
					layoutMode: 'masonry',
					transitionDuration: '0.6s',
					filter: "*"
				});
			});
			$('.isotope-container-fitrows').fadeIn();
			var $container_fitrows = $('.isotope-container-fitrows').imagesLoaded( function() {
				$container_fitrows.isotope({
					itemSelector: '.isotope-item',
					layoutMode: 'fitRows',
					transitionDuration: '0.6s',
					filter: "*"
				});
			});
			// filter items on button click
			$('.filters').on( 'click', 'ul.nav li a', function() {
				var filterValue = $(this).attr('data-filter');
				$(".filters").find("li .active").removeClass("active");
				$(this).addClass("active");
				$container.isotope({ filter: filterValue });
				$container_fitrows.isotope({ filter: filterValue });
				return false;
			});
			$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				$('.tab-pane .masonry-grid-fitrows').isotope({
					itemSelector: '.masonry-grid-item',
					layoutMode: 'fitRows'
				});
			});
		};

		//Modal
		//-----------------------------------------------
		if($(".modal").length>0) {
			$(".modal").each(function() {
				$(".modal").prependTo( "body" );
			});
		}

		// Pricing tables popovers
		//-----------------------------------------------
		if ($(".pricing-tables").length>0) {
			$(".plan .pt-popover").popover({
				trigger: 'hover',
				container: 'body'
			});
		};

		//Scroll Spy
		//-----------------------------------------------
		if($(".scrollspy").length>0) {
			$("body").addClass("scroll-spy");
			if($(".fixed.header").length>0) {
				$('body').scrollspy({
					target: '.scrollspy',
					offset: 85
				});
			} else {
				$('body').scrollspy({
					target: '.scrollspy',
					offset: 20
				});
			}
		}

		//Smooth Scroll
		//-----------------------------------------------
		if ($(".smooth-scroll").length>0) {
			if($(".header.fixed").length>0) {
				$( ".smooth-scroll a, a.smooth-scroll" ).on( "click", function(e) {
					var destination = $(this.hash);
					e.preventDefault();
					$('html,body').animate({
						scrollTop: destination.offset().top-66
					}, 1000);
				});
			} else {
				$( ".smooth-scroll a, a.smooth-scroll" ).on( "click", function(e) {
					var destination = $(this.hash);
					e.preventDefault();
					$('html,body').animate({
						scrollTop: destination.offset().top
					}, 1000);
				});
			}
		}

		// Offcanvas side navbar
		//-----------------------------------------------
		if ($("#offcanvas").length>0) {
			$('#offcanvas').offcanvas({
				canvas: "body",
				disableScrolling: false,
				toggle: false
			});
		};

		// Notify Plugin
		//-----------------------------------------------
		if ($(".btn-alert").length>0){
			$(".btn-alert").on('click', function(event) {
				$.notify({
					// options
					// before putting here dynamic content (e.g content from a user input) please read https://github.com/mouse0270/bootstrap-notify/issues/53
					message: 'Great! you have just created this message :-) you can configure this into the template.js file'
				},{
					// settings
					type: 'info',
					delay: 4000,
					offset : {
						y: 100,
						x: 20
					}
				});
				return false;
			});
		};

		// Remove Button
		//-----------------------------------------------
		$(".btn-remove").click(function() {
			$(this).closest(".remove-data").remove();
		});

		// Shipping Checkbox
		//-----------------------------------------------
		if ($("#shipping-info-check").is(':checked')) {
			$("#shipping-information").hide();
		}
		$("#shipping-info-check").change(function(){
			if ($(this).is(':checked')) {
				$("#shipping-information").slideToggle();
			} else {
				$("#shipping-information").slideToggle();
			}
		});

		// Full Width Image Overlay
		//-----------------------------------------------
		if ($(".full-image-overlay").length>0) {
			(function(){
				var overlayHeight = $(".full-image-overlay").outerHeight();
				$(".full-image-overlay").css("marginTop",-overlayHeight/2);
			})();
		};

		//This will prevent the event from bubbling up and close the dropdown when you type/click on text boxes (Header Top).
		//-----------------------------------------------
		$('.header-top .dropdown-menu input').click(function(e) {
			e.stopPropagation();
		});

	});

})(jQuery);

if (jQuery(".btn-print").length>0) {
	function print_window() {
		var mywindow = window;
		mywindow.document.close();
		mywindow.focus();
		mywindow.print();
		mywindow.close();
	}
}