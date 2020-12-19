
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?= WEB_TITLE ?></title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Quản lý tài sản | Honeynet">
    <link rel="shortcut icon" href="<?= WEB_URI ?>/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="<?= WEB_URI ?>/logo.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <style>
        @font-face {
            font-family: "Roboto";
            src: url(/assets/backend/dist/fonts/roboto/Roboto-Regular.ttf);
        }
    </style>

    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/datatables-bs4/css/dataTables.bootstrap4.css">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">  
    <!-- Daterangepicker -->
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/daterangepicker/daterangepicker.css">  
    <!-- Select2 -->
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/select2/css/select2.min.css">  
    <!-- Select2 -->
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/smoothproducts/css/smoothproducts.css">  
    <!-- OverlayScrollbars -->
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>
    <!-- Theme style -->
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>/css/adminlte.min.css">
    <!-- ckeditor -->
    <!-- <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/ckeditor/samples/css/samples.css">
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css"> -->
    <!-- dashboard -->
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/' ?>material-dashboard.css?v=<?= VS_SCRIPT ?>">
    <!-- custom -->
    <link rel="stylesheet" href="<?= WEB_URI.'/assets/backend/' ?>custom.css?v=<?= VS_SCRIPT ?>">
    <!-- Google Font: Roboto -->
    <!-- <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,700&display=swap" rel="stylesheet"> -->
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

    <!-- jQuery -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/sweetalert2/sweetalert2.min.js"></script>
    <!-- Select2 -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/select2/js/select2.full.min.js"></script>
    <!-- Daterangepicker -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/moment/moment.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Validation -->
    <script src="<?= WEB_URI ?>/js/validator.min.js"></script>
    <!-- DataTable -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
    <!-- overlayScrollbars JS -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- custom-file-input -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
    <!-- barcode -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/barcode/jquery-barcode.min.js"></script>
    <!-- smoothproducts -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/smoothproducts/js/smoothproducts.min.js"></script>
    <!-- ckeditor -->
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/ckeditor/ckeditor.js"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>plugins/ckeditor/samples/js/sample.js"></script>
    <!-- Call API -->
    <script src="<?= WEB_URI.'/assets/backend/' ?>js/callapi.js?v=<?= VS_SCRIPT ?>"></script>
    <!-- Define -->
    <script src="<?= WEB_URI.'/assets/backend/' ?>js/define.js?v=<?= VS_SCRIPT ?>"></script>
    <!-- Define ChartJs -->
    <script src="<?= WEB_URI.'/assets/backend/' ?>js/definechartjs.js?v=<?= VS_SCRIPT ?>"></script>
    <script src="<?= WEB_URI.'/assets/backend/dist/' ?>js/adminlte.js"></script>
    <?php $this->assets->outputJs(); ?>
    <script src="<?= WEB_URI.'/assets/backend/' ?>js/init.js?v=<?= VS_SCRIPT ?>"></script>
</body>

</html>