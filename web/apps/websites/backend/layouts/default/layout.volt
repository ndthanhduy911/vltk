<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon.ico">
    <title>ADMIN</title>

    <link href="/assets/backend/css/lib/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="/assets/backend/css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/backend/js/lib/datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="/assets/backend/js/lib/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/backend/uploadfile/css/jquery.fileupload.css">
    <link href="/assets/backend/css/lib/select2/select2.min.css" rel="stylesheet">
    <link href="/assets/backend/js/lib/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet"> 
    {{ assets.outputCss() }}
    <link href="/assets/backend/css/helper.css" rel="stylesheet">
    <link href="/assets/backend/css/style.css" rel="stylesheet">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:** -->
    <!--[if lt IE 9]>
    <script src="https:**oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https:**oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header fix-sidebar">
    <!-- Preloader - style you can find in spinners.css -->
    <div class="preloader" id="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <div id="main-wrapper">
        <!-- header header  -->
        {{ partial('header') }}
        <!-- Left Sidebar  -->
        {{ partial('slidebar') }}
        <!-- Page wrapper  -->
        <div class="page-wrapper">
            {{ content() }}
        </div>
        {{ partial('footer') }}
    </div>
    <script id="template-upload" type="text/x-tmpl">
    <?php echo '{'.'%'; ?> for (var i=0, file; file=o.files[i]; i++) { <?php echo '%'.'}'; ?>
        <tr class="template-upload fade">
            <td style="min-width: 100px">
                <span class="preview"></span>
            </td>
            <td style="min-width: 100px">
                <?php echo '{'.'%'; ?>=file.name<?php echo '%'.'}'; ?>
                <strong class="error text-danger"></strong>
            </td>
            <td style="width: 100px" class="text-center">
                <?php echo '{'.'%'; ?> if (!i) { <?php echo '%'.'}'; ?>
                    <button class="btn btn-warning btn-sm btn-cancel2">
                        Hủy
                    </button>
                <?php echo '{'.'%'; ?> } <?php echo '%'.'}'; ?>
            </td>
        </tr>
    <?php echo '{'.'%'; ?> } <?php echo '%'.'}'; ?>
    </script>
    
    <script id="template-download" type="text/x-tmpl">
    <?php echo '{'.'%'; ?> for (var i=0, file; file=o.files[i]; i++) { <?php echo '%'.'}'; ?>
        <tr class="template-download fade">
            <td>
                <span class="preview">
                    <?php echo '{'.'%'; ?> if (file.thumbnailUrl) { <?php echo '%'.'}'; ?>
                        <a href="<?php echo '{'.'%'; ?>=file.url<?php echo '%'.'}'; ?>" title="<?php echo '{'.'%'; ?>=file.name<?php echo '%'.'}'; ?>" download="<?php echo '{'.'%'; ?>=file.name<?php echo '%'.'}'; ?>" data-gallery><img src="<?php echo '{'.'%'; ?>=file.thumbnailUrl<?php echo '%'.'}'; ?>"></a>
                    <?php echo '{'.'%'; ?> } <?php echo '%'.'}'; ?>
                </span>
            </td>
            <td>
                <p class="name">
                    <?php echo '{'.'%'; ?> if (file.url) { <?php echo '%'.'}'; ?>
                        <a href="<?php echo '{'.'%'; ?>=file.url<?php echo '%'.'}'; ?>" title="<?php echo '{'.'%'; ?>=file.name<?php echo '%'.'}'; ?>" download="<?php echo '{'.'%'; ?>=file.name<?php echo '%'.'}'; ?>" <?php echo '{'.'%'; ?>=file.thumbnailUrl?'data-gallery':''<?php echo '%'.'}'; ?>><?php echo '{'.'%'; ?>=file.name<?php echo '%'.'}'; ?></a>
                    <?php echo '{'.'%'; ?> } else { <?php echo '%'.'}'; ?>
                        <span><?php echo '{'.'%'; ?>=file.name<?php echo '%'.'}'; ?></span>
                    <?php echo '{'.'%'; ?> } <?php echo '%'.'}'; ?>
                </p>
                <?php echo '{'.'%'; ?> if (file.error) { <?php echo '%'.'}'; ?>
                    <div><span class="label label-danger">Error</span> <?php echo '{'.'%'; ?>=file.error<?php echo '%'.'}'; ?></div>
                <?php echo '{'.'%'; ?> } <?php echo '%'.'}'; ?>
            </td>
            <td>
                <span class="size"><?php echo '{'.'%'; ?>=o.formatFileSize(file.size)<?php echo '%'.'}'; ?></span>
            </td>
            <td>
                <?php echo '{'.'%'; ?> if (file.deleteUrl) { <?php echo '%'.'}'; ?>
                    <button class="btn btn-danger delete" data-type="<?php echo '{'.'%'; ?>=file.deleteType<?php echo '%'.'}'; ?>" data-url="<?php echo '{'.'%'; ?>=file.deleteUrl<?php echo '%'.'}'; ?>"<?php echo '{'.'%'; ?> if (file.deleteWithCredentials) { <?php echo '%'.'}'; ?> data-xhr-fields='{"withCredentials":true}'<?php echo '{'.'%'; ?> } <?php echo '%'.'}'; ?>>
                        <i class="glyphicon glyphicon-trash"></i>
                        <span>Delete</span>
                    </button>
                    <input type="checkbox" name="delete" value="1" class="toggle">
                <?php echo '{'.'%'; ?> } else { <?php echo '%'.'}'; ?>
                    <button class="btn btn-warning btn-cancel2" style="min-width: 50px">
                        <span>Hủy</span>
                    </button>
                <?php echo '{'.'%'; ?> } <?php echo '%'.'}'; ?>
            </td>
        </tr>
    <?php echo '{'.'%'; ?> } <?php echo '%'.'}'; ?>
    </script>
    <!-- Inclue Javascript -->
    <script type="text/javascript" src="/assets/backend/js/lib/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/bootstrap/js/popper.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/moment/moment.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/number/jquery.number.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/form-validation/validator.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/datepicker/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/chart-js/Chart.bundle.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/owl-carousel/owl.carousel.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/datatables/datatables.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/datatables/cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/select2/select2.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/tinymce/jquery.tinymce.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/tinymce/tinymce.min.js"></script>
    <script src="/assets/backend/uploadfile/js/vendor/jquery.ui.widget.js"></script>
    <script src="https://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
    <script src="https://blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
    <script src="https://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
    <script src="https://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
    <script src="/assets/backend/uploadfile/js/jquery.iframe-transport.js"></script>
    <script src="/assets/backend/uploadfile/js/jquery.fileupload.js"></script>
    <script src="/assets/backend/uploadfile/js/jquery.fileupload-process.js"></script>
    <script src="/assets/backend/uploadfile/js/jquery.fileupload-image.js"></script>
    <script src="/assets/backend/uploadfile/js/jquery.fileupload-audio.js"></script>
    <script src="/assets/backend/uploadfile/js/jquery.fileupload-video.js"></script>
    <script src="/assets/backend/uploadfile/js/jquery.fileupload-validate.js"></script>
    <script src="/assets/backend/uploadfile/js/jquery.fileupload-ui.js"></script>
    <script type="text/javascript" src="/assets/backend/js/define.js"></script>
    <script src="/assets/backend/faq/js/main.js"></script>

    <!-- Main Javascript -->
    <script type="text/javascript" src="/assets/backend/js/load.script.js"></script>
    <script type="text/javascript" src="/assets/backend/js/singlepage.js"></script>
    <script type="text/javascript" src="/assets/backend/js/jquery.slimscroll.js"></script>
    <script type="text/javascript" src="/assets/backend/js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script type="text/javascript" src="/assets/backend/js/custom.min.js"></script>
</body>

</html>