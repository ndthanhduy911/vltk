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
                    "data": "featured_image"
                },
                {
                    "data": "title"
                },
                {
                    "data": "cat_name"
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
                let image = item.featured_image ? `<img src="${item.featured_image}" width="50px">` : '';
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(1)', row).html(image);
                $('td:eq(5)', row).html(vi_moment(item.created_at, 'DD/MM/YYYY HH:mm'));
                $('td:eq(6)', row).html(showStatus(item.status));
                $('td:eq(7)', row).html(`
                    <a href="${backendUrl}/posts/update/${item.id}" class="fa fa-pencil btn btn-info btn-sm editPost" title="Cập nhật"></a>
                    <a href="#" data-href="${backendUrl}/posts/trash/${item.id}" class="fa fa-trash btn btn-danger btn-sm trashPost" title="Chuyển đến thùng rác"></a>
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

        showConfrimDelete('.trashPost',()=>{
            dt.draw();
        })
    }
}

const loadTablePostsTrash = () => {
    if ($('#posts_trash').length) {
        let dt = $('#posts_trash').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": backendUrl+"/posts/getdatatrash",
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "featured_image"
                },
                {
                    "data": "title"
                },
                {
                    "data": "cat_name"
                },
                {
                    "data": "author_name"
                },
                {
                    "data": "created_at"
                },
                {
                    "data": null
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                let image = item.featured_image ? `<img src="${item.featured_image}" width="50px">` : '';
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(1)', row).html(image);
                $('td:eq(5)', row).html(vi_moment(item.created_at, 'DD/MM/YYYY HH:mm'));
                $('td:eq(6)', row).html(`
                    <a href="#" data-href="${backendUrl}/posts/restore/${item.id}" class="fa fa-refresh btn btn-info btn-sm restorePost" title="Phục hồi"></a>
                    <a href="#" data-href="${backendUrl}/posts/delete/${item.id}" class="fa fa-remove btn btn-danger btn-sm deletePost" title="Xóa vĩnh viễn"></a>
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

        showConfrimDelete('.restorePost',()=>{
            dt.draw();
        })

        showConfrimDelete('.deletePost',()=>{
            dt.draw();
        })
    }
}

loadTablePosts();
loadTablePostsTrash();

showSelectImage('#uploadImage','#showImg','#featured_image');