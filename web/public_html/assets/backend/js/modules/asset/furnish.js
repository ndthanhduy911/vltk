//Datatable cho bảng furnish

const showStatusFurnish = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const loadTableFurnish = (table = 'furnish', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchFurnish');
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
            "ajax": `${webAdminUrl}/furnish/getdata?${paramsUrl}`,
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
                    <input name="furnishCheckbox[]" class="furnishCheckbox" type="checkbox" value="${item.id}">
                `)
                $(`td:eq(${fkeys.indexOf('createddate')})`, row).html(vi_moment(item.createddate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('furnish',item.reportfile,true));  
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center'); 
                $(`td:eq(${fkeys.indexOf('costs')})`, row).html(item.costs ? numberFormat(item.costs) : '');
                let action = showActionButton(item,'furnish','Furnish', {u:parseInt(item.status)?false:true},true);
                if (action) {
                    $(`td:last`, row).addClass('text-nowrap text-center').html(action);
                } else {
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                }
                if(!item.private['d']){
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
        // Show modal Furnish Import
        showModalForm('#importFurnish', '#modalFurnishImport', 'POST', () => {
            $('#modalFurnishImport .modal-title').html('Nhập tài sản');
            $('#btnSummitFurnishImport span').html('Tải lên');
            let filename = $('#modalFurnishImport form').find('#importfurnishfile');
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
            LoadPage(`${webAdminUrl}/furnish`).then(()=>{
                loadTableFurnish('#furnish');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });

        singleLoadPage(`#addFurnish`).then(() => {
            updateFurnish('#frmFurnish');
        });

        singleLoadPage(`${table} tbody .editFurnish,${table} tbody .viewFurnish`).then(()=>{
            updateFurnish('#frmFurnish');
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
            $('#exportFurnish').attr('href',`${webAdminUrl}/furnish/export${textGet}`);
            $('#printFurnish').attr('href',`${webAdminUrl}/furnish/print${textGet}`);
            window.history.pushState({}, "Search furnish", `${webAdminUrl}/furnish${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/furnish/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search furnish", `${webAdminUrl}/furnish${textGetSearch}`);
        });

        checkboxAll('#furnishCheckboxAll','.furnishCheckbox');
        deleteAll('#deleteFurnish','.furnishCheckbox',(data)=>{
            showSweetAlertOk('Xóa đề nghị thành công');
            dt.draw();
        });
        updateSettingFurnish('#frmSettingFurnish');
        cb();
    }
}

const loadTableFurnishDetail = (table = '#furnishdetail') => {
    let fId = $(table).attr('data-id');
    fId = fId ? fId : 0;
    let typeForm = $('#frmFurnish').attr('data-type');
    let perEdit = $('#frmFurnish').attr('peredit');
    if ($(table).length) {
        let paramsUrl = getParams();
        let paged = getParams('paged');
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
            "ajax": `${webAdminUrl}/furnish/getdatadetail/${fId}?${paramsUrl}`,
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
                    <input name="furnishDetailCheckbox[]" class="furnishDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                $(`td:eq(${fkeys.indexOf('expecteddate')})`, row).html(vi_moment(item.expecteddate,'DD/MM/YYYY'));
                $('td:last', row).html(showActionDetailButton(item,'furnish','FurnishDetail',{u:true,v:true}));
                $(`td:eq(${fkeys.indexOf('unitprice')})`, row).html(item.unitprice ? numberFormat(item.unitprice) : '');
                $(`td:eq(${fkeys.indexOf('costs')})`, row).html(item.costs ? numberFormat(item.costs) : '');
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
            window.history.pushState({}, "Search furnishdetail", `${webAdminUrl}/furnish/view${textGet}`);
        });

        // Show modal FurnishDetail Add
        showModalForm('#addFurnishDetail', '#modalFurnishDetail', 'GET', () => {
            let className = 'FurnishDetail';
            $(`#btn${className} span`).html('Thêm mới');
            $(`#modal${className} .modal-title`).html('Thêm mới tài sản');
            $(`#btn${className}`).parents('.modal-footer').removeClass('hidden');
            $(`#modal${className}`).find('select, input:not(#costs,#estimatesaccept)').prop('disabled', false);
        },(data,row)=>{
            dt.draw();
            Swal.fire({
                position: 'top',
                type: 'success',
                title: 'Thêm mới thành công',
                showConfirmButton: false,
                timer: 1500
            })
        });

        showModalForm(`.editFurnishDetail,.viewFurnishDetail`, '#modalFurnishDetail', 'GET', (data) => {
            let className = 'FurnishDetail';
            $(`#btn${className} span`).html('Cập nhật');
            $(`#modal${className} .modal-title`).html('Cập nhật tài sản');
            $('.numberPrice').trigger('change');
            $('.numberQuantity').trigger('change');
            if(typeForm == 'lock' || (data.id && !perEdit)){
                $(`#modal${className}`).find('select, input').prop('disabled', true);
                $(`#btn${className}`).parents('.modal-footer').addClass('hidden');
            }
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        checkboxAll('#furnishDetailCheckboxAll','.furnishDetailCheckbox');
        deleteAll('#deleteFurnishDetail','.furnishDetailCheckbox',(data)=>{
            showSweetAlertOk('Xóa tài sản chi tiết thành công');
            dt.draw();
        });
        updateSettingFurnishDetail("#frmSettingFurnishDetail");
    }
}

const updateFurnish = (form) => {
    if ($(form).length) {
        let typeForm = $('#frmFurnish').attr('data-type');
        let perEdit = $('#frmFurnish').attr('peredit');
        if (typeForm == 'edit') {
            $('#furnishDetailCheckboxAll').prop('disabled',false)
            $('#addFurnishDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteFurnishDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#furnishDetailCheckboxAll').prop('disabled',true);
            $('#addFurnishDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteFurnishDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }
        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }

        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/furnish/view/${data.id}`).then(() => {
                updateFurnish('#frmFurnish');
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
        loadTableFurnishDetail('#furnishdetail');
        showS2ByS2('#deptid','#createduser',apiS2EmployeeList,{ id:'',text:'Chọn'});

        $('#quantity, #unitprice').unbind('change').change(function (e) { 
            e.preventDefault();
            let quantity = floatFormat($('#quantity').val());
            let unitprice = floatFormat($('#unitprice').val())
            if(quantity && unitprice ){
                $('#costs').val(calculateCosts(unitprice,quantity)).trigger('change');
            }
        });

        $('#budgetcosts, #sponsorcosts, #careercosts, #othercosts').unbind('change').change(function (e) { 
            e.preventDefault();
            let budgetcosts = floatFormat($('#budgetcosts').val());
            let sponsorcosts = floatFormat($('#sponsorcosts').val());
            let careercosts = floatFormat($('#careercosts').val());
            let othercosts = floatFormat($('#othercosts').val());
            $('#estimatesaccept').val(caculateEstimatesaccept(budgetcosts,sponsorcosts,careercosts,othercosts)).trigger('change');
        });
    }
}

const calculateCosts = (unitprice = 0, quantity = 0) => {
    unitprice = parseFloat(unitprice);
    quantity = parseInt(quantity);
    return unitprice*quantity;
}

const caculateEstimatesaccept = (budgetcosts, sponsorcosts, careercosts, othercosts) => {
    budgetcosts = parseFloat(budgetcosts);
    budgetcosts = budgetcosts ? budgetcosts : 0;
    sponsorcosts = parseFloat(sponsorcosts);
    sponsorcosts = sponsorcosts ? sponsorcosts : 0;
    careercosts = parseFloat(careercosts);
    careercosts = careercosts ? careercosts : 0;
    othercosts = parseFloat(othercosts);
    othercosts = othercosts ? othercosts : 0;
    return budgetcosts + sponsorcosts + careercosts + othercosts;
}

const updateSettingFurnish = (form) => {
    if ($(form).length) {
        let filterField = ['number', 'deptid', 'createddate'];
        let tableField = ['number','deptname','createddate','reason','note','reportfile','username'];
        showModalForm('#settingFurnish', '#modalSettingFurnish', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/furnish`).then(() => {
                loadTableFurnish('#furnish');
                updateSettingFurnish('#frmSettingFurnish');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingFurnishDetail = (form) => {
    if ($(form).length) {
        let filterField = ['name', 'typeid'];
        let tableField = ['name','typename','specifications','expecteddate','purchasename','quantity','unitprice','costs','note'];
        showModalForm('#settingFurnishDetail', '#modalSettingFurnishDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let furnishId = $('#settingFurnishDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/furnish/view/${furnishId}`).then(() => {
                updateFurnish('#frmFurnish');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updateFurnish('#frmFurnish');

loadTableFurnish('#furnish');