//Datatable cho bảng staff
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

const showDean = (dean = '') => {
    switch (parseInt(dean)) {
        case 1:
            return `<span class="badge badge-primary p-2">Trưởng khoa</span>`;
        case 2:
            return `<span class="badge badge-primary p-2">Phó trưởng khoa</span>`;
        default:
            return "";
    }
}

const showPosition = (pos = '') => {
    switch (parseInt(pos)) {
        case 1:
            return `<span class="badge badge-primary p-2">Trưởng bộ môn</span>`;
        case 2:
            return `<span class="badge badge-primary p-2">Phó bộ môn</span>`;
        case 3:
            return `<span class="badge badge-primary p-2">Giáo vụ</span>`;
        case 4:
            return `<span class="badge badge-primary p-2">Giảng viên</span>`;
        case 5:
            return `<span class="badge badge-primary p-2">Giảng viên thỉnh giản</span>`;
        case 6:
            return `<span class="badge badge-primary p-2">Nhân viên</span>`;
        default:
            return "";
    }
}

const loadTablePages = () => {
    if ($('#staff').length) {
        let dt = $('#staff').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": backendUrl+"/staff/getdata",
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
                    "data": null
                },
                {
                    "data": "dept_name"
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
                let image = `<img src="${getPathImage(item.featured_image, '/assets/frontend/images/defaut_img.png')}" width="50px">`;
                $('td:eq(1)', row).html(image);
                $('td', row).addClass('align-middle');
                $('td:eq(5)', row).html(showDean(item.dean)+showPosition(item.dept_position))
                $('td:eq(5)', row).html(vi_moment(item.created_at, 'DD/MM/YYYY HH:mm'));
                $('td:eq(6)', row).html(showStatus(item.status));
                $('td:eq(7)', row).html(`
                    <a href="${backendUrl}/staff/update/${item.id}" class="fa fa-pencil btn btn-info btn-sm editStaff" title="Cập nhật"></a>
                `);
                $('td:eq(7)', row).append(`<a href="#" data-href="${backendUrl}/staff/delete/${item.id}" class="fa fa-trash btn btn-danger btn-sm deleteStaff" title="Xóa"></a>`);
                
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

showSelectImage('#uploadImage','#showImg','#featured_image');