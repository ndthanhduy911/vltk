const backendUrl = '/admin';
const fontendUrl = '';
const deptId = parseInt($('body').attr('dept-id'));

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
const vi_moment = (date, type = "DD/MM/YYYY HH:mm:ss") => {
    return moment(date, 'YYYY-MM-DD HH:mm:ss').format(type)
}

const vi_moment_time = (time, type = 'HH:mm:ss') => {
    return moment(time, 'HH:mm:ss').format(type)
}

const changeTitleToSlug = (title) =>
{
    //Đổi chữ hoa thành chữ thường
    slug = title.toLowerCase();
 
    //Đổi ký tự có dấu thành không dấu
    slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
    slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
    slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
    slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
    slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
    slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
    slug = slug.replace(/đ/gi, 'd');
    //Xóa các ký tự đặt biệt
    slug = slug.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '');
    //Đổi khoảng trắng thành ký tự gạch ngang
    slug = slug.replace(/ /gi, "-");
    //Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
    //Phòng trường hợp người nhập vào quá nhiều ký tự trắng
    slug = slug.replace(/\-\-\-\-\-/gi, '-');
    slug = slug.replace(/\-\-\-\-/gi, '-');
    slug = slug.replace(/\-\-\-/gi, '-');
    slug = slug.replace(/\-\-/gi, '-');
    //Xóa các ký tự gạch ngang ở đầu và cuối
    slug = '@' + slug + '@';
    slug = slug.replace(/\@\-|\-\@|\@/gi, '');
    //In slug ra textbox có id “slug”
    
    return slug;
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

// Show Confirm delete
const showConfrimDelete = (button, cb = () => {}) => {
    $('body').off('clcik').on('click', button, function (e) {
        e.preventDefault();
        let href = $(this).attr('data-href');
        showSweetAlert(() => {
            $.ajax({
                type: "GET",
                url: href,
                data: '',
                dataType: "json",
                success: function (response) {
                    // swal("Thành công !!", "Xoá thành công", "success");
                    cb();
                },
                error: function (error) {
                    if (error.responseJSON == undefined) {
                        swal("Thất bại", 'Không xác định', "error");
                    } else {
                        if (Array.isArray(error.responseJSON.error)) {
                            swal("Thất bại", Array.isArray(error.responseJSON.error) ? error.responseJSON.error.join('\n') : 'Không xác định', "error");
                        } else {
                            swal("Thất bại", 'Không xác định', "error");
                        }
                    }
                }
            });
        });
    })
}

// Show modal basic
const showModalBasic = (option, dt = false, add = () => {}, update = () => {}, remove = () => {}) => {

    showModalForm(`#add${option.element}`, option.modal, 'GET', false, () => {
        $(option.modal).find('.modal-title').html(`Thêm ${option.title}`);
        $(`#btnSummit${option.element}`).html('Thêm mới');
        add()
    }, (data, row) => {
        dt !== false ? dt.draw() : '';
        swal("Thành công !!", "Thêm thành công", "success");
    });

    // Show modal Update
    showModalForm(`.edit${option.element}`, option.modal, 'GET', false, (data) => {
        $(option.modal).find('.modal-title').html(`Cập nhật ${option.title}`);
        $(`#btnSummit${option.element}`).html('Cập nhật');
        update(data);
    }, (data, row) => {
        dt !== false ? dt.draw() : '';
        swal("Thành công !!", "Cập nhật thành công", "success");
    });

    showConfrimDelete(`.delete${option.element}`, () => {
        dt !== false ? dt.draw() : '';
        remove();
    });
}

const showSelectImage = (button, showImg, uploadImageValue, buttonRemoveImg) => {
    if($(button).length){
        $('body').on('click', button ,function (e) {
            e.preventDefault();
            let elfNode = $('<div \>');
            elfNode.dialog({
                modal: true,
                width: "80%",
                title: "Thư viện",
                zIndex: 99999,
                create: function (event, ui) {
                    $(this).elfinder({
                        resizable: false,
                        url: "/elfinder/php/connector.minimal.php?dept_id="+deptId,
                        commandsOptions: {
                            getfile: {
                                oncomplete: 'destroy'
                            }
                        },
                        getFileCallback: function (file) {
                            file.url = file.url.replace("/elfinder/php/../../", fontendUrl+'/');
                            let url = file.url;
                            if($(buttonRemoveImg).length){
                                $(buttonRemoveImg).removeClass('hidden');
                            }
                            $(showImg).attr('src' , url);
                            $(showImg).attr('alt' , url);
                            $(uploadImageValue).val(url);
                            elfNode.dialog('close');
                            elfInsrance.disable();
                        }
                    }).elfinder('instance')
                }
            }).parent().css({'zIndex':'11000','top':'100px', 'position' : 'fixed'});
        });
        if($(buttonRemoveImg).length){
            $('body').on('click', buttonRemoveImg ,function (e) {
                e.preventDefault();
                showSweetAlert(()=>{
                    $(showImg).attr('src' , '');
                    $(showImg).attr('alt' , '');
                    $(uploadImageValue).val('');
                    $(buttonRemoveImg).addClass('hidden');
                })
            });
        }
    }
}

const getPathImage = (path = null, iamgeDefault = '') => {
    return path ? path : iamgeDefault
}
