//Datatable cho bảng assettype
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

const showType = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `TSCĐ`;
        case 2:
            return `CCDC`;
        default:
            return `1`;
    }
}


const showDeType = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `Năm`;
        case 2:
            return `Tháng`;
        default:
            return ``;
    }
}

const showIsDe = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `Có`;
        case 0:
            return `Không`;
        default:
            return ``;
    }
}

const getColorType = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return ``;
        case 2:
            return `bg-beige`;
        default:
            return ``;
    }
}

const loadTableAssetType = (table = 'assettype', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchAssetType');
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
            "ajax": `${webAdminUrl}/assettype/getdata${textGet}`,
            "searching": false,
            "pageLength": '25',
            // "paging": false,
            "info": false,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [
                [25, 50, 100, 200],
                [25, 50, 100, 200]
            ],
            "displayStart": paged * 25,
            "columns": [{
                    "data": "id"
                },
                {
                    "data": "id"
                },
                {
                    "data": "type"
                },
                {
                    "data": "name"
                },
                {
                    "data": "code"
                },
                {
                    "data": "isde"
                },
                {
                    "data": "detype"
                },
                {
                    "data": "period"
                },
                {
                    "data": "typefactor"
                },
                {
                    "data": "note"
                },
                {
                    "data": "status"
                },
                {
                    "data": "no"
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                $(row).addClass(getColorType(item.type));
                $('td:eq(0),td:eq(1),td:eq(2),td:eq(5),td:eq(6),td:eq(7),td:eq(8),td:eq(11),td:eq(12)', row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="assetTypeCheckbox[]" class="assetTypeCheckbox" type="checkbox" value="${item.id}">
                `);
                $('td:eq(2)', row).html(showType(item.type));
                $('td:eq(5)', row).html(showIsDe(item.isde));
                $('td:eq(6)', row).html(showDeType(item.detype));
                $('td:eq(10)', row).html(showStatus(item.status));
                $('td:last', row).html((['1','2'].includes(item.id)) ? "" : showActionButton(item,'assettype','AssetType'));

                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
                if(!item.private['u']){
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                }

                apiGetAssetTypeChild(item.id).then(data => {
                    let text = '';
                    data.forEach((em, index) => {
                        text += `
                            <tr role="row" class="${getColorType(em.type)}">
                                ${item.private['d'] ? `<td class="align-middle select-box text-center"><input name="assetTypeCheckbox[]" class="assetTypeCheckbox" type="checkbox" value="${em.id}"></td>` : '' }
                                <td class="align-middle text-center">${em.id}</td>
                                <td class="align-middle text-center">${showType(em.type)}</td>
                                <td class="align-middle">${em.level} ${em.name}</td>
                                <td class="align-middle">${em.code}</td>
                                <td class="align-middle text-center">${showIsDe(em.isde)}</td>
                                <td class="align-middle text-center">${showDeType(em.detype)}</td>
                                <td class="align-middle text-center">${em.period ? em.period : ''}</td>
                                <td class="align-middle text-center">${em.typefactor ? em.typefactor : ''}</td>
                                <td class="align-middle">${em.note ? em.note : ''}</td>
                                <td class="align-middle text-center">${showStatus(em.status)}</td>
                                ${item.private['u'] ? `<td class="align-middle text-center">${showActionButton(em,'assettype','AssetType')}</td>` : ''}
                            </tr>
                        `;
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

        showModalForm(`.editAssetType`, '#modalAssetType', 'GET', (data) => {
            $('#btnSummitAssetType span').html('Cập nhật');
            $('#modalAssetType .modal-title').html('Cập nhật');
            let specifics = JSON.parse(data.specifics);
            specifics = Array.isArray(specifics) ? specifics : []
            specifics.forEach(element => {
                $('#modalAssetType').find(`input[value="${element}"]`).prop('checked',true)
            });
            if(parseInt(data.isde)){
                $('#modalAssetType #isde').prop('checked',true).trigger('change');
            }else{
                $('#modalAssetType #isde').prop('checked',false).trigger('change');
            }
            $('#modalAssetType').on('change', '#type',function (e) {
                e.preventDefault();
                let type = $(this).val();
                apiS2AssetTypeChild(0,type).then((data)=>{  
                    $('#frmAssetType #parentid').find('optgroup,option').remove();
                    data.unshift({id:'0',text : 'Không có'});     
                    $('#frmAssetType #parentid').select2({
                        data : data
                    }).val(data.typeid);
                });
            });
        }, (data, row) => {
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        // Show modal AssetType Import
        showModalForm('#importAssetType', '#modalAssetTypeImport', 'POST', () => {
            $('#modalAssetTypeImport .modal-title').html('Nhập loại tài sản');
            $('#btnSummitAssetTypeImport span').html('Tải lên');
            let filename = $('#modalAssetTypeImport form').find('#importassetfile');
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

        // Show modal AssetType Add
        showModalForm('#addAssetType', '#modalAssetType', 'GET', () => {
            $('#modalAssetType .modal-title').html('Thêm mới');
            $('#btnSummitAssetType span').html('Thêm mới');
            $('#modalAssetType').find(`input[type="checkbox"]`).prop('checked',false);
            specifics = ['originid','purchaseid','barcode','purchaseddate','producedyear','madeid','supplierid','specifications','co','cq','note','image'];
            specifics.forEach(element => {
                $('#modalAssetType').find(`input[value="${element}"]`).prop('checked',true)
            });
            $('#modalAssetType #isde').prop('checked',true).trigger('change');
            $('#modalAssetType').on('change', '#type',function (e) {
                e.preventDefault();
                let type = $(this).val();
                apiS2AssetTypeChild(0,type).then((data)=>{  
                    $('#frmAssetType #parentid').find('optgroup,option').remove();
                    data.unshift({id:'0',text : 'Không có'});     
                    $('#frmAssetType #parentid').select2({
                        data : data
                    });
                });
            });
            $('#modalAssetType #type').trigger('change')
        }, (data, row) => {
            LoadPage(`${webAdminUrl}/assettype`).then(()=>{
                loadTableAssetType('#assettype');
            });
            showSweetAlertOk('Thêm mới thành công');
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
            window.history.pushState({}, "Search assettype", `${webAdminUrl}/assettype${textGet}`);
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
            dt.ajax.url(`${webAdminUrl}/assettype/getdata${textGetSearch}`).load();
            window.history.pushState({}, "Search assettype", `${webAdminUrl}/assettype${textGetSearch}`);
        });

        checkboxAll('#specific0SelectAll', '.specific0');
        checkboxAll('#specific1SelectAll', '.specific1');
        checkboxAll('#specific2SelectAll', '.specific2');
        checkboxAll('#specific3SelectAll', '.specific3');

        checkboxAll('#assetTypeCheckboxAll', '.assetTypeCheckbox');
        deleteAll('#deleteAssetType', '.assetTypeCheckbox',(data) => {
            showSweetAlertOk('Xóa thành công');
            dt.draw();
        },'Nếu xóa loại TS này tất cả các loại TS trực thuộc cũng sẽ bị xóa. Bạn thật sự muốn thực hiện thao tác này ?');

        cb();

        $('#isde').change(function (e) { 
            e.preventDefault();
            $(this).val(1)
            if($(this).is(':checked')){
                $('#modalAssetType').find('[name="detype"],[name="typefactor"],[name="period"]').prop('required',true).parents('.form-group').show();
            }else{
                $('#modalAssetType').find('[name="detype"],[name="typefactor"],[name="period"]').prop('required',false).parents('.form-group').hide();
            }
        });
    }
}

loadTableAssetType('#assettype');