//Datatable cho bảng logs
const showTypeLogs = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `<span class="badge badge-success p-1">Thêm mới</span>`;
        case 2:
            return `<span class="badge badge-info p-1">Cập nhật</span>`;
        case 3:
            return `<span class="badge badge-danger p-1">Xóa</span>`;
        case 4:
            return `<span class="badge badge-info p-1">Đăng nhập</span>`;
        case 5:
            return `<span class="badge badge-info p-1">Nhập (Import)</span>`;
        case 6:
            return `<span class="badge badge-info p-1">Khóa</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const loadTableLogs = (table = 'logs', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchLogs');
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
            "ajax": `${webAdminUrl}/logs/getdata${textGet}`,
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
                    "data": "type"
                },
                {
                    "data": "name"
                },
                {
                    "data": "username"
                },
                {
                    "data": "ip"
                },
                {
                    "data": "browser"
                },
                {
                    "data": "os"
                },
                {
                    "data": "createdat"
                },
            ],
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('text-center align-middle');
                $('td:eq(1)', row).html(showTypeLogs(item.type));
                $('td:eq(7)', row).html(vi_moment(item.createdat));
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
            window.history.pushState({}, "Search logs", `${webAdminUrl}/logs${textGet}`);
        } );

        formSearch.submit(function (e) { 
            e.preventDefault();
            let dataSearch = formSearch.serializeArray();
            let textGetSearch = "?paged=";
            dataSearch.forEach((element, index) => {
                if(element.name != "paged"){
                    textGetSearch += `&${element.name}=${element.value}`
                }
            })            
            window.location.href = textGetSearch;
        });

        cb();
    }
}

loadTableLogs('#logs');