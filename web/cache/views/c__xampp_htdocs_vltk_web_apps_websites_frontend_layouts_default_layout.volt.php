<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title><?php echo isset($title) ? $title.' | Khoa Vật Lý - Vật Lý Kỹ Thuật' : 'Khoa Vật Lý - Vật Lý Kỹ Thuật' ?> </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Canonical SEO -->
    <link rel="canonical" href="<?php echo FRONTEND_URL ?>/" />
    <!--  Social tags      -->
    <meta name="keywords" content="support, it, technical, physics, network, system">
    <meta name="description" content="Ho tro khach hang physics">
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="Vật Lý - Vật Lý Kỹ Thuật">
    <meta itemprop="description" content="Vật Lý - Vật Lý Kỹ Thuật">
    <meta itemprop="image" content="http://physics.vn/images/logo.png">
    <!-- Twitter Card data -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@hcmus.edu.vn">
    <meta name="twitter:title" content="Vật Lý - Vật Lý Kỹ Thuật">
    <meta name="twitter:description" content="Vật Lý - Vật Lý Kỹ Thuật">
    <meta name="twitter:creator" content="@hcmus.edu.vn">
    <meta name="twitter:image" content="http://physics.vn/images/logo.png">
    <!-- Open Graph data -->
    <meta property="fb:app_id" content="655968634437471">
    <meta property="og:title" content="Vật Lý - Vật Lý Kỹ Thuật" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="http://physics.vn/" />
    <meta property="og:image" content="http://physics.vn/images/logo.png" />
    <meta property="og:description" content="Vật Lý - Vật Lý Kỹ Thuật" />
    <meta property="og:site_name" content="Vật Lý - Vật Lý Kỹ Thuật" />

    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="76x76" href="<?php echo FRONTEND_URL ?>/favicon.ico" />
    <link rel="icon" type="image/png" href="<?php echo FRONTEND_URL ?>/favicon.ico" />

    <!-- Web Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Plugins -->
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/css/settings.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/css/layers.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/css/navigation.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/css/animations.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/slick/slick.css" rel="stylesheet">

    <!-- VL-VLKT's core CSS file -->
    <!-- Use css/rtl_style.css for RTL version -->
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/css/style.css" rel="stylesheet">
    <!-- VL-VLKT's Typography CSS file, includes used fonts -->
    <!-- Used font for body: Roboto -->
    <!-- Used font for headings: Raleway -->
    <!-- Use css/rtl_typography-default.css for RTL version -->
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/css/typography-default.css" rel="stylesheet">
    <!-- Color Scheme (In order to change the color scheme, replace the blue.css with the color scheme that you prefer) -->
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/css/skins/light_blue.css" rel="stylesheet">


    <!-- Custom css -->
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/css/custom.css" rel="stylesheet">
</head>

<body class="front-page">
    <!-- scrollToTop -->
    <!-- ================ -->
    <div class="scrollToTop circle"><i class="fa fa-angle-up"></i></div>

    <div class="page-wrapper">
        
        <?= $this->partial('header') ?>

        <?= $this->getContent() ?>

        <?= $this->partial('footer') ?>

    </div>
</body>
<!-- JavaScript files placed at the end of the document so the pages load faster -->
<!-- ================================================== -->
<!-- Jquery and Bootstap core js files -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/jquery.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery Revolution Slider  -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/js/jquery.themepunch.tools.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/js/extensions/revolution.extension.navigation.min.js"></script>
<!-- Isotope javascript -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/isotope/imagesloaded.pkgd.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/isotope/isotope.pkgd.min.js"></script>
<!-- Magnific Popup javascript -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<!-- Appear javascript -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/waypoints/jquery.waypoints.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/waypoints/sticky.min.js"></script>
<!-- Count To javascript -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/countTo/jquery.countTo.js"></script>
<!-- Slick carousel javascript -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/slick/slick.min.js"></script>
<!-- Moment function -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/moment.min.js"></script>
<!-- Define function -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/js/define.js"></script>
<!-- Call API -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/js/apicall.js"></script>
<!-- Initialization of Plugins -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/js/template.js"></script>

<?= $this->assets->outputJs() ?>

<!-- Custom Scripts -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/js/custom.js"></script>

<!-- Pace javascript -->
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/pace/pace.min.js"></script>

</html>