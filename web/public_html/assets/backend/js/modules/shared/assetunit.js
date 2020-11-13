//Datatable cho bảng assetunit
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

const getActionAssetUnit = (item) => {
    let buttonEdit = false;
    let buttonDelete = false;
    if(item.private['update'] || item.private['d']){
        if (item.private['update']) {
            buttonEdit = `<a data-href="${webAdminUrl}/assetunit/update/${item.id}" data-get="${webAdminUrl}/assetunit/getsingle/${item.id}" href="#" class="btn btn-hnn btn-hnn-info editAssetUnit" data-toggle="tooltip" title="Cập nhật"><span><i class="fas fa-pencil-alt"></i></span></a>`
        }
    }

    let buttonAction = `
    <div class="btn-group btn-group-sm">
        ${buttonEdit}
        ${buttonDelete}
    </div>`;
    
    return buttonDelete && buttonEdit ? buttonAction : false; 
}


const loadTableAssetUnit = (table = 'assetunit', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchAssetUnit');
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
            "ajax": `${webAdminUrl}/assetunit/getdata${textGet}`,
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
                $('td:eq(0),td:eq(1),td:eq(2),td:eq(6)', row).addClass('text-center');
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
                    <input name="assetUnitCheckbox[]" class="assetUnitCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td:eq(4)', row).html(vi_moment(item.createdat));
                $('td:eq(5)', row).html(vi_moment(item.updatedat));
                $('td:eq(6)', row).html(showActionButton(item,'assetunit','AssetUnit'));
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

        showModalForm(`.editAssetUnit`, '#modalAssetUnit', 'GET', (data) => {
            $('#btnSummitAssetUnit span').html('Cập nhật');
            $('#modalAssetUnit .modal-title').html('Cập nhật');
            $('#modalAssetUnit').validator('update');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        // Show modal AssetUnit Import
        showModalForm('#importAssetUnit', '#modalAssetUnitImport', 'POST', () => {
            $('#modalAssetUnitImport .modal-title').html('Nhập đơn vị tính');
            $('#btnSummitAssetUnitImport span').html('Tải lên');
            let filename = $('#modalAssetUnitImport form').find('#importassetfile');
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

        // Show modal AssetUnit Add
        showModalForm('#addAssetUnit', '#modalAssetUnit', 'GET', () => {
            $('#modalAssetUnit .modal-title').html('Thêm mới đơn vị tính');
            $('#btnSummitAssetUnit span').html('Thêm mới');
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
            window.history.pushState({}, "Search assetunit", `${webAdminUrl}/assetunit${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/assetunit/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search assetunit", `${webAdminUrl}/assetunit${textGetSearch}`);
        });

        checkboxAll('#assetUnitCheckboxAll','.assetUnitCheckbox');
        deleteAll('#deleteAssetUnit','.assetUnitCheckbox',(data)=>{
            showSweetAlertOk('Xóa thành công');
            dt.draw();
        });
        showConfrim('.deleteAssetUnit',()=>{
            dt.draw();
        });
        cb();
    }
}

loadTableAssetUnit('#assetunit');