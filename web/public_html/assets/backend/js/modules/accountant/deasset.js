//Datatable cho bảng deasset

const showStatusDeAsset = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showActionButtonDeAsset = (item) => {
    if(parseInt(item.status)){
        return showActionButton(item, 'deasset','DeAsset',{v:true},true)
    }else{
        return showActionButton(item, 'deasset','DeAsset',{u:true,l:true},true)
    }
}

const loadTableDeAsset = (table = 'deasset', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchDeAsset');
        let typeForm = $('#frmDeAsset').attr('data-type');
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
            "ajax": `${webAdminUrl}/deasset/getdata?${paramsUrl}`,
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
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="deassetCheckbox[]" class="deassetCheckbox" type="checkbox" value="${item.id}">
                `)
                $(`td:eq(${fkeys.indexOf('rpdate')})`, row).html(vi_moment(item.rpdate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('deassetdate')})`, row).html(vi_moment(item.deassetdate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('deasset',item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                let action = showActionButtonDeAsset(item,'deasset','DeAsset');
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
        // Show modal DeAsset Import
        showModalForm('#importDeAsset', '#modalDeAssetImport', 'POST', () => {
            $('#modalDeAssetImport .modal-title').html('Nhập tài sản');
            $('#btnSummitDeAssetImport span').html('Tải lên');
            let filename = $('#modalDeAssetImport form').find('#importdeassetfile');
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
            LoadPage(`${webAdminUrl}/deasset`).then(()=>{
                loadTableDeAsset('#deasset');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });

        singleLoadPage(`#addDeAsset`).then(() => {
            updateDeAsset('#frmDeAsset');
        });

        singleLoadPage(`${table} tbody .editDeAsset,${table} tbody .viewDeAsset`).then(()=>{
            updateDeAsset('#frmDeAsset');
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
            window.history.pushState({}, "Search deasset", `${webAdminUrl}/deasset${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/deasset/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search deasset", `${webAdminUrl}/deasset${textGetSearch}`);
        });

        checkboxAll('#deassetCheckboxAll','.deassetCheckbox');
        deleteAll('#deleteDeAsset','.deassetCheckbox',(data)=>{
            showSweetAlertOk('Xóa khấu hao, hao mòn thành công');
            dt.draw();
        });

        showConfrim('.lockDeAsset',()=>{
            dt.draw();
            showSweetAlertOk(`Khóa khấu hao, hao mòn thành công`);
        },'Nếu chọn “Đồng ý”, tất cả thông tin khấu hao, hao mòn sẽ không được phép thay đổi và làm thay đổi thông tin tài sản sử dụng tương ứng. Anh/Chị muốn thực hiện thao tác này?')
        updateSettingDeAsset('#frmSettingDeAsset');
        cb();
    }
}

const loadTableDeAssetDetail = (table = '#deassetdetail') => {
    let daId = $(table).attr('data-id');
    daId = daId ? daId : 0;
    let typeForm = $('#frmDeAsset').attr('data-type')
    if ($(table).length) {
        let paramsUrl = getParams();
        let paged = getParams('paged')
        paged = paged ? paged : 0;     

        let columns = [];
        let fkeys = [];
        $(`${table} thead th`).each((key,element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
            if(fkey == 'ddcosts'){
                columns.push({data : 'no'})
            }else{
                columns.push({data : $(element).data('col')})
            }

        });

        let dt = $(table).DataTable({
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": `${webAdminUrl}/deasset/getdatadetail/${daId}${paramsUrl}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle').addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="deassetDetailCheckbox[]" class="deassetDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                if (item.costs) {
                    $(`td:eq(${fkeys.indexOf('costs')})`, row).html(parseFloat(item.costs) ? numberFormat(item.costs) : '');
                }

                if (item.disfactor) {
                    $(`td:eq(${fkeys.indexOf('disfactor')})`, row).html(parseFloat(item.disfactor) ? numberFormat(item.disfactor,2) : '');
                }

                if (item.discosts) {
                    $(`td:eq(${fkeys.indexOf('discosts')})`, row).html(parseFloat(item.discosts) ? numberFormat(item.discosts) : '');
                }

                if (item.typefactor) {
                    $(`td:eq(${fkeys.indexOf('typefactor')})`, row).html(parseFloat(item.typefactor) ? numberFormat(item.typefactor,2) : '');
                }

                if (item.decosts) {
                    $(`td:eq(${fkeys.indexOf('decosts')})`, row).html(parseFloat(item.decosts) ? numberFormat(item.decosts) : '');
                }

                if (item.decosts || item.discosts) {
                    let ddcosts = parseFloat(item.decosts) + parseFloat(item.discosts);
                    $(`td:eq(${fkeys.indexOf('ddcosts')})`, row).html(ddcosts ? numberFormat(ddcosts) : '');
                }

                if (item.accumulated) {
                    $(`td:eq(${fkeys.indexOf('accumulated')})`, row).html(parseFloat(item.accumulated) ? numberFormat(item.accumulated) : '');
                }

                $('td:last', row).addClass('text-center').html(showActionDetailButton(item,'deasset','DeAssetDetail'));

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
            window.history.pushState({}, "Search deassetdetail", `${webAdminUrl}/deasset/view${textGet}`);
        });

        // Show modal DeAssetDetail Add
        $('#addDeAssetDetail').unbind('click').click(function (e) { 
            e.preventDefault();
            showModalNotSm('#modalDeAssetDetailMore','#frmDeAssetDetailMore',()=>{
                $('#modalDeAssetDetailMore .modal-title').html('Thêm chi tiết tài sản');
                let deptId = $('#deptid').val();
                if(deptId){
                    loadTableDeAssetDetailMore('#deassetDetailMore', deptId, daId);
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

        showModalForm(`.editDeAssetDetail`, '#modalDeAssetDetail', 'GET', (data) => {
            $('#btnDeAssetDetail span').html('Cập nhật');
            $('#modalDeAssetDetail .modal-title').html('Cập nhật tài sản');
            $('.numberPrice').trigger('change');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        checkboxAll('#deassetDetailCheckboxAll','.deassetDetailCheckbox');
        deleteAll('#deleteDeAssetDetail','.deassetDetailCheckbox',(data)=>{
            showSweetAlertOk('Xóa tài sản chi tiết thành công');
            dt.draw();
        });

        updateSettingDeAssetDetail('#frmSettingDeAssetDetail');
    }
}

const loadTableDeAssetDetailMore = (table = '#deassetDetailMore', deptId = 0, daId = 0) => {
    if ($(table).length && deptId && daId) {
        let formSearch = $('#searchDeAssetDetailMore');
        $('#typeidSearch option:not([value="0"])').remove();
        apiGetS2AssetTypeDept(deptId, {daId: daId}).then((data)=>{        
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
                "ajax": `${webAdminUrl}/deasset/getdatadetailsearch/${deptId}`,
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
                    },
                    {
                        "data": "no"
                    },
                    {
                        "data": "no"
                    }
                ],
                "drawCallback": function( settings ) {
                    $('#frmDeAssetDetailMore').validator('update');
                    $('#frmDeAssetDetailMore').off('submit').validator().on('submit', function (e) {
                        if (e.isDefaultPrevented()) {
                        } else {
                            e.preventDefault();
                            $(table).find('.editDetailMore').trigger('click');
                        }
                    });
                    $(table).find('[data-toggle="tooltip"]').tooltip();
                    numberLoader('.numberCent', 2,100)
                },
                'createdRow': function (row, item, dataIndex) {
                    $('td', row).addClass('align-middle');
                    $('td:eq(0),td:last', row).addClass('text-center');
                    $('td:eq(4)', row).html(renderForm('costs','text','Ví dụ: 1,000,000',dataIndex,parseFloat(item.costs) ? numberFormat(item.costs) : '',{max: 20, size: 20, rq:false,class:'numberPrice',ro:true}));
                    $('td:eq(5)', row).html(renderForm('disfactor','text','Ví dụ: 10.00',dataIndex,parseFloat(item.disfactor) ? numberFormat(item.disfactor) : '',{max: 5,size: 5, rq:false,class:'numberCent'}))
                    $('td:eq(6)', row).html(renderForm('discosts','text','Ví dụ: 1,000,000',dataIndex,parseFloat(item.discosts) ? numberFormat(item.discosts) : '',{max: 20, size: 20, rq:false,class:'numberPrice'}));
                    $('td:eq(7)', row).html(renderForm('typefactor','text','Ví dụ: 10.00',dataIndex,parseFloat(item.typefactor) ? numberFormat(item.typefactor) : '',{max: 5, size: 5, rq:false,class:'numberCent'}))
                    $('td:eq(8)', row).html(renderForm('decosts','text','Ví dụ: 1,000,000',dataIndex,parseFloat(item.decosts) ? numberFormat(item.decosts) : '',{max: 20, size: 20, rq:false,class:'numberPrice'}));
                    $('td:eq(9)', row).html(renderForm('accumulated','text','Ví dụ: 1,000,000',dataIndex,parseFloat(item.accumulated) ? numberFormat(item.accumulated) : '',{max: 20, size: 20, rq:false,class:'numberPrice'}));

                    $('td:last', row).html(`
                        <div class="btn-group btn-group-sm">
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-info editDetailMore" data-toggle="tooltip" title="Chỉnh sửa"><span><i class="fas fa-save"></i></span></a>
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-danger rmDetailMore" data-toggle="tooltip" title="Xóa"><span><i class="fas fa-ban"></i></span></a>
                        </div>
                    `);
                    $(row).find('.editDetailMore').click(function (e) { 
                        e.preventDefault();
                        let data = {};
                        let costs = $(row).find('#costs'+dataIndex).val();
                        data.costs = costs;
                        
                        let accumulated = $(row).find('#accumulated'+dataIndex).val();
                        data.accumulated = accumulated;


             

                        if(!data.costs){
                            showSweetAlertError("Vui lòng nhập nguyên giá");
                        }else if(!data.accumulated){
                            showSweetAlertError("Vui lòng nhập Lũy kế khấu hao, hao mòn");
                        }else{
                            $('body').append(loaderHtml);
                            data.deassetid = daId;
                            data.code = item.code;
                            $.ajax({
                                type: "POST",
                                url: `${webAdminUrl}/deasset/addonedetail`,
                                data: data,
                                dataType: "json",
                                success: function (response) {
                                    $('body .block-loader').remove();
                                    if(typeof response.error == 'undefined'){
                                        $('td:last', row).html(`<span class="fas fa-check text-success" style="font-size: 16px !important"></span>`);
                                        $('#deassetdetail').DataTable().draw();
                                        $('#typeidSearch option:not([value="0"])').remove();
                                        apiGetS2AssetTypeDept(deptId, {daId: daId}).then((data)=>{  
                                            data.unshift({id:'',text : 'Chọn'});     
                                            $('#typeidSearch').select2({
                                                data : data
                                            });
                                        });
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
                dt.ajax.url(`${webAdminUrl}/deasset/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
            $(table).off('.rmDetailMore').on( 'click', '.rmDetailMore', function (e) {
                e.preventDefault();
                $(this).parents('tr').remove();
                $('#frmDeAssetDetailMore').validator('update');
            });
        }else{
            $(table).DataTable().ajax.url(`${webAdminUrl}/deasset/getdatadetailsearch/${deptId}`).load()
            formSearch.unbind('submit').submit(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                $(table).DataTable().ajax.url(`${webAdminUrl}/deasset/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
        }
    }
}

const updateDeAsset = (form) => {
    if ($(form).length) {
        let typeForm = $(form).attr('data-type');
        let perEdit = $(form).attr('peredit');  
        if (typeForm == 'edit') {
            $('#deassetDetailCheckboxAll').prop('disabled',false);
            $('#addDeAssetDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteDeAssetDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#deassetDetailCheckboxAll').prop('disabled',true);
            $('#addDeAssetDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteDeAssetDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }

        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }
        
        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/deasset/view/${data.id}`).then(() => {
                updateDeAsset('#frmDeAsset');
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
        loadTableDeAssetDetail('#deassetdetail');

        showConfrim('#lockDeAsset', () => {
            let deassetId = $('#lockDeAsset').data('id');
            LoadPage(`${webAdminUrl}/deasset/view/${deassetId}`).then(() => {
                updateDeAsset('#frmDeAsset');
            });
            showSweetAlertOk("Khóa thông tin thành công");
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin khấu hao, hao mòn sẽ không được phép thay đổi. Anh/Chị muốn thực hiện thao tác này?')
    }
}

const updateSettingDeAsset = (form) => {
    if ($(form).length) {
        let filterField = ['number', 'deptid', 'rpdate'];
        let tableField = ['number','rpdate','deptname','reason','note','reportfile'];
        showModalForm('#settingDeAsset', '#modalSettingDeAsset', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/deasset`).then(() => {
                loadTableDeAsset('#deasset');
                updateSettingDeAsset('#frmSettingDeAsset');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
        
    }
}

const updateSettingDeAssetDetail = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'typeid'];
        let tableField = ['code','name','typename','costs','disfactor','discosts','typefactor','decosts','ddcosts','accumulated'];
        showModalForm('#settingDeAssetDetail', '#modalSettingDeAssetDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let deassetId = $('#settingDeAssetDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/deasset/view/${deassetId}`).then(() => {
                updateDeAsset('#frmDeAsset');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updateDeAsset('#frmDeAsset');

loadTableDeAsset('#deasset');