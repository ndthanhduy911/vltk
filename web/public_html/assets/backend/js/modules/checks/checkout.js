const showStatusCheckOut = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-1">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-1">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showActionButtonCheckOut = (item) => {
    if(parseInt(item.status)){
        return showActionButton(item, 'checkout','CheckOut',{v:true,p:true,h:true},true)
    }else{
        return showActionButton(item, 'checkout','CheckOut',{u:true,p:true,l:true,h:true},true)
    }
}

const loadTableCheckOut = (table = 'checkout') => {
    if ($(table).length) {
        let formSearch = $('#searchCheckOut');
        let dataLoadSearch = formSearch.serializeArray();
        let paged = formSearch.find('[name="paged"]').val();
        let textGet = "?";
        dataLoadSearch.forEach((element, index) => {
            textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
        });

        let columns =   [];
        let fkeys =   [];
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
            "ajax": `${webAdminUrl}/checkout/getdata${textGet}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="checkOutCheckbox[]" class="checkOutCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center')
                $(`td:eq(${fkeys.indexOf('checkoutdate')})`, row).html(vi_moment(item.checkoutdate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('checkout',item.reportfile,true));
                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
                let action = showActionButtonCheckOut(item,'checkout','CheckOut');
                if (action) {
                    $('td:last', row).addClass('text-nowrap text-center').html(action);
                } else {
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
            clearFlashSession();
            let orderBy = $(this).attr('order');
            let orderDir = $(this).attr('dir');
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search checkout", `${webAdminUrl}/checkout${textGet}&order=${orderBy}&dir=${orderDir}`);
        });

        $(table).on('click', '.orderby', function (e) {
            e.preventDefault();
            let orderBy = $(this).attr('order');
            let orderDir = $(this).attr('dir');
            let dataSearch = formSearch.serializeArray();
            let textGet = "?paged=";
            dataSearch.forEach((element, index) => {
                if (element.name != "paged") {
                    textGet += `&${element.name}=${element.value}`
                }
            })
            dt.ajax.url(`${webAdminUrl}/checkin/getdata${textGet}&order=${orderBy}&dir=${orderDir}`).load();
            $(table).find('thead th a i').removeClass(['fa-sort-up','fa-sort-down']).addClass('fa-sort');
            changeSort(this,orderDir);
            window.history.pushState({}, "Order checkin", `${webAdminUrl}/checkin${textGet}&order=${orderBy}&dir=${orderDir}`);
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
            dt.ajax.url( `${webAdminUrl}/checkout/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search checkout", `${webAdminUrl}/checkout${textGetSearch}`);
        });

        singleLoadPage(`${table} tbody .editCheckOut,${table} tbody .viewCheckOut`).then(()=>{
            updateCheckOut('#frmCheckOut');
        });

        singleLoadPage(`#addCheckOut`).then(()=>{
            updateCheckOut('#frmCheckOut');
        });

        // Show modal CheckOut Import
        showModalForm('#importCheckOut', '#modalCheckOutImport', 'POST', () => {
            $('#modalCheckOutImport .modal-title').html('Nhập phiếu xuất');
            $('#btnSummitCheckOutImport span').html('Tải lên');
            let filename = $('#modalCheckOutImport form').find('#importfile');
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
        },()=>{
            let filename = $('#modalCheckOutImport form').find('#importfile');
            let labelfile = $('#modalCheckOutImport form').find('[for="importfile"]');
            filename.val('');
            labelfile.html('Chọn tập tin XLSX');
        });

        $('#modalCheckOutPrint').on('shown.bs.modal', function (e) {
            let button = $(e.relatedTarget);
            let link = button.attr('data-href');
            if(link){
                $('#modalCheckOutPrint .btnDownloadExcel').attr('href',link);
                $('#modalCheckOutPrint .btnDownloadPdf').attr('href',link+'?t=pdf');
                $('#modalCheckOutPrint .btnPrintPdf').attr('href',link+'?t=pdf');
                $('#modalCheckOutPrint .pdfDocument').attr('src',link+'?t=pdf');
            }
        })

        showS2ByS2('#deptidSearch','#issuedbySearch',apiS2EmployeeList,{ id:'0',text:'Tất cả'});

        showConfrim('.lockCheckOut',()=>{
            dt.draw();
            showSweetAlertOk(`Khóa phiếu xuất thành công`);
        },'Nếu chọn “Đồng ý”, tất cả thông tin của phiếu xuất sẽ không được phép thay đổi và tài sản trong danh sách sẽ được chuyển đến đơn vị/bộ phận sử dụng. Anh/Chị muốn thực hiện thao tác này?')

        checkboxAll('#checkOutCheckboxAll','.checkOutCheckbox');
        deleteAll('#deleteCheckOut','.checkOutCheckbox',(data)=>{
            showSweetAlertOk(`Xóa phiếu xuất thành công`);
            dt.draw();
        });

        updateSettingCheckOut('#frmSettingCheckOut');
    }
}

