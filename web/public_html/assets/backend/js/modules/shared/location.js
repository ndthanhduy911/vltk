//Datatable cho bảng location
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

const getActionLocation = (item) => {
    let buttonEdit = false;
    let buttonDelete = false;
    if(item.private['update'] || item.private['d']){
        if (item.private['update']) {
            buttonEdit = `<a data-href="${webAdminUrl}/location/update/${item.id}" data-get="${webAdminUrl}/location/getsingle/${item.id}" href="#" class="btn btn-hnn btn-hnn-info editLocation" data-toggle="tooltip" title="Cập nhật"><span><i class="fas fa-pencil-alt"></i></span></a>`
        }
    }

    let buttonAction = `
    <div class="btn-group btn-group-sm">
        ${buttonEdit}
        ${buttonDelete}
    </div>`;
    
    return buttonDelete && buttonEdit ? buttonAction : false; 
}


const loadTableLocation = (table = 'location', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchLocation');
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
            "ajax": `${webAdminUrl}/location/getdata${textGet}`,
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
                    "data": "address"
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
                $('td:eq(0),td:eq(1),td:eq(7)', row).addClass('text-center');
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
                    <input name="locationCheckbox[]" class="locationCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td:eq(5)', row).html(vi_moment(item.createdat));
                $('td:eq(6)', row).html(vi_moment(item.updatedat));
                $('td:eq(7)', row).html(showActionButton(item,'location','Location'));
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

        showModalForm(`.editLocation`, '#modalLocation', 'GET', (data) => {
            $('#btnSummitLocation span').html('Cập nhật');
            $('#modalLocation .modal-title').html('Cập nhật');
            $('#modalLocation').validator('update');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        // Show modal Location Import
        showModalForm('#importLocation', '#modalLocationImport', 'POST', () => {
            $('#modalLocationImport .modal-title').html('Nhập địa điểm');
            $('#btnSummitLocationImport span').html('Tải lên');
            addFlashSession('success','Tải lên dữ liệu thành công');
            let filename = $('#modalLocationImport form').find('#importassetfile');
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

        // Show modal Location Add
        showModalForm('#addLocation', '#modalLocation', 'GET', () => {
            $('#modalLocation .modal-title').html('Thêm mới địa điểm');
            $('#btnSummitLocation span').html('Thêm mới');
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
            window.history.pushState({}, "Search location", `${webAdminUrl}/location${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/location/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search location", `${webAdminUrl}/location${textGetSearch}`);
        });

        checkboxAll('#locationCheckboxAll','.locationCheckbox');
        deleteAll('#deleteLocation','.locationCheckbox',(data)=>{
            showSweetAlertOk('Xóa thành công');
            dt.draw();
        });
        showConfrim('.deleteLocation',()=>{
            dt.draw();
        });
        cb();
    }
}

loadTableLocation('#location');