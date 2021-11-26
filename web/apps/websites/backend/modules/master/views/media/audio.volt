
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Thư viện | Âm nhạc</title>
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
            var reParam = new RegExp('(?:[\?&]|&amp;)' + paramName + '=([^&]+)', 'i');
            var match = window.location.search.match(reParam);

            return (match && match.length > 1) ? match[1] : '';
        }
        $(document).ready(function() {
            const webAdminUri = "<?= WEB_ADMIN_URI; ?>";
            var funcNum = getUrlParam('CKEditorFuncNum');
            var myCommands = [
                'copy', 'cut', 'download', 'duplicate', 'home', 'mkdir',
                'opendir', 'paste', 'reload', 'rename', 'rm', 'search', 'sort', 'up', 'upload'
            ];
            var elf = $('#elfinder').elfinder({
                url: webAdminUri+'/media/connectoraudio',
                commands : myCommands,
                resizable: false,
                onlyMimes: ['audio'],
                getFileCallback: function (file) {
                    window.opener.CKEDITOR.tools.callFunction(funcNum, file.url);
                    elf.destroy();
                    window.close();
                },
                resizable: false
            }).elfinder('instance');
        });
    </script>
</head>
<body>
<div class="page-header">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Âm nhạc</li>
        </ol>
    </nav>
</div>
<div id="elfinder" class="mb-4"></div>
</body>
</html>
