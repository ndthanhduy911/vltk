<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="description" content="Admin">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="admin">
    <meta property="twitter:site" content="@admin">
    <meta property="twitter:creator" content="@admin">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Admin">
    <meta property="og:title" content="Admin">
    <meta property="og:url" content="/">
    <meta property="og:image" content="/">
    <meta property="og:description" content="">
    <title>ADMIN</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" sizes="16x16" href="/favicon.ico">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="/assets/backend/fonts/font-awesome/css/font-awesome.min.css">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="/assets/backend/css/main.css">
    <link rel="stylesheet" type="text/css" href="/assets/backend/css/custom.css">
    {{ assets.outputCss() }}
</head>

<body class="app sidebar-mini rtl">

    <!-- header header  -->
    {{ partial('header') }}
    <!-- Left Sidebar  -->
    {{ partial('sidebar') }}

    {{ content() }}

    {{ partial('footer') }}


    <!-- Inclue Javascript -->
    <!-- Essential javascripts for application to work-->
    <script src="/assets/backend/js/jquery-3.2.1.min.js"></script>
    <script src="/assets/backend/js/popper.min.js"></script>
    <script src="/assets/backend/js/bootstrap.min.js"></script>
    <script src="/assets/backend/js/plugins/jquery.dataTables.min.js"></script>
    <script src="/assets/backend/js/plugins/dataTables.bootstrap.min.js"></script>
    <script src="/assets/backend/js/plugins/select2.min.js"></script>
    <script src="/assets/backend/js/plugins/validator.min.js"></script>
    <script src="/assets/backend/js/define.js"></script>
    <script src="/assets/backend/js/modules/users.js"></script>
    <script src="/assets/backend/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/assets/backend/js/plugins/pace.min.js"></script>

</body>

</html>