//Datatable cho bảng history

const showStatusAsset = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `<span class="badge badge-success p-1">Tốt</span>`;
        case 2:
            return `<span class="badge badge-danger p-1">Hỏng</span>`;
        default:
            return `<span class="badge badge-warning p-1">Không có</span>`;
    }
}

const showHTypeHistory = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `Nhập mới`;
        case 2:
            return `Xuất`;
        case 3:
            return `Sử dụng`;
        case 5:
            return `Đánh giá`;
        case 6:
            return `Ghi tăng`;
        case 7:
            return `Ghi giảm`;
        case 8:
            return `Khấu hao, hao mòn`;
        case 10:
            return `Điều chuyển`;
        case 11:
            return `Thu hồi`;
        case 12:
            return `Kiểm kê`;
        default:
            return `Khác`;
    }
}

const showHNumber = (item) => {
    switch (parseInt(item.typelog)) {
        case 1:
            return item.cinumber;//Nhập
        case 2:
            return item.conumber;//Xuất
        case 3:
            return ``;//Sử dụng
        case 5:
            return item.esnumber;//Đánh giá
        case 6:
            return item.aunumber;//Đánh giá
        case 7:
            return item.renumber;//Ghi giảm
        case 8:
            return item.adnumber;//Khấu hao, hao mòn
        case 10:
            return item.tfnumber;//Điều chuyển
        case 11:
            return item.rvnumber;//Thu hồi
        case 12:
            return item.invnumber;//Kiểm kê
        default:
            return `Khác`;
    }
}

const loadTableHistory = (table = 'history', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchHistory');
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
            "ajax": `${webAdminUrl}/history/getdata?${paramsUrl}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).addClass('text-center');
                $(`td:eq(${fkeys.indexOf('typelog')})`, row).addClass('text-center').html(showHTypeHistory(item.typelog));
                $(`td:eq(${fkeys.indexOf('hrnumber')})`, row).html(showHNumber(item))
                $(`td:eq(${fkeys.indexOf('aplieddate')})`, row).addClass('text-center').html(vi_moment(item.aplieddate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center').html(1);
                $(`td:eq(${fkeys.indexOf('status')})`, row).addClass('text-center').html(showStatusAsset(item.status));
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
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            let textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search history", `${webAdminUrl}/history${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/history/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search history", `${webAdminUrl}/history${textGetSearch}`);
        });

        updateSettingHistory('#frmSettingHistory');

        cb();
    }
}

const updateSettingHistory = (form) => {
    if ($(form).length) {
        let filterField = ['typelog', 'deptid', 'sdate','edate'];
        let tableField = ['typelog','aplieddate','hrnumber','code','deptname','employeename','quantity','status'];
        showModalForm('#settingHistory', '#modalSettingHistory', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/revoke`).then(() => {
                loadTableHistory('#revoke');
                updateSettingHistory('#frmSettingHistory');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

loadTableHistory('#history');