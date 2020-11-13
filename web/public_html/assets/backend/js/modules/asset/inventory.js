const showStatusInventory = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showActionButtonInventory = (item) => {
    if(parseInt(item.status)){
        return showActionButton(item, 'inventory','Inventory',{v:true,p:true},true)
    }else{
        return showActionButton(item, 'inventory','Inventory',{u:true,l:true,p:true},true)
    }
}

const loadTableInventory = (table = 'inventory', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchInventory');
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
            "ajax": `${webAdminUrl}/inventory/getdata?${paramsUrl}`,
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
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="inventoryCheckbox[]" class="inventoryCheckbox" type="checkbox" value="${item.id}">
                `)
                $(`td:eq(${fkeys.indexOf('inventorydate')})`, row).html(vi_moment(item.inventorydate,'DD/MM/YYYY HH:mm'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('inventory',item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
                let action = showActionButtonInventory(item,'inventory','Inventory');
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
        // Show modal Inventory Import
        showModalForm('#importInventory', '#modalInventoryImport', 'POST', () => {
            $('#modalInventoryImport .modal-title').html('Nhập tài sản');
            $('#btnSummitInventoryImport span').html('Tải lên');
            let filename = $('#modalInventoryImport form').find('#importinventoryfile');
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
            LoadPage(`${webAdminUrl}/inventory`).then(()=>{
                loadTableInventory('#inventory');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });

        $('#modalInventoryPrint').on('shown.bs.modal', function (e) {
            let button = $(e.relatedTarget);
            let link = button.attr('data-href');
            if(link){
                $('#modalInventoryPrint .btnDownloadExcel').attr('href',link);
                $('#modalInventoryPrint .btnDownloadPdf').attr('href',link+'?t=pdf');
                $('#modalInventoryPrint .btnPrintPdf').attr('href',link+'?t=pdf');
                $('#modalInventoryPrint .pdfDocument').attr('src',link+'?t=pdf');
            }
        })

        singleLoadPage(`#addInventory`).then(() => {
            updateInventory('#frmInventory');
        });

        singleLoadPage(`${table} tbody .editInventory,${table} tbody .viewInventory`).then(()=>{
            updateInventory('#frmInventory');
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
            window.history.pushState({}, "Search inventory", `${webAdminUrl}/inventory${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/inventory/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search inventory", `${webAdminUrl}/inventory${textGetSearch}`);
        });

        checkboxAll('#inventoryCheckboxAll','.inventoryCheckbox');
        deleteAll('#deleteInventory','.inventoryCheckbox',(data)=>{
            showSweetAlertOk('Xóa kiểm kê thành công');
            dt.draw();
        });

        showConfrim('.lockInventory',()=>{
            dt.draw();
            showSweetAlertOk(`Khóa kiểm kê thành công`);
        },'Nếu chọn “Đồng ý”, tất cả thông tin kiểm kê sẽ không được phép thay đổi và làm thay đổi thông tin tài sản sử dụng tương ứng. Anh/Chị muốn thực hiện thao tác này?')
        updateSettingInventory('#frmSettingInventory');
        cb();
    }
}

const loadTableInventoryDetail = (table = '#inventorydetail') => {
    let iId = $(table).attr('data-id');
    iId = iId ? iId : 0;
    let typeForm = $('#frmInventory').attr('data-type')
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
            "ajax": `${webAdminUrl}/inventory/getdatadetail/${iId}?${paramsUrl}`,
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
                    <input name="inventoryDetailCheckbox[]" class="inventoryDetailCheckbox" type="checkbox" value="${item.id}">
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

                $(`td:eq(${fkeys.indexOf('quantityreal')})`, row).addClass('text-center').html(numberFormat(item.quantityreal));


                $('td:last', row).addClass('text-center').html(showActionDetailButton(item,'inventory','InventoryDetail',{u:true}));

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
            window.history.pushState({}, "Search inventorydetail", `${webAdminUrl}/inventory/view${textGet}`);
        });

        // Show modal InventoryDetail Add
        $('#addInventoryDetail').unbind('click').click(function (e) { 
            e.preventDefault();
            showModalNotSm('#modalInventoryDetailMore','#frmInventoryDetailMore',()=>{
                $('#modalInventoryDetailMore .modal-title').html('Thêm chi tiết tài sản');
                let deptId = $('#deptid').val();
                if(deptId){
                    loadTableInventoryDetailMore('#inventoryDetailMore', deptId, iId);
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

        showModalForm(`.editInventoryDetail`, '#modalInventoryDetail', 'GET', (data) => {
            $('#btnInventoryDetail span').html('Cập nhật');
            $('#modalInventoryDetail .modal-title').html('Cập nhật tài sản');
            $('.numberPrice').trigger('change');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        showModalForm(`.viewDetail`, '#modalViewDetail', 'GET', (data) => {
            $('#modalViewDetail .modal-title').html('Thông tin tài sản');
            showViewGallery('#detail-img','checkindetail', isJson(data.image) ? JSON.parse(data.image) : data.image);
        });

        checkboxAll('#inventoryDetailCheckboxAll','.inventoryDetailCheckbox');
        deleteAll('#deleteInventoryDetail','.inventoryDetailCheckbox',(data)=>{
            showSweetAlertOk('Xóa tài sản chi tiết thành công');
            dt.draw();
        });
        updateSettingInventoryDetail('#frmSettingInventoryDetail');
    }
}

const loadTableInventoryDetailMore = (table = '#inventoryDetailMore', deptId = 0, iId = 0) => {
    if ($(table).length && deptId && iId) {
        let formSearch = $('#searchInventoryDetailMore');
        $('#typeidSearch option:not([value="0"])').remove();
        apiGetS2AssetTypeDept(deptId, {iId: iId}).then((data)=>{        
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
                "ajax": `${webAdminUrl}/inventory/getdatadetailsearch/${deptId}`,
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
                    }
                ],
                'createdRow': function (row, item, dataIndex) {
                    $('td:eq(0)', row).addClass('text-center');
                    $('td', row).addClass('align-middle');
                    dttbPermission(table,row,4,(rowc)=>{
                        rowc.html(renderForm('costs','text','Ví dụ: 1,000,000',dataIndex,numberFormat(item.costs),{max: 20,size: 20, ro:true, class:'numberPrice'}))
                    }) 
                    dttbPermission(table,row,5,(rowc)=>{
                        rowc.html(renderForm('costsreal','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, class:'numberPrice'}))
                    }) 
                    dttbPermission(table,row,6,(rowc)=>{
                        rowc.html(renderForm('restcosts','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, class:'numberPrice'}))
                    }) 
                    dttbPermission(table,row,7,(rowc)=>{
                        rowc.html(renderForm('restcostsreal','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, class:'numberPrice'}));
                    }) 
                    $('td:eq(8)', row).html(renderForm('quantityreal','text','Ví dụ: 1',dataIndex,'',{max: 5, size: 5, class:'numberQuantity'}));
                    
                    $('td:last', row).addClass('text-center').html(`
                        <div class="btn-group btn-group-sm">
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-info editDetailMore" data-toggle="tooltip" title="Chỉnh sửa"><span><i class="fas fa-save"></i></span></a>
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-danger rmDetailMore" data-toggle="tooltip" title="Xóa"><span><i class="fas fa-ban"></i></span></a>
                        </div>
                    `);
                    $(row).find('.editDetailMore').click(function (e) { 
                        e.preventDefault();
                        let data = updateIndex(table,item.code,dataIndex);
                        updateOneDetail([data],iId).then((response)=>{
                            if(typeof response.error == 'undefined'){
                                dt.draw();
                                $('#inventorydetail').DataTable().draw();
                                showSweetAlertOk('Thêm tài sản thành công');
                            }else{
                                dataError = response.error.join(',');
                                showSweetAlertError(dataError);
                            }
                        })
                    });
                },
                "drawCallback": function (settings) {                
                    $('#frmInventoryDetailMore').validator('update');
                    $('#frmInventoryDetailMore').off('submit').validator().on('submit', function (e) {
                        if (e.isDefaultPrevented()) {
                        } else {
                            e.preventDefault();
                            let data = [];
                            $('#frmInventoryDetailMore').find('table tbody tr').each(function(index){
                                let code = $(`#frmInventoryDetailMore table tbody tr:eq(${index}) td:eq(2)`).text().trim();
                                data.push(updateIndex(table,code,index))
                            });
                            updateOneDetail(data,iId).then((response)=>{
                                if(typeof response.error == 'undefined'){
                                    dt.draw();
                                    $('#inventorydetail').DataTable().draw();
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
                dt.ajax.url(`${webAdminUrl}/inventory/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
            $(table).off('.rmDetailMore').on( 'click', '.rmDetailMore', function (e) {
                e.preventDefault();
                $(this).parents('tr').remove();
                $('#frmInventoryDetailMore').validator('update');
            });
        }else{
            $(table).DataTable().ajax.url(`${webAdminUrl}/inventory/getdatadetailsearch/${deptId}`).load()
            formSearch.unbind('submit').submit(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                $(table).DataTable().ajax.url(`${webAdminUrl}/inventory/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
        }
    }
}

const updateInventory = (form) => {
    if ($(form).length) {
        let typeForm = $(form).attr('data-type');
        let perEdit = $(form).attr('peredit');
        if (typeForm == 'edit') {
            $('#inventoryDetailCheckboxAll').prop('disabled',false);
            $('#addInventoryDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteInventoryDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#inventoryDetailCheckboxAll').prop('disabled',true);
            $('#addInventoryDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteInventoryDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }

        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }

        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/inventory/view/${data.id}`).then(() => {
                updateInventory('#frmInventory');
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
        loadTableInventoryDetail('#inventorydetail');

        showConfrim('#lockInventory', () => {
            let inventoryId = $('#lockInventory').data('id');
            LoadPage(`${webAdminUrl}/inventory/view/${inventoryId}`).then(() => {
                updateInventory('#frmInventory');
            });
            showSweetAlertOk("Khóa thông tin thành công");
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin kiểm kê sẽ không được phép thay đổi. Anh/Chị muốn thực hiện thao tác này?')
    }
}

const updateOneDetail = (data,iId) => {
    return new Promise((resolve,reject) => {
        $('body').append(loaderHtml);
        $.ajax({
            type: "POST",
            url: `${webAdminUrl}/inventory/adddetail`,
            data: {
                invid : iId,
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
    let costs = $(form).find('#costs'+dataIndex).val();
    data.costs = costs;

    let costsreal = $(form).find('#costsreal'+dataIndex).val();
    data.costsreal = costsreal;

    let restcosts = $(form).find('#restcosts'+dataIndex).val();
    data.restcosts = restcosts;

    let restcostsreal = $(form).find('#restcostsreal'+dataIndex).val();
    data.restcostsreal = restcostsreal;

    let quantityreal = $(form).find('#quantityreal'+dataIndex).val();
    data.quantityreal = quantityreal;

    data.code = code

    return data;
}

const updateSettingInventory = (form) => {
    if ($(form).length) {
        let filterField = ['number', 'deptid', 'inventorydate'];
        let tableField = ['number','deptname','inventorydate','reason','note','reportfile'];
        showModalForm('#settingInventory', '#modalSettingInventory', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/inventory`).then(() => {
                loadTableInventory('#inventory');
                updateSettingInventory('#frmSettingInventory');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingInventoryDetail = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'typeid'];
        let tableField = ['code','name','typename','costs','restcosts','costsreal','restcostsreal','note'];
        showModalForm('#settingInventoryDetail', '#modalSettingInventoryDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let inventoryId = $('#settingInventoryDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/inventory/view/${inventoryId}`).then(() => {
                updateInventory('#frmInventory');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updateInventory('#frmInventory');

loadTableInventory('#inventory');