//Datatable cho bảng pcplan

const showStatusPCPlan = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const loadTablePCPlan = (table = 'pcplan', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchPCPlan');
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
            "ajax": `${webAdminUrl}/pcplan/getdata?${paramsUrl}`,
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
                    <input name="procurementPlanCheckbox[]" class="procurementPlanCheckbox" type="checkbox" value="${item.id}">
                `)
                $(`td:eq(${fkeys.indexOf('createdat')})`, row).html(vi_moment(item.createdat,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('pcplan',item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                $(`td:eq(${fkeys.indexOf('costs')})`, row).html(item.costs ? numberFormat(item.costs) : '');
                let action = showActionButton(item,'pcplan','PCPlan', {u:parseInt(item.status)?false:true},true);
                $('td:last', row).addClass('text-nowrap text-center').html(action);
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
        // Show modal PCPlan Import
        showModalForm('#importPCPlan', '#modalPCPlanImport', 'POST', () => {
            $('#modalPCPlanImport .modal-title').html('Nhập kế hoạch mua sắm');
            $('#btnSummitPCPlanImport span').html('Tải lên');
            let filename = $('#modalPCPlanImport form').find('#importpcplanfile');
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
            LoadPage(`${webAdminUrl}/pcplan`).then(()=>{
                loadTablePCPlan('#pcplan');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });

        singleLoadPage(`#addPCPlan`).then(() => {
            updatePCPlan('#frmPCPlan');
        });

        singleLoadPage(`${table} tbody .editPCPlan,${table} tbody .viewPCPlan`).then(()=>{
            updatePCPlan('#frmPCPlan');
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
            $('#exportPCPlan').attr('href',`${webAdminUrl}/pcplan/export${textGet}`);
            $('#printPCPlan').attr('href',`${webAdminUrl}/pcplan/print${textGet}`);
            window.history.pushState({}, "Search pcplan", `${webAdminUrl}/pcplan${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/pcplan/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search pcplan", `${webAdminUrl}/pcplan${textGetSearch}`);
        });

        checkboxAll('#procurementPlanCheckboxAll','.procurementPlanCheckbox');
        deleteAll('#deletePCPlan','.procurementPlanCheckbox',(data)=>{
            addFlashSession('success',`Xóa kế hoạch mua sắm thành công`);
            dt.draw();
        });
        updateSettingPCPlan('#frmSettingPCPlan')
        cb();
    }
}

const loadTablePCPlanDetail = (table = '#pcplandetail') => {
    let pLId = $(table).attr('data-id');
    pLId = pLId ? pLId : 0;
    let typeForm = $('#frmPCPlan').attr('data-type');
    let perEdit = $('#frmPCPlan').attr('peredit');
    if ($(table).length) {
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
            "ajax": `${webAdminUrl}/pcplan/getdatadetail/${pLId}${paramsUrl}`,
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
                    <input name="procurementPlanDetailCheckbox[]" class="procurementPlanDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                $(`td:eq(${fkeys.indexOf('expecteddate')})`, row).html(vi_moment(item.expecteddate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('unitprice')})`, row).html(item.unitprice ? numberFormat(item.unitprice) : '');
                $(`td:eq(${fkeys.indexOf('costs')})`, row).html(item.costs ? numberFormat(item.costs) : '');
                $('td:last', row).addClass('text-center').html(showActionDetailButton(item,'pcplan','PCPlanDetail',{u:true,v:true}));

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
            window.history.pushState({}, "Search pcplandetail", `${webAdminUrl}/pcplan/view${textGet}`);
        });

        // Show modal PCPlanDetail Add
        showModalForm('#addPCPlanDetail', '#modalPCPlanDetail', 'GET', () => {
            let className = 'PCPlanDetail';
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

        showModalForm(`.editPCPlanDetail,.viewPCPlanDetail`, '#modalPCPlanDetail', 'GET', (data) => {
            let className = 'PCPlanDetail';
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
            Swal.fire({
                position: 'top',
                type: 'success',
                title: 'Cập nhật thành công',
                showConfirmButton: false,
                timer: 1500
            })
        });

        checkboxAll('#procurementPlanDetailCheckboxAll','.procurementPlanDetailCheckbox');
        deleteAll('#deletePCPlanDetail','.procurementPlanDetailCheckbox',(data)=>{
            addFlashSession('success',`Xóa chi tiết kế hoạch thành công`);
            dt.draw();
        });
        updateSettingPCPlanDetail('#frmSettingPCPlanDetail')
    }
    // select2Loader();
}

const updatePCPlan = (form) => {
    if ($(form).length) {
        let typeForm = $('#frmPCPlan').attr('data-type');
        let perEdit = $('#frmPCPlan').attr('peredit');
        if (typeForm == 'edit') {
            $('#procurementPlanDetailCheckboxAll').prop('disabled',false)
            $('#addPCPlanDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deletePCPlanDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#procurementPlanDetailCheckboxAll').prop('disabled',true);
            $('#addPCPlanDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deletePCPlanDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }
        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }


        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/pcplan/view/${data.id}`).then(() => {
                updatePCPlan('#frmPCPlan');
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

        loadTablePCPlanDetail('#pcplandetail');

        $('#quantity, #unitprice').unbind('change').change(function (e) { 
            e.preventDefault();
            let quantity = floatFormat($('#quantity').val());
            let unitprice = floatFormat($('#unitprice').val());
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

const updateSettingPCPlan = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'typeid'];
        let tableField = ['number','deptname','year','reason','createdat','note'];
        showModalForm('#settingPCPlan', '#modalSettingPCPlan', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/pcplan`).then(() => {
                loadTablePCPlan('#pcplan');
                updateSettingPCPlan('#frmSettingPCPlan');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingPCPlanDetail = (form) => {
    if ($(form).length) {
        let filterField = ['name', 'typeid'];
        let tableField = ['name','typename','specifications','expecteddate','purchasename','quantity','unitprice','costs','note'];
        showModalForm('#settingPCPlanDetail', '#modalSettingPCPlanDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let pcplanId = $('#settingPCPlanDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/pcplan/view/${pcplanId}`).then(() => {
                updatePCPlan('#frmPCPlan');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updatePCPlan('#frmPCPlan');

loadTablePCPlan('#pcplan');