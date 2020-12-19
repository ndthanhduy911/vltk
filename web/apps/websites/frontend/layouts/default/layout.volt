<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="vi-vn" lang="vi-vn" dir="ltr">
<head>
    <title><?= isset($title) ? $title." | " : '' ?>{{ deptlang.title }}</title>
    <meta charset="utf-8" />
    <meta name="theme-color" content="#003D7C"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="vat ly,khoa vat ly, vat ly - vat ly ky thuat,khoa hoc tu nhien, hcmuns, hcmus, truong dai hoc khoa hoc tu nhien, trường đại học khoa học tự nhiên, 227 nguyen van cu q5, khtn, vnuhcm-us, hcmus">
    <meta name="description" content="{{ deptlang.title }}">
    <meta itemprop="name" content="{{ deptlang.title }}">
    <meta itemprop="description" content="{{ deptlang.title }}">
    <meta itemprop="image" content="{{ helper.getLinkImage(dept.logo, '/logo.png') }}">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@hcmus.edu.vn">
    <meta name="twitter:title" content="{{ deptlang.title }}">
    <meta name="twitter:description" content="{{ deptlang.title }}">
    <meta name="twitter:creator" content="@hcmus.edu.vn">
    <meta name="twitter:image" content="{{ helper.getLinkImage(dept.logo, '/logo.png') }}">
    <meta property="fb:app_id" content="1234567890">
    <meta property="og:title" content="{{ deptlang.title }}" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="<?= WEB_URI ?>/" />
    <meta property="og:image" content="{{ helper.getLinkImage(dept.logo, '/logo.png') }}" />
    <meta property="og:description" content="{{ deptlang.title }}" />
    <meta property="og:site_name" content="{{ deptlang.title }}" />
    <link rel="apple-touch-icon" sizes="76x76" href="{{ helper.getLinkImage(dept.icon, '/favicon.ico') }}" />
    <link rel="icon" type="image/png" href="{{ helper.getLinkImage(dept.icon, '/favicon.ico') }}" />
    <link rel="canonical" href="<?= WEB_URI ?>/" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?= WEB_URL.'/assets/backend/dist/' ?>plugins/overlayScrollbars/css/OverlayScrollbars.min.css" rel="stylesheet"/>
    <link href="<?= WEB_URI ?>/assets/frontend/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/plugins/rs-plugin-5/css/settings.css" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/plugins/rs-plugin-5/css/layers.css" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/plugins/rs-plugin-5/css/navigation.css" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/css/animations.css" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/plugins/slick/slick.css" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/css/style.css" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/css/typography-default.css" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/css/skins/light_blue.css" rel="stylesheet">
    <link href="<?= WEB_URI ?>/assets/frontend/css/custom.css" rel="stylesheet">
</head>

<body class="front-page">
    <div class="scrollToTop circle"><i class="fa fa-angle-up"></i></div>
    <div class="page-wrapper">
        {{ partial('header') }}
        {{ content() }}
        {{ partial('footer') }}
    </div>
</body>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/jquery.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<?= WEB_URL.'/assets/backend/dist/' ?>plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/rs-plugin-5/js/jquery.themepunch.tools.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/rs-plugin-5/js/jquery.themepunch.revolution.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/rs-plugin-5/js/extensions/revolution.extension.slideanims.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/rs-plugin-5/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/rs-plugin-5/js/extensions/revolution.extension.navigation.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/isotope/imagesloaded.pkgd.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/isotope/isotope.pkgd.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/countTo/jquery.countTo.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/slick/slick.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/moment.min.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/js/define.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/js/apicall.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/js/template.js"></script>
{{ assets.outputJs() }}
<script src="<?= WEB_URI ?>/assets/frontend/js/custom.js"></script>
<script src="<?= WEB_URI ?>/assets/frontend/plugins/pace/pace.min.js"></script>

</html>