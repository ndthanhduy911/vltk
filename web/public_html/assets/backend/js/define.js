const webAdminUrl = '/admin';
const webUrl = window.location.protocol+'://'+window.location.hostname;
const webUri = "";
const loaderHtml = `
<div class="block-loader">
    <div class="loader mr-auto ml-auto"></div>
</div>`;
const singleCore = '#singleCore';
const deptId = parseInt($('body').attr('dept'));
// Random number integer
function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
}
// Format date Viet Nam
const vi_moment = (date, type = 'DD/MM/YYYY HH:mm:ss') => {
    return date ? moment(date, 'YYYY-MM-DD HH:mm:ss').format(type) : '';
}
//Datatable Custom
const settingFiled = (form,filterField,tableField) => {
    $('.sortFilter').sortable({
        placeholder         : 'sort-highlight',
        connectWith: `.sortFilter`,
        forceHelperSize: true,
        handle              : '.handle',
        forcePlaceholderSize: true,
        zIndex              : 999999
    });

    $('.sortTables').sortable({
        placeholder         : 'sort-highlight',
        connectWith: `.sortTables`,
        forceHelperSize: true,
        handle              : '.handle',
        forcePlaceholderSize: true,
        zIndex              : 999999
    });

    $(form).find(`[name="filters[]"]`).parents('.ui-sortable').attr('data-ids',1000);
    filterField.forEach((element,index) => {
        $(form).find(`#filters-${element}`).parents('.ui-sortable').attr('data-ids',index+1);
    });

    $(form).find(`[name="tables[]"]`).parents('.ui-sortable').attr('data-ids',1000);
    tableField.forEach((element,index) => {
        $(form).find(`#tables-${element}`).parents('.ui-sortable').attr('data-ids',index+1);
    });

    $(form).off('click','.refeshFilter').on('click', '.refeshFilter',function (e) {
        e.preventDefault()
        $(form).find(`[name="filters[]"]`).prop('checked',false);
        filterField.forEach(element => {
            $(form).find(`#filters-${element}`).prop('checked',true);
        });

        let items = $(form).find(`[name="filters[]"]`).parents('.ui-sortable');
        items.sort(function(a, b){
            return +$(a).data('ids') - +$(b).data('ids');
        });
        items.appendTo($(form).find(`.filterBox`));
    });
    $(form).off('click','.refeshTable').on('click', '.refeshTable',function (e) {
        e.preventDefault();
        $(form).find(`[name="tables[]"]`).prop('checked',false);
        tableField.forEach(element => {
            $(form).find(`#tables-${element}`).prop('checked',true);

        });

        let items = $(form).find(`[name="tables[]"]`).parents('.ui-sortable');
        items.sort(function(a, b){
            return +$(a).data('ids') - +$(b).data('ids');
        });
        items.appendTo($(form).find(`.tableBox`));
        
    });
}
const updateSetting = (table,className,filterField,tableField,cb=()=>{}) => {
    if ($(`#frmSetting${className}`).length) {
        showModalForm(`#setting${className}`, `#modalSetting${className}`, 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(`#frmSetting${className}`).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(`#frmSetting${className}`).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(window.location.href).then(()=>{
                cb();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');
        settingFiled(`#frmSetting${className}`,filterField,tableField);
    }
}
const dataTableCt = (table, opCT = false,router={co:'',fo:'',aj:'ajaxgetdata',cl:'',ti:'hàng',ff:[],tf:[],lI:''}) => {
    return new Promise((resolve, reject) => {
        if ($(table).length) {
            let paged = getParams('paged')
            paged = paged ? paged : 0;
            let options = {
                "ordering": false,
                "autoWidth": false,
                "searching": false,            
                "pageLength": 25,
                "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
                "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
                "displayStart": paged*25,
                "deferRender": true,
                "preDrawCallback": function(settings) {
                    if(!$('body .block-loader').length){
                        $('body').append(loaderHtml);
                    }
                },
                "drawCallback": function(settings) {
                    $('body .block-loader').remove();
                },
                "language": {
                    "sProcessing": "Đang xử lý...",
                    "sLengthMenu": "Xem _MENU_",
                    "sZeroRecords": "Không tìm thấy dữ liệu",
                    "sInfo": `Đang xem _START_ đến _END_ trong tổng số _TOTAL_ ${router.ti}`,
                    "sInfoEmpty": `Đang xem 0 đến 0 trong tổng số 0 ${router.ti}`,
                    "sInfoFiltered": `(được lọc từ _MAX_ ${router.ti})`,
                    "sInfoPostFix": "",
                    "sSearch": "Tìm:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "Đầu",
                        "sPrevious": "Trước",
                        "sNext": "Tiếp",
                        "sLast": "Cuối"
                    }
                }
            }
            let dt = $(table).DataTable(opCT ? $.extend(options, opCT) : options);
            
            $(table).on( 'page.dt', function (e) {
                e.preventDefault();
                let paged = dt.page.info().page;
                let paramsUrl = setParam('paged',paged);
                window.history.pushState({}, `Search ${router.co}`, `${webAdminUrl}/${router.co}?${paramsUrl}`);
            });

            $(table).on('click', '.orderby', function (e) {
                e.preventDefault();
                let orderBy = $(this).attr('order');
                let orderDir = $(this).attr('dir');
                let dataSearch = $(router.fo).serializeArray();
                let textGet = "?paged=";
                dataSearch.forEach((element, index) => {
                    if (element.name != "paged") {
                        textGet += `&${element.name}=${element.value}`
                    }
                })
                dt.ajax.url(`${webAdminUrl}/${router.co}/${router.aj}${textGet}&order=${orderBy}&dir=${orderDir}`).load();
                $(table).find('thead th a i').removeClass(['fa-sort-up','fa-sort-down']).addClass('fa-sort');
                changeSort(this,orderDir);
                window.history.pushState({}, `Order ${router.co}`, `${webAdminUrl}/${router.co}${textGet}&order=${orderBy}&dir=${orderDir}`);
            });

            if(router.fo){
                $(router.fo).submit(function (e) { 
                    e.preventDefault();
                    let dataSearch = $(router.fo).serializeArray();
                    let textGetSearch = "?paged=";
                    dataSearch.forEach((element, index) => {
                        if(element.name != "paged"){
                            textGetSearch += `&${element.name}=${element.value}`
                        }
                    })            
                    dt.ajax.url( `${webAdminUrl}/${router.co}/${router.aj}${textGetSearch}` ).load();
                    window.history.pushState({}, `Search ${router.co}`, `${webAdminUrl}/${router.co}${textGetSearch}`);
                });
            }

            checkboxAll(`#${router.co}CheckboxAll`,`.${router.co}Checkbox`);
            deleteAll(`#delete${router.cl}`, `.${router.co}Checkbox`,(data) => {
                showSweetAlertOk('Xóa thành công');
                dt.draw()
            });

            deleteAll(`#restore${router.cl}`, `.${router.co}Checkbox`,(data) => {
                showSweetAlertOk('Khôi phục thành công');
                dt.draw()
            });

            showConfrim(`${table} .delete${router.cl}`,()=>{
                showSweetAlertOk('Xóa thành công');
                dt.draw()
            })

            if(router.ff && router.tf){
                updateSetting(table,router.cl,router.ff,router.tf,()=>{
                    dataTableCt(table,opCT,router);
                });
            }

            resolve(dt);
        }else{
            reject();
        }
    });

}
//Set data parameters url
const setParam = (name,value) => {
    let url_string = window.location.href;
    let url = new URL(url_string);
    url.searchParams.set(name, value)
    return url.searchParams.toString()
}
//Show excerpt textshowViewDetail
const trimText = (input, length, ellipses = true, strip_html = true) => {
    //strip tags, if desired
    if (strip_html) {
        input = input.replace(/<\/?[^>]+>/ig, "");
    }

    //no need to trim, already shorter than trim length
    if (input.length <= length) {
        return input;
    }

    //find last space within length
    trimmed_text = input.substr(0, length);

    //add ellipses (...)
    if (ellipses) {
        trimmed_text += '...';
    }

    return trimmed_text;
}
const isJson = (str) => {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

const changeTitleToSlug = (title, slug) => {
    $(title).change(function (e) { 
        e.preventDefault();
        $(slug).val(changeToSlug($(this).val()));
    });
}

const changeToSlug = (title) =>
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
                        url: "/admin/media/connector?deptid="+deptId,
                        lang:'vi',
                        commandsOptions: {
                            getfile: {
                                oncomplete: 'destroy'
                            }
                        },
                        getFileCallback: function (file) {
                            console.log(file.url);
                            file.url = file.url.replace("/elfinder/php/../../", '/');
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
//Show Selet2 by Select2
const showS2ByS2 = (select1, select2, nameApi, empty = {id: '',text: 'Chọn'}) => {
    $(singleCore).off('change', select1).on('change', select1, function (e) {
        e.preventDefault();
        let id = $(this).val();
        if (id) {
            $(`${select2} option:not([value=""])`).remove();
            nameApi(id).then((data) => {
                data.unshift(empty);
                $(select2).select2({
                    data: data
                });
            })
        }
    })
}
//
//Call API
const callApiForm = (href,data={},type = "GET",ctype='json') => {
    return new Promise((resolve) => {
        $.ajax({
            type: type,
            url: href,
            data: data,
            dataType: ctype,
            processData: false,
            contentType: false,
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
//Show Selet2 by Select2
const showS2ByS2Value = (values =[]) => {
    let defaut = {
        ep : {id: '',text: 'Chọn'}
    }
    values.forEach(item => {
        item = Object.assign(item,defaut);
        let s1 = item.s1;
        let s2 = item.s2;
        let nameApi = item.api;
        let ep = item.ep;
        let v1 = item.v1;
        let v2 = item.v2;
        $(singleCore).off('change', s1).on('change', s1, function (e) {
            e.preventDefault();
            let id = $(this).val();
            if (id && id == v1) {
                $(`${s2} option:not([value=""])`).remove();
                nameApi(id).then((data) => {
                    data.unshift(ep);
                    $(s2).select2({
                        data: data
                    });
                    $(s2).val(v2).trigger('change')
                })
            }else if(id){
                $(`${s2} option:not([value=""])`).remove();
                nameApi(id).then((data) => {
                    data.unshift(ep);
                    $(s2).select2({
                        data: data
                    }).trigger('change');
                });
            }else{
                $(`${s2} option:not([value=""])`).remove();
            }
        });
    });

}

//focus input, textarea first
const fousFirstForm = (form) => {
    $(form).find('input:not([type="file"]), textarea').first().focus();
}
//Reset Form
const resetForm = (form) => {
    form.find(`input:not([type="hidden"],[type="checkbox"]),textarea`).val('');
    form.find('select option[value = ""]').parents('select').val('').trigger('change');
    form.find('select option:eq(0)').prop('selected', true).trigger('change');
    form.find('input[type="checkbox"]').prop('checked', false).trigger('change');
    form.find('input[type="radio"]').prop('checked', false).trigger('change');
    form.validator('destroy');
    form.off();
    return form;
}
//Map Data Form
const mapDataForm = (form, data,hidden = false) => {
    return new Promise((resolve, reject) => {
        for (let item in data) {
            let inputElement = form.find(`[name="${item}"]:not([type="file"]), #${item}:not([type="file"])`);
            let inputType = inputElement.attr('type');
            if(data[item] && inputElement.length && !['checkbox','radio'].includes(inputType)){
                // inputElement.parents('.form-group').removeClass('hidden');
                if (moment(data[item], "YYYY-MM-DD", true).isValid()) {
                    inputElement.val(moment(data[item], "YYYY-MM-DD").format('DD/MM/YYYY'));
                } else if (moment(data[item], "YYYY-MM-DD HH:mm:ss", true).isValid()) {
                    inputElement.val(moment(data[item], "YYYY-MM-DD HH:mm:ss").format('DD/MM/YYYY HH:mm:ss'));
                } else {
                    inputElement.val(data[item]);
                }
                form.find(`select[name="${item}"]`).trigger('change');
            }else if(['checkbox','radio'].includes(inputType)){
                if(parseInt(data[item])){
                    inputElement.prop("checked", true);
                }else{
                    inputElement.prop("checked", false);
                }
                inputElement.trigger('change');
            }else{
                if(hidden && inputElement.length){
                    inputElement.parents('.form-group').addClass('hidden');
                }
            }

        }
        form.validator('destroy').validator('update');
        resolve(data);
    })

}
//Get Data Form API
const getDataFormApi = (url,typeAjax="GET") => {
    return new Promise((resolve) => {
        if (url) {
            $.ajax({
                type: typeAjax,
                url: url,
                data: null,
                dataType: "json",
                success: function (response) {
                    if(typeof response.logout != 'undefined'){
                        window.location.reload();
                    }else{
                        if (typeof response.error == 'undefined') {
                            if (typeof response.token != 'undefined') {
                                $('.tokenCSRF').val(response.token.value);
                                $('.tokenCSRF').attr('name', response.token.key);
                            }
                            resolve(response);
                        } else {
                            resolve()
                            showErrorAjax(response);
                        }
                    }
                }
            });
        }else{
            resolve()
        }
    });

}
const showModalNotSm = (modal, form, cbShow = () => {}, cbHide = () => {}) => {
    return new Promise((resolve, reject) => {
        form = $(form);
        $(modal).on('shown.bs.modal', function (e) {
            e.preventDefault();
            cbShow(form);
        });

        $(modal).on('hidden.bs.modal', function (e) {
            e.preventDefault();
            resetForm(form);
            $(modal).off();
            cbHide(form);
        });

        $(modal).modal({
            backdrop: 'static',
            keyboard: false
        }).modal('show');
        resolve()
    })
}
//Show Modal
const showModal = (modal, cbShow = () => {}, cbSubmit = false, cbHide = () => {}) => {
    let form = $(modal).find('form');
    showModalNotSm(modal, form, cbShow, cbHide).then(() => {
        if (typeof cbSubmit === "function") {
            sendAjax('#' + form.attr('id'), 'POST').then(data => {
                cbSubmit(data);
                $(modal).modal('hide');
            });
        }
    })
}
// Show Modal Not Map From
const showModalNotMapForm = (button, modal, typeAjax = 'GET', cbShow = () => {}, submit = false, cbHite = () => {}, hasHide = true) => {
    $(singleCore).off('click', button).on('click', button, function (e) {
        e.preventDefault();
        let _this = $(this);
        let href = _this.attr('data-href');
        href = href ? href : _this.attr('href');
        let form = $(modal).find('form');
        let url = _this.data('get');
        url = url ? url : _this.parent('tr').data('get');
        form.attr('action', href.trim());

        new Promise((resolve, reject) => {
            try {
                $(modal).on('shown.bs.modal', function (e) {
                    e.preventDefault();
                    fousFirstForm(form);
                    if (url) {
                        getDataFormApi(url,typeAjax).then(data => {
                            cbShow(data);
                            resolve();
                        })

                    } else {
                        cbShow();
                        form.validator('destroy').validator('update');
                        resolve()
                    }
                });

                $(modal).on('hidden.bs.modal', function (e) {
                    e.preventDefault();
                    resetForm(form);
                    form.attr('action', '');
                    $(modal).off();
                    cbHite();
                });

                $(modal).modal({
                    backdrop: 'static',
                    keyboard: false
                }).modal('show');
            } catch (error) {
                reject(error)
            }
        }).then(() => {
            if (typeof submit === "function") {
                sendAjax('#' + form.attr('id'), 'POST').then(data => {
                    submit(data.data, _this.parents('tr'));
                    if (hasHide) {
                        $(modal).modal('hide');
                    }
                })
            }
        })
    })
}
// Show Modal From
const showModalForm = (button, modal, typeAjax = 'GET', cbShow = () => {}, submit = false, cbHite = () => {}, hasHide = true) => {
    $(singleCore).off('click', button).on('click', button, function (e) {
        e.preventDefault();
        let _this = $(this);
        let href = _this.attr('data-href');
        href = href ? href : _this.attr('href');
        let form = $(modal).find('form');
        let url = _this.data('get');
        url = url ? url : _this.parent('tr').data('get');
        form.attr('action', href.trim());

        new Promise((resolve, reject) => {
            try {
                $(modal).on('shown.bs.modal', function (e) {
                    e.preventDefault();
                    fousFirstForm(form);
                    if (url) {
                        getDataFormApi(url,typeAjax).then(data => {
                            mapDataForm(form, data).then(() => {
                                cbShow(data);
                                resolve();
                            });
                        })
                    } else {
                        cbShow();
                        form.validator('destroy').validator('update');
                        resolve()
                    }
                });

                $(modal).on('hidden.bs.modal', function (e) {
                    e.preventDefault();
                    resetForm(form);
                    form.attr('action', '');
                    $(modal).off();
                    cbHite();
                });

                $(modal).modal({
                    backdrop: 'static',
                    keyboard: false
                }).modal('show');
            } catch (error) {
                reject(error)
            }
        }).then(() => {
            if (typeof submit === "function") {
                sendAjax('#' + form.attr('id'), 'POST').then(data => {
                    submit(data.data, _this);
                    if (hasHide) {
                        $(modal).modal('hide');
                    }
                })
            }
        })
    })
}
//Format number money
const numberFormat = (number, decimals = 0, dec_point = '.', thousands_sep = ',', unit = "") => {
    // * example 1: numberFormat(1234.5678, 2, '.', '');
    // * returns 1: 1234.57
    if (!number) {
        return number == 0 ? 0 : '';
    }
    var n = number,
        c = isNaN(decimals = Math.abs(decimals)) ? 2 : decimals;
    var d = dec_point == undefined ? "," : dec_point;
    var t = thousands_sep == undefined ? "." : thousands_sep,
        s = n < 0 ? "-" : "";
    var i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;

    return (s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "") + ' ' + unit).trim();
}
//floatFormat 
const floatFormat = (number) => {
    return Number(number.replace(/[^0-9.-]+/g,""));
}
// Count date of month
const countDate = (date) => {
    let t = parseInt(date.format('M'));
    let year = parseInt(date.format('Y'));

    switch (t) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
        case 2:
            if (year % 100 != 0 && year % 4 == 0) {
                return 29;
            } else {
                return 28;
            }
            default:
                return 0;
    }
}
//Show popup sweetalert
const showSweetAlert = (cb = () => {}, text = "Bạn có chắc muốn thực hiện thao tác này ?") => {
    Swal.fire({
        title: 'Xác nhận',
        text: text,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#4CAF50',
        cancelButtonColor: '#F44336',
        confirmButtonText: 'Đồng ý',
        cancelButtonText: 'Hủy',
        position: 'top',
    }).then((result) => {
        if (result.value) {
            cb();
        }
    })
}

//Show popup sweetalert Textarea
const showSweetAlertArea = (cb = () => {}, text = "Nội dung") => {
    Swal.fire({
        title: text,
        input: 'textarea',
        inputAttributes: {
            autocapitalize: 'off'
        },
        showCancelButton: true,
        confirmButtonText: 'Gửi',
        cancelButtonText: 'Hủy',
        confirmButtonColor: '#4CAF50',
        cancelButtonColor: '#F44336',
        position: 'top',
    }).then((result) => {
        cb(result);
    })
}

const showSweetAlertOk = (title) => {
    Swal.fire({
        type: 'success',
        title: title,
        showConfirmButton: false,
        timer: 1500
    });
}
const showSweetAlertError = (title) => {
    Swal.fire({
        type: 'error',
        position: 'top',
        title: title,
        showConfirmButton: false,
    });
}
// Show Confirm delete
const showConfrim = (button, cb = () => {}, title = "Bạn có chắc muốn thực hiện thao tác này ?") => {
    $('body').off('clcik').on('click', button, function (e) {
        e.preventDefault();
        let href = $(this).attr('data-href');
        let dataMethod = $(this).attr('data-method');
        showSweetAlert(() => {
            $('body').append(loaderHtml);
            $.ajax({
                type: dataMethod ? dataMethod : "GET",
                url: href,
                data: '',
                dataType: "json",
                success: function (response) {
                    if(typeof response.logout != 'undefined'){
                        window.location.reload();
                    }else{
                        if (typeof response.error == 'undefined') {
                            cb();
                        } else {
                            showErrorAjax(response);
                        }
                    }
                    $('body .block-loader').remove();
                },
                error: function (error) {
                    $('body .block-loader').remove();
                    showSweetAlertError('Thất bại');
                }
            });
        }, title);
    })
}
// Show Confirm TextArea
const showTextArea = (button, cb = () => {}, title = "Bạn có chắc muốn thực hiện thao tác này ?") => {
    $('body').off('clcik').on('click', button, function (e) {
        e.preventDefault();
        let href = $(this).attr('data-href');
        let dataMethod = $(this).attr('data-method');
        let dataTitle = $(this).attr('data-title');
        title = dataTitle ? dataTitle : title;
        showSweetAlertArea((data) => {
            $('body').append(loaderHtml);
            if (typeof result != 'undefined' && result.isConfirmed) {
                $.ajax({
                    type: dataMethod ? dataMethod : "GET",
                    url: href,
                    data: {data:data},
                    dataType: "json",
                    success: function (response) {
                        if(typeof response.logout != 'undefined'){
                            window.location.reload();
                        }else{
                            if (typeof response.error == 'undefined') {
                                cb();
                            } else {
                                showErrorAjax(response);
                            }
                        }
                        $('body .block-loader').remove();
                    },
                    error: function (error) {
                        $('body .block-loader').remove();
                        showSweetAlertError('Thất bại');
                    }
                });
            }
        }, title);
    })
}
//Create button
const createButton = (types = ["","","",""], item,controller, className) => {
    let action = "";
    let color = "";
    let icon = "";
    let title = "";
    switch (types[0]) {
        case 1 : {
            action = 'view';
            color = 'purple';
            icon = 'eye';
            title = "Xem chi tiết"
            break;            
        }
        case 2 : {
            action = 'edit';
            color = 'info';
            icon = 'pencil-alt';
            title = "Cập nhật"
            break;            
        }
        case 3 : {
            action = 'lock';
            color = 'warning';
            icon = 'lock';
            title = "Khóa"
            break;            
        }
        case 4 : {
            action = 'print';
            color = 'danger';
            icon = 'file-pdf';
            title = "Tải tập tin"
            break;            
        }
        case 5 : {
            action = 'handover';
            color = 'warning';
            icon = 'file';
            title = "Xuất biên bản bàn giao"
            break;            
        }
        case 6 : {
            action = 'restore';
            color = 'info';
            icon = 'sync';
            title = "Khôi phục dữ liệu"
            break;            
        }
        case 7 : {
            action = 'delete';
            color = 'danger';
            icon = 'trash';
            title = "Xóa dữ liệu"
            break;            
        }
            
        default:
            break;
    }
    return `<a ${types[3] ? types[3] :''} data-href="${webAdminUrl}/${controller}/${types[1]}/${item.id}" href="${webAdminUrl}/${controller}/${types[1]}/${item.id}" ${types[2] ? 'data-get="'+webAdminUrl+'/'+controller+'/'+types[2]+'/'+item.id+'"' : ''} class="btn btn-hnn btn-sm btn-hnn-${color} ${action}${className}"><span title="${title}" ><i class="fas fa-${icon}"></i></span></a>`
}
// Show button update
const showActionButton = (item, controller, className, typeBtn = {
    u: true,
    l: false,
    p: false,
    v: false,
    h: false
},two = false) => {
    let btnText = '';
    let btnView = createButton([1,'view','getsingle'],item,controller,className);
    let btnEdit = createButton([2, two ? 'view' : 'update' ,'getsingle'],item,controller,className);
    let btnLock = createButton([3,'lock',''],item,controller,className);
    let btnPrint = createButton([4,'print','',`data-toggle="modal" data-target="#modal${className}Print" style="padding: 4px 9px"`],item,controller,className)
    let btnH = createButton([5,'handover','',`data-toggle="modal" data-target="#modal${className}Print" style="padding: 4px 9px"`],item,controller,className)
    if (typeof item.private != 'undefined') {
        if (item.private['u'] && typeBtn.u) {
            btnText += btnEdit;
        }else if(item.private['v'] && typeBtn.v) {
            btnText += btnView;
        }
        if (item.private['l'] && typeBtn.l ) {
            btnText += btnLock;
        }
        if (item.private['p'] && typeBtn.p) {
            btnText += btnPrint;
        }
        if(item.private['v'] && typeBtn.h){
            btnText += btnH;
        }
    } else {
        btnText += typeBtn.v ? btnView : '';
        btnText += typeBtn.u ? btnEdit : '';
        btnText += typeBtn.l ? btnLock : '';
        btnText += typeBtn.p ? btnPrint : '';
        btnText += typeBtn.h ? btnH : '';
    }

    let btnAction = btnText ? `
    <div class="btn-group btn-group-sm">
        ${btnText}
    </div>` : ''

    return btnAction;
}

// Show Button View
const showButtonView = (item,controller,className) => {
    return createButton([1, 'view' ,'getsingle'],item,controller,className);
}

// Show Button Edit
const showButtonEdit = (item,controller,className) => {
    return createButton([2, 'view' ,'getsingle'],item,controller,className);
}
// Show Button Restore
const showButtonRestore = (item,controller,className) => {
    return createButton([6, 'restore' ,''],item,controller,className);
}


// Show button updatedetail
const showActionDetailButton = (item, controller, className, typeBtn = {
    u: true,
    v:false,
}) => {
    let btnText = '';
    let btnView = createButton([1,'updatedetail','getsingledetail'],item,controller,className);
    let btnEdit = createButton([2,'updatedetail','getsingledetail'],item,controller,className);;
    if (typeof item.private != 'undefined') {
        if (item.private['u'] && typeBtn.u) {
            btnText += btnEdit;
        }else if (item.private['v'] || typeBtn.v) {
            btnText += btnView;
        }
    } else {
        btnText += typeBtn.v ? btnView : '';
        btnText += typeBtn.u ? btnEdit : '';
    }

    let btnAction = btnText ? `
    <div class="btn-group btn-group-sm">
        ${btnText}
    </div>` : ''

    return btnAction;
}
//
const showViewDetail = (item,controller,action = 'getsingleview',classes = 'Detail') => {
    return `<div class="btn-group btn-group-sm">
            <a data-href="#" href="#" data-get="/admin/${controller}/${action}/${item.id}" class="btn btn-hnn btn-hnn-purple view${classes}">
                <span data-toggle="tooltip" title="" data-original-title="Xem chi tiết"><i class="fas fa-eye"></i></span>
            </a>
        </div>`
}
//Show Alert Error
const showErrorAjax = (response) => {
    dataError = Array.isArray(response.error) ? response.error.join(',') : response.error;
    Swal.fire({
        position: 'top',
        type: 'error',
        title: dataError,
        showConfirmButton: false,
    });
    if (typeof response.token != 'undefined') {
        $('.tokenCSRF').val(response.token.value);
        $('.tokenCSRF').attr('name', response.token.key);
    }
}

//Loader Select2 default
const select2Loader = () => {
    $('form select:not(.custom-select)').select2({
        minimumResultsForSearch: 5,
        language: "vi",
        placeholder: "Chọn",
    });

    $('.select2-multiple').select2({
        minimumResultsForSearch: 5,
        language: "vi",
        placeholder: "Chọn"
    });
}
//Send Ajax
const sendAjax = (form, type = "GET", loader = true) => {
    return new Promise((resolve, reject) => {
        $(form).off('submit').validator().on('submit', function (e) {
            let href = $(this).attr('action');
            if (e.isDefaultPrevented()) {

            } else {
                e.preventDefault();
                let data = new FormData($(this)[0]);
                if (loader) {
                    $('body').append(loaderHtml);
                }
                callApiForm(href,data,type).then((response)=>{
                    resolve(response);
                })
            }
        })
    })
}
//Load page by ajax when click button
const singleLoadPage = (button, blockSingle = $(singleCore), link = false) => {
    return new Promise((resolve, reject) => {
        $('body').off('click',button).on('click', button, function (e) {
            e.preventDefault();
            let url = $(this).attr('data-href');
            url = url ? url : $(this).attr('href');
            if(link){
                url = link;
            }

            LoadPage(url, blockSingle).then(() => {
                resolve();
            }).catch((error) => {
                reject(error)
            });
        });
    })
}
//Load page by ajax
const LoadPage = (url, blockSingle = $(singleCore)) => {
    return new Promise((resolve, reject) => {
        blockSingle.append(loaderHtml);
        if (url) {
            let data = {
                singlePage: 1
            }
            $.ajax({
                type: "GET",
                url: url,
                data: data,
                dataType: "html",
                success: function (response) {
                    if(response == '{"logout":true}'){
                        window.location.reload();
                    }else{
                        blockSingle.html(response);
                        if (typeof response.error == 'undefined') {
                            window.history.pushState({}, "", url);
                            select2Loader();
                            dateRangePickerLoader();
                            viewGallery('.viewGallery');
                            numberLoaderList();
                            bsCustomFileInput.init();
                            resolve();
                        } else {
                            showErrorAjax(response);
                        }
                        $('[data-toggle="tooltip"]').tooltip()
                        $('.tooltip').remove()
                    }
                },
                error: function (error) {
                    showSweetAlertError('Thất bại');
                }
            });
        }
    })

}
//Loader dateRangePickerdefault
const dateRangePickerLoader = () => {
    $('.singleDatePicker:not([readonly])').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        autoUpdateInput: false,
        locale: {
            format: 'DD/MM/YYYY'
        }
    });

    $('.singleDatePicker:not([readonly])').on('apply.daterangepicker', function (ev, picker) {
        $(this).val(picker.startDate.format('DD/MM/YYYY'));
    })

    $('.singleDateTimePicker:not([readonly])').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        timePicker: true,
        timePicker24Hour: true,
        autoUpdateInput: false,
        locale: {
            format: 'DD/MM/YYYY HH:mm'
        }
    });

    $('.singleDateTimePicker:not([readonly])').on('apply.daterangepicker', function (ev, picker) {
        $(this).val(picker.startDate.format('DD/MM/YYYY HH:mm'));
    })

    $('.yearPicker:not([readonly])').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        autoUpdateInput: false,
        locale: {
            format: 'YYYY'
        }
    });

    $('.yearPicker:not([readonly])').on('apply.daterangepicker', function (ev, picker) {
        $(this).val(picker.startDate.format('YYYY'));
    })
}
//Restricts input for the set of matched elements to the given inputFilter function
const inputFilterLoader = () => {
    (function ($) {
        $.fn.inputFilter = function (inputFilter) {
            return this.on("input", function () {
                if (inputFilter(this.value)) {
                    this.oldValue = this.value;
                    this.oldSelectionStart = this.selectionStart;
                    this.oldSelectionEnd = this.selectionEnd;
                } else if (this.hasOwnProperty("oldValue")) {
                    this.value = this.oldValue;
                    this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
                } else {
                    this.value = "";
                }
            });
        };
    }(jQuery));
}
//Loader Number Input 
const numberLoader = (element = '.numberFormat', decimals = 0, max = false) => {
    $(element).each(function (index, item) {
        $(item).val(numberFormat($(item).val(),decimals));
    });
    $(element).inputFilter(function (value) {
        if(max && parseFloat(value) > max){
            return false;
        }
        let price = value.replace(/\,|\./gi,'');
        return /(^\d*$)/.test(price);
    });
    $(singleCore).off('change',element).on('change',element, function (e) {
        e.preventDefault();
        let price = $(this).val().replace(/\,/gi,'');
        $(this).val(numberFormat(price,decimals));
        if(/(^\d*$)/.test(price)){
            $(this).val(numberFormat(price,decimals));
        }else{
            return false;
        }
    });
}
const numberLoaderList = () => {
    numberLoader('.numberPrice');
	numberLoader('.numberQuantity');
	numberLoader('.numberCent', 2,100);
	numberLoader('.numberMap', 7);
}
//Get data parameters url
const getParams = (name = false) => {
    let url_string = window.location.href;
    let url = new URL(url_string);
    if (!name) {
        return url.searchParams.toString();
    } else if (Array.isArray(name)) {
        data = {};
        name.forEach(element => {
            data[element] = url.searchParams.get(element);
        });
        return data;
    } else {
        return url.searchParams.get(name);
    }

}
//Render Form
const renderForm = (n = '', t = '', ph = '', nb = '', df = '', valid = {
    max: 100,
    size: 100,
    rq: false,
    class: ''
}) => {
    switch (t) {
        case 'text': {
            return `
            <div class="form-group">
                <div class="input-group">
                    <input 
                    value="${df}"
                    type="${t}" 
                    id="${n}${nb}" 
                    name="${n}${nb}"
                    placeholder="${ph ? ph : '' }"
                    ${valid.max ? 'maxlength="'+valid.max+'"' : ''} 
                    ${valid.size ? 'size="'+valid.size+'"' : ''} 
                    ${valid.rq ? 'required' : ''}
                    ${valid.ro ? 'readonly' : ''}
                    class="form-control form-control-sm ${valid.class}" data-error="Thông tin không hợp lệ" data-required-error="Vui lòng nhập thông tin">
                </div>
            </div>

            `;
        }

        case 'select': {
            let options = "";
            for (let op in ph) {
                options += `<option value ="${op}">${ph[op]}</option>`
              }
            return `
            <div class="form-group">
                <div class="input-group">
                    <select class="form-control form-control-sm ${valid.class}"
                        ${valid.rq ? 'required' : ''}
                        data-error="Thông tin không hợp lệ" data-required-error="Vui lòng nhập thông tin">
                        ${options}
                    </select>
                </div>
            </div>

            `;
        }
        default:
            return '';
    }
}
// View report file
const btnViewRF = (controller = "", filename = "", m = false) => {
    if(m){
        return filename ? `<a class="viewGallery" href="#" data-path="/files/display/${controller}_reportfile/" data-files='${filename}' >Xem file</a>` : '';
    }else{
        return filename ? `<a target="_blank" href="/files/display/${controller}_reportfile/${filename}">Xem file</a>` : '';
    }
}
const btnViewImg = (path = "", filename = "", m = false) => {
    if(m){
        return filename ? `<a class="viewGallery btn btn-hnn btn-hnn-purple" href="#" data-path="/files/display/${path}/" data-files='${filename}' ><span data-toggle="tooltip" title="" data-original-title="Xem mẫu"><i class="fas fa-eye"></i></span></a>` : '';
    }else{
        return filename ? `<a class="btn btn-hnn btn-hnn-purple" target="_blank" href="/files/display/${path}/${filename}"><span data-toggle="tooltip" title="" data-original-title="Xem mẫu"><i class="fas fa-eye"></i></span></a>` : '';
    }
}

const dttbPermission = (table,row,number,cb = ()=>{}) => {
    if($(table).find(`thead tr th:eq(${number})`).hasClass('hidden')){
        $(`td:eq(${number})`, row).addClass('hidden');
    }else{
        cb($(`td:eq(${number})`, row))
    }
}
const clearFlashSession = () => {
    $('#blockSession').html('');
}

const addFlashSession = (type, text) => {
    $('#blockSession').html(`
        <div class="alert alert-${type} alert-dismissible">${text}<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button></div>
    `);
}

const readURL = (_this, preview) => {
    if (_this.files && _this.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $(preview).attr('src', e.target.result);
        }

        reader.readAsDataURL(_this.files[0]);
    }
}

