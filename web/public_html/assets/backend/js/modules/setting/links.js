//Datatable cho bảng links
const showStatus = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-2">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-2">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-2">Chờ</span>`;
    }
}

const loadTableLinks = () => {
    if ($('#links').length) {
        let dt = $('#links').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "pageLength": 25,
            "ajax": backendUrl+"/setting/getdatalinks",
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "name"
                },
                {
                    "data": "icon"
                },
                {
                    "data": "link"
                },
                {
                    "data": "sort"
                },
                {
                    "data": "status"
                },
                {
                    "data": null
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(2)', row).html(`<i class="fa ${item.icon ? item.icon : 'fa-image'}"></i>`);
                $('td:eq(5)', row).html(showStatus(item.status));
                $('td:eq(6)', row).html(`
                    <a href="${backendUrl}/setting/updatelink/${item.id}" class="fa fa-pencil btn btn-info btn-sm editLink" title="Cập nhật"></a>
                `);

                $('td:eq(6)', row).append(`<a href="#" data-href="${backendUrl}/setting/deletelink/${item.id}" class="fa fa-trash btn btn-danger btn-sm deleteLink" title="Xóa"></a>`);

            },
            "deferRender": true,
            "language": {
                "sProcessing": "Đang xử lý...",
                "sLengthMenu": "Xem _MENU_ mục",
                "sZeroRecords": "Không tìm thấy dữ liệu",
                "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
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
        showConfrimDelete('.deleteLink',()=>{
            dt.draw();
        })
    }
}

loadTableLinks();