
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?= WEB_TITLE ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="<?= WEB_TITLE ?>">
    <link rel="shortcut icon" href="<?= WEB_URI ?>/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="<?= WEB_URI ?>/logo.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        @font-face {
            font-family: "Roboto";
            src: url(/assets/backend/dist/fonts/roboto/Roboto-Regular.ttf);
        }
    </style>

    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/datatables-bs4/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">  
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/daterangepicker/daterangepicker.css">  
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/select2/css/select2.min.css">  
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/smoothproducts/css/smoothproducts.css">  
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/elFinder/css/elfinder.min.css">
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/elFinder/css/theme.css">
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>/css/adminlte.min.css">
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/' ?>material-dashboard.css?v=<?= VS_SCRIPT ?>">
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/' ?>custom.css?v=<?= VS_SCRIPT ?>">
    <?php $this->assets->outputCss(); ?>    
</head>

<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed text-sm navbar-white navbar-light" dept="{{session.get('deptid')}}">
    <div class="wrapper">
        {{ partial('header') }}
        {{ partial('sidebar') }}
        <div class="content-wrapper">
            <div id="singleCore">
                {{ content() }}
            </div>
        </div>
        {{ partial('footer') }}
    </div>
    <script>
        const webAdminUrl = "<?= WEB_ADMIN_URL; ?>";
        const webAdminUri = "<?= WEB_ADMIN_URI; ?>";
        const webUrl = window.location.origin;
        const webUri = "";
        const singleCore = '#singleCore';
    </script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/jquery/jquery.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/sweetalert2/sweetalert2.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/select2/js/select2.full.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/moment/moment.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/daterangepicker/daterangepicker.js"></script>
    <script src="<?= WEB_URI ?>/js/validator.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/barcode/jquery-barcode.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/smoothproducts/js/smoothproducts.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/ckeditor/ckeditor.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/ckeditor/init.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/ckeditor/adapters/jquery.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/elFinder/js/elfinder.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/elFinder/js/i18n/elfinder.vi.js"></script>    
    <script src="<?= WEB_URI.'/assets/backend/' ?>js/callapi.js?v=<?= VS_SCRIPT ?>"></script>
    <script src="<?= WEB_URI.'/assets/backend/' ?>js/define.js?v=<?= VS_SCRIPT ?>"></script>
    <script src="<?= WEB_URI.'/assets/backend/' ?>js/definechartjs.js?v=<?= VS_SCRIPT ?>"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>js/adminlte.js"></script>
    <?php $this->assets->outputJs(); ?>
    <script src="<?= WEB_URI.'/assets/backend/' ?>js/init.js?v=<?= VS_SCRIPT ?>"></script>
</body>

</html>