const checkUploadFile = (filename, type = (/\.(xlsx|xls)$/i),cb=()=>{}, size = 2) => {
    if ($(filename).length) {
        $(filename).unbind('change').change(function (e) {
            e.preventDefault();
            let _this = this;
            let files = $(_this)[0].files;
            try {
                for (let i = 0; i < files.length; i++) {
                    let file = files[i];
                    if (file.size <= size * 1024 * 1024) {
                        if (!type.test(file.name)) {
                            Swal.fire({
                                type: 'error',
                                title: 'Tệp không đúng định dạng',
                                showConfirmButton: false,
                            });
                            throw "Tệp không đúng định dạng";
                        }
                    } else {
                        Swal.fire({
                            type: 'error',
                            title: `Tệp tải lên không quá ${size}M`,
                            showConfirmButton: false,
                        });
                        throw `Tệp tải lên không quá ${size}M`
                    }
                }
                cb({this:this,s:1,l:files.length});
            } catch (error) {
                cb({this:this,s:0});
            }
        });
    }
}

const checkboxAll = (button, selector) => {
    $(button).change(function (e) {
        e.preventDefault();
        if ($(this).is(":checked")) {
            $(selector).not(':disabled').prop("checked", true);
        } else {
            $(selector).not(':disabled').prop("checked", false);
        }
    });
}

