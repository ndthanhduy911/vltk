﻿CKEDITOR.plugins.add( 'docs', {
    icons:  this.path + 'icon/docs.png',
    init: function( editor ) {
        editor.addCommand( 'Docs', new CKEDITOR.dialogCommand( 'docsDialog' ) );
        editor.ui.addButton( 'Docs', {
            label: 'Documents',
            command: 'Docs',
            toolbar: 'insert',
            icon : this.path + 'icon/docs.png'
        });
        CKEDITOR.dialog.add( 'docsDialog', this.path + 'dialogs/docs.js' );
    }
});
