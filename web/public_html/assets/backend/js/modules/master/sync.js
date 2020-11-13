const showStatusSync = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showActionButtonSync = (item) => {
    if(parseInt(item.status)){
        return showActionButton(item, 'sync','Sync',{v:true,p:true},true)
    }else{
        return showActionButton(item, 'sync','Sync',{u:true,l:true,p:true},true)
    }
}

const loadTableSync = (table = 'sync', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchSync');
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
            "ajax": `${webAdminUrl}/sync/getdata?${paramsUrl}`,
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
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="syncCheckbox[]" class="syncCheckbox" type="checkbox" value="${item.id}">
                `)
                $(`td:eq(${fkeys.indexOf('createdat')})`, row).addClass('text-center').html(vi_moment(item.createdat,'DD/MM/YYYY HH:mm'));
                $(`td:eq(${fkeys.indexOf('updatedat')})`, row).addClass('text-center').html(vi_moment(item.updatedat,'DD/MM/YYYY HH:mm'));
                // $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('sync',item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
                let action = showActionButtonSync(item,'sync','Sync');
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

        singleLoadPage(`${table} tbody .editSync,${table} tbody .viewSync`).then(()=>{
            updateSync('#frmSync');
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
            window.history.pushState({}, "Search sync", `${webAdminUrl}/sync${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/sync/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search sync", `${webAdminUrl}/sync${textGetSearch}`);
        });

        checkboxAll('#syncCheckboxAll','.syncCheckbox');
        deleteAll('#deleteSync','.syncCheckbox',(data)=>{
            showSweetAlertOk('Xóa dữ liệu thành công');
            dt.draw();
        });

        showConfrim('#lockSync',()=>{
            dt.draw();
            showSweetAlertOk(`Khóa dữ liệu thành công`);
        },'Nếu chọn “Đồng ý”, tất cả thông tin dữ liệu sẽ không được phép thay đổi và làm thay đổi thông tin tài sản sử dụng tương ứng. Anh/Chị muốn thực hiện thao tác này?')


        addSync('#frmAddSync',(data)=>{
            showSweetAlertOk("Nhập dữ liệu thành công");
            dt.draw();
        });

        cb();
    }
}

const loadTableSyncDetail = (table = '#syncdetail') => {
    let iId = $(table).attr('data-id');
    iId = iId ? iId : 0;
    let typeForm = $('#frmSync').attr('data-type')
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
            "ajax": `${webAdminUrl}/sync/getdatadetail/${iId}?${paramsUrl}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="syncDetailCheckbox[]" class="syncDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');

                $(`td:eq(${fkeys.indexOf('disfactor')})`, row).html(numberFormat(item.disfactor,2));

                $(`td:eq(${fkeys.indexOf('defactor')})`, row).html(numberFormat(item.defactor,2));

                $(`td:eq(${fkeys.indexOf('costs')})`, row).html(numberFormat(item.costs));

                $(`td:eq(${fkeys.indexOf('decosts')})`, row).html(numberFormat(item.decosts));

                $(`td:eq(${fkeys.indexOf('discosts')})`, row).html(numberFormat(item.discosts));

                $(`td:eq(${fkeys.indexOf('ddcosts')})`, row).html(numberFormat(item.ddcosts));

                $(`td:eq(${fkeys.indexOf('accumulated')})`, row).html(numberFormat(item.accumulated));

                $(`td:eq(${fkeys.indexOf('quantityreal')})`, row).html(numberFormat(item.quantityreal));

                $(`td:eq(${fkeys.indexOf('restcosts')})`, row).html(parseInt(item.restcosts) ? numberFormat(item.restcosts) : "");

                $(`td:eq(${fkeys.indexOf('audate')})`, row).html(vi_moment(item.audate,'DD/MM/YYYY'));

                $(`td:eq(${fkeys.indexOf('redate')})`, row).html(vi_moment(item.redate,'DD/MM/YYYY'));

                $('td:last', row).html(showActionDetailButton(item,'sync','SyncDetail',{u:true}));

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
            window.history.pushState({}, "Search syncdetail", `${webAdminUrl}/sync/view${textGet}`);
        });

        // Show modal SyncDetail Add
        $('#addSyncDetail').unbind('click').click(function (e) { 
            e.preventDefault();
            showModalNotSm('#modalSyncDetailMore','#frmSyncDetailMore',()=>{
                $('#modalSyncDetailMore .modal-title').html('Thêm chi tiết tài sản');
                let deptId = $('#deptid').val();
                if(deptId){
                    loadTableSyncDetailMore('#syncDetailMore', deptId, iId);
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

        showModalForm(`.editSyncDetail`, '#modalSyncDetail', 'GET', (data) => {
            $('#btnSyncDetail span').html('Cập nhật');
            $('#modalSyncDetail .modal-title').html('Cập nhật tài sản');
            $('.numberPrice').trigger('change');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        showModalForm(`.viewDetail`, '#modalViewDetail', 'GET', (data) => {
            $('#modalViewDetail .modal-title').html('Thông tin tài sản');
            showViewGallery('#detail-img','checkindetail', isJson(data.image) ? JSON.parse(data.image) : data.image);
        });

        checkboxAll('#syncDetailCheckboxAll','.syncDetailCheckbox');
        deleteAll('#deleteSyncDetail','.syncDetailCheckbox',(data)=>{
            showSweetAlertOk('Xóa tài sản chi tiết thành công');
            dt.draw();
        });
    }
}

const updateSync = (form) => {
    if ($(form).length) {
        let typeForm = $(form).attr('data-type');
        let perEdit = $(form).attr('peredit');
        if (typeForm == 'edit') {
            $('#syncDetailCheckboxAll').prop('disabled',false);
            $('#addSyncDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteSyncDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#syncDetailCheckboxAll').prop('disabled',true);
            $('#addSyncDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteSyncDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }

        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }

        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/sync/view/${data.id}`).then(() => {
                updateSync('#frmSync');
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
        loadTableSyncDetail('#syncdetail');

        showConfrim('#lockSync', () => {
            let syncId = $('#lockSync').data('id');
            LoadPage(`${webAdminUrl}/sync/view/${syncId}`).then(() => {
                updateSync('#frmSync');
            });
            showSweetAlertOk("Khóa thông tin thành công");
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin dữ liệu sẽ không được phép thay đổi. Anh/Chị muốn thực hiện thao tác này?')
    }
}
updateSync('#frmSync');

const addSync = (form,cb=()=>{}) => {
    if ($(form).length) {
        sendAjax(form, "POST").then((result) => {
            cb(result);
        });
    }
}

loadTableSync('#sync');