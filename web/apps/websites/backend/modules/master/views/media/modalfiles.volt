<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>File browser</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2" />
    <link rel="stylesheet" type="text/css" href="/assets/backend/dist/plugins/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/backend/dist/plugins/elFinder/css/elfinder.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/backend/dist/plugins/elFinder/css/theme.css">
    <script src="/assets/backend/dist/plugins/jquery/jquery.min.js"></script>
    <script src="/assets/backend/dist/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="/assets/backend/dist/plugins/elFinder/js/elfinder.min.js"></script>
    <script src="/assets/backend/dist/plugins/elFinder/js/js/i18n/elfinder.vi.js"></script>
    <script type="text/javascript" charset="utf-8">
        function getUrlParam(paramName) {
            var reParam = new RegExp('(?:[\?&]|&amp;)' + paramName + '=([^&]+)', 'i') ;
            var match = window.location.search.match(reParam) ;
            return (match && match.length > 1) ? match[1] : '' ;
        }
        $(document).ready(function() {
            const webAdminUri = "<?= WEB_ADMIN_URI; ?>";
            var funcNum = getUrlParam('CKEditorFuncNum');
            var elf  = $('#elfinder').elfinder({
                url : webAdminUri+'/media/connectorfiles',
                height: '100%',
                resizable: false,
                onlyMimes: ['application/pdf'],
                getFileCallback : function(file) {
                    window.opener.CKEDITOR.tools.callFunction(funcNum, file.url);
                    elf.destroy();
                    window.close();
                },
                lang:'vi',
            }).elfinder('instance');
        });
    </script>
</head>
<body>
<div id="elfinder"></div>
</body>
</html>
