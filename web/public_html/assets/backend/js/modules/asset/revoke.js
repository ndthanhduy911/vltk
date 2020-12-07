//Datatable cho bảng revoke

const showReStatusRevoke = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `<span class="badge badge-success p-1">Tốt</span>`;
        case 2:
            return `<span class="badge badge-danger p-1">Hỏng</span>`;
        default:
            return `<span class="badge badge-warning p-1">Không có</span>`;
    }
}

const showReTypeRevoke = (id = '') => {
    switch (parseInt(id)) {
        case 2:
            return `Trả lại`;
        case 3:
            return `Thôi sử dụng`;
        default:
            return `Khác`;
    }
}

const showActionButtonRevoke = (item) => {
    if(parseInt(item.status)){
        return showActionButton(item, 'revoke','Revoke',{v:true},true)
    }else{
        return showActionButton(item, 'revoke','Revoke',{u:true,l:true},true)
    }
}

const loadTableRevoke = (table = 'revoke', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchRevoke');
        let typeForm = $('#frmRevoke').attr('data-type');
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
            "ajax": `${webAdminUrl}/revoke/getdata?${paramsUrl}`,
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
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="revokeCheckbox[]" class="revokeCheckbox" type="checkbox" value="${item.id}">
                `)
                $(`td:eq(${fkeys.indexOf('retype')})`, row).html(item.retype == 1 ? item.reason :showReTypeRevoke(item.retype));
                $(`td:eq(${fkeys.indexOf('revokedate')})`, row).html(vi_moment(item.revokedate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('revoke',item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                let action = showActionButtonRevoke(item,'revoke','Revoke');
                if (action) {
                    $(`td:last`, row).addClass('text-nowrap text-center').html(action);
                } else {
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                }

                if(typeForm == 'lock' || !item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
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
        // Show modal Revoke Import
        showModalForm('#importRevoke', '#modalRevokeImport', 'POST', () => {
            $('#modalRevokeImport .modal-title').html('Nhập tài sản');
            $('#btnSummitRevokeImport span').html('Tải lên');
            let filename = $('#modalRevokeImport form').find('#importrevokefile');
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
            LoadPage(`${webAdminUrl}/revoke`).then(()=>{
                loadTableRevoke('#revoke');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });

        singleLoadPage(`#addRevoke`).then(() => {
            updateRevoke('#frmRevoke');
        });

        singleLoadPage(`${table} tbody .editRevoke,${table} tbody .viewRevoke`).then(()=>{
            updateRevoke('#frmRevoke');
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
            window.history.pushState({}, "Search revoke", `${webAdminUrl}/revoke${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/revoke/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search revoke", `${webAdminUrl}/revoke${textGetSearch}`);
        });

        checkboxAll('#revokeCheckboxAll','.revokeCheckbox');
        deleteAll('#deleteRevoke','.revokeCheckbox',(data)=>{
            showSweetAlertOk('Xóa thu hồi thành công');
            dt.draw();
        });

        showConfrim('.lockRevoke',()=>{
            dt.draw();
            showSweetAlertOk(`Khóa thu hồi thành công`);
        },'Nếu chọn “Đồng ý”, tất cả thông tin thu hồi sẽ không được phép thay đổi và làm thay đổi thông tin tài sản sử dụng tương ứng. Anh/Chị muốn thực hiện thao tác này?')
        updateSettingRevoke('#frmSettingRevoke');
        cb();
    }
}

const loadTableRevokeDetail = (table = '#revokedetail') => {
    let reId = $(table).attr('data-id');
    reId = reId ? reId : 0;
    let typeForm = $('#frmRevoke').attr('data-type')
    if ($(table).length) {
        let formSearch = $('#searchRevokeDetail');
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
            "ajax": `${webAdminUrl}/revoke/getdatadetail/${reId}?${paramsUrl}`,
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
                    <input name="revokeDetailCheckbox[]" class="revokeDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                if (item.restcosts) {
                    $(`td:eq(${fkeys.indexOf('restcosts')})`, row).html(numberFormat(item.restcosts));
                }
                $(`td:eq(${fkeys.indexOf('restatus')})`, row).addClass('text-center').html(showReStatusRevoke(item.restatus));
                $('td:last', row).addClass('text-center').html(showActionDetailButton(item,'revoke','RevokeDetail'));

                if(typeForm == 'lock'){
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }else if(!item.private['d']){
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
            window.history.pushState({}, "Search revokedetail", `${webAdminUrl}/revoke/view${textGet}`);
        });

        // Show modal RevokeDetail Add
        $('#addRevokeDetail').unbind('click').click(function (e) { 
            e.preventDefault();
            showModalNotSm('#modalRevokeDetailMore','#frmRevokeDetailMore',()=>{
                $('#modalRevokeDetailMore .modal-title').html('Thêm chi tiết tài sản');
                let deptId = $('#deptid').val();
                if(deptId){
                    loadTableRevokeDetailMore('#revokeDetailMore', deptId, reId);
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

        showModalForm(`.editRevokeDetail`, '#modalRevokeDetail', 'GET', (data) => {
            $('#btnRevokeDetail span').html('Cập nhật');
            $('#modalRevokeDetail .modal-title').html('Cập nhật tài sản');
            $('.numberPrice').trigger('change');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
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
            dt.ajax.url( `${webAdminUrl}/revoke/getdatadetail/${reId}${textGetSearch}` ).load();
            window.history.pushState({}, "Search revoke", `${webAdminUrl}/revoke/view/${reId}${textGetSearch}`);
        });

        checkboxAll('#revokeDetailCheckboxAll','.revokeDetailCheckbox');
        deleteAll('#deleteRevokeDetail','.revokeDetailCheckbox',(data)=>{
            showSweetAlertOk('Xóa tài sản chi tiết thành công');
            dt.draw();
        });

        updateSettingRevokeDetail('#frmSettingRevokeDetail');
    }
}

const loadTableRevokeDetailMore = (table = '#revokeDetailMore', deptId = 0, reId = 0) => {
    if ($(table).length && deptId && reId) {
        let formSearch = $('#searchRevokeDetailMore');
        $('#typeidSearch option:not([value="0"])').remove();
        apiGetS2AssetTypeDept(deptId, {reId: reId}).then((data)=>{        
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
                "ajax": `${webAdminUrl}/revoke/getdatadetailsearch/${deptId}`,
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
                    },
                    {
                        "data": "no"
                    },
                    {
                        "data": "no"
                    }
                ],
                "drawCallback": function( settings ) {
                    $('#frmRevokeDetailMore').validator('update');
                    $('#frmRevokeDetailMore').off('submit').validator().on('submit', function (e) {
                        if (e.isDefaultPrevented()) {
                        } else {
                            e.preventDefault();
                            $(table).find('.editDetailMore').trigger('click');
                        }
                    });
                    $(table).find('[data-toggle="tooltip"]').tooltip()
                },
                'createdRow': function (row, item, dataIndex) {
                    $('td:eq(0)', row).addClass('text-center');
                    $('td', row).addClass('align-middle');
                    $('td:eq(4)', row).html(numberFormat(item.costs));
                    $('td:eq(5)', row).addClass('w-15').html(renderForm('restcosts','text','Ví dụ: 1,000,000',dataIndex,"",{max: 20, size: 20,rq:true,class:'numberPrice'}))
                    $('td:eq(6)', row).addClass('w-10').html(renderForm('restatus','select',{1:'Tốt',2:'Hỏng'},dataIndex,"",{max: 100, size: 100,rq:true})).find('select').select2({minimumResultsForSearch: 5})
                    $('td:eq(7)', row).addClass('w-20').html(renderForm('note','text','Ví dụ: Ghi chú',dataIndex,"",{max: 100, size: 100,rq:false}))

                    $('td:last', row).addClass('text-center').html(`
                        <div class="btn-group btn-group-sm">
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-info editDetailMore" data-toggle="tooltip" title="Cập nhật"><span><i class="fas fa-save"></i></span></a>
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-danger rmDetailMore" data-toggle="tooltip" title="Xóa"><span><i class="fas fa-ban"></i></span></a>
                        </div>
                    `);
                    $(row).find('.editDetailMore').click(function (e) { 
                        e.preventDefault();
                        let data = {};
                        let restcosts = $(row).find('#restcosts'+dataIndex).val();
                        data.restcosts = restcosts;
                        let restatus = $(row).find('#restatus'+dataIndex).val();
                        data.restatus = restatus;
                        let note = $(row).find('#note'+dataIndex).val();
                        data.note = note;


                        if((!data.restcosts)){
                            showSweetAlertError("Vui lòng nhập giá trị còn lại");
                        }else if(!data.restatus){
                            showSweetAlertError("Vui lòng nhập tình trạng");
                        }else{
                            $('body').append(loaderHtml);
                            data.revokeid = reId;
                            data.code = item.code;
                            $.ajax({
                                type: "POST",
                                url: `${webAdminUrl}/revoke/addonedetail`,
                                data: data,
                                dataType: "json",
                                success: function (response) {
                                    $('body .block-loader').remove();
                                    if(typeof response.error == 'undefined'){
                                        $('td:last', row).html(`<span class="fas fa-check text-success" style="font-size: 16px !important"></span>`);
                                        $('#revokedetail').DataTable().draw();
                                        $('#typeidSearch option:not([value="0"])').remove();
                                        apiGetS2AssetTypeDept(deptId, {reId: reId}).then((data)=>{  
                                            data.unshift({id:'',text : 'Chọn'});     
                                            $('#typeidSearch').select2({
                                                data : data
                                            });
                                        });
                                        showSweetAlertOk('Thêm tài sản thành công');
                                    }else{
                                        dataError = response.error.join(',');
                                        showSweetAlertError(dataError);
                                    }
                                },
                                error: function (error) {                        
                                    $('body .block-loader').remove();
                                    showSweetAlertError('Thất bại')
                                }
                            });
                        }
                    });
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
                dt.ajax.url(`${webAdminUrl}/revoke/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
            $(table).off('.rmDetailMore').on( 'click', '.rmDetailMore', function (e) {
                e.preventDefault();
                $(this).parents('tr').remove();
                $('#frmRevokeDetailMore').validator('update');
            });
        }else{
            $(table).DataTable().ajax.url(`${webAdminUrl}/revoke/getdatadetailsearch/${deptId}`).load()
            formSearch.unbind('submit').submit(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                $(table).DataTable().ajax.url(`${webAdminUrl}/revoke/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
        }
    }
}

const updateRevoke = (form) => {
    if ($(form).length) {
        let typeForm = $(form).attr('data-type');
        let perEdit = $(form).attr('peredit');  
        if (typeForm == 'edit') {
            $('#revokeDetailCheckboxAll').prop('disabled',false);
            $('#addRevokeDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteRevokeDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#revokeDetailCheckboxAll').prop('disabled',true);
            $('#addRevokeDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteRevokeDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }

        if(parseInt($(`${form} #retype`).val()) === 1){
            $(form).find('#reason').attr({'required':true,'disabled':false}).parents('.form-group').removeClass('hidden');
        }else{
            $(form).find('#reason').attr({'required':false,'disabled':true}).parents('.form-group').addClass('hidden');
        }

        $(`${form} #retype`).change(function (e) { 
            e.preventDefault();
            let retype = $(this).val();
            if(parseInt(retype) === 1){
                $(form).find('#reason').attr({'required':true,'disabled':false}).parents('.form-group').removeClass('hidden');
            }else{
                $(form).find('#reason').attr({'required':false,'disabled':true}).parents('.form-group').addClass('hidden');
            }
        });

        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }
        

        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/revoke/view/${data.id}`).then(() => {
                updateRevoke('#frmRevoke');
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
        loadTableRevokeDetail('#revokedetail');

        showConfrim('#lockRevoke', () => {
            let revokeId = $('#lockRevoke').data('id');
            LoadPage(`${webAdminUrl}/revoke/view/${revokeId}`).then(() => {
                updateRevoke('#frmRevoke');
            });
            showSweetAlertOk("Khóa thông tin thành công");
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin thu hồi sẽ không được phép thay đổi. Anh/Chị muốn thực hiện thao tác này?');
        $('.revokeGallery').smoothproducts();
    }
}

const updateSettingRevoke = (form) => {
    if ($(form).length) {
        let filterField = ['number', 'deptid', 'revokedate'];
        let tableField = ['number','deptname','revokedate','reason','note','reportfile'];
        showModalForm('#settingRevoke', '#modalSettingRevoke', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/revoke`).then(() => {
                loadTableRevoke('#revoke');
                updateSettingRevoke('#frmSettingRevoke');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingRevokeDetail = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'typeid'];
        let tableField = ['code','name','typename','costs','restcosts','costsreal','restcostsreal','note'];
        showModalForm('#settingRevokeDetail', '#modalSettingRevokeDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let revokeId = $('#settingRevokeDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/revoke/view/${revokeId}`).then(() => {
                updateRevoke('#frmRevoke');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updateRevoke('#frmRevoke');

loadTableRevoke('#revoke');