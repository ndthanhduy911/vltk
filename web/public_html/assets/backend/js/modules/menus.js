//Datatable cho bảng categories
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

const loadTableMenuLocation = () => {
    if ($('#menulocation').length) {
        let dt = $('#menulocation').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": backendUrl+"/menu/getdatalocation",
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "name"
                },
                {
                    "data": "description"
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
                $('td:eq(3)', row).html(showStatus(item.status));
                $('td:eq(4)', row).addClass('text-nowrap');
                $('td:eq(4)', row).html(`<a href="${backendUrl}/menu/updatelocation/${item.id}" class="fa fa-pencil btn btn-info btn-sm editLocation" title="Cập nhật"></a>`);
                $('td:eq(4)', row).append(`<a href="#" data-href="${backendUrl}/menu/deletelocation/${item.id}" class="fa fa-trash btn btn-danger btn-sm deleteLocation" title="Xóa"></a>`);

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
        showConfrimDelete('.deleteLocation',()=>{
            dt.draw();
        })
    }
}

const loadTableMenu = () => {
    if ($('#menus').length) {
        let dt = $('#menus').DataTable({
            "bInfo" : false,
            "paging":   false,
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "searching": false,
            "ajax": backendUrl+"/menu/getdata",
            "columns": [
                {
                    "data": "menu_name"
                },
                {
                    "data": "null"
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
                $('td:eq(2)', row).html(showStatus(item.status));
                $('td:eq(3)', row).html(`
                    <a href="${backendUrl}/menu/update/${item.id}" class="fa fa-pencil btn btn-info btn-sm editMenu" title="Cập nhật"></a>
                `);

                $('td:eq(3)', row).append(`<a href="#" data-href="${backendUrl}/menu/delete/${item.id}" class="fa fa-trash btn btn-danger btn-sm deleteMenu" title="Xóa"></a>`);
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
        showConfrimDelete('.deleteMenu',()=>{
            dt.draw();
        })
    }
}

loadTableMenuLocation();

loadTableMenu();

changeTitleToSlug('#title', '#slug');