//Datatable cho bảng estimate

const showStatusEstimate = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showActionButtonEstimate = (item) => {
    if(parseInt(item.status)){
        return showActionButton(item, 'estimate','Estimate',{v:true},true)
    }else{
        return showActionButton(item, 'estimate','Estimate',{u:true,l:true},true)
    }
}

const loadTableEstimate = (table = 'estimate', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchEstimate');
        let typeForm = $('#frmEstimate').attr('data-type');
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
            "ajax": `${webAdminUrl}/estimate/getdata?${paramsUrl}`,
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
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="estimateCheckbox[]" class="estimateCheckbox" type="checkbox" value="${item.id}">
                `)
                $(`td:eq(${fkeys.indexOf('estimatedate')})`, row).html(vi_moment(item.estimatedate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('estimate',item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                let action = showActionButtonEstimate(item,'estimate','Estimate');
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
        // Show modal Estimate Import
        showModalForm('#importEstimate', '#modalEstimateImport', 'POST', () => {
            $('#modalEstimateImport .modal-title').html('Nhập tài sản');
            $('#btnSummitEstimateImport span').html('Tải lên');
            let filename = $('#modalEstimateImport form').find('#importestimatefile');
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
            LoadPage(`${webAdminUrl}/estimate`).then(()=>{
                loadTableEstimate('#estimate');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });

        singleLoadPage(`#addEstimate`).then(() => {
            updateEstimate('#frmEstimate');
        });

        singleLoadPage(`${table} tbody .editEstimate,${table} tbody .viewEstimate`).then(()=>{
            updateEstimate('#frmEstimate');
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
            window.history.pushState({}, "Search estimate", `${webAdminUrl}/estimate${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/estimate/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search estimate", `${webAdminUrl}/estimate${textGetSearch}`);
        });

        checkboxAll('#estimateCheckboxAll','.estimateCheckbox');
        deleteAll('#deleteEstimate','.estimateCheckbox',(data)=>{
            showSweetAlertOk('Xóa đánh giá thành công');
            dt.draw();
        });

        showConfrim('.lockEstimate',()=>{
            dt.draw();
            showSweetAlertOk(`Khóa đánh giá thành công`);
        },'Nếu chọn “Đồng ý”, tất cả thông tin đánh giá sẽ không được phép thay đổi và làm thay đổi thông tin tài sản sử dụng tương ứng. Anh/Chị muốn thực hiện thao tác này?')
        updateSettingEstimate('#frmSettingEstimate');
        cb();
    }
}

const loadTableEstimateDetail = (table = '#estimatedetail') => {
    let eId = $(table).attr('data-id');
    eId = eId ? eId : 0;
    let typeForm = $('#frmEstimate').attr('data-type')
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
            "ajax": `${webAdminUrl}/estimate/getdatadetail/${eId}${paramsUrl}`,
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
                    <input name="estimateDetailCheckbox[]" class="estimateDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                if (item.costs) {
                    $(`td:eq(${fkeys.indexOf('costs')})`, row).html(parseFloat(item.costs) ? numberFormat(item.costs) : '');
                }

                if (item.costsreal) {
                    $(`td:eq(${fkeys.indexOf('costsreal')})`, row).html(parseFloat(item.costsreal) ? numberFormat(item.costsreal) : '');
                }

                if (item.restcosts) {
                    $(`td:eq(${fkeys.indexOf('restcosts')})`, row).html(parseFloat(item.restcosts) ? numberFormat(item.restcosts) : '');
                }

                if (item.restcostsreal) {
                    $(`td:eq(${fkeys.indexOf('restcostsreal')})`, row).html(parseFloat(item.restcostsreal) ? numberFormat(item.restcostsreal) : '');
                }
                $('td:last', row).addClass('text-center').html(showActionDetailButton(item,'estimate','EstimateDetail'));

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
            window.history.pushState({}, "Search estimatedetail", `${webAdminUrl}/estimate/view${textGet}`);
        });

        // Show modal EstimateDetail Add
        $('#addEstimateDetail').unbind('click').click(function (e) { 
            e.preventDefault();
            showModalNotSm('#modalEstimateDetailMore','#frmEstimateDetailMore',()=>{
                $('#modalEstimateDetailMore .modal-title').html('Thêm chi tiết tài sản');
                let deptId = $('#deptid').val();
                if(deptId){
                    loadTableEstimateDetailMore('#estimateDetailMore', deptId, eId);
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

        showModalForm(`.editEstimateDetail`, '#modalEstimateDetail', 'GET', (data) => {
            $('#btnEstimateDetail span').html('Cập nhật');
            $('#modalEstimateDetail .modal-title').html('Cập nhật tài sản');
            $('.numberPrice').trigger('change');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        checkboxAll('#estimateDetailCheckboxAll','.estimateDetailCheckbox');
        deleteAll('#deleteEstimateDetail','.estimateDetailCheckbox',(data)=>{
            showSweetAlertOk('Xóa tài sản chi tiết thành công');
            dt.draw();
        });

        updateSettingEstimateDetail('#frmSettingEstimateDetail');
    }
}

const loadTableEstimateDetailMore = (table = '#estimateDetailMore', deptId = 0, eId = 0) => {
    if ($(table).length && deptId && eId) {
        let formSearch = $('#searchEstimateDetailMore');
        $('#typeidSearch option:not([value="0"])').remove();
        apiGetS2AssetTypeDept(deptId, {eId: eId}).then((data)=>{        
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
                "ajax": `${webAdminUrl}/estimate/getdatadetailsearch/${deptId}`,
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
                    $('#frmEstimateDetailMore').validator('update');
                    $('#frmEstimateDetailMore').off('submit').validator().on('submit', function (e) {
                        if (e.isDefaultPrevented()) {
                        } else {
                            e.preventDefault();
                            $(table).find('.editDetailMore').trigger('click');
                        }
                    });
                    $(table).find('[data-toggle="tooltip"]').tooltip()
                },
                'createdRow': function (row, item, dataIndex) {
                    $('td:eq(0),td:eq(8)', row).addClass('text-center');
                    $('td', row).addClass('align-middle');
                    dttbPermission(table,row,4,(rowc)=>{
                        rowc.html(renderForm('costs','text','Ví dụ: 1,000,000',dataIndex,parseFloat(item.costs) ? numberFormat(item.costs) : '',{max: 20, size: 20, rq:true,class:'numberPrice'}))
                    }) 
                    dttbPermission(table,row,5,(rowc)=>{
                        rowc.html(renderForm('costsreal','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, rq:true,class:'numberPrice'}))
                    }) 
                    dttbPermission(table,row,6,(rowc)=>{
                        rowc.html(renderForm('restcosts','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, rq:true,class:'numberPrice'}))
                    }) 
                    dttbPermission(table,row,7,(rowc)=>{
                        rowc.html(renderForm('restcostsreal','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, rq:true,class:'numberPrice'}));
                    }) 

                    $('td:eq(8)', row).html(`
                        <div class="btn-group btn-group-sm">
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-info editDetailMore" data-toggle="tooltip" title="Cập nhật"><span><i class="fas fa-save"></i></span></a>
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-danger rmDetailMore" data-toggle="tooltip" title="Xóa"><span><i class="fas fa-ban"></i></span></a>
                        </div>
                    `);
                    $(row).find('.editDetailMore').click(function (e) { 
                        e.preventDefault();
                        let data = {};
                        let cH = $(table).find(`thead tr th:eq(4)`).hasClass('hidden');
                        let costs = $(row).find('#costs'+dataIndex).val();
                        if(!cH){
                            data.costs = costs;
                        }
                        let cRH = $(table).find(`thead tr th:eq(5)`).hasClass('hidden');
                        let costsreal = $(row).find('#costsreal'+dataIndex).val();
                        if(!cRH){
                            data.costsreal = costsreal;
                        }
                        let rcH = $(table).find(`thead tr th:eq(6)`).hasClass('hidden');
                        let restcosts = $(row).find('#restcosts'+dataIndex).val();
                        if(!rcH){
                            data.restcosts = restcosts;
                        }

                        let rCRH = $(table).find(`thead tr th:eq(7)`).hasClass('hidden');
                        let restcostsreal = $(row).find('#restcostsreal'+dataIndex).val();
                        if(!rCRH){
                            data.restcostsreal = restcostsreal;
                        }

                        if((!cH && !data.costs)){
                            showSweetAlertError("Vui lòng nhập nguyên giá");
                        }else if(!cRH && !data.costsreal){
                            showSweetAlertError("Vui lòng nhập nguyên giá(Đánh giá)");
                        }else if(!rcH && !data.restcosts){
                            showSweetAlertError("Vui lòng nhập giá trị còn lại");
                        }else if(!rCRH && !data.restcostsreal){
                            showSweetAlertError("Vui lòng nhập giá trị còn lại(Đánh giá)");
                        }else{
                            $('body').append(loaderHtml);
                            data.estimateid = eId;
                            data.code = item.code;
                            $.ajax({
                                type: "POST",
                                url: `${webAdminUrl}/estimate/addonedetail`,
                                data: data,
                                dataType: "json",
                                success: function (response) {
                                    $('body .block-loader').remove();
                                    if(typeof response.error == 'undefined'){
                                        $('td:eq(8)', row).html(`<span class="fas fa-check text-success" style="font-size: 16px !important"></span>`);
                                        $('#estimatedetail').DataTable().draw();
                                        $('#typeidSearch option:not([value="0"])').remove();
                                        apiGetS2AssetTypeDept(deptId, {eId: eId}).then((data)=>{  
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
                dt.ajax.url(`${webAdminUrl}/estimate/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
            $(table).off('.rmDetailMore').on( 'click', '.rmDetailMore', function (e) {
                e.preventDefault();
                $(this).parents('tr').remove();
                $('#frmEstimateDetailMore').validator('update');
            });
        }else{
            $(table).DataTable().ajax.url(`${webAdminUrl}/estimate/getdatadetailsearch/${deptId}`).load()
            formSearch.unbind('submit').submit(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                $(table).DataTable().ajax.url(`${webAdminUrl}/estimate/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
        }
    }
}

const updateEstimate = (form) => {
    if ($(form).length) {
        let typeForm = $(form).attr('data-type');
        let perEdit = $(form).attr('peredit');  
        if (typeForm == 'edit') {
            $('#estimateDetailCheckboxAll').prop('disabled',false);
            $('#addEstimateDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteEstimateDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#estimateDetailCheckboxAll').prop('disabled',true);
            $('#addEstimateDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteEstimateDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }

        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }
        
        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/estimate/view/${data.id}`).then(() => {
                updateEstimate('#frmEstimate');
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
        loadTableEstimateDetail('#estimatedetail');

        showConfrim('#lockEstimate', () => {
            let estimateId = $('#lockEstimate').data('id');
            LoadPage(`${webAdminUrl}/estimate/view/${estimateId}`).then(() => {
                updateEstimate('#frmEstimate');
            });
            showSweetAlertOk("Khóa thông tin thành công");
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin đánh giá sẽ không được phép thay đổi. Anh/Chị muốn thực hiện thao tác này?')
    }
}

const updateSettingEstimate = (form) => {
    if ($(form).length) {
        let filterField = ['number', 'deptid', 'estimatedate'];
        let tableField = ['number','deptname','estimatedate','reason','note','reportfile'];
        showModalForm('#settingEstimate', '#modalSettingEstimate', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/estimate`).then(() => {
                loadTableEstimate('#estimate');
                updateSettingEstimate('#frmSettingEstimate');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
        
    }
}

const updateSettingEstimateDetail = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'typeid'];
        let tableField = ['code','name','typename','costs','restcosts','costsreal','restcostsreal','note'];
        showModalForm('#settingEstimateDetail', '#modalSettingEstimateDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let estimateId = $('#settingEstimateDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/estimate/view/${estimateId}`).then(() => {
                updateEstimate('#frmEstimate');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updateEstimate('#frmEstimate');

loadTableEstimate('#estimate');