const deleteAll = (button, selector, cb = () => {}, title = "Bạn có chắc muốn thực hiện thao tác này ?") => {
    $(button).unbind('click').click(function (e) {
        e.preventDefault();
        let data = $(`${selector}:checked`).map(function () {
            let arrayId = this.value.split(',');
            return arrayId;
        }).get();
        let href = $(this).attr('data-href');
        href = href ? href : $(this).attr('href');

        data = data.filter((value, index, self) => {
            return self.indexOf(value) === index;
        });

        if ($(`${selector}:checked`).length) {
            showSweetAlert(() => {
                $('body').append(loaderHtml);
                $.ajax({
                    type: "POST",
                    url: href,
                    data: {
                        'dataId': data
                    },
                    dataType: "json",
                    success: function (response) {
                        if(typeof response.logout != 'undefined'){
                            window.location.reload();
                        }else{
                            $('body .block-loader').remove();
                            if (typeof response.error == 'undefined') {
                                cb(response);
                            } else {
                                showErrorAjax(response);
                            }
                        }
                    },
                    error: function (error) {
                        $('body .block-loader').remove();
                        showSweetAlertError('Thất bại');
                    }
                });
            }, title)
        } else {
            Swal.fire({
                position: 'top',
                type: 'error',
                title: 'Vui lòng chọn dữ liệu',
                showConfirmButton: false,
            })
        }
    })
}

