const updateViews = (form = '#frmViews') => {
    if($(form).length){
        sendAjax(form, "POST").then(() => {
            window.location.reload();
        });
    
        showSelectImage(".upImage");
        rmSelectImage('.rmImage')
        changeTitleToSlug('#title1', '#slug');
    }
}

updateViews();