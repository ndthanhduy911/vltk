/*
 * @file Files plugin for CKEditor
 * Copyright (C) 2011 Alfonso Martínez de Lizarrondo
 *
 * == BEGIN LICENSE ==
 *
 * Licensed under the terms of any of the following licenses at your
 * choice:
 *
 *  - GNU General Public License Version 2 or later (the "GPL")
 *    http://www.gnu.org/licenses/gpl.html
 *
 *  - GNU Lesser General Public License Version 2.1 or later (the "LGPL")
 *    http://www.gnu.org/licenses/lgpl.html
 *
 *  - Mozilla Public License Version 1.1 or later (the "MPL")
 *    http://www.mozilla.org/MPL/MPL-1.1.html
 *
 * == END LICENSE ==
 *
 */

( function() {

CKEDITOR.plugins.add( 'files',
{
	// Translations, available at the end of this file, without extra requests
	lang : [ 'en'  ],

	getPlaceholderCss : function()
	{
		return 'img.cke_files' +
				'{' +
					'background-image: url(' + CKEDITOR.getUrl( this.path + 'images/placeholder.png' ) + ');' +
					'background-position: center center;' +
					'background-repeat: no-repeat;' +
					'background-color:gray;'+
					'border: 1px solid #a9a9a9;' +
					'width: 80px;' +
					'height: 80px;' +
				'}';
	},

	onLoad : function()
	{
		// v4
		if (CKEDITOR.addCss)
			CKEDITOR.addCss( this.getPlaceholderCss() );

	},

	init : function( editor )
	{
		var lang = editor.lang.files;

		// Check for CKEditor 3.5
		if (typeof editor.element.data == 'undefined')
		{
			alert('The "files" plugin requires CKEditor 3.5 or newer');
			return;
		}

		CKEDITOR.dialog.add( 'files', this.path + 'dialogs/files.js' );

		editor.addCommand( 'Files', new CKEDITOR.dialogCommand( 'files' ) );
		editor.ui.addButton( 'Files',
			{
				label : lang.toolbar,
				command : 'Files',
				icon : this.path + 'images/icon.png'
			} );

		// v3
		if (editor.addCss)
			editor.addCss( this.getPlaceholderCss() );


		// If the "menu" plugin is loaded, register the menu items.
		if ( editor.addMenuItems )
		{
			editor.addMenuItems(
				{
					files :
					{
						label : lang.properties,
						command : 'Files',
						group : 'flash'
					}
				});
		}

		editor.on( 'doubleclick', function( evt )
			{
				var element = evt.data.element;
				if ( element.is( 'img' ) && element.data( 'cke-real-element-type' ) == 'files' )
					evt.data.dialog = 'files';
			});

		// If the "contextmenu" plugin is loaded, register the listeners.
		if ( editor.contextMenu )
		{
			editor.contextMenu.addListener( function( element, selection )
				{
					if ( element && element.is( 'img' ) && !element.isReadOnly()
							&& element.data( 'cke-real-element-type' ) == 'files' )
						return { files : CKEDITOR.TRISTATE_OFF };
				});
		}

		// Add special handling for these items
		CKEDITOR.dtd.$empty['cke:source']=1;
		CKEDITOR.dtd.$empty['source']=1;

		editor.lang.fakeobjects.files = lang.fakeObject;


	}, //Init

	afterInit: function( editor )
	{
		var dataProcessor = editor.dataProcessor,
			htmlFilter = dataProcessor && dataProcessor.htmlFilter,
			dataFilter = dataProcessor && dataProcessor.dataFilter;

		// dataFilter : conversion from html input to internal data
		dataFilter.addRules(
			{
				elements : {
					$ : function( realElement ){
						if ( realElement.name == 'files' )
						{
							realElement.name = 'cke:files';
							for( var i=0; i < realElement.children.length; i++)
							{
								if ( realElement.children[ i ].name == 'source' )
									realElement.children[ i ].name = 'cke:source'
							}

							var fakeElement = editor.createFakeParserElement( realElement, 'cke_files', 'files', false ),
								fakeStyle = fakeElement.attributes.style || '';

							var width = realElement.attributes.width,
								height = realElement.attributes.height,
								poster = realElement.attributes.poster;

							if ( typeof width != 'undefined' )
								fakeStyle = fakeElement.attributes.style = fakeStyle + 'width:' + CKEDITOR.tools.cssLength( width ) + ';';

							if ( typeof height != 'undefined' )
								fakeStyle = fakeElement.attributes.style = fakeStyle + 'height:' + CKEDITOR.tools.cssLength( height ) + ';';

							if ( poster )
								fakeStyle = fakeElement.attributes.style = fakeStyle + 'background-image:url(' + poster + ');';

							return fakeElement;
						}
					}
				}
			}
		);
	} // afterInit

} ); // plugins.add


var en = {
		toolbar	: 'Files',
		dialogTitle : 'Files properties',
		fakeObject : 'Files',
		properties : 'Edit files',
		widthRequired : 'Width field cannot be empty',
		heightRequired : 'Height field cannot be empty',
		poster: 'Poster image',
		sourceFiles: 'Source files',
		sourceType : 'Files type',
		linkTemplate :  '<a href="%src%">%type%</a> ',
		fallbackTemplate : 'Your browser doesn\'t support files.<br>Please download the file: %links%'
	};

var es = {
		toolbar	: 'Files',
		dialogTitle : 'Propiedades de files',
		fakeObject : 'Files',
		properties : 'Editar el files',
		widthRequired : 'La anchura no se puede dejar en blanco',
		heightRequired : 'La altura no se puede dejar en blanco',
		poster: 'Imagen de presentación',
		sourceFiles: 'Archivo de files',
		sourceType : 'Tipo',
		linkTemplate :  '<a href="%src%">%type%</a> ',
		fallbackTemplate : 'Su navegador no soporta FILES.<br>Por favor, descargue el fichero: %links%'
	};

	// v3
	if (CKEDITOR.skins)
	{
		en = { files : en} ;
		es = { files : es} ;
	}

	// Translations
	CKEDITOR.plugins.setLang( 'files', 'en', en );

	CKEDITOR.plugins.setLang( 'files', 'es', es );

})();