const viewGallery = (button) => {
    let modal = "#modalViewGallery";
    $(modal).find('.divgallery').html("");
    $(singleCore).off('click',button).on('click', button,function (e) {
        e.preventDefault();
        let btn = $(this);
        $(modal).on('shown.bs.modal', function (e) {
            e.preventDefault();
            let files = btn.data('files');
            let path = btn.data('path')
            console.log(btn.data('files'));
            if(Array.isArray(files)){
                $(modal).find('.divgallery').html("");
                files.forEach(file => {
                    if((/\.(pdf)$/i).test(file)){
                        $(modal).find('.divgallery').append(`
                            <a href="${path}${file}" data-type="pdf"><object class="m-70vh w-100" data="${path}${file}" type="application/pdf"></object></a>
                        `);
                    }else{
                        $(modal).find('.divgallery').append(`
                            <a href="${path}${file}"><img class="object-fit-fill" src="${path}${file}" alt=""></a>
                        `);
                    }
                });
                $(modal).find("divgallery").smoothproducts();
            }else{
                if((/\.(pdf)$/i).test(files)){
                    $(modal).find('.divgallery').append(`
                        <a href="${path}${files}" data-type="pdf"><object class="m-70vh w-100" data="${path}${files}" type="application/pdf"></object></a>
                    `);
                }else{
                    $(modal).find('.divgallery').append(`
                        <a href="${path}${files}"><img class="object-fit-fill" src="${path}${files}" alt=""></a>
                    `);
                }
                $(modal).find("divgallery").smoothproducts();
            }
        });

        $(modal).on('hidden.bs.modal', function (e) {
            e.preventDefault();
            $(modal).find('.divgallery').html("");
            $(modal).off()
        });

        $(modal).modal({
            backdrop: 'static',
            keyboard: false
        }).modal('show');
    });
}

