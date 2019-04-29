/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.toolbar =  [
		{ name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
		{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
		{ name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
		{ name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] },
		{ name: 'colors', items : [ 'TextColor','BGColor' ] },
		{ name: 'insert', items : [ 'Image','Flash','Video','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe'] },
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
		{ name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button',
		'HiddenField' ] },
		{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },

		{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
			'-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
		{ name: 'links', items : [ 'Unlink','Anchor','Link' ] },
    ],
		config.filebrowserBrowseUrl =  '/admin/media/elfinder'
		config.image_previewText = ' ';
		config.extraPlugins = 'video,youtube,audio,docs';
		config.skin = 'office2013';
		config.extraPlugins = 'tableresize';
		config.extraPlugins = 'imagepaste';
		config.extraPlugins = 'autolink';
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
						var elfNode = $('<div \>');
						elfNode.dialog({
								modal: true,
								width: '80%',
								title: 'Thư viện',
								create: function (event, ui) {
										var startPathHash = '';
										elfInsrance = $(this).elfinder({
												startPathHash: startPathHash,
												useBrowserHistory: false,
												resizable: false,
												width: '100%',
												onlyMimes: ['image'],
												url: '/elfinder/php/connector.minimal.php',
												lang:'vi',
												getFileCallback: function (file) {
														file.url = file.url.replace("/elfinder/php/../../", fontendUrl+'/');
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


	// // Remove some buttons provided by the standard plugins, which are
	// // not needed in the Standard(s) toolbar.
	
	// config.removeButtons = 'Subscript,Superscript';

	// // Set the most common block elements.
	// config.format_tags = 'p;h1;h2;h3;pre';
  
	// // Simplify the dialog windows.
	// config.removeDialogTabs = 'image:advanced;link:advanced';
  //   config.enterMode = CKEDITOR.ENTER_P;
  //   config.autoParagraph = false;
  //   config.entities = false;
  //   config.allowedContent = true;
  //   config.removePlugins = 'forms,save,print,newpage,templates,preview,about';