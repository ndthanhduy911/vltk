const updateViews = (form = '#frmViews') => {
    if($(form).length){
        if($(`${form} #content1`).length){
            getCkeditor1();
        }
    
        if($(`${form} #content2`).length){
            getCkeditor2();
        }

        if($(`${form} #stdout1`).length){
            getCkeditor3();
        }
    
        if($(`${form} #stdout2`).length){
            getCkeditor4();
        }

        if($(`${form} #curriculum1`).length){
            getCkeditor5();
        }
    
        if($(`${form} #curriculum2`).length){
            getCkeditor6();
        }

        if($(`${form} #prospects1`).length){
            getCkeditor7();
        }
    
        if($(`${form} #prospects2`).length){
            getCkeditor8();
        }

        if($(`${form} #fee1`).length){
            getCkeditor9();
        }
    
        if($(`${form} #fee2`).length){
            getCkeditor10();
        }

        if($(`${form} #researches1`).length){
            getCkeditor11();
        }
    
        if($(`${form} #researches2`).length){
            getCkeditor12();
        }

        if($(`${form} #students1`).length){
            getCkeditor13();
        }
    
        if($(`${form} #students2`).length){
            getCkeditor14();
        }

        
        if($(`${form} #rpartners1`).length){
            getCkeditor15();
        }
    
        if($(`${form} #rpartners2`).length){
            getCkeditor16();
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