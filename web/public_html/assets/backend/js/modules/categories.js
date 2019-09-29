//Datatable cho bảng categories
const showStatus = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-2">Dừng</span>`;
        case 1:
            return `<span class="badge badge-success p-2">Hiển thị</span>`;
        default:
            return `<span class="badge badge-warning p-2">Chờ</span>`;
    }
}

const loadTableCategories = () => {
    if ($('#categories').length) {
        let dt = $('#categories').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": backendUrl+"/categories/getdata",
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "dept_name"
                },
                {
                    "data": "name"
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
                $('td:eq(4)', row).html(vi_moment(item.created_at, 'DD/MM/YYYY HH:mm'));
                $('td:eq(5)', row).html(showStatus(item.status));
                $('td:eq(6)', row).html(`
                    <a href="${backendUrl}/categories/update/${item.id}" class="fa fa-pencil btn btn-info btn-sm editCat" title="Cập nhật"></a>
                `);
                // if(![1, 2, 3, 4, 5].includes(parseInt(item.id))){
                    $('td:eq(6)', row).append(`<a href="#" data-href="${backendUrl}/categories/delete/${item.id}" class="fa fa-trash btn btn-danger btn-sm deleteCat" title="Xóa"></a>`);
                // }
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
        showConfrimDelete('.deleteCat',()=>{
            dt.draw();
        })
    }
}

loadTableCategories();

changeTitleToSlug('#title', '#slug');