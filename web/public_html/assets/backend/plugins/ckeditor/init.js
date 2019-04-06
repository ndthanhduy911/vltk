var config = {
    language: 'vi',
    height: 150,
    filebrowserImage2BrowseUrl: '/modal/image',
    filebrowserImageBrowseUrl: '/modal/image',
    filebrowserVideoBrowseUrl: '/modal/video',
    filebrowserAudioBrowseUrl: '/modal/audio'
};
CKEDITOR.on('dialogDefinition', function (event) {
    var editor = event.editor;
    var dialogDefinition = event.data.definition;
    var tabCount = dialogDefinition.contents.length;
    for (var i = 0; i < tabCount; i++) { // cycle to replace the click of button "View on the server"
        var browseButton = dialogDefinition.contents[i].get('browse');
        if (browseButton !== null) {
            browseButton.hidden = false;
            browseButton.onClick = function (dialog, i) {
                var dialogName = CKEDITOR.dialog.getCurrent()._.name;
                console.log(editor.config);
                var elfNode = $('<div \>');
                elfNode.dialog({
                    modal: true,
                    width: '80%',
                    title: 'File Manager',
                    create: function (event, ui) {
                        var startPathHash = '';
                        elfInsrance = $(this).elfinder({
                            startPathHash: startPathHash,
                            useBrowserHistory: false,
                            resizable: false,
                            width: '100%',
                            onlyMimes: ['image'],
                            url: '/finder/connector',
                            lang:'vi',
                            getFileCallback: function (file) {
                                var url = file.url;
                                var dialog = CKEDITOR.dialog.getCurrent();
                                if (dialogName == 'image') {
                                    var urlObj = 'txtUrl'
                                }else if (dialogName == 'image2') {
                                    var urlObj = 'src'
                                }else if (dialogName == 'video' || dialogName == 'audio') {
                                    var urlObj = 'poster'
                                } else if (dialogName == 'flash') {
                                    var urlObj = 'src'
                                } else if (dialogName == 'files' || dialogName == 'link') {
                                    var urlObj = 'url'
                                } else {
                                    return;
                                }
                                dialog.setValueOf(dialog._.currentTabId, urlObj, url);
                                elfNode.dialog('close');
                                elfInsrance.disable();
                            }
                        }).elfinder('instance');
                    },
                    open: function() {
                        elfNode.find('div.elfinder-toolbar input').blur();
                        setTimeout(function(){
                            elfInsrance.enable();
                        }, 100);
                    },
                    resizeStop: function() {
                        elfNode.trigger('resize');
                    }
                }).parent().css({'zIndex':'11000'});
            }
        }
    }
});