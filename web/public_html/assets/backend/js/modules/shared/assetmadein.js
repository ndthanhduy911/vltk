//Datatable cho bảng assetmadein
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

const loadTableAssetMadeIn = (table = 'assetmadein', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchMadeIn');
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
            "ajax": `${webAdminUrl}/assetmadein/getdata${textGet}`,
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
                $('td:eq(0),td:eq(1),td:eq(4),td:eq(5),td:last', row).addClass('text-center');
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
                    <input name="assetMadeInCheckbox[]" class="assetMadeInCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td:eq(4)', row).html(vi_moment(item.createdat));
                $('td:eq(5)', row).html(vi_moment(item.updatedat));
                $('td:eq(6)', row).html(showActionButton(item,'assetmadein','AssetMadeIn'));
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

        showModalForm(`.editAssetMadeIn`, '#modalAssetMadeIn', 'GET', (data) => {
            $('#btnSummitAssetMadeIn span').html('Cập nhật');
            $('#modalAssetMadeIn .modal-title').html('Cập nhật');
            $('#modalAssetMadeIn').validator('update');
        },(data,row)=>{
            showSweetAlertOk('Cập nhật thành công');
            dt.draw();
        });

        // Show modal AssetMadeIn Import
        showModalForm('#importAssetMadeIn', '#modalAssetMadeInImport', 'POST', () => {
            $('#modalAssetMadeInImport .modal-title').html('Nhập nước sản xuất');
            $('#btnSummitAssetMadeInImport span').html('Tải lên');
            let filename = $('#modalAssetMadeInImport form').find('#importassetfile');
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

        // Show modal AssetMadeIn Add
        showModalForm('#addAssetMadeIn', '#modalAssetMadeIn', 'GET', () => {
            $('#modalAssetMadeIn .modal-title').html('Thêm mới nước sản xuất');
            $('#btnSummitAssetMadeIn span').html('Thêm mới');
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
            window.history.pushState({}, "Search assetmadein", `${webAdminUrl}/assetmadein${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/assetmadein/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search assetmadein", `${webAdminUrl}/assetmadein${textGetSearch}`);
        });

        checkboxAll('#assetMadeInCheckboxAll','.assetMadeInCheckbox');
        deleteAll('#deleteAssetMadeIn','.assetMadeInCheckbox',(data)=>{
            showSweetAlertOk('Xóa thành công');
            dt.draw();
        });
        cb();
    }
}

loadTableAssetMadeIn('#assetmadein');