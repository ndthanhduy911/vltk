<!DOCTYPE html>
<html lang="en">

<head>
    <title>{{ dept_lang.name }} </title>
    <meta charset="utf-8" />
    <meta name="theme-color" content="#003D7C"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="support, it, technical, physics, network, system">
    <meta name="description" content="Ho tro khach hang physics">
    <meta itemprop="name" content="{{ dept_lang.name }}">
    <meta itemprop="description" content="{{ dept_lang.name }}">
    <meta itemprop="image" content="{{ helper.getLinkImage(dept.logo, '/logo.png') }}">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@hcmus.edu.vn">
    <meta name="twitter:title" content="{{ dept_lang.name }}">
    <meta name="twitter:description" content="{{ dept_lang.name }}">
    <meta name="twitter:creator" content="@hcmus.edu.vn">
    <meta name="twitter:image" content="{{ helper.getLinkImage(dept.logo, '/logo.png') }}">
    <meta property="fb:app_id" content="655968634437471">
    <meta property="og:title" content="{{ dept_lang.name }}" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="<?= FRONTEND_URL ?>/" />
    <meta property="og:image" content="{{ helper.getLinkImage(dept.logo, '/logo.png') }}" />
    <meta property="og:description" content="{{ dept_lang.name }}" />
    <meta property="og:site_name" content="{{ dept_lang.name }}" />
    <link rel="apple-touch-icon" sizes="76x76" href="{{ helper.getLinkImage(dept.icon, '/favicon.ico') }}" />
    <link rel="icon" type="image/png" href="{{ helper.getLinkImage(dept.icon, '/favicon.ico') }}" />4
    <link rel="canonical" href="<?= FRONTEND_URL ?>/" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/css/settings.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/css/layers.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/css/navigation.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/css/animations.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/slick/slick.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/css/style.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/css/typography-default.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/css/skins/light_blue.css" rel="stylesheet">
    <link href="<?php echo FRONTEND_URL ?>/assets/frontend/css/custom.css" rel="stylesheet">
</head>

<body class="front-page">
    <div class="scrollToTop circle"><i class="fa fa-angle-up"></i></div>

    <div class="page-wrapper">
        {{ partial('header') }}

        {{ content() }}

        {{ partial('footer') }}

    </div>
</body>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/jquery.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/js/jquery.themepunch.tools.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/js/jquery.themepunch.revolution.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/js/extensions/revolution.extension.slideanims.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/rs-plugin-5/js/extensions/revolution.extension.navigation.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/isotope/imagesloaded.pkgd.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/isotope/isotope.pkgd.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/waypoints/jquery.waypoints.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/waypoints/sticky.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/countTo/jquery.countTo.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/slick/slick.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/moment.min.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/js/define.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/js/apicall.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/js/template.js"></script>
{{ assets.outputJs() }}
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/js/custom.js"></script>
<script src="<?php echo FRONTEND_URL ?>/assets/frontend/plugins/pace/pace.min.js"></script>

</html>