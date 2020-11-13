//Datatable cho bảng fixedbook

const showStatusDeAsset = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showActionButtonDeAsset = (item) => {
    if(parseInt(item.status)){
        return showActionButton(item, 'fixedbook','DeAsset',{v:true},true)
    }else{
        return showActionButton(item, 'fixedbook','DeAsset',{u:true,l:true},true)
    }
}

const loadTableDeAsset = (table = 'fixedbook', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchDeAsset');
        let paramsUrl = getParams();
        let paged = getParams('paged')
        paged = paged ? paged : 0;
        

        let dt = $(table).DataTable({
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": `${webAdminUrl}/fixedbook/getdata?${paramsUrl}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": [
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'},
                {data: 'no'}
            ],
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle text-center');
     
                let action = showActionButtonDeAsset(item,'fixedbook','DeAsset');
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
            window.history.pushState({}, "Search fixedbook", `${webAdminUrl}/fixedbook${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/fixedbook/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search fixedbook", `${webAdminUrl}/fixedbook${textGetSearch}`);
        });

        cb();
    }
}

loadTableDeAsset('#fixedbook');