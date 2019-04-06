/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config

	// The toolbar groups arrangement, optimized for two toolbar rows.
    config.toolbar =  [
        { name: 'document', items: [ 'Source','Print' ] },
        { name: 'clipboard', items: [ 'Undo', 'Redo' ] },
        { name: 'styles', items: [ 'Format', 'Font', 'FontSize' ] },
        { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat', 'CopyFormatting' ] },
        { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
        { name: 'align', items: [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
        { name: 'links', items: [ 'Link', 'Unlink' ] },
        { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
        { name: 'insert', items: ['Image', 'Table' ] },
        { name: 'tools', items: [ 'Maximize' ] },
        { name: 'editing', items: [ 'Scayt','Youtube','Video','Audio', 'Docs'] }
    ],
    config.filebrowserBrowseUrl =  '/finder'
	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.skin = 'office2013';
	config.removeButtons = 'Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';
    config.extraPlugins = 'video,youtube,image2,audio,docs';
	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
    config.enterMode = CKEDITOR.ENTER_P;
    config.autoParagraph = false;
    config.entities = false;
    config.allowedContent = true;
    config.removePlugins = 'forms,save,print,newpage,templates,preview,about';
};
