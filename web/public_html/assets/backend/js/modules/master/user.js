//Datatable cho bảng user
const showStatusUser = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const loadTableUser = (table = 'user', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchUser');
        let dataLoadSearch = formSearch.serializeArray();
        let paged = formSearch.find('[name="paged"]').val();
        let textGet = "?";
        dataLoadSearch.forEach((element, index) => {
            textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
        });
        let dt = $(table).DataTable({
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": `${webAdminUrl}/user/getdata${textGet}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": [
                {
                    "data": "no"
                },
                {
                    "data": "no"
                },
                {
                    "data": "avatar"
                },
                {
                    "data": "username"
                },
                {
                    "data": "fullname"
                },
                {
                    "data": "email"
                },
                {
                    "data": "rolename",
                },
                {
                    "data": "status",
                },
                {
                    "data": null
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                let action = showActionButton(item,'user','User');
                $('td:eq(0),td:eq(1),td:eq(7),td:eq(8)',row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="userCheckbox[]" class="userCheckbox" type="checkbox" value="${item.id}">
                `)
                let avatar = item.avatar ? `<img width="30px" height="30px" src="/uploads/avatar/${item.avatar}" alt="${item.fullname}" class="img-circle">` : `<img width="30px" src="/img/avatar.png" alt="${item.fullname}" class="img-circle">`;                
                $('td:eq(2)', row).html(avatar);
                $('td:eq(7)', row).html(showStatusUser(item.status));
                $('td:eq(8)', row).addClass('text-nowrap').html(``);
                if(action){
                    $('td:eq(8)', row).addClass('text-nowrap').html(action);
                }else{
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                }

                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
            },
            "drawCallback": function (settings) {                
                $(table).find('[data-toggle="tooltip"]').tooltip()
            },
            "deferRender": true,
            "language": {
                "sProcessing": "Đang xử lý...",
                "sLengthMenu": "Xem _MENU_",
                "sZeroRecords": "Không tìm thấy dữ liệu",
                "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_",
                "sInfoEmpty": "",
                "sInfoFiltered": "(được lọc từ _MAX_)",
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

        formSearch.on('change','select', function (e) {
            if (e.isDefaultPrevented()) {
                // alert(0)
            } else {
                e.preventDefault();
                let data = formSearch.serializeArray();
                formSearch.find('[name="paged"]').val(0);
                textGet = "?";
                data.forEach((element, index) => {
                    textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                });
                dt.ajax.url( `${webAdminUrl}/user/getdata${textGet}` ).load();
                window.history.pushState({}, "Search user", `${webAdminUrl}/user${textGet}`);
            }
        });

        $(table).on( 'page.dt', function (e) {
            e.preventDefault();
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search user", `${webAdminUrl}/user${textGet}`);
        } );

        // Show modal User Add
        showModalForm('#addUser', '#modalUser', 'GET', () => {
            $('#modalUser .modal-title').html('Thêm mới');
            $('#btnSummitUser span').html('Thêm mới');
            $('#modalUser .rowPassword').removeClass('hidden');
            $('#modalUser .rowPassword input').attr('disabled', false);
            $('#modalUser .rowPassword input').attr('required', true);
        },(data,row)=>{
            dt.draw();
            Swal.fire({
                // position: 'top-end',
                type: 'success',
                title: 'Thêm mới thành công',
                showConfirmButton: false,
                timer: 1500
            })
        });

        // Show modal User Update
        showModalForm('.editUser', '#modalUser', 'GET', (data) => {
            $('#btnSummitUser span').html('Cập nhật');
            $('#modalUser .modal-title').html('Cập nhật');
            $('#modalUser .rowPassword').addClass('hidden');
            $('#modalUser .rowPassword input').attr('disabled', true);
            $('#modalUser .rowPassword input').attr('required', false);
            $('#modalUser').validator('update');

        },(data,row)=>{
            dt.draw();
            Swal.fire({
                // position: 'top-end',
                type: 'success',
                title: 'Cập nhật thành công',
                showConfirmButton: false,
                timer: 1500
            })
        });

        checkboxAll('#userCheckboxAll','.userCheckbox');
        deleteAll('#deleteUser', '.userCheckbox',(data) => {
            showSweetAlertOk('Xóa thành công');
            dt.draw()
        });

        formSearch.submit(function (e) { 
            e.preventDefault();
            let dataSearch = formSearch.serializeArray();
            let textGetSearch = "?paged=";
            dataSearch.forEach((element, index) => {
                if(element.name != "paged"){
                    textGetSearch += `&${element.name}=${element.value}`
                }
            })            
            window.location.href = textGetSearch;
        });

        cb();
    }
}

const updateAvatar = () =>{
    if($('#avatar').length){
        $('#avatar').unbind('change').change(function (e) { 
            e.preventDefault();
            let _this = $(this);
            let avatar = _this[0].files[0];
            if(avatar.size <= 2*1024*1024){
                let id = $(this).attr('data-id');                
                if((/\.(gif|jpg|jpeg|tiff|png)$/i).test(avatar.name)){
                    showSweetAlert(() => {
                        let data = new FormData();
                        data.append('avatar',avatar);
                        $.ajax({
                            type: "POST",
                            url: `${webAdminUrl}/user/avatar/${id}`,
                            data: data,
                            contentType: false,
                            processData: false,
                            dataType: 'json',
                            success: function (results) {
                                Swal.fire({
                                    // position: 'top-end',
                                    type: 'success',
                                    title: 'Cập nhật thành công',
                                    showConfirmButton: false,
                                    timer: 1500
                                })
                                $('.profile-user-img, .header-avatar').attr('src','/uploads/avatar/'+results.avatar);
                            },
                            error: function (error) {                                
                                Swal.fire({
                                    type: 'error',
                                    title: Array.isArray(error.responseJSON.error) ? error.responseJSON.error.join(', ') : 'Không xác định',
                                    showConfirmButton: false,
                                })
                            }
                        });
                    });
                }else{
                    Swal.fire({
                        type: 'error',
                        title: 'Hình không đúng định dạng',
                        showConfirmButton: false,
                    })
                }
            }else{
                Swal.fire({
                    type: 'error',
                    title: 'Hình không tồn tại hoặc kích thước lơn hơn 2M',
                    showConfirmButton: false,
                })
            }
        });
    }
}

updateAvatar();

loadTableUser('#user');