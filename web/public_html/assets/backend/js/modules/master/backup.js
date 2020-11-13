const loadTableAssetOrigin = (table = 'backup', cb = () => {}) => {
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
            "ajax": `${webAdminUrl}/backup/getdata${textGet}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": [
                {
                    "data": "id"
                },
                {
                    "data": "createdat"
                },
                {
                    "data": "filename"
                },
                {
                    "data": "filesize"
                },
                {
                    "data": "downloads"
                },
                {
                    "data": "id"
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:eq(5)', row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(1)', row).html(vi_moment(item.createdat));
                $('td:eq(3)', row).html( item.filesize ? Math.round(item.filesize/1024/1024*100)/100 + ' MB' : 0);
                showDownoads(item.id,$('td:eq(4)', row).addClass('text-center'));
                $('td:eq(5)', row).html(`<a href="${webAdminUrl}/backup/download/${item.id}"><i class="fa fa-download" aria-hidden="true"></i></a> `);
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
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search backup", `${webAdminUrl}/backup${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/backup/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search backup", `${webAdminUrl}/backup${textGetSearch}`);
        });
        cb();
    }
}

const updateBackup = (form) => {
    if ($(form).length) {
        
        loadTableAssetOrigin('#backup');
        if($('#is_enable_backup').is(':checked')){
            $(form).find(`input:not(#is_enable_backup), select`).prop('disabled', false);
        }else{
            $(form).find('input:not(#is_enable_backup), select').prop('disabled', true);
        }
        $('#is_enable_backup').change(function (e) { 
            e.preventDefault();
            if($(this).is(':checked')){
                $(form).find(`input:not(#is_enable_backup), select`).prop('disabled', false);
            }else{
                $(form).find(`input:not(#is_enable_backup), select`).prop('disabled', true);
            }
        });
        
        let time = $(`[name="period_value[hour]"]`).val();
        $('.timePicker').wickedpicker({
            title: 'Chọn thời gian',
            twentyFour: true,
            now : time
        });

        sendAjax(form, "POST").then((result) => {
            LoadPage(`${webAdminUrl}/backup`).then(() => {
                showSweetAlertOk("Lưu thiết lập thành công");
                updateBackup('#frmBackup');
            });
        });
    }
}

const showDownoads = (id = 0, row) => {
    apiGetDownloads(id).then(data => {
        if(data.length){
            let sum = data.reduce(function (accumulator, currentValue) {
                return accumulator + currentValue.downloads;
            },'')
            let text = `
                <div class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <span class="badge badge-danger mr-auto ml-auto">${sum}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="min-width: 300px; overflow-y: auto; height: 150px">
            `;

            data.forEach((user) => {
                text += `
                    <div class="dropdown-item">
                        <div class="media d-flex justify-content-between align-items-center">
                            <img src="${user.avatar ? user.avatar : '/img/avatar.png'}" alt="${user.fname}" class="mr-3 img-circle" style="width: 30px">
                            <div class="media-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h3 class="dropdown-item-title">${user.fname}</h3>
                                    <div>
                                        <span class="badge badge-danger">${user.downloads}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown-divider"></div>
                `;
            });
            text+=`
                    </div>
                </div>
            `
            row.html(text)
        }else{
            row.html(`
                <span class="badge badge-danger mr-auto ml-auto">0</span>
            `)
        }

    });
}

updateBackup('#frmBackup');

const updateSync = (form) => {
    if ($(form).length) {
        sendAjax(form, "POST").then((result) => {
            LoadPage(`${webAdminUrl}/backup/sync`).then(() => {
                showSweetAlertOk("Nhập dữ liệu thành công");
                updateSync(form);
            });
        });
    }
}

updateSync('#frmSync');

showConfrim('#restoreSync',()=>{
    showSweetAlertOk(`Xóa dữ liệu thành công`);
},'Nếu chọn “Đồng ý”, tất cả tài sản đang có trên hệ thống sẽ bị xóa và không thể khôi phục lại. Anh/Chị muốn thực hiện thao tác này?')