const showViewGalleryChange = (element,files) => {
    if(files && files.files){
        $(element).html('');
        for (let index = 0; index < files.files.length; index++) {
            let reader = new FileReader();
            reader.onload = function (e) {
                $(element).append(`
                    <a href="${e.target.result}"><img class="object-fit-fill review${index}" src="${e.target.result}" alt=""></a>
                `);
                if(index == files.files.length - 1){
                    $(element).smoothproducts();
                }
            }
            reader.readAsDataURL(files.files[index]);
        }
    }
}

const showViewGallery = (element,path,files) => {    
    if(!files){
        $(element).html("");
        $(element).append(`
            <a href="/img/avatar.png"><img class="object-fit-fill" src="/img/avatar.png" alt=""></a>
        `);
        $(element).smoothproducts();
    }else{
        if(Array.isArray(files)){
            $(element).html("");
            files.forEach(file => {
                if((/\.(pdf)$/i).test(file)){
                    $(element).append(`
                        <a href="${createUrlImg(path,file)}" data-type="pdf"><object class="m-70vh w-100" data="${createUrlImg(path,file)}" type="application/pdf"></object></a>
                    `);
                }else{
                    $(element).append(`
                        <a href="${createUrlImg(path,file)}"><img class="object-fit-fill" src="${createUrlImg(path,file)}" alt=""></a>
                    `);
                }
            });
            $(element).smoothproducts();
        }else{
            if((/\.(pdf)$/i).test(files)){
                $(element).append(`
                    <a href="${createUrlImg(path,files)}" data-type="pdf"><object class="m-70vh w-100" data="${createUrlImg(path,files)}" type="application/pdf"></object></a>
                `);
            }else{
                $(element).append(`
                    <a href="${createUrlImg(path,files)}"><img class="object-fit-fill" src="${createUrlImg(path,files)}" alt=""></a>
                `);
            }
            $(element).smoothproducts();
        }
    }

}

const createUrlImg = (path = "", file = "") => {
    return `${webUrl}/files/display/${path}/${file}`;
}

const changeSort = (_this,dir) => {
    switch (parseInt(dir)) {
        case 1 : {
            $(_this).attr('dir',2).find('i').removeClass([ "fa-sort", "fa-sort-down" ]).addClass('fa-sort-up')
            break;
        }
        // case 2: {
        //     $(_this).removeClass([ "fa-sort-up", "fa-sort-down" ]).addClass('fa-sort').attr('dir',0)
        //     break
        // }
        default: {
            $(_this).attr('dir',1).find('i').removeClass([ "fa-sort", "fa-sort-up" ]).addClass('fa-sort-down')
            break;
        }

    }
}