const loadTableCheckOutDetail = (table = '#checkoutdetail') => {
    let checkOutId = $(table).attr('data-id');
    let typeForm = $('#frmCheckOut').attr('data-type');
    if ($(table).length && checkOutId) {
        let paramsUrl = getParams();       

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
            "ajax": `${webAdminUrl}/checkout/getdatadetail/${checkOutId}?${paramsUrl}`,
            "searching": false,
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [
                [25, 50, 100, 200],
                [25, 50, 100, 200]
            ],
            "displayStart": 0 * 25,
            "columns": columns,
            "drawCallback": function (settings) {                
                $(`.detailBarcode`).each((index,element)=>{
                    generateBarcode($(element),{barHeight: 15});
                })  
                $(table).find('[data-toggle="tooltip"]').tooltip()      
            },
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="checkOutDetailCheckbox[]" class="checkOutDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                let action = showActionDetailButton(item,'checkin','CheckOutDetail',{v:true});
                let codes = item.codes.split(',');
                if(codes.length > 3){
                    codes.sort();
                    $(`td:eq(${fkeys.indexOf('codes')})`, row).html(`Từ ${codes[0]} đến ${codes[(codes.length -1)]}`);
                }
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center')
                if(item.quantity > 1){
                    $('td:last', row).addClass('text-nowrap text-center').html("<button type='button' class='btn btn-hnn btn-sm btn-hnn-info row-details' title='Xem tất cả' data-toggle='tooltip' style='padding: 6px 9px;'><span><i class='fa fa-plus'></i></span></button>");
                    fkeys.forEach(element => {
                        if(!['codes','no','name','quantity','typename','deptname'].includes(element)){
                            $(`td:eq(${fkeys.indexOf(element)})`, row).html(``);
                        }
                    });
                    $(row).addClass('bg-beige');
                }else{
                    $(`td:eq(${fkeys.indexOf('purchaseddate')})`, row).html(item.purchaseddate ? vi_moment(item.purchaseddate, 'DD/MM/YYYY') : '');
                    $('td:last', row).addClass('text-nowrap text-center').html(action);
                    $(`td:eq(${fkeys.indexOf('barcode')})`, row).addClass('text-center').html(`<div class="detailBarcode mr-auto ml-auto">${item.barcode}</div>`);
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
            window.history.pushState({}, "Search checkoutdetail", `${webAdminUrl}/checkout/update${textGet}`);
        });

        // Show modal CheckOutDetail Add
        showModalForm('#addCheckOutDetail', '#modalCheckOutDetail', 'GET', () => {
            $('#modalCheckOutDetail .modal-title').html('Thêm chi tiết tài sản');
            $('.btnCheckOutDetail span').html('Đồng ý');
            let href =  $('#addCheckOutDetail').attr('data-href');
            $('.btnCheckOutDetail').attr('data-href', href);
            let deptId = $('#deptid').val();
            if(deptId){
                loadTableCheckOutDetailMore('#checkoutDetailMore', deptId);
            }else{
                Swal.fire({
                    position: 'top',
                    type: 'error',
                    title: 'Vui lòng chọn Đơn vị/ bộ phận',
                    showConfirmButton: false,
                })
            }
        });

        showModalNotMapForm(`.viewCheckOutDetail`, '#modalViewDetail', 'GET', (data) => {
            let form = $('#modalViewDetail form');
            $('#modalViewDetail .modal-title').html('Thông tin tài sản');
            showViewGallery('#detail-img','checkindetail', isJson(data.image) ? JSON.parse(data.image) : data.image);
            form.find(`#barcode`).trigger('input');
            showS2ByS2Value([
                {s1:'#cityid',s2:'#districtid',api:apiGetS2DistrictCity,v1:data.cityid,v2:data.districtid},
                {s1:'#districtid',s2:'#wardid',api:apiGetS2WardDistrict,v1:data.districtid,v2:data.wardid}
            ]);
            mapDataForm(form,data,true);
        });

        checkboxAll('#checkOutDetailCheckboxAll', '.checkOutDetailCheckbox');
        deleteAll('#deleteCheckOutDetail', '.checkOutDetailCheckbox',(data) => {
            showSweetAlertOk(`Xóa tài sản chi tiết thành công`);
            dt.draw();
        });

        updateCheckOutDetail('.btnCheckOutDetail', '.checkOutDetailMoreCheckbox',(data) => {
            $('#typeidSearch option:not([value="0"])').remove();
            apiGetAssetTypeOut($('#deptid').val()).then((data)=>{                
                $('#typeidSearch').select2({
                    data : data
                });
            });
            dt.draw();
            showSweetAlertOk('Thêm tài sản chi tiết thành công');
            resetForm($('#searchCheckOutDetailMore')).find('#btnCheckOutDetailMore').trigger('click');
            $('#checkOutDetailMoreCheckboxAll').prop('checked', false);
        });

        $(table).on('click', '.row-details', function (e) {
            e.preventDefault();
            resetCheckOutDetail($(this));
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
                rowCheckOutDetail(ids, rowCurrent);
            }
        });

        updateSettingCheckOutDetail('#frmSettingCheckOutDetail');
    }
}

