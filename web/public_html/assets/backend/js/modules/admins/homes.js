const updateHomes = (form = '#frmHomes') => {
    if($(form).length){    
        sendAjax(form, "POST").then(() => {
            window.location.reload();
        });
    
        showSelectImage(".boxImg .upImage",'.boxImg .showImg','.boxImg input', '.boxImg .rmImage');
    }
}

updateHomes();