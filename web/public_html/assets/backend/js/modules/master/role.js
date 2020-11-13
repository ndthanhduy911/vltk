//Datatable cho bảng role
const showStatusRole = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const loadTableRole = (table = 'role', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchRole');
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
            "ajax": `${webAdminUrl}/role/getdata${textGet}`,
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
                    "data": "name"
                },
                {
                    "data": "createdat"
                },
                {
                    "data": "updatedat"
                },
                {
                    "data": "status",
                },
                {
                    "data": 'no'
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                let action = showActionButton(item,'role','Role');
                $('td:eq(0),td:eq(1),td:eq(5),td:eq(6)',row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="roleCheckbox[]" class="roleCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                $('td:eq(3)', row).html(vi_moment(item.createdat));
                $('td:eq(4)', row).html(vi_moment(item.updatedat));
                $('td:eq(5)', row).html(showStatusRole(item.status));
                $('td:eq(6)', row).addClass('text-nowrap').html(``);
                if(action){
                    $('td:eq(6)', row).addClass('text-nowrap').html(action);
                }else{
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
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

        $(table).on( 'page.dt', function (e) {
            e.preventDefault();
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search role", `${webAdminUrl}/role${textGet}`);
        } );

        // Show modal Role Add
        showModalForm('#addRole', '#modalRole', 'GET', () => {
            $('#modalRole .modal-title').html('Thêm mới');
            $('.btnSummitRole span').html('Thêm mới');
            $(`#modalRole #roleGroup input[type="checkbox"]:not([change=false])`).prop('disabled', false)
            $(`#modalRole #dashboardGroup input[type="checkbox"]:not([change=false])`).prop('disabled', false)
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

        // Show modal Role Update
        showModalForm('.editRole', '#modalRole', 'GET', (data) => {
            $('.btnSummitRole span').html('Cập nhật');
            $('#modalRole .modal-title').html('Cập nhật');
            $('#modalRole').validator('update');
            if(typeof data.permissions != 'undefined'){
                data.permissions.forEach(element => {
                    let input = $(`#modalRole #permission${element.permissionid}:not([change=false])`);
                    input.prop('checked', true).prop('disabled', false);
                    let inputDept = input.parents('tr').find('.roleDept');
                    if(inputDept.val() != element.depted){
                        inputDept.val(element.depted).trigger('change');
                    }
                });
            }
            if(typeof data.dashboards != 'undefined'){
                data.dashboards.forEach(element => {
                    $(`#modalRole #dashboard${element.dashboardid}:not([change=false])`).prop('checked', true).prop('disabled', false);
                });   
            }
            if(typeof data.fgroup != 'undefined'){
                mapGroupFiiled('asset',data.fgroup.asset);
                mapGroupFiiled('inventory',data.fgroup.inventory);
                mapGroupFiiled('estimate',data.fgroup.estimate);
                mapGroupFiiled('reduction',data.fgroup.reduction);
                mapGroupFiiled('pcplan',data.fgroup.pcplan);
                mapGroupFiiled('furnish',data.fgroup.furnish);
            }
            if(data.id){
                $(`#modalRole #roleGroup input[type="checkbox"]:not([change=false])`).prop('disabled', false);
                $(`#modalRole #dashboardGroup input[type="checkbox"]:not([change=false])`).prop('disabled', false);
            }else{
                $(`#modalRole #roleGroup input[type="checkbox"]:not([change=false])`).prop('checked', true).prop('disabled', true);
                $(`#modalRole #dashboardGroup input[type="checkbox"]:not([change=false])`).prop('checked', true).prop('disabled', true);
            }

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

        showConfrim('.deleteRole',()=>{
            dt.draw();
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

        $('.roleAll').unbind('change').change(function (e) { 
            e.preventDefault();
            let tr = $(this).parents('tr');
            if($(this).is(":checked")){
                tr.find('input:not([change=false])').prop('checked', true).prop('disabled', false); 
            }else{
                tr.find('input:not([change=false])').prop('checked', false); 
            }                       
        });

        checkboxAll('#assetSelectAll','input[name="asset[]"]');
        checkboxAll('#inventorySelectAll','input[name="inventory[]"]');
        checkboxAll('#estimateSelectAll','input[name="estimate[]"]');
        checkboxAll('#pcplanSelectAll','input[name="pcplan[]"]');
        checkboxAll('#furnishSelectAll','input[name="furnish[]"]');

        checkboxAll('#roleCheckboxAll','.roleCheckbox');
        deleteAll('#deleteRole', '.roleCheckbox',(data) => {
            showSweetAlertOk('Xóa thành công');
            dt.draw()
        },'Nếu xóa nhóm người dùng này các tài khoản thuộc nhóm này sẽ bị vô hiệu hóa. Bạn thật sự muốn thực hiện thao tác này ?');

        cb();
    }
}

const mapGroupFiiled = (fkey,datas) => {
    if(typeof datas != 'undefined' && Array.isArray(datas)){
        datas.forEach(value => {
            $(`#${fkey}-${value}`).prop('checked',true);
        });
    }
}

loadTableRole('#role');