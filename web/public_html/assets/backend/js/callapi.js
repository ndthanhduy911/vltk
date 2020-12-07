//Call API
const callApi = (href,data={},type = "GET",ctype='json') => {
    return new Promise((resolve) => {
        $.ajax({
            type: type,
            url: href,
            data: data,
            dataType: ctype,
            success: function (response) {
                $('body .block-loader').remove();
                if(typeof response.logout != 'undefined'){
                    window.location.reload();
                }else{
                    if (typeof response.error == 'undefined') {
                        if(typeof response.token != 'undefined'){
                            $('.tokenCSRF').val(response.token.value);
                            $('.tokenCSRF').attr('name', response.token.key);
                        }
                        resolve(response);
                    } else {
                        showErrorAjax(response);
                    }
                }
                $('[data-toggle="tooltip"]').tooltip()
            },
            error: function (error) {
                $('body .block-loader').remove();
                showSweetAlertError('Thất bại');
            }
        });
    })
}

// ===================================
// EMPLOYEE
// ===================================
//Get list menus of dept for seletc2
const apiS2MenusLocation = (id = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/menus/gets2menulocation/${id}`).then((response)=>{
            resolve(response);
        })
    })
}
