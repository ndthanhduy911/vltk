//Datatable cho bảng depts
const showStatus = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const loadTableDepts = (table = 'depts', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchDepts');
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
            "ajax": `${webAdminUrl}/depts/getdata${textGet}`,
            "searching": false,
            "pageLength": 25,
            // "paging": false,
            "info": false,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [
                [25, 50, 100, 200],
                [25, 50, 100, 200]
            ],
            "displayStart": paged * 25,
            "columns": [
                {
                    "data": "id"
                },
                {
                    "data": "dcode"
                },
                {
                    "data": "qhns"
                },
                {
                    "data": "name"
                },
                {
                    "data": "address"
                },
                {
                    "data": "description"
                },
                {
                    "data": "no"
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:last', row).addClass('text-center');
                if (!item.private['d']) {
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
                if (!item.private['u']) {
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                }
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="assetTypeCheckbox[]" class="assetTypeCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td:last', row).html(showActionButton(item,'depts','Depts'));

                apiGetDeptsChild(item.id).then(data => {
                    let text = '';
                    data.forEach((element, index) => {
                        if(item.private['u'] && item.private['d']){
                            text += `
                                <tr class="text-left" role="row">
                                    <td class="align-middle select-box text-center"><input name="assetTypeCheckbox[]" class="assetTypeCheckbox" type="checkbox" value="${element.id}"></td>
                                    <td class="align-middle">${element.dcode ? element.dcode : ''}</td>
                                    <td class="align-middle">${element.qhns ? element.qhns : ''}</td>
                                    <td class="align-middle">${element.levelTag} ${element.name}</td>
                                    <td class="align-middle">${element.address}</td>
                                    <td class="align-middle">${element.description}</td>
                                    <td class="align-middle text-center">${showActionButton(element,'depts','Depts')}</td>
                                </tr> 
                            `;
                        }else if(item.private['u']){
                            text += `
                                <tr class="text-left" role="row">
                                    <td class="align-middle">${element.dcode ? element.dcode : ''}</td>
                                    <td class="align-middle">${element.qhns ? element.qhns : ''}</td>
                                    <td class="align-middle">${element.levelTag} ${element.name}</td>
                                    <td class="align-middle">${element.address}</td>
                                    <td class="align-middle">${element.description}</td>
                                    <td class="align-middle text-center">${showActionButton(element,'depts','Depts')}</td>
                                </tr> 
                            `;

                        }else if(item.private['d']) {
                            text += `
                                <tr class="text-left" role="row">
                                    <td class="align-middle select-box text-center"><input name="assetTypeCheckbox[]" class="assetTypeCheckbox" type="checkbox" value="${element.id}"></td>
                                    <td class="align-middle">${element.dcode ? element.dcode : ''}</td>
                                    <td class="align-middle">${element.qhns ? element.qhns : ''}</td>
                                    <td class="align-middle">${element.levelTag} ${element.name}</td>
                                    <td class="align-middle">${element.address}</td>
                                    <td class="align-middle">${element.description}</td>
                                </tr> 
                            `;
                        }else{
                            text += `
                                <tr class="text-left" role="row">
                                    <td class="align-middle">${element.dcode ? element.dcode : ''}</td>
                                    <td class="align-middle">${element.qhns ? element.qhns : ''}</td>
                                    <td class="align-middle">${element.levelTag} ${element.name}</td>
                                    <td class="align-middle">${element.address}</td>
                                    <td class="align-middle">${element.description}</td>
                                </tr> 
                            `;
                        }

                    });
                    $(text).insertAfter(row);
                });
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

        showModalForm(`.editDepts`, '#modalDepts', 'GET', (data) => {
            $('#btnSummitDepts span').html('Cập nhật');
            $('#modalDepts .modal-title').html('Cập nhật');
        }, (data, row) => {
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });
        // Show modal Depts Import
        showModalForm('#importDepts', '#modalDeptsImport', 'POST', () => {
            $('#modalDeptsImport .modal-title').html('Nhập hàng loạt đơn vị/ bộ phận');
            $('#btnSummitDeptsImport span').html('Tải lên');
            let filename = $('#modalDeptsImport form').find('#importassetfile');
            checkUploadFile(filename, (/\.(xls|xlsx)$/i),(data)=>{
                if(!data.s){
                    $(data.this).val('');
                }
            })
        }, (data, row) => {
            dt.draw();
            addFlashSession('success','Tải lên dữ liệu thành công');
            $('body.modal-open').removeClass('modal-open');
            $('.modal-backdrop.fade.show').remove();
        });

        // Show modal Depts Add
        showModalForm('#addDepts', '#modalDepts', 'GET', () => {
            $('#modalDepts .modal-title').html('Thêm mới đơn vị/ bộ phận');
            $('#btnSummitDepts span').html('Thêm mới');
        }, (data, row) => {
            showSweetAlertOk('Thêm mới thành công');
            dt.draw();
        });

        $(table).on('page.dt', function (e) {
            e.preventDefault();
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search depts", `${webAdminUrl}/depts${textGet}`);
        });

        formSearch.submit(function (e) {
            e.preventDefault();
            clearFlashSession();
            let dataSearch = formSearch.serializeArray();
            let textGetSearch = "?paged=";
            dataSearch.forEach((element, index) => {
                if (element.name != "paged") {
                    textGetSearch += `&${element.name}=${element.value}`
                }
            })
            dt.ajax.url(`${webAdminUrl}/depts/getdata${textGetSearch}`).load();
            window.history.pushState({}, "Search depts", `${webAdminUrl}/depts${textGetSearch}`);
        });

        deleteAll('#deleteDepts', '.assetTypeCheckbox',(data) => {
            showSweetAlertOk('Xóa thành công');
            dt.draw()
        },'Nếu xóa đơn vị/ bộ phận này tất cả các đơn vị/ bộ phận trực thuộc cũng sẽ bị xóa. Bạn thật sự muốn thực hiện thao tác này ?');
    }
}

loadTableDepts('#depts');