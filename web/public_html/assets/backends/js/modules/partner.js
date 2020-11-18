//Datatable cho bảng partner
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
    if ($('#partner').length) {
        let dt = $('#partner').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "pageLength": 25,
            "ajax": backendUrl+"/partner/getdata",
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "image"
                },
                {
                    "data": "title"
                },
                {
                    "data": "createdat"
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
                let image = `<img src="${getPathImage(item.image, '/assets/frontend/images/defaut_img.png')}" width="50px">`;
                $('td', row).addClass('align-middle');
                $('td:eq(1)', row).html(image);
                $('td:eq(3)', row).html(vi_moment(item.createdat, 'DD/MM/YYYY HH:mm'));
                $('td:eq(4)', row).html(showStatus(item.status));
                $('td:eq(5)', row).html(`
                    <a href="${backendUrl}/partner/update/${item.id}" class="fa fa-pencil btn btn-info btn-sm editPage" title="Cập nhật"></a>
                `);
                $('td:eq(5)', row).append(`<a href="#" data-href="${backendUrl}/partner/delete/${item.id}" class="fa fa-trash btn btn-danger btn-sm deletePartner" title="Xóa"></a>`);
                
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
        showConfrimDelete('.deletePartner',()=>{
            dt.draw();
        })
    }
}

loadTablePages();

changeTitleToSlug('#title', '#slug');

showSelectImage('#uploadImage','#showImg','#image');