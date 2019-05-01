//Datatable cho bảng posts
const showStatus = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-2">Dừng</span>`;
        case 1:
            return `<span class="badge badge-success p-2">Sử dụng</span>`;
        default:
            return `<span class="badge badge-warning p-2">Chờ</span>`;
    }
}

const loadTablePosts = () => {
    if ($('#posts').length) {
        let dt = $('#posts').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": backendUrl+"/posts/getdata",
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "title"
                },
                {
                    "data": "author_name"
                },
                {
                    "data": "created_at"
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
                $('td:eq(3)', row).html(vi_moment(item.created_at, 'DD/MM/YYYY HH:mm'));
                $('td:eq(4)', row).html(showStatus(item.status));
                $('td:eq(5)', row).html(`
                    <a href="${backendUrl}/posts/update/${item.id}" class="fa fa-pencil btn btn-info btn-sm editUser" title="Cập nhật"></a>
                    <a href="${backendUrl}/posts/delete/${item.id}" class="fa fa-trash btn btn-danger btn-sm" title="Xóa"></a>
                `);
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
    }
}

loadTablePosts();
showSelectImage('#addImage','#showImg','#modalImg');