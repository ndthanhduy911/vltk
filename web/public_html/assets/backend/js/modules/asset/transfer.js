const showStatusTransfer = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const loadTableTransfer = (table = 'transfer') => {
    if ($(table).length) {
        let formSearch = $('#searchTransfer');
        let paramsUrl = getParams(); 
        let paged = getParams('paged')
        paged = paged ? paged : 0;

        let columns = [];
        let fkeys = [];
        $(`${table} thead th`).each((key, element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
            columns.push({
                data: $(element).data('col')
            })
        });

        let dt = $(table).DataTable({
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": `${webAdminUrl}/transfer/getdata?${paramsUrl}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="transferCheckbox[]" class="transferCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                $(`td:eq(${fkeys.indexOf('transferdate')})`, row).html(vi_moment(item.transferdate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('transfer',item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                let action = showActionButton(item,'transfer','Transfer', {u:parseInt(item.status)?false:true,l: parseInt(item.status)?false:true},true);
                if (action) {
                $(`td:last`, row).addClass('text-nowrap text-center').html(action);
                } else {
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

        $(table).on( 'page.dt', function (e) {
            e.preventDefault();
            clearFlashSession();
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search transfer", `${webAdminUrl}/transfer${textGet}`);
        });

        formSearch.submit(function (e) { 
            e.preventDefault();
            clearFlashSession();
            let dataSearch = formSearch.serializeArray();
            let textGetSearch = "?paged=";
            dataSearch.forEach((element, index) => {
                if(element.name != "paged"){
                    textGetSearch += `&${element.name}=${element.value}`
                }
            })            
            dt.ajax.url( `${webAdminUrl}/transfer/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search transfer", `${webAdminUrl}/transfer${textGetSearch}`);
        });

        singleLoadPage(`${table} tbody .editTransfer,${table} tbody .viewTransfer`).then(()=>{
            updateTransfer('#frmTransfer');
        });
        
        singleLoadPage(`#addTransfer`).then(()=>{
            updateTransfer('#frmTransfer');
        });

        // Show modal Transfer Import
        showModalForm('#importTransfer', '#modalTransferImport', 'POST', () => {
            $('#modalTransferImport .modal-title').html('Nhập phiếu xuất');
            $('#btnSummitTransferImport span').html('Tải lên');
            let filename = $('#modalTransferImport form').find('#importfile');
            checkUploadFile(filename, (/\.(xls|xlsx)$/i),(data)=>{
                if(!data.s){
                    $(data.this).val('');
                }
            })
        }, (data, row) => {
            dt.draw();
            addFlashSession('success', `Nhập thành công`);
            $('body.modal-open').removeClass('modal-open');
            $('.modal-backdrop.fade.show').remove();
        });

        $('#modalTransferPrint').on('shown.bs.modal', function (e) {
            let button = $(e.relatedTarget);
            let link = button.attr('data-href');
            if(link){
                $('#btnDownloadExcel').attr('href',link);
                $('#btnDownloadPdf').attr('href',link+'?t=pdf');
            }

        })

        showS2ByS2('#deptidSearch','#issuedbySearch',apiS2EmployeeList,{ id:'0',text:'Tất cả'});

        showConfrim('.lockTransfer',()=>{
            dt.draw();
            showSweetAlertOk(`Khóa điều chuyển thành công`);
        },'Nếu chọn “Đồng ý”, tất cả thông tin điều chuyển sẽ không được phép thay đổi và cập nhật cho tài sản sử dụng trong danh sách. Anh/Chị muốn thực hiện thao tác này?')

        checkboxAll('#transferCheckboxAll','.transferCheckbox');
        deleteAll('#deleteTransfer','.transferCheckbox',(data)=>{
            showSweetAlertOk(`Xóa điều chuyển thành công`);
            dt.draw();
        });

        updateSettingTransfer('#frmSettingTransfer');
    }
}

const loadTableTransferDetail = (table = '#transferdetail') => {
    let tId = $(table).attr('data-id');
    tId = tId ? tId : 0;
    let perEdit = $('#frmTransfer').attr('peredit');
    let typeForm = $('#frmTransfer').attr('data-type')
    if ($(table).length) {
        let paramsUrl = getParams();
        let paged = getParams('paged')
        paged = paged ? paged : 0;

        let columns = [];
        let fkeys = [];
        $(`${table} thead th`).each((key,element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
            columns.push({data : $(element).data('col')})
        });
        
        let dt = $(table).DataTable({
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": `${webAdminUrl}/transfer/getdatadetail/${tId}?${paramsUrl}`,
            "searching": false,
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [
                [25, 50, 100, 200],
                [25, 50, 100, 200]
            ],
            "displayStart": paged * 25,
            "columns": columns,
            "drawCallback": function (settings) {                
                if(settings.json.recordsFiltered){
                    $('#deptid').prop('disabled', true);
                }else{
                    $('#deptid').prop('disabled', false);
                }    
                $(table).find('[data-toggle="tooltip"]').tooltip()        
            },
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="transferDetailCheckbox[]" class="transferDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
 
                let codes = item.codes.split(',');
                if(codes.length > 3){
                    codes.sort();
                    $(`td:eq(${fkeys.indexOf('codes')})`, row).html(`Từ ${codes[0]} đến ${codes[(codes.length -1)]}`);
                }
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                if(item.quantity > 1){
                    $('td:last', row).addClass('text-nowrap text-center').html("<button type='button' class='btn btn-hnn btn-sm btn-hnn-info row-details' title='Xem tất cả' data-toggle='tooltip' style='padding: 6px 9px;'><span><i class='fa fa-plus'></i></span></button>");
                    fkeys.forEach(element => {
                        if(!['codes','no','name','quantity','typename'].includes(element)){
                            $(`td:eq(${fkeys.indexOf(element)})`, row).html(``);
                        }
                    });
                    $(row).addClass('bg-beige');
                }else{
                    let action = showActionDetailButton(item,'transfer','TransferDetail',{v:true});
                    $(`td:eq(${fkeys.indexOf('purchaseddate')})`, row).html(item.purchaseddate ? vi_moment(item.purchaseddate, 'DD/MM/YYYY') : '');
                    $(`td:eq(${fkeys.indexOf('barcode')})`, row).addClass('text-center').html(`<div class="detailBarcode mr-auto ml-auto">${item.barcode}</div>`);
                    $('td:last', row).addClass('text-nowrap text-center').html(action);
                }

                if(typeForm == 'lock' || !item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
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

        $(table).on('page.dt', function (e) {
            e.preventDefault();
            clearFlashSession();
            let info = dt.page.info();
            textGet = `?paged=${info.page}`;
            window.history.pushState({}, "Search transferdetail", `${webAdminUrl}/transfer/view${textGet}`);
        });

        // Show modal TransferDetail Add
        showModalForm('#addTransferDetail', '#modalTransferDetail', 'GET', () => {
            $('#modalTransferDetail .modal-title').html('Thêm chi tiết tài sản');
            $('.btnTransferDetail span').html('Đồng ý');
            let href =  $('#addTransferDetail').attr('data-href');
            $('.btnTransferDetail').attr('data-href', href);
            let deptoutidId = $('#deptid').val();
            if(deptoutidId){
                loadTableTransferDetailMore('#transferDetailMore', deptoutidId, tId);
            }else{
                Swal.fire({
                    position: 'top',
                    type: 'error',
                    title: 'Vui lòng chọn Đơn vị/ bộ phận',
                    showConfirmButton: false,
                })
            }

        });

        showModalForm(`.viewTransferDetail`, '#modalViewDetail', 'GET', (data) => {
            let form = $('#modalViewDetail form');
            $('#modalViewDetail .modal-title').html('Thông tin tài sản');
            form.find('#detail-img').attr('src', data.image ? data.image : '/img/avatar.png');
            form.find(`#barcode`).trigger('input');
            showS2ByS2Value([
                {s1:'#cityid',s2:'#districtid',api:apiGetS2DistrictCity,v1:data.cityid,v2:data.districtid},
                {s1:'#districtid',s2:'#wardid',api:apiGetS2WardDistrict,v1:data.districtid,v2:data.wardid}
            ]);
            mapDataForm(form,data,true);
        });

        checkboxAll('#transferDetailCheckboxAll', '.transferDetailCheckbox');
        deleteAll('#deleteTransferDetail', '.transferDetailCheckbox',(data) => {
            showSweetAlertOk('Xóa tài sản chi tiết thành công')
            dt.draw();
        });

        updateTransferDetail('.btnTransferDetail', '.transferDetailMoreCheckbox',(data) => {
            let deptoutidId = $('#deptid').val();
            $('#typeidSearch option:not([value="0"])').remove();
            apiGetS2AssetTypeDept(deptoutidId,{tId:tId}).then((data)=>{
                $('#typeidSearch').select2({
                    data : data
                });
            });
            dt.draw();
            showSweetAlertOk('Thêm tài sản chi tiết thành công');
            resetForm($('#searchTransferDetailMore')).find('#btnTransferDetailMore').trigger('click');
            $('#transferDetailMoreCheckboxAll').prop('checked', false);
        });

        $(table).on('click', '.row-details', function (event) {
            event.preventDefault();
            resetTransferDetail($(this));
            let btn = $(this);
            let rowCurrent = btn.parents('tr');
            let openDetail = btn.data('open-detail');
            if (typeof openDetail == 'undefined') {
                openDetail = 0;
            }
            if (openDetail == 0) {
                btn.data('open-detail', 1);
                btn.find('i').removeClass('fa-plus').addClass('fa-minus');
            } else {
                btn.data('open-detail', 0);
                btn.find('i').removeClass('fa-minus').addClass('fa-plus');
            }
            if (openDetail == 0) {
                let ids = rowCurrent.find('td:eq(0) input').val();
                rowTransferDetail(ids, rowCurrent);
            }
        });
        updateSettingTransferDetail('#frmSettingTransferDetail');
    }
}

const loadTableTransferDetailMore = (table = '#transferDetailMore', deptoutidId = 0, tId = 0) => {
    if ($(table).length) {
        let formSearch = $('#searchTransferDetailMore');
        $('#typeidSearch option:not([value="0"])').remove();
        apiGetS2AssetTypeDept(deptoutidId,{tId:tId}).then((data)=>{
            $('#typeidSearch').select2({
                data : data
            });
        });
        if (!$.fn.DataTable.isDataTable(table)) {
            let dt = $(table).DataTable({
                "ordering": false,
                "processing": true,
                "serverSide": true,
                "autoWidth": false,
                "ajax": `${webAdminUrl}/transfer/getdatadetailsearch/${deptoutidId}`,
                "searching": false,
                "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
                // "info": false,
                "paging":false,
                "columns": [
                    {
                        "data": "no"
                    },
                    {
                        "data": "name"
                    },
                    {
                        "data": "code"
                    },
                    {
                        "data": "typename"
                    },
                    {
                        "data": "no"
                    }
                ],
                'createdRow': function (row, item, dataIndex) {
                    $('td:eq(0),td:eq(4)', row).addClass('text-center');
                    $('td:eq(4)', row).addClass('select-box').html(`
                        <input name="transferDetailMoreCheckbox[]" class="transferDetailMoreCheckbox" type="checkbox" value="${item.id}">
                    `)
                    $('td', row).addClass('align-middle');
                },
                "drawCallback": function (settings) {                
                    $(table).find('[data-toggle="tooltip"]').tooltip()
                },
                "deferRender": true,
                "language": {
                    "sProcessing": "Đang xử lý...",
                    "sLengthMenu": "Xem _MENU_ tài sản",
                    "sZeroRecords": "Không tìm thấy dữ liệu",
                    "sInfo": "Đang xem _TOTAL_ tài sản",
                    "sInfoEmpty": "Đang xem 0 tài sản",
                    "sInfoFiltered": "(được lọc từ _MAX_ tài sản)",
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
            formSearch.find('#btnTransferDetailMore').unbind('click').click(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                dt.ajax.url(`${webAdminUrl}/transfer/getdatadetailsearch/${deptoutidId}${textGetSearch}`).load();
            });
            checkboxAll('#transferDetailMoreCheckboxAll', '.transferDetailMoreCheckbox');
        }else{
            $(table).DataTable().ajax.url(`${webAdminUrl}/transfer/getdatadetailsearch/${deptoutidId}`).load()
            formSearch.find('#btnTransferDetailMore').unbind('click').click(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                $(table).DataTable().ajax.url(`${webAdminUrl}/transfer/getdatadetailsearch/${deptoutidId}${textGetSearch}`).load();
            });
        }
    }
}


const updateTransfer = (form) => {
    if($(form).length){
        let typeForm = $(form).attr('data-type');
        let perEdit = $(form).attr('peredit');
        if (typeForm == 'edit') {
            $('#transferDetailCheckboxAll').prop('disabled',false)
            $('#addTransferDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteTransferDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#transferDetailCheckboxAll').prop('disabled',true);
            $('#addTransferDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteTransferDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }

        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true)
            $(form).find('label.custom-file-label').addClass('disabled');
        }
        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/transfer/view/${data.id}`).then(() => {
                updateTransfer('#frmTransfer');
                if (typeForm == 'edit') {
                    addFlashSession('success', "Cập nhật thành công");
                } else {
                    addFlashSession('success', "Thêm mới thành công");
                }
            });

        });

        checkUploadFile($(form).find('#reportfile'), (/\.(jpg|jpeg|png|pdf)$/i),(data)=>{
            if(!data.s){
                $(data.this).val('');
            }
        })

        loadTableTransferDetail('#transferdetail');
        showS2ByS2('#deptid','#employeeoutid',apiS2EmployeeList);
        showS2ByS2('#deptinid','#employeeinid',apiS2EmployeeList);
    }
}

const rowTransferDetail = (ids = '', insertAfterTr = '') => {
    if (ids != '' && insertAfterTr != '') {
        let typeForm = $('#frmTransfer').attr('data-type');
        let fkeys = [];
        $(`#transferdetail thead th`).each((key, element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
        });
        apiGetTransferDropdown(ids).then((data) => {
            let content = '';
            $.each(data.data, function (index, item) {
                let action = showActionDetailButton(item,'transfer','TransferDetail',{v:true});
                content += `<tr class="detail-item">${(typeForm != 'lock' && item.private['d']) ? '<td class="text-center align-middle"><input type="checkbox" name="checkInDetailCheckbox[]" class="checkInDetailCheckbox" value="'+item.id+'"></td>' : ''}<td></td>`
                fkeys.forEach(element => {
                    if (element != 'no') {
                        switch (element) {
                            case 'codes':
                                content += `<td class="align-middle">${item.code ? item.code : ''}</td>`
                                break;
                            case 'purchaseddate':
                                content += `<td class="align-middle">${item.purchaseddate ? vi_moment(item.purchaseddate, 'DD/MM/YYYY') : ''}</td>`
                                break;
                            case 'quantity':
                                content += `<td class="align-middle text-center">1</td>`
                                break;

                            default:
                                content += `<td class="align-middle">${item[element] ? item[element] : ''}</td>`
                                break;
                        }
                    }
                });
                content +=  `<td class="text-center align-middle">
                                    ${action}
                                </td>
                            </tr>`
            });
            $(content).insertAfter(insertAfterTr);
            $(`.detail-item .detailBarcode`).each((index, element) => {
                generateBarcode($(element), {
                    barHeight: 15
                });
            })
            $('.detail-item').find('[data-toggle="tooltip"]').tooltip()
        });
    }
}

const resetTransferDetail = (btn = null) => {
    if (btn != null) {
        btn.parents('table').find('tr.detail-item').remove();
        btn.parents('table').find('button.row-details').not(btn).each(function (index, el) {
            let openDetail = $(this).data('open-detail');
            if (typeof openDetail != 'undefined' && openDetail == 1) {
                $(this).data('open-detail', 0);
                $(this).find('i').removeClass('fa-minus').addClass('fa-plus');
            }
        });
    }
}

const updateTransferDetail = (button, selector, cb = () => {}) => {    
    $(button).unbind('click').click(function (e) {
        e.preventDefault();
        let data = $(`${selector}:checked`).map(function () {
            let arrayId = this.value.split(',');                
            return arrayId;
        }).get();
        let href = $(this).attr('data-href');
        href = href ? href : $(this).attr('href');
        
        data = data.filter((value, index, self) => {
            return self.indexOf(value) === index;
        });
        // console.log(data);
        if ($(`${selector}:checked`).length) {
            $('body').append(loaderHtml);
            $.ajax({
                type: "POST",
                url: href,
                data: {
                    'dataId': data
                },
                dataType: "json",
                success: function (response) {
                    $('body .block-loader').remove();
                    cb(response);
                },
                error: function (error) {
                    $('body .block-loader').remove();
                    showSweetAlertError('Thất bại');
                }
            });
        } else {
            Swal.fire({
                position: 'top',
                type: 'error',
                title: 'Vui lòng chọn tài sản chi tiết',
                showConfirmButton: false,
            })
        }
    })
}

const updateSettingTransfer = (form) => {
    if ($(form).length) {
        let filterField = ['number','transferdate','deptid','deptinid'];
        let tableField = ['number','transferdate','deptname','employeeoutname','deptinname','employeeinname','reason','note','reportfile'];
        showModalForm('#settingTransfer', '#modalSettingTransfer', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/transfer`).then(() => {
                loadTableTransfer('#transfer');
                updateSettingTransfer('#frmSettingTransfer');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingTransferDetail = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'typeid'];
        let tableField = ['codes','name','typename','quantity'];
        showModalForm('#settingTransferDetail', '#modalSettingTransferDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let transferId = $('#settingTransferDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/transfer/view/${transferId}`).then(() => {
                updateTransfer('#frmTransfer');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updateTransfer('#frmTransfer');

loadTableTransfer('#transfer');