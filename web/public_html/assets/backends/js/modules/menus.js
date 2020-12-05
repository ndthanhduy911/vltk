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
    if ($('#menuslocation').length) {
        let dt = $('#menuslocation').DataTable({
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "pageLength": 25,
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
        let formSearch = $('#searchMenu');
        let dataLoadSearch = formSearch.serializeArray();
        let textGet = "?";
        dataLoadSearch.forEach((element, index) => {
            textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
        });
        let dt = $('#menus').DataTable({
            "bInfo" : false,
            "paging":   false,
            "scrollX": true,
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "pageLength": 25,
            "iDisplayLength": 'all',
            // "searching": false,
            "ajax": `${backendUrl}/menu/getdata${textGet}`,
            "columns": [
                {
                    "data": "menu_name"
                },
                {
                    "data": "status"
                },
                {
                    "data": null
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                $(row).addClass('text-center bg-warning text-white');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).addClass('text-left');                
                if(item.parentid){
                    $('td:eq(0)', row).html('---'+item.menu_name);
                }
                $('td:eq(1)', row).html(showStatus(item.status));
                $('td:eq(2)', row).html(`
                    <a href="${backendUrl}/menu/update/${item.locationid}?id=${item.id}" class="fa fa-pencil btn btn-info btn-sm editMenu" title="Cập nhật"></a>
                `);

                $('td:eq(2)', row).append(`<a href="#" data-href="${backendUrl}/menu/delete/${item.id}" class="fa fa-trash btn btn-danger btn-sm deleteMenu" title="Xóa"></a>`);

                $.ajax({
                    type: "GET",
                    url: `${backendUrl}/menu/getdatachild/${item.id}`,
                    data: null,
                    dataType: "json",
                    success: function (response) {
                        let menus = response.menus;                        
                        menus.forEach(menu => {
                            let newRow = $(row).clone();
                            $(newRow).removeClass('bg-warning text-white');
                            $('td:eq(1)', newRow).html(showStatus(menu.status));
                            $('td:eq(2)', newRow).html(`
                                <a href="${backendUrl}/menu/update/${menu.locationid}?id=${menu.id}" class="fa fa-pencil btn btn-info btn-sm editMenu" title="Cập nhật"></a>
                            `);
                            $('td:eq(0)', newRow).html('---'+menu.menu_name);
            
                            $('td:eq(2)', newRow).append(`<a href="#" data-href="${backendUrl}/menu/delete/${menu.id}" class="fa fa-trash btn btn-danger btn-sm deleteMenu" title="Xóa"></a>`);
                            $(newRow).insertAfter(row);
                        });
                    }
                });
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
        });
        
        $('#menuLocationId').change(function (e) { 
            e.preventDefault();
            let data = formSearch.serializeArray();
            $('#addMenu').attr('href',`${backendUrl}/menu/update/${$(this).val()}`);
            textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            dt.ajax.url( `${backendUrl}/menu/getdata${textGet}` ).load();
            window.history.pushState({}, "Search group", `${backendUrl}/menu${textGet}`);
        });
    }
}

loadTableMenu();

loadTableMenuLocation();

changeTitleToSlug('#title', '#slug');

$('#frmMenus .typeSeleted.hidden').find('select, input').attr('disabled', true).attr('required', false);

$('#frmMenus #type').change(function (e) { 
    e.preventDefault();
    let type = $(this).val();
    $(`#frmMenus .typeSeleted[data-type="${type}"]`).removeClass('hidden').find('select, input').attr('disabled', false).attr('required', true);
    $(`#frmMenus .typeSeleted:not([data-type="${type}"])`).addClass('hidden').find('select, input').attr('disabled', true).attr('required', false);
});

$("#postid").select2({
    placeholder: "Chọn bài viết",
});

$("#pageid").select2({
    placeholder: "Chọn trang",
});

$("#catid").select2({
    placeholder: "Chọn danh mục",
});

$("#depts").select2({
    placeholder: "Chọn bộ môn",
});

