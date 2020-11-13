//Datatable cho bảng supplier
const showStatus = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const loadTableSupplier = (table = '#supplier', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchSupplier');
        let dataLoadSearch = formSearch.serializeArray();
        let paged = formSearch.find('[name="paged"]').val();
        let textGet = "?";
        dataLoadSearch.forEach((element, index) => {
            textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
        });
        
        let dt = $(table).DataTable({
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": `${webAdminUrl}/supplier/getdata${textGet}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "no"
                },
                {
                    "data": "slcode"
                },
                {
                    "data": "tin"
                },
                {
                    "data": "name"
                },
                {
                    "data": "address"
                },
                {
                    "data": "email"
                },
                {
                    "data": "phone"
                },
                {
                    "data": "description"
                },
                {
                    "data": "no"
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:eq(1),td:last', row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="supplierCheckbox[]" class="supplierCheckbox" type="checkbox" value="${item.id}">
                `);
                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
                if(!item.private['u']){
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                }
                
                $('td:last', row).html(showActionButton(item,'supplier','Supplier'));
                
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

        showModalForm(`.editSupplier`, '#modalSupplier', 'GET', (data) => {
            $('#btnSummitSupplier span').html('Cập nhật');
            $('#modalSupplier .modal-title').html('Cập nhật');
            $('#modalSupplier').validator('update');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        // Show modal Supplier Import
        showModalForm('#importSupplier', '#modalSupplierImport', 'POST', () => {
            $('#modalSupplierImport .modal-title').html('Nhập Nhà cung cấp');
            $('#btnSummitSupplierImport span').html('Tải lên');
            let filename = $('#modalSupplierImport form').find('#importassetfile');
            checkUploadFile(filename, (/\.(xls|xlsx)$/i),(data)=>{
                if(!data.s){
                    $(data.this).val('');
                }
            })
        },(data,row)=>{
            dt.draw();
            addFlashSession('success','Tải lên dữ liệu thành công');
            $('body.modal-open').removeClass('modal-open');
            $('.modal-backdrop.fade.show').remove();
        });

        // Show modal Supplier Add
        showModalForm('#addSupplier', '#modalSupplier', 'GET', () => {
            $('#modalSupplier .modal-title').html('Thêm Nhà cung cấp');
            $('#btnSummitSupplier span').html('Thêm mới');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Thêm mới thành công');
        });

        $(table).on( 'page.dt', function (e) {
            e.preventDefault();
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search supplier", `${webAdminUrl}/supplier${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/supplier/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search supplier", `${webAdminUrl}/supplier${textGetSearch}`);
        });

        checkboxAll('#supplierCheckboxAll','.supplierCheckbox');
        deleteAll('#deleteSupplier','.supplierCheckbox',(data)=>{
            showSweetAlertOk('Xóa thành công');
            dt.draw();
        });
        cb();
    }
}

loadTableSupplier('#supplier');