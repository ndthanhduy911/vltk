const updateViews = (form = '#frmViews') => {
    if($(form).length){
        if($(`${form} #content1`).length){
            getCkeditor1();
        }
    
        if($(`${form} #content2`).length){
            getCkeditor2();
        }
    
        sendAjax(form, "POST").then(() => {
            window.location.reload();
        });
    
        showSelectImage(".upImage");
        rmSelectImage('.rmImage')
        changeTitleToSlug('#title1', '#slug');
    }
}

updateViews();