/**
 * @license Copyright (c) 2003-2021, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */
CKEDITOR.dtd.$removeEmpty['i'] = false;
CKEDITOR.editorConfig = function( config ) {
    config.height = 450; 
	config.toolbar = [
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
	];
	config.allowedContent = true;
	config.extraAllowedContent = '*(*);*{*};*[*]';
	config.contentsCss = '/assets/backend/dist/plugins/fontawesome-free/css/all.min.css';
	config.image_previewText = ' ';
	config.extraPlugins = 'autolink,audio,video,youtube,files';
	config.uploadUrl = webAdminUri+'/media';
	config.skin = 'office2013';
	config.removeButtons = 'Save';
	config.filebrowserImage2BrowseUrl = webAdminUri+'/media/modalimage',
	config.filebrowserImageBrowseUrl = webAdminUri+'/media/modalimage',
	config.filebrowserVideoBrowseUrl = webAdminUri+'/media/modalvideo',
	config.filebrowserAudioBrowseUrl = webAdminUri+'/media/modalaudio',
	config.filebrowserFilesBrowseUrl = webAdminUri+'/media/modalfiles'
	// config.extraPlugins = 'tableresize';
	// config.extraPlugins = 'imagepaste';
	// config.extraPlugins = 'autolink';
};
