//Datatable cho bảng users
const showStatus = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-2">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-2">Sử dụng</span>`;
        default:
            return `<span class="badge badge-warning p-2">Chờ</span>`;
    }
}

const loadTableUsers = () => {
    if ($('#users').length) {
        let dt = $('#users').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": backendUrl+"/users/getdata",
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "name"
                },
                {
                    "data": "avatar"
                },
                {
                    "data": "username"
                },
                {
                    "data": "email"
                },
                {
                    "data": "phone"
                },
                {
                    "data": "dept_name"
                },
                {
                    "data": "role_name",
                },
                {
                    "data": "status",
                },
                {
                    "data": null
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(8)', row).html(showStatus(item.status));
                $('td:eq(9)', row).html(`
                    <a href="${backendUrl}/users/update/${item.id}" data-get="" class="fa fa-pencil btn btn-info btn-sm editUser" title="Cập nhật"></a>
                `);
                if(parseInt(item.id) !== 1){
                    $('td:eq(9)', row).append(`<a href="#" data-href="${backendUrl}/users/delete/${item.id}" class="fa fa-trash btn btn-danger btn-sm deleteUser" title="Xóa"></a>`);
                }
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

        // showModalBasic({element : 'User', modal : '#modalUser', title : 'tài khoản'}, dt)
        
        showConfrimDelete('.deleteUser',()=>{
            dt.draw();
        })
    }
}

loadTableUsers();