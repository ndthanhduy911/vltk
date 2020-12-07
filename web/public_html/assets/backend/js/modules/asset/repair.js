const showStatusRepair = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showActionButtonRepair = (item) => {
    if(parseInt(item.status)){
        return showActionButton(item, 'repair','Repair',{v:true,p:true},true)
    }else{
        return showActionButton(item, 'repair','Repair',{u:true,l:true,p:true},true)
    }
}

const loadTableRepair = (table = 'repair', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchRepair');
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
            "ajax": `${webAdminUrl}/repair/getdata?${paramsUrl}`,
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
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="repairCheckbox[]" class="repairCheckbox" type="checkbox" value="${item.id}">
                `)
                $(`td:eq(${fkeys.indexOf('repairdate')})`, row).html(vi_moment(item.repairdate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('repair',item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
                let action = showActionButtonRepair(item,'repair','Repair');
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
        // Show modal Repair Import
        showModalForm('#importRepair', '#modalRepairImport', 'POST', () => {
            $('#modalRepairImport .modal-title').html('Nhập tài sản');
            $('#btnSummitRepairImport span').html('Tải lên');
            let filename = $('#modalRepairImport form').find('#importrepairfile');
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
            LoadPage(`${webAdminUrl}/repair`).then(()=>{
                loadTableRepair('#repair');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });

        $('#modalRepairPrint').on('shown.bs.modal', function (e) {
            let button = $(e.relatedTarget);
            let link = button.attr('data-href');
            if(link){
                $('#modalRepairPrint .btnDownloadExcel').attr('href',link);
                $('#modalRepairPrint .btnDownloadPdf').attr('href',link+'?t=pdf');
                $('#modalRepairPrint .btnPrintPdf').attr('href',link+'?t=pdf');
                $('#modalRepairPrint .pdfDocument').attr('src',link+'?t=pdf');
            }
        })

        singleLoadPage(`#addRepair`).then(() => {
            updateRepair('#frmRepair');
        });

        singleLoadPage(`${table} tbody .editRepair,${table} tbody .viewRepair`).then(()=>{
            updateRepair('#frmRepair');
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
            window.history.pushState({}, "Search repair", `${webAdminUrl}/repair${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/repair/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search repair", `${webAdminUrl}/repair${textGetSearch}`);
        });

        checkboxAll('#repairCheckboxAll','.repairCheckbox');
        deleteAll('#deleteRepair','.repairCheckbox',(data)=>{
            showSweetAlertOk('Xóa nâng cấp/sửa chữa thành công');
            dt.draw();
        });

        showConfrim('.lockRepair',()=>{
            dt.draw();
            showSweetAlertOk(`Khóa nâng cấp/sửa chữa thành công`);
        },'Nếu chọn “Đồng ý”, tất cả thông tin nâng cấp/sửa chữa sẽ không được phép thay đổi và làm thay đổi thông tin tài sản sử dụng tương ứng. Anh/Chị muốn thực hiện thao tác này?')
        updateSettingRepair('#frmSettingRepair');
        cb();
    }
}

const loadTableRepairDetail = (table = '#repairdetail') => {
    let rpId = $(table).attr('data-id');
    rpId = rpId ? rpId : 0;
    let typeForm = $('#frmRepair').attr('data-type')
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
            "ajax": `${webAdminUrl}/repair/getdatadetail/${rpId}?${paramsUrl}`,
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
                    <input name="repairDetailCheckbox[]" class="repairDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');

                $(`td:eq(${fkeys.indexOf('incurred')})`, row).html(parseFloat(item.incurred) ? numberFormat(item.incurred) : '');

                $('td:last', row).addClass('text-center').html(showActionDetailButton(item,'repair','RepairDetail',{u:true}));

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

        $(table).on( 'page.dt', function (e) {
            e.preventDefault();
            clearFlashSession();
            let info = dt.page.info();
            textGet = "?paged="+info.page;
            window.history.pushState({}, "Search repairdetail", `${webAdminUrl}/repair/view${textGet}`);
        });

        // Show modal RepairDetail Add
        $('#addRepairDetail').unbind('click').click(function (e) { 
            e.preventDefault();
            showModalNotSm('#modalRepairDetailMore','#frmRepairDetailMore',()=>{
                $('#modalRepairDetailMore .modal-title').html('Thêm chi tiết tài sản');
                let deptId = $('#deptid').val();
                if(deptId){
                    loadTableRepairDetailMore('#repairDetailMore', deptId, rpId);
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

        showModalForm(`.editRepairDetail`, '#modalRepairDetail', 'GET', (data) => {
            $('#btnRepairDetail span').html('Cập nhật');
            $('#modalRepairDetail .modal-title').html('Cập nhật tài sản');
            $('.numberPrice').trigger('change');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        showModalForm(`.viewDetail`, '#modalViewDetail', 'GET', (data) => {
            $('#modalViewDetail .modal-title').html('Thông tin tài sản');
            showViewGallery('#detail-img','checkindetail', isJson(data.image) ? JSON.parse(data.image) : data.image);
        });

        checkboxAll('#repairDetailCheckboxAll','.repairDetailCheckbox');
        deleteAll('#deleteRepairDetail','.repairDetailCheckbox',(data)=>{
            showSweetAlertOk('Xóa tài sản chi tiết thành công');
            dt.draw();
        });
        updateSettingRepairDetail('#frmSettingRepairDetail');
    }
}

const loadTableRepairDetailMore = (table = '#repairDetailMore', deptId = 0, rpId = 0) => {
    if ($(table).length && deptId && rpId) {
        let formSearch = $('#searchRepairDetailMore');
        $('#typeidSearch option:not([value="0"])').remove();
        apiGetS2AssetTypeDept(deptId, {rpId: rpId}).then((data)=>{        
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
                "ajax": `${webAdminUrl}/repair/getdatadetailsearch/${deptId}`,
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
                    },
                    {
                        "data": "no"
                    }
                ],
                'createdRow': function (row, item, dataIndex) {
                    $('td:eq(0)', row).addClass('text-center');
                    $('td', row).addClass('align-middle');

                    $('td:eq(4)', row).html(renderForm('content','text','Ví dụ: Nâng cấp/sửa chữa hệ thống',dataIndex,'',{max: 250, size: 250}));

                    $('td:eq(5)', row).html(renderForm('incurred','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, class:'numberPrice'}));

                    $('td:last', row).addClass('text-center').html(`
                        <div class="btn-group btn-group-sm">
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-info editDetailMore" data-toggle="tooltip" title="Cập nhật"><span><i class="fas fa-save"></i></span></a>
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-danger rmDetailMore" data-toggle="tooltip" title="Xóa"><span><i class="fas fa-ban"></i></span></a>
                        </div>
                    `);
                    $(row).find('.editDetailMore').click(function (e) { 
                        e.preventDefault();
                        let data = updateIndex(table,item.code,dataIndex);
                        updateOneDetail([data],rpId).then((response)=>{
                            if(typeof response.error == 'undefined'){
                                dt.draw();
                                $('#repairdetail').DataTable().draw();
                                showSweetAlertOk('Thêm tài sản thành công');
                            }else{
                                dataError = response.error.join(',');
                                showSweetAlertError(dataError);
                            }
                        })
                    });
                },
                "drawCallback": function (settings) {                
                    $('#frmRepairDetailMore').validator('update');
                    $('#frmRepairDetailMore').off('submit').validator().on('submit', function (e) {
                        if (e.isDefaultPrevented()) {
                        } else {
                            e.preventDefault();
                            let data = [];
                            $('#frmRepairDetailMore').find('table tbody tr').each(function(index){
                                let code = $(`#frmRepairDetailMore table tbody tr:eq(${index}) td:eq(2)`).text().trim();
                                data.push(updateIndex(table,code,index))
                            });
                            updateOneDetail(data,rpId).then((response)=>{
                                if(typeof response.error == 'undefined'){
                                    dt.draw();
                                    $('#repairdetail').DataTable().draw();
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
                dt.ajax.url(`${webAdminUrl}/repair/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
            $(table).off('.rmDetailMore').on( 'click', '.rmDetailMore', function (e) {
                e.preventDefault();
                $(this).parents('tr').remove();
                $('#frmRepairDetailMore').validator('update');
            });
        }else{
            $(table).DataTable().ajax.url(`${webAdminUrl}/repair/getdatadetailsearch/${deptId}`).load()
            formSearch.unbind('submit').submit(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                $(table).DataTable().ajax.url(`${webAdminUrl}/repair/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
        }
    }
}

const updateRepair = (form) => {
    if ($(form).length) {
        let typeForm = $(form).attr('data-type');
        let perEdit = $(form).attr('peredit');
        if (typeForm == 'edit') {
            $('#repairDetailCheckboxAll').prop('disabled',false);
            $('#addRepairDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteRepairDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#repairDetailCheckboxAll').prop('disabled',true);
            $('#addRepairDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteRepairDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }

        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }

        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/repair/view/${data.id}`).then(() => {
                updateRepair('#frmRepair');
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
        loadTableRepairDetail('#repairdetail');

        showConfrim('#lockRepair', () => {
            let repairId = $('#lockRepair').data('id');
            LoadPage(`${webAdminUrl}/repair/view/${repairId}`).then(() => {
                updateRepair('#frmRepair');
            });
            showSweetAlertOk("Khóa thông tin thành công");
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin nâng cấp/sửa chữa sẽ không được phép thay đổi. Anh/Chị muốn thực hiện thao tác này?')
    }
}

const updateOneDetail = (data,rpId) => {
    return new Promise((resolve,reject) => {
        $('body').append(loaderHtml);
        $.ajax({
            type: "POST",
            url: `${webAdminUrl}/repair/adddetail`,
            data: {
                rpid : rpId,
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
    let incurred = $(form).find('#incurred'+dataIndex).val();
    data.incurred = incurred;

    let content = $(form).find('#content'+dataIndex).val();
    data.content = content;

    data.code = code

    return data;
}

const updateSettingRepair = (form) => {
    if ($(form).length) {
        let filterField = ['number', 'deptid', 'repairdate'];
        let tableField = ['number','deptname','repairdate','reason','note','reportfile'];
        showModalForm('#settingRepair', '#modalSettingRepair', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/repair`).then(() => {
                loadTableRepair('#repair');
                updateSettingRepair('#frmSettingRepair');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingRepairDetail = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'typeid'];
        let tableField = ['code','name','typename','content','incurred'];
        showModalForm('#settingRepairDetail', '#modalSettingRepairDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let repairId = $('#settingRepairDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/repair/view/${repairId}`).then(() => {
                updateRepair('#frmRepair');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updateRepair('#frmRepair');

loadTableRepair('#repair');