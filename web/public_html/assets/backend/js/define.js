const backendUrl = '/admin';

//Format number money
const number_format = (number, decimals, dec_point, thousands_sep, unit = "") => {
    // * example 1: number_format(1234.5678, 2, '.', '');
    // * returns 1: 1234.57

    var n = number,
        c = isNaN(decimals = Math.abs(decimals)) ? 2 : decimals;
    var d = dec_point == undefined ? "," : dec_point;
    var t = thousands_sep == undefined ? "." : thousands_sep,
        s = n < 0 ? "-" : "";
    var i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;

    return (s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "") + ' ' + unit).trim();
}

// Format date Viet Nam
const vi_moment = (date, type) => {
    return moment(date, 'YYYY-MM-DD HH:mm:ss').format(type)
}

//Show popup sweetalert
const showSweetAlert = (cb=()=>{},text = "Bạn chắc chắn muốn làm điều này ?") => {
    swal({
        title: "Xác nhận",
        text: text,
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Đồng ý",
        cancelButtonText: "Từ chối",
        closeOnConfirm: true,
        closeOnCancel: true
    },
    function (isConfirm) {
        if (isConfirm) {
            swal("Thành công !!", "Xác nhận thành công", "success");
            cb();
        }
        else {
            swal.close();
        }
    });
}

// Show Modal From
const showModalForm = (button, modal, typeAjax = 'GET', confirm = false, cb = () => { }, submit = false, cbHite = () => {}) => {
    $('body').on('click', button, function (e) {
        e.preventDefault();
        let _this = $(this);
        let href = _this.attr('href');
        let form = $(modal).find('form');
        let url = _this.data('get');

        form.attr('action', href.trim());

        $(modal).on('shown.bs.modal', function (e) {
            e.preventDefault();
            if (url) {
                $.ajax({
                    type: typeAjax,
                    url: url,
                    data: null,
                    dataType: "json",
                    success: function (response) {
                        for (let item in response) {
                            if (moment(response[item], "YYYY-MM-DD", true).isValid()) {
                                form.find(`[name="${item}"]:not([type="file"]), #${item}:not([type="file"])`).val(moment(response[item], "YYYY-MM-DD").format('DD-MM-YYYY'));
                            } else if (moment(response[item], "YYYY-MM-DD HH:mm:ss", true).isValid()) {
                                form.find(`[name="${item}"]:not([type="file"]), #${item}:not([type="file"])`).val(moment(response[item], "YYYY-MM-DD HH:mm:ss").format('DD-MM-YYYY HH:mm:ss'));
                            } else {
                                form.find(`[name="${item}"]:not([type="file"]), #${item}:not([type="file"])`).val(response[item]);
                            }
                        }
                        form.validator('destroy').validator('update');
                        cb(response);
                    }
                });
            } else {
                cb();
                form.validator('update');
            }
        });

        $(modal).on('hidden.bs.modal', function () {
            form.find('input,textarea').val('');
            form.find('select option[value = ""]').parents('select').val('').trigger('change');
            form.find('select option:eq(0)').prop('selected', true).trigger('change');
            form.validator('destroy');
            form.attr('action','');
            $(modal).off();
            form.off();
            cbHite();
        })

        $(modal).modal('show');
        if (confirm) {
            form.validator().on('submit', function (e) {
                if (e.isDefaultPrevented()) {
                } else {
                    e.preventDefault();
                    if(typeof submit === "function"){
                        submit();
                    }else{
                        // form.trigger('submit');
                    }
                }
            })
        }else{
            if(typeof submit === "function"){
                form.validator().on('submit', function (e) {
                    if (e.isDefaultPrevented()) {

                    } else {
                        e.preventDefault();
                        $.ajax({
                            type: "POST",
                            url: href,
                            data: form.serializeArray(),
                            dataType: "json",
                            success: function (response) {
                                submit(response,_this.parents('tr'));
                                $(modal).modal('hide');
                            },
                            error: function (error){                                                                
                                swal("Thất bại", Array.isArray(error.responseJSON) ? error.responseJSON.join(', ') : 'Không xác định', "error");
                            }
                        });
                    }
                })
            }
        }
    })
}