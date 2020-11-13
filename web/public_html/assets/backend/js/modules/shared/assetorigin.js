//Datatable cho bảng assetorigin
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

const loadTableAssetOrigin = (table = 'assetorigin', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchAssetOrigin');
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
            "ajax": `${webAdminUrl}/assetorigin/getdata${textGet}`,
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
                    "data": "id"
                },
                {
                    "data": "name"
                },
                {
                    "data": "note"
                },
                {
                    "data": "createdat"
                },
                {
                    "data": "updatedat"
                },
                {
                    "data": "no"
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:eq(1),td:eq(6)', row).addClass('text-center');
                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
                if(!item.private['u']){
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                }

                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="assetOriginCheckbox[]" class="assetOriginCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td:eq(4)', row).html(vi_moment(item.createdat));
                $('td:eq(5)', row).html(vi_moment(item.updatedat));
                $('td:eq(6)', row).html(showActionButton(item,'assetorigin','AssetOrigin'));
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

        showModalForm(`.editAssetOrigin`, '#modalAssetOrigin', 'GET', (data) => {
            $('#btnSummitAssetOrigin span').html('Cập nhật');
            $('#modalAssetOrigin .modal-title').html('Cập nhật');
            $('#modalAssetOrigin').validator('update');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        // Show modal AssetOrigin Import
        showModalForm('#importAssetOrigin', '#modalAssetOriginImport', 'POST', () => {
            $('#modalAssetOriginImport .modal-title').html('Nhập nguồn gốc hình thành');
            $('#btnSummitAssetOriginImport span').html('Tải lên');
            let filename = $('#modalAssetOriginImport form').find('#importassetfile');
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

        // Show modal AssetOrigin Add
        showModalForm('#addAssetOrigin', '#modalAssetOrigin', 'GET', () => {
            $('#modalAssetOrigin .modal-title').html('Thêm mới nguồn gốc hình thành');
            $('#btnSummitAssetOrigin span').html('Thêm mới');
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
            window.history.pushState({}, "Search assetorigin", `${webAdminUrl}/assetorigin${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/assetorigin/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search assetorigin", `${webAdminUrl}/assetorigin${textGetSearch}`);
        });

        checkboxAll('#assetOriginCheckboxAll','.assetOriginCheckbox');
        deleteAll('#deleteAssetOrigin','.assetOriginCheckbox',(data)=>{
            showSweetAlertOk('Xóa thành công');
            dt.draw();
        });
        
        showConfrim('.deleteAssetOrigin',()=>{
            dt.draw();
        });
        cb();
    }
}

loadTableAssetOrigin('#assetorigin');