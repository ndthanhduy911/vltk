CKEDITOR.dialog.add( 'files', function ( editor )
{
	var lang = editor.lang.files;

	function commitValue( filesNode, extraStyles )
	{
		var value=this.getValue();

		if ( !value && this.id=='id' )
			value = generateId();

		filesNode.setAttribute( this.id, value);

		if ( !value )
			return;
		switch( this.id )
		{
			case 'poster':
				extraStyles.backgroundImage = 'url(' + value + ')';
				break;
			case 'width':
				extraStyles.width = value + 'px';
				break;
			case 'height':
				extraStyles.height = value + 'px';
				break;
		}
	}

	function commitSrc( filesNode, extraStyles, filess )
	{
		var match = this.id.match(/(\w+)(\d)/),
			id = match[1],
			number = parseInt(match[2], 10);

		var files = filess[number] || (filess[number]={});
		files[id] = this.getValue();
	}

	function loadValue( filesNode )
	{
		if ( filesNode )
			this.setValue( filesNode.getAttribute( this.id ) );
		else
		{
			if ( this.id == 'id')
				this.setValue( generateId() );
		}
	}

	function loadSrc( filesNode, filess )
	{
		var match = this.id.match(/(\w+)(\d)/),
			id = match[1],
			number = parseInt(match[2], 10);

		var files = filess[number];
		if (!files)
			return;
		this.setValue( files[ id ] );
	}

	function generateId()
	{
		var now = new Date();
		return 'files' + now.getFullYear() + now.getMonth() + now.getDate() + now.getHours() + now.getMinutes() + now.getSeconds();
	}

	// To automatically get the dimensions of the poster image
	var onImgLoadEvent = function()
	{
		// Image is ready.
		var preview = this.previewImage;
		preview.removeListener( 'load', onImgLoadEvent );
		preview.removeListener( 'error', onImgLoadErrorEvent );
		preview.removeListener( 'abort', onImgLoadErrorEvent );

		this.setValueOf( 'info', 'width', preview.$.width );
		this.setValueOf( 'info', 'height', preview.$.height );
	};

	var onImgLoadErrorEvent = function()
	{
		// Error. Image is not loaded.
		var preview = this.previewImage;
		preview.removeListener( 'load', onImgLoadEvent );
		preview.removeListener( 'error', onImgLoadErrorEvent );
		preview.removeListener( 'abort', onImgLoadErrorEvent );
	};

	return {
		title : lang.dialogTitle,
		minWidth : 400,
		minHeight : 200,

		onShow : function()
		{
			// Clear previously saved elements.
			this.fakeImage = this.filesNode = null;
			// To get dimensions of poster image
			this.previewImage = editor.document.createElement( 'img' );

			var fakeImage = this.getSelectedElement();
			if ( fakeImage && fakeImage.data( 'cke-real-element-type' ) && fakeImage.data( 'cke-real-element-type' ) == 'files' )
			{
				this.fakeImage = fakeImage;

				var filesNode = editor.restoreRealElement( fakeImage ),
					filess = [],
					sourceList = filesNode.getElementsByTag( 'source', '' );
				if (sourceList.count()==0)
					sourceList = filesNode.getElementsByTag( 'source', 'cke' );

				for ( var i = 0, length = sourceList.count() ; i < length ; i++ )
				{
					var item = sourceList.getItem( i );
					filess.push( {src : item.getAttribute( 'src' ), type: item.getAttribute( 'type' )} );
				}

				this.filesNode = filesNode;

				this.setupContent( filesNode, filess );
			}
			else
				this.setupContent( null, [] );
		},

		onOk : function()
		{
			// If there's no selected element create one. Otherwise, reuse it
			var extraStyles = {class : ''}, filess = [];
			this.commitContent( this.filesNode, extraStyles, filess );
			let files = filess[0] ? filess[0] : null;
			if(files && files.src){
				let filesNode = null;
				if(files.type == 'application/pdf'){
					filesNode = CKEDITOR.dom.element.createFromHtml( '<iframe src="' + files.src + '" width="100%" height="500"></iframe>', editor.document );
				}else if(files.type == 'link'){
					filesNode = CKEDITOR.dom.element.createFromHtml( '<a href="'+files.src+'">Tải về</a>', editor.document );
				}else{
					filesNode = this.filesNode;
				}
	
				editor.insertElement( filesNode );
			}

		},
		onHide : function()
		{
			if ( this.previewImage ){
				this.previewImage.removeListener( 'load', onImgLoadEvent );
				this.previewImage.removeListener( 'error', onImgLoadErrorEvent );
				this.previewImage.removeListener( 'abort', onImgLoadErrorEvent );
				this.previewImage.remove();
				this.previewImage = null;		// Dialog is closed.
			}
		},

		contents :
		[
			{
				id : 'info',
				elements :
				[
					{
						type : 'hbox',
						widths: [ '', '100px'],
						children : [
							{
								type : 'button',
								id : 'browse',
								hidden : 'true',
								style : 'display:none;margin-top:10px;',
								filebrowser :
								{
									action : 'Browse',
									target: 'info:poster',
									url: editor.config.filebrowserImageBrowseUrl || editor.config.filebrowserBrowseUrl
								},
								label : editor.lang.common.browseServer
							}]
					},
					{
						type : 'hbox',
						widths: [ '', '100px', '75px'],
						children : [
							{
								type : 'text',
								id : 'src0',
								label : lang.sourceFiles,
								commit : commitSrc,
								setup : loadSrc
							},
							{
								type : 'button',
								id : 'browse',
								hidden : 'true',
								style : 'display:inline-block;margin-top:14px;',
								filebrowser :
								{
									action : 'Browse',
									target: 'info:src0',
									url: editor.config.filebrowserFilesBrowseUrl || editor.config.filebrowserBrowseUrl
								},
								label : editor.lang.common.browseServer
							},
							{
								id : 'type0',
								label : lang.sourceType,
								type : 'select',
								default : 'application/pdf',
								items :
								[
									[ 'Viewer', 'application/pdf' ],
									[ 'Link', 'link' ]
								],
								commit : commitSrc,
								setup : loadSrc
							}]
					}
				]
			}

		]
	};
} );