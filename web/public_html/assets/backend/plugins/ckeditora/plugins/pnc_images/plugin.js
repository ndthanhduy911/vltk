/*
* Youtube Embed Plugin
*
* @author Jonnas Fonini <contato@fonini.net>
* @version 2.0.0
*/
( function() {
    CKEDITOR.plugins.add( 'pnc_images',
        {
            icons: 'icon',
            init: function( editor )
            {
                editor.addCommand( 'showDiablogGallery', new CKEDITOR.dialogCommand( 'pnc_images', {
                    allowedContent: 'iframe[!width,!height,!src,!frameborder,!allowfullscreen]; object param[*]'
                }));
                console.log(22);
                editor.ui.addButton( 'Gallery',
                    {
                        label : 'Thư viện Gallery',
                        toolbar : 'insert',
                        command : 'showDiablogGallery',
                        icon : this.path + 'icons/pgallery.png'
                    });
                CKEDITOR.dialog.add( 'pnc_images', function ( instance )
                {
                    var video;

                    return {
                        title : editor.lang.youtube.title,
                        minWidth : 500,
                        minHeight : 200,
                        contents :
                            [
                                {
                                id : 'showDiablogGalleryPlugin',
                                expand : true,
                                elements :
                                    [
                                        {
                                            type : 'hbox',
                                            widths : [ '70%', '15%', '15%' ],
                                            children :
                                                [
                                                    {
                                                        id : 'txtUrl',
                                                        type : 'text',
                                                        label : "ID Gallery",

                                                    }
                                                ]
                                        },
                                    ]
                            }
                            ],
                        onOk: function()
                        {
                            var a = this.getContentElement( 'showDiablogGalleryPlugin', 'txtUrl').getValue();
                            var content = '<p>{pgallery}'+a+'{/pgallery}</p>';
                            var element = CKEDITOR.dom.element.createFromHtml( content );
                            var instance = this.getParentEditor();
                            instance.insertElement(element);
                        }
                    };
                });
            }
        });
})();