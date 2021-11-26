const configCkedior = {
    language: 'vi',
    height : 450,
	toolbar : [
		{ name: 'document', items: [ 'Source', '-', 'ExportPdf', 'Preview', 'Print', '-', 'Templates' ] },
		{ name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
		{ name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
		{ name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'HiddenField' ] },
		'/',
		{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
		{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
		{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
		{ name: 'insert', items: [ 'Image','Video','Youtube','Audio','Files','Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
		'/',
		{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
		{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
		{ name: 'tools', items: [ 'Maximize', 'ShowBlocks'  ] }
	],
    allowedContent:true,
    extraAllowedContent:'*(*);*{*}',
	image_previewText : ' ',
	extraPlugins : 'autolink,audio,video,youtube,files',
	uploadUrl : webAdminUri+'/media',
	skin : 'office2013',
	removeButtons : 'Save',
    disallowedContent  : true,
	filebrowserImage2BrowseUrl : webAdminUri+'/media/modalimage',
	filebrowserImageBrowseUrl : webAdminUri+'/media/modalimage',
	filebrowserVideoBrowseUrl : webAdminUri+'/media/modalvideo',
	filebrowserAudioBrowseUrl : webAdminUri+'/media/modalaudio',
	filebrowserFilesBrowseUrl : webAdminUri+'/media/modalfiles'
}

CKEDITOR.on('dialogDefinition', function (event) {
    let editor = event.editor;
    let dialogDefinition = event.data.definition;
    let tabCount = dialogDefinition.contents.length;

    for (let i = 0; i < tabCount; i++) {
        var browseButton = dialogDefinition.contents[i].get('browse');
        if (browseButton !== null) {
            browseButton.hidden = false;
            browseButton.onClick = function (dialog, i) {
                var dialogName = CKEDITOR.dialog.getCurrent()._.name;
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
                            url: webAdminUri+'/media/connector',
                            lang:'vi',
                            getFileCallback: function (file) {
                                var url = file.url.replace(window.location.origin+'/static/images/', staticImageUrl);
                                var dialog = CKEDITOR.dialog.getCurrent();
                                if (dialogName == 'image') {
                                    var urlObj = 'txtUrl';
                                    let previewImage = $(`#${dialog.preview.getId()}`);
                                    let aReview = previewImage.parent('a');
                                    let tdReview = aReview.parent('td');
                                    tdReview.html(aReview)
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
                                console.log(urlObj);
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
                }).parent().css({'zIndex':'11000','width':'100vw','left' :0 });
            }
        }
    }
});