const loadTableCheckOutDetailMore = (table = '#checkoutDetailMore', deptId = 0) => {
    if ($(table).length) {
        let formSearch = $('#searchCheckOutDetailMore');
        $('#typeidSearch option:not([value="0"])').remove();
        apiGetAssetTypeOut(deptId).then((data)=>{       
            $('#typeidSearch').select2({
                data : data
            });            
        });
        if (!$.fn.DataTable.isDataTable(table)) {
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
                "ajax": `${webAdminUrl}/checkout/getdatadetailsearch/${deptId}`,
                "searching": false,
                "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
                "paging":false,
                "columns": columns,
                'createdRow': function (row, item, dataIndex) {
                    $('td:eq(0),td:last', row).addClass('text-center');
                    $('td:last', row).addClass('select-box').html(`
                        <input name="checkOutDetailMoreCheckbox[]" class="checkOutDetailMoreCheckbox" type="checkbox" value="${item.id}">
                    `)
                    $('td', row).addClass('align-middle');
                    $(`td:eq(${fkeys.indexOf('purchaseddate')})`, row).html(item.purchaseddate ? vi_moment(item.purchaseddate,'DD/MM/YYYY') : "");
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
            formSearch.find('#btnCheckOutDetailMore').unbind('click').click(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                dt.ajax.url(`${webAdminUrl}/checkout/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
            checkboxAll('#checkOutDetailMoreCheckboxAll', '.checkOutDetailMoreCheckbox');
        }else{
            $(table).DataTable().ajax.url(`${webAdminUrl}/checkout/getdatadetailsearch/${deptId}`).load()
            formSearch.find('#btnCheckOutDetailMore').unbind('click').click(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                $(table).DataTable().ajax.url(`${webAdminUrl}/checkout/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
        }
    }
}

const updateCheckOut = (form) => {
    if($(form).length){
        let deptId = $('#deptid').val();
        let perEdit = $(form).attr('peredit');
        let typeForm = $(form).attr('data-type');
        if (typeForm == 'edit') {
            $('#checkOutDetailCheckboxAll').prop('disabled',false)
            $('#addCheckOutDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteCheckOutDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#checkOutDetailCheckboxAll').prop('disabled',true);
            $('#addCheckOutDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteCheckOutDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }

        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }

        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/checkout/view/${data.id}`).then(() => {
                updateCheckOut(form);
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

        loadTableCheckOutDetail('#checkoutdetail');
        loadTableCheckOutDetailMore('#checkoutDetailMore', deptId);
        showS2ByS2('#deptid','#issuedby',apiS2EmployeeList);
        showGenerateBarcode('#barcode','#barcodeTarget');

        showConfrim('#lockCheckOut', () => {
            let checkoutId = $('#lockCheckOut').data('id');
            LoadPage(`${webAdminUrl}/checkout/view/${checkoutId}`).then(() => {
                updateCheckOut('#frmCheckOut');
            });
            showSweetAlertOk("Khóa thông tin thành công");
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin của phiếu xuất sẽ không được phép thay đổi và tài sản trong danh sách sẽ được chuyển đến đơn vị/bộ phận sử dụng. Anh/Chị muốn thực hiện thao tác này?')
    }
}

const rowCheckOutDetail = (ids = '', insertAfterTr = '') => {
    let typeForm = $('#frmCheckOut').attr('data-type');
    if (ids != '' && insertAfterTr != '') {
        let fkeys = [];
        $(`#checkoutdetail thead th`).each((key, element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
        });
        apiGetDetailOutDropdown(ids).then((data) => {
            let content = '';
            $.each(data.data, function (index, item) {
                let action = showActionDetailButton(item, 'checkout', 'CheckOutDetail', {
                    v: true
                });
                content += `<tr class="detail-item">${(typeForm != 'lock' && item.private['d']) ? '<td class="text-center align-middle"><input type="checkbox" name="checkOutDetailCheckbox[]" class="checkOutDetailCheckbox" value="'+item.id+'"></td>' : ''}<td></td>`
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
                            case 'status':
                                content += `<td class="align-middle text-center">${showStatusCheckInAsset(item.status)}</td>`
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

const resetCheckOutDetail = (btn = null) => {
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

const updateCheckOutDetail = (button, selector, cb = () => {}) => {    
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
                    if(typeof response.logout != 'undefined'){
                        window.location.reload();
                    }else{
                        if (typeof response.error == 'undefined') {
                            cb(response);
                        } else {
                            showErrorAjax(response);
                        }
                    }                    
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

const updateSettingCheckOut = (form)=> {
    if($(form).length){
        let filterField = ['number','deptid','issuedby','checkoutdate'];
        let tableField = ['number','deptname','checkoutdate','issuedbyname','reason','description','deptoutname','receiver','quantity','reportfile'];
        showModalForm('#settingCheckOut', '#modalSettingCheckOut', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked',true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked',true);
            });
        },(data,row)=>{
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/checkout`).then(()=>{
                loadTableCheckOut('#checkout');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll','input[name="filters[]"]');
        checkboxAll('#tablesSelectAll','input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingCheckOutDetail = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'deptid', 'typeid'];
        let tableField = ['codes', 'name', 'typename', 'deptname', 'barcode', 'madename', 'producedyear', 'purchaseddate', 'suppliername', 'quantity'];
        showModalForm('#settingCheckOutDetail', '#modalSettingCheckOutDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let checkoutId = $('#settingCheckOutDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/checkout/view/${checkoutId}`).then(() => {
                updateCheckOut('#frmCheckOut');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updateCheckOut('#frmCheckOut');

loadTableCheckOut('#checkout');