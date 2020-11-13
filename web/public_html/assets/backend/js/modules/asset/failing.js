const showStatusFailing = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showActionButtonFailing = (item) => {
    if(parseInt(item.status)){
        return showActionButton(item, 'failing','Failing',{v:true,p:true},true)
    }else{
        return showActionButton(item, 'failing','Failing',{u:true,l:true,p:true},true)
    }
}

const loadTableFailing = (table = 'failing', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchFailing');
        let paramsUrl = getParams();
        let paged = getParams('paged')
        paged = paged ? paged : 0;

        let columns = [];
        let fkeys = [];
        $(`${table} thead th`).each((key, element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
            columns.push({
                data: $(element).data('col')
            })
        });
        
        let dt = $(table).DataTable({
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": `${webAdminUrl}/failing/getdata?${paramsUrl}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle');
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="failingCheckbox[]" class="failingCheckbox" type="checkbox" value="${item.id}">
                `)
                $(`td:eq(${fkeys.indexOf('failingdate')})`, row).html(vi_moment(item.failingdate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('failing',item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
                let action = showActionButtonFailing(item,'failing','Failing');
                if (action) {
                    $(`td:last`, row).addClass('text-nowrap text-center').html(action);
                } else {
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                }
            },
            "drawCallback": function (settings) {                
                $(table).find('[data-toggle="tooltip"]').tooltip()
            },
            "deferRender": true,
            "language": {
                "sProcessing": "Đang xử lý...",
                "sLengthMenu": "Xem _MENU_",
                "sZeroRecords": "Không tìm thấy dữ liệu",
                "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_",
                "sInfoEmpty": "",
                "sInfoFiltered": "(được lọc từ _MAX_)",
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
        });
        // Show modal Failing Import
        showModalForm('#importFailing', '#modalFailingImport', 'POST', () => {
            $('#modalFailingImport .modal-title').html('Nhập tài sản');
            $('#btnSummitFailingImport span').html('Tải lên');
            let filename = $('#modalFailingImport form').find('#importfailingfile');
            if($(filename).length){
                $(filename).unbind('change').change(function (e) { 
                    e.preventDefault();
                    let _this = $(this);
                    let importfile = _this[0].files[0];
                    if(importfile.size){                
                        if((/\.(xlsx|xls)$/i).test(importfile.name)){
                            
                        }else{
                            $(filename).val("");
                            Swal.fire({
                                type: 'error',
                                title: 'Biểu mẫu không đúng định dạng',
                                showConfirmButton: false,
                            })
                        }
                    }else{
                        Swal.fire({
                            type: 'error',
                            title: 'Biểu mẫu không tồn tại',
                            showConfirmButton: false,
                        })
                    }
                });
            }
        },(data,row)=>{
            LoadPage(`${webAdminUrl}/failing`).then(()=>{
                loadTableFailing('#failing');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });

        $('#modalFailingPrint').on('shown.bs.modal', function (e) {
            let button = $(e.relatedTarget);
            let link = button.attr('data-href');
            if(link){
                $('#modalFailingPrint .btnDownloadExcel').attr('href',link);
                $('#modalFailingPrint .btnDownloadPdf').attr('href',link+'?t=pdf');
                $('#modalFailingPrint .btnPrintPdf').attr('href',link+'?t=pdf');
                $('#modalFailingPrint .pdfDocument').attr('src',link+'?t=pdf');
            }
        })

        singleLoadPage(`#addFailing`).then(() => {
            updateFailing('#frmFailing');
        });

        singleLoadPage(`${table} tbody .editFailing,${table} tbody .viewFailing`).then(()=>{
            updateFailing('#frmFailing');
        });

        $(table).on( 'page.dt', function (e) {
            e.preventDefault();
            clearFlashSession();
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            let textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search failing", `${webAdminUrl}/failing${textGet}`);
        });
        
        formSearch.submit(function (e) { 
            e.preventDefault();
            clearFlashSession();
            let dataSearch = formSearch.serializeArray();
            let textGetSearch = "?paged=";
            dataSearch.forEach((element, index) => {
                if(element.name != "paged"){
                    textGetSearch += `&${element.name}=${element.value}`
                }
            })            
            dt.ajax.url( `${webAdminUrl}/failing/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search failing", `${webAdminUrl}/failing${textGetSearch}`);
        });

        checkboxAll('#failingCheckboxAll','.failingCheckbox');
        deleteAll('#deleteFailing','.failingCheckbox',(data)=>{
            showSweetAlertOk('Xóa báo hỏng thành công');
            dt.draw();
        });

        showConfrim('.lockFailing',()=>{
            dt.draw();
            showSweetAlertOk(`Khóa báo hỏng thành công`);
        },'Nếu chọn “Đồng ý”, tất cả thông tin báo hỏng sẽ không được phép thay đổi và làm thay đổi thông tin tài sản sử dụng tương ứng. Anh/Chị muốn thực hiện thao tác này?')
        updateSettingFailing('#frmSettingFailing');
        cb();
    }
}

const loadTableFailingDetail = (table = '#failingdetail') => {
    let flId = $(table).attr('data-id');
    flId = flId ? flId : 0;
    let typeForm = $('#frmFailing').attr('data-type')
    if ($(table).length) {
        let paramsUrl = getParams();
        let paged = getParams('paged')
        paged = paged ? paged : 0;     

        let columns = [];
        let fkeys = [];
        $(`${table} thead th`).each((key,element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
            columns.push({data : $(element).data('col')})
        });

        let dt = $(table).DataTable({
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": `${webAdminUrl}/failing/getdatadetail/${flId}?${paramsUrl}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle');
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="failingDetailCheckbox[]" class="failingDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');

                $('td:last', row).addClass('text-center').html(showActionDetailButton(item,'failing','FailingDetail',{u:true}));

                if(typeForm == 'lock' || !item.private['u']){
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }

                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
            },
            "drawCallback": function (settings) {                
                if(settings.json.recordsFiltered){
                    $('#deptid').prop('disabled', true);
                }else{
                    $('#deptid').prop('disabled', false);
                }   
                $(table).find('[data-toggle="tooltip"]').tooltip()                       
            },
            "deferRender": true,
            "language": {
                "sProcessing": "Đang xử lý...",
                "sLengthMenu": "Xem _MENU_ tài sản",
                "sZeroRecords": "Không tìm thấy dữ liệu",
                "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ tài sản",
                "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 tài sản",
                "sInfoFiltered": "(được lọc từ _MAX_ tài sản)",
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
        });

        $(table).on( 'page.dt', function (e) {
            e.preventDefault();
            clearFlashSession();
            let info = dt.page.info();
            textGet = "?paged="+info.page;
            window.history.pushState({}, "Search failingdetail", `${webAdminUrl}/failing/view${textGet}`);
        });

        // Show modal FailingDetail Add
        $('#addFailingDetail').unbind('click').click(function (e) { 
            e.preventDefault();
            showModalNotSm('#modalFailingDetailMore','#frmFailingDetailMore',()=>{
                $('#modalFailingDetailMore .modal-title').html('Thêm chi tiết tài sản');
                let deptId = $('#deptid').val();
                if(deptId){
                    loadTableFailingDetailMore('#failingDetailMore', deptId, flId);
                }else{
                    Swal.fire({
                        position: 'top',
                        type: 'error',
                        title: 'Vui lòng chọn Đơn vị/ bộ phận',
                        showConfirmButton: false,
                    })
                }
            })
        });

        showModalForm(`.editFailingDetail`, '#modalFailingDetail', 'GET', (data) => {
            $('#btnFailingDetail span').html('Cập nhật');
            $('#modalFailingDetail .modal-title').html('Cập nhật tài sản');
            $('.numberPrice').trigger('change');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        showModalForm(`.viewDetail`, '#modalViewDetail', 'GET', (data) => {
            $('#modalViewDetail .modal-title').html('Thông tin tài sản');
            showViewGallery('#detail-img','checkindetail', isJson(data.image) ? JSON.parse(data.image) : data.image);
        });

        checkboxAll('#failingDetailCheckboxAll','.failingDetailCheckbox');
        deleteAll('#deleteFailingDetail','.failingDetailCheckbox',(data)=>{
            showSweetAlertOk('Xóa tài sản chi tiết thành công');
            dt.draw();
        });
        updateSettingFailingDetail('#frmSettingFailingDetail');
    }
}

const loadTableFailingDetailMore = (table = '#failingDetailMore', deptId = 0, flId = 0) => {
    if ($(table).length && deptId && flId) {
        let formSearch = $('#searchFailingDetailMore');
        $('#typeidSearch option:not([value="0"])').remove();
        apiGetS2AssetTypeDept(deptId, {flId: flId}).then((data)=>{        
            $('#typeidSearch').select2({
                data : data
            });
        });
        if (!$.fn.DataTable.isDataTable(table)) {
            let dt = $(table).DataTable({
                "ordering": false,
                "processing": true,
                "serverSide": true,
                "autoWidth": false,
                "ajax": `${webAdminUrl}/failing/getdatadetailsearch/${deptId}`,
                "searching": false,
                "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
                // "info": false,
                "paging":false,
                "columns": [
                    {
                        "data": "no"
                    },
                    {
                        "data": "name"
                    },
                    {
                        "data": "code"
                    },
                    {
                        "data": "typename"
                    },
                    {
                        "data": "no"
                    },
                    {
                        "data": "no"
                    }
                ],
                'createdRow': function (row, item, dataIndex) {
                    $('td:eq(0)', row).addClass('text-center');
                    $('td', row).addClass('align-middle');

                    $('td:eq(4)', row).html(renderForm('content','text','Ví dụ: Tài sản bị trong quá trình sử dụng',dataIndex,'',{max: 250, size: 250}));

                    $('td:last', row).addClass('text-center').html(`
                        <div class="btn-group btn-group-sm">
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-info editDetailMore" data-toggle="tooltip" title="Chỉnh sửa"><span><i class="fas fa-save"></i></span></a>
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-danger rmDetailMore" data-toggle="tooltip" title="Xóa"><span><i class="fas fa-ban"></i></span></a>
                        </div>
                    `);
                    $(row).find('.editDetailMore').click(function (e) { 
                        e.preventDefault();
                        let data = updateIndex(table,item.code,dataIndex);
                        updateOneDetail([data],flId).then((response)=>{
                            if(typeof response.error == 'undefined'){
                                dt.draw();
                                $('#failingdetail').DataTable().draw();
                                showSweetAlertOk('Thêm tài sản thành công');
                            }else{
                                dataError = response.error.join(',');
                                showSweetAlertError(dataError);
                            }
                        })
                    });
                },
                "drawCallback": function (settings) {                
                    $('#frmFailingDetailMore').validator('update');
                    $('#frmFailingDetailMore').off('submit').validator().on('submit', function (e) {
                        if (e.isDefaultPrevented()) {
                        } else {
                            e.preventDefault();
                            let data = [];
                            $('#frmFailingDetailMore').find('table tbody tr').each(function(index){
                                let code = $(`#frmFailingDetailMore table tbody tr:eq(${index}) td:eq(2)`).text().trim();
                                data.push(updateIndex(table,code,index))
                            });
                            updateOneDetail(data,flId).then((response)=>{
                                if(typeof response.error == 'undefined'){
                                    dt.draw();
                                    $('#failingdetail').DataTable().draw();
                                    showSweetAlertOk('Thêm tài sản thành công');
                                }else{
                                    dataError = response.error.join(',');
                                    showSweetAlertError(dataError);
                                }
                            })
                        }
                    });
                    $(table).find('[data-toggle="tooltip"]').tooltip()
                },
                "deferRender": true,
                "language": {
                    "sProcessing": "Đang xử lý...",
                    "sLengthMenu": "Xem _MENU_ tài sản",
                    "sZeroRecords": "Không tìm thấy dữ liệu",
                    "sInfo": "Đang xem _TOTAL_ tài sản",
                    "sInfoEmpty": "Đang xem 0 tài sản",
                    "sInfoFiltered": "(được lọc từ _MAX_ tài sản)",
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
            });
            formSearch.unbind('submit').submit(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                dt.ajax.url(`${webAdminUrl}/failing/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
            $(table).off('.rmDetailMore').on( 'click', '.rmDetailMore', function (e) {
                e.preventDefault();
                $(this).parents('tr').remove();
                $('#frmFailingDetailMore').validator('update');
            });
        }else{
            $(table).DataTable().ajax.url(`${webAdminUrl}/failing/getdatadetailsearch/${deptId}`).load()
            formSearch.unbind('submit').submit(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                $(table).DataTable().ajax.url(`${webAdminUrl}/failing/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
        }
    }
}

const updateFailing = (form) => {
    if ($(form).length) {
        let typeForm = $(form).attr('data-type');
        let perEdit = $(form).attr('peredit');
        if (typeForm == 'edit') {
            $('#failingDetailCheckboxAll').prop('disabled',false);
            $('#addFailingDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteFailingDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#failingDetailCheckboxAll').prop('disabled',true);
            $('#addFailingDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteFailingDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }

        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }

        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/failing/view/${data.id}`).then(() => {
                updateFailing('#frmFailing');
            });
            if (typeForm == 'edit') {
                addFlashSession('success', "Cập nhật thành công");
            } else {
                addFlashSession('success', "Thêm mới thành công");
            }
        });

        checkUploadFile($(form).find('#reportfile'), (/\.(jpg|jpeg|png|pdf)$/i),(data)=>{
            if(!data.s){
                $(data.this).val('');
            }
        })
        loadTableFailingDetail('#failingdetail');

        showConfrim('#lockFailing', () => {
            let failingId = $('#lockFailing').data('id');
            LoadPage(`${webAdminUrl}/failing/view/${failingId}`).then(() => {
                updateFailing('#frmFailing');
            });
            showSweetAlertOk("Khóa thông tin thành công");
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin báo hỏng sẽ không được phép thay đổi. Anh/Chị muốn thực hiện thao tác này?')
    }
}

const updateOneDetail = (data,flId) => {
    return new Promise((resolve,reject) => {
        $('body').append(loaderHtml);
        $.ajax({
            type: "POST",
            url: `${webAdminUrl}/failing/adddetail`,
            data: {
                rpid : flId,
                details : data
            },
            dataType: "json",
            success: function (response) {
                $('body .block-loader').remove();
                resolve(response)
            },
            error: function (error) {     
                reject(error);                   
                $('body .block-loader').remove();
                showSweetAlertError('Thất bại')
            }
        });
    })
}

const updateIndex = (form,code,dataIndex) => {
    let data = {};
    let content = $(form).find('#content'+dataIndex).val();
    data.content = content;

    data.code = code

    return data;
}

const updateSettingFailing = (form) => {
    if ($(form).length) {
        let filterField = ['number', 'deptid', 'failingdate'];
        let tableField = ['number','deptname','failingdate','reason','note','reportfile'];
        showModalForm('#settingFailing', '#modalSettingFailing', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/failing`).then(() => {
                loadTableFailing('#failing');
                updateSettingFailing('#frmSettingFailing');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingFailingDetail = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'typeid'];
        let tableField = ['code','name','typename','content'];
        showModalForm('#settingFailingDetail', '#modalSettingFailingDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let failingId = $('#settingFailingDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/failing/view/${failingId}`).then(() => {
                updateFailing('#frmFailing');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updateFailing('#frmFailing');

loadTableFailing('#failing');