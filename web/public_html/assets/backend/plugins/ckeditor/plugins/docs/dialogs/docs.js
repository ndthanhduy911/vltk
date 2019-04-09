CKEDITOR.dialog.add('docsDialog', function (editor) {
    return {
        title: 'Documents',
        minWidth: 400,
        minHeight: 200,
        contents: [
            {
                id: 'tab-basic',
                label: 'Basic Settings',

                elements: [
                    {
                        id: 'docs_button',
                        label: 'Duyệt từ máy chủ',
                        type: 'button',
                        disabled: false,
                        onClick: function () {
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
                                        onlyMimes: ['application/msword','application/pdf'],
                                        url: '/finder/connectorDocs',
                                        lang:'vi',
                                        getFileCallback: function (file) {
                                            var url = file.url;
                                            var dialog = CKEDITOR.dialog.getCurrent();
                                            dialog.setValueOf(dialog._.currentTabId, 'docs_link', url);
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
                        },
                    },
                    {
                        type: 'text',
                        id: 'docs_title',
                        label: 'Tiêu đề'
                    },
                    {
                        type: 'text',
                        id: 'docs_link',
                        label: 'Link',
                        minWidth: 200,
                    },


                ]
            }
        ],
        onOk: function () {
            var dialog = this;
            var a = editor.document.createElement('a');
            a.setAttribute('href', dialog.getValueOf('tab-basic', 'docs_link'));
            // a.setText(dialog.getValueOf('tab-basic', 'docs_title'));
            var img = editor.document.createElement('img');
            img.setAttribute('src', '/ckeditor/plugins/docs/icon/docs.png');
            img.setAttribute('width', 200);
            img.setAttribute('height', 200);
            img.setAttribute('title', dialog.getValueOf('tab-basic', 'docs_title'));
            a.append(img);
            editor.insertElement(a);
        }

    };
});
