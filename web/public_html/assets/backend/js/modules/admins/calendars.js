//Datatable cho bảng calendars
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

const showLocation = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `Cơ sở NVC`;
        case 2:
            return `Cơ sở LT`;
        default:
            return `Cơ sở khác`;
    }
}

const showYear = (year) => {
    year = parseInt(year);
    return year + ' - ' + (year+1)
}

const loadTablePages = () => {
    if ($('#calendars').length) {
        let dt = $('#calendars').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "pageLength": 25,
            "ajax": backendUrl+"/calendars/getdata",
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "subject_name"
                },
                {
                    "data": "year"
                },
                {
                    "data": "begin_date"
                },
                {
                    "data": "begin_time"
                },
                {
                    "data": "end_time"
                },
                {
                    "data": "location"
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
                $('td:eq(2)', row).html(item.semester+' ('+showYear(item.year) +')');
                $('td:eq(3)', row).html(vi_moment(item.begin_date, 'DD/MM/YYYY'));
                $('td:eq(4)', row).html(vi_moment_time(item.begin_time, 'HH:mm'));
                $('td:eq(5)', row).html(vi_moment_time(item.end_time, 'HH:mm'));
                $('td:eq(6)', row).html(showLocation(item.location)+' - ' + item.room);
                $('td:eq(7)', row).html(showStatus(item.status));
                $('td:eq(8)', row).html(`
                    <a href="${backendUrl}/calendars/update/${item.id}" class="fa fa-pencil btn btn-info btn-sm editPage" title="Cập nhật"></a>
                `);
                $('td:eq(8)', row).append(`<a href="#" data-href="${backendUrl}/calendars/delete/${item.id}" class="fa fa-trash btn btn-danger btn-sm deletePage" title="Xóa"></a>`);
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
