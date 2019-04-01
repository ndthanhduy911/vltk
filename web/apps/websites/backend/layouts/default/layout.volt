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
    <link rel="stylesheet" type="text/css" href="/assets/backend/plugins/ckeditor/samples/css/samples.css">
    <link rel="stylesheet" type="text/css"
        href="/assets/backend/plugins/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
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
    <script src="/assets/backend/plugins/ckeditor/ckeditor.js"></script>
    <script src="/assets/backend/plugins/ckeditor/samples/js/sample.js"></script>
    <script src="/assets/backend/js/define.js"></script>
    <script src="/assets/backend/js/modules/users.js"></script>
    <script src="/assets/backend/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/assets/backend/js/plugins/pace.min.js"></script>


    <script data-main="/elfinder/main.js" src="//cdnjs.cloudflare.com/ajax/libs/require.js/2.3.5/require.min.js"></script>
    <script>
        define('elFinderConfig', {
            // elFinder options (REQUIRED)
            // Documentation for client options:
            // https://github.com/Studio-42/elFinder/wiki/Client-configuration-options
            defaultOpts : {
                url : '/elfinder/php/connector.minimal.php' // connector URL (REQUIRED)
                ,commandsOptions : {
                    edit : {
                        extraOptions : {
                            // set API key to enable Creative Cloud image editor
                            // see https://console.adobe.io/
                            creativeCloudApiKey : '',
                            // browsing manager URL for CKEditor, TinyMCE
                            // uses self location with the empty value
                            managerUrl : ''
                        }
                    }
                    ,quicklook : {
                        // to enable CAD-Files and 3D-Models preview with sharecad.org
                        sharecadMimes : ['image/vnd.dwg', 'image/vnd.dxf', 'model/vnd.dwf', 'application/vnd.hp-hpgl', 'application/plt', 'application/step', 'model/iges', 'application/vnd.ms-pki.stl', 'application/sat', 'image/cgm', 'application/x-msmetafile'],
                        // to enable preview with Google Docs Viewer
                        googleDocsMimes : ['application/pdf', 'image/tiff', 'application/vnd.ms-office', 'application/msword', 'application/vnd.ms-word', 'application/vnd.ms-excel', 'application/vnd.ms-powerpoint', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/postscript', 'application/rtf'],
                        // to enable preview with Microsoft Office Online Viewer
                        // these MIME types override "googleDocsMimes"
                        officeOnlineMimes : ['application/vnd.ms-office', 'application/msword', 'application/vnd.ms-word', 'application/vnd.ms-excel', 'application/vnd.ms-powerpoint', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/vnd.oasis.opendocument.text', 'application/vnd.oasis.opendocument.spreadsheet', 'application/vnd.oasis.opendocument.presentation']
                    }
                }
                // bootCalback calls at before elFinder boot up 
                ,bootCallback : function(fm, extraObj) {
                    /* any bind functions etc. */
                    fm.bind('init', function() {
                        // any your code
                    });
                    // for example set document.title dynamically.
                    var title = document.title;
                    fm.bind('open', function() {
                        var path = '',
                            cwd  = fm.cwd();
                        if (cwd) {
                            path = fm.path(cwd.hash) || null;
                        }
                        document.title = path? path + ':' + title : title;
                    }).bind('destroy', function() {
                        document.title = title;
                    });
                }
            },
            managers : {
                // 'DOM Element ID': { /* elFinder options of this DOM Element */ }
                'elfinder': {}
            }
        });
    </script>
</body>

</html>