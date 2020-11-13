//Datatable cho bảng pages
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

const loadTablePages = () => {
    if ($('#pages').length) {
        let dt = $('#pages').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "pageLength": 25,
            "ajax": backendUrl+"/pages/getdata",
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "title"
                },
                {
                    "data": "excerpt"
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
                    <a href="${backendUrl}/pages/update/${item.id}" class="fa fa-pencil btn btn-info btn-sm editPage" title="Cập nhật"></a>
                `);
                $('td:eq(5)', row).append(`<a href="#" data-href="${backendUrl}/pages/delete/${item.id}" class="fa fa-trash btn btn-danger btn-sm deletePage" title="Xóa"></a>`);
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
        showConfrimDelete('.deletePage',()=>{
            dt.draw();
        })
    }
}

loadTablePages();

changeTitleToSlug('#title', '#slug');

showSelectImage('#uploadImage','#showImg','#featured_image', '#removeImage');

showSelectImage('#uploadBackgroundImage','#showBackgroundImg','#background_image', '#removeBackgroundImage');
