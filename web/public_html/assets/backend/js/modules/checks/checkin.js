const showStatusCheckIn = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-warning p-1">Đã khóa</span>`;
        case 1:
            return `<span class="badge badge-info p-1">Đang soạn</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showStatusCheckInAsset = (s = '') => {
    switch (parseInt(s)) {
        case 2:
            return `<span class="badge badge-info p-1">Đã nhập</span>`;
        case 4:
            return `<span class="badge badge-warning p-1">Đã xuất</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showActionButtonCheckIn = (item) => {
    if (parseInt(item.status)) {
        return showActionButton(item, 'checkin', 'CheckIn', {
            v: true,
            p: true
        }, true)
    } else {
        return showActionButton(item, 'checkin', 'CheckIn', {
            u: true,
            p: true,
            l: true
        }, true)
    }
}

const loadTableCheckIn = (table = 'checkin') => {
    if ($(table).length) {
        let formSearch = $('#searchCheckIn');
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
            "ajax": `${webAdminUrl}/checkin/getdata?${paramsUrl}`,
            "searching": false,
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [
                [25, 50, 100, 200],
                [25, 50, 100, 200]
            ],
            "displayStart": paged * 25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="checkInCheckbox[]" class="checkInCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center')
                $(`td:eq(${fkeys.indexOf('checkindate')})`, row).html(vi_moment(item.checkindate, 'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('deliverymore')})`, row).html(item.deliveryperson + (item.deliverymore ? ' - ' + item.deliverymore : ''));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('checkin', item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('status')})`, row).addClass('text-center').html(showStatusCheckIn(item.status));

                if (!item.private['d']) {
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }

                let action = showActionButtonCheckIn(item);
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

        $(table).on('page.dt', function (e) {
            e.preventDefault();
            clearFlashSession();
            let orderBy = $(this).attr('order');
            let orderDir = $(this).attr('dir');
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            let textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}&order=${orderBy}&dir=${orderDir}`
            });
            window.history.pushState({}, "Search checkin", `${webAdminUrl}/checkin${textGet}&order=${orderBy}&dir=${orderDir}`);
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
            dt.ajax.url(`${webAdminUrl}/checkin/getdata${textGetSearch}`).load();
            window.history.pushState({}, "Search checkin", `${webAdminUrl}/checkin${textGetSearch}`);
        });

        singleLoadPage(`#addCheckIn`).then(() => {
            updateCheckIn('#frmCheckIn');
        });

        singleLoadPage(`${table} tbody .editCheckIn,${table} tbody .viewCheckIn`).then(() => {
            updateCheckIn('#frmCheckIn');
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

        // Show modal CheckIn Import
        showModalForm('#importCheckIn', '#modalCheckInImport', 'POST', () => {
            $('#modalCheckInImport .modal-title').html('Tải lên');
            $('#btnSummitCheckInImport span').html('Tải lên');
            let filename = $('#modalCheckInImport form').find('#importfile');
            checkUploadFile(filename, (/\.(xls|xlsx)$/i),(data)=>{
                if(!data.s){
                    $(data.this).val('');
                }
            })
        }, (data, row) => {
            dt.draw();
            addFlashSession('success', 'Tải lên dữ liệu thành công');
            $('body.modal-open').removeClass('modal-open');
            $('.modal-backdrop.fade.show').remove();
        });

        $('#modalCheckInPrint').on('shown.bs.modal', function (e) {
            let button = $(e.relatedTarget);
            let link = button.attr('data-href');
            if (link) {
                $('#btnDownloadExcel').attr('href', link);
                $('#btnDownloadPdf').attr('href', link + '?t=pdf');
                $('#btnPrintPdf').attr('href', link + '?t=pdf');
                $('#pdfDocument').attr('src', link + '?t=pdf');
            }
        })

        showConfrim('.lockCheckIn', () => {
            dt.draw();
            showSweetAlertOk("Khóa phiếu nhập thành công")
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin của phiếu nhập sẽ không được phép thay đổi. Anh/Chị muốn thực hiện thao tác này?')

        checkboxAll('#checkInCheckboxAll', '.checkInCheckbox');
        deleteAll('#deleteCheckIn', '.checkInCheckbox', (data) => {
            showSweetAlertOk("Xóa phiếu nhập thành công");
            dt.draw();
        });

        showS2ByS2('#deptidSearch', '#receiverSearch', apiS2EmployeeList, {
            id: '0',
            text: 'Tất cả'
        });

        updateSettingCheckIn('#frmSettingCheckIn');
    }
}

const loadTableCheckInDetail = (table = '#checkindetail') => {
    let perEdit = $('#frmCheckIn').attr('peredit');
    let checkInId = $(table).attr('data-id');
    let typeForm = $('#frmCheckIn').attr('data-type');
    if ($(table).length && checkInId) {
        let formSearch = $('#searchCheckInDetail');
        let dataLoadSearch = formSearch.serializeArray();
        let paged = formSearch.find('[name="paged"]').val();
        paged = paged ? paged : 0;
        let textGet = "?";

        $(table).parents('.block-table').removeClass('hidden');

        dataLoadSearch.forEach((element, index) => {
            textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
        });

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
            "ajax": `${webAdminUrl}/checkin/getdatadetail/${checkInId}`,
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
                $(`.detailBarcode`).each((index, element) => {
                    generateBarcode($(element), {
                        barHeight: 15
                    });
                })
                $(table).find('[data-toggle="tooltip"]').tooltip()
            },
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="checkInDetailCheckbox[]" class="checkInDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                let codes = item.codes.split(', ');
                if (codes.length > 3) {
                    codes.sort();
                    $(`td:eq(${fkeys.indexOf('codes')})`, row).html(`Từ ${codes[0]} đến ${codes[(codes.length -1)]}`);
                }
                let action = showActionDetailButton(item, 'checkin', 'CheckInDetail', {
                    u: (typeForm != 'lock' ? true : false),
                    v: true
                });
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center')
                if (item.quantity > 1) {
                    $('td:last', row).addClass('text-nowrap text-center').html("<button type='button' class='btn btn-hnn btn-sm btn-hnn-info row-details' title='Xem tất cả' data-toggle='tooltip' style='padding: 6px 9px;'><span><i class='fa fa-plus'></i></span></button>");
                    fkeys.forEach(element => {
                        if(!['codes','no','name','quantity','typename','deptname'].includes(element)){
                            $(`td:eq(${fkeys.indexOf(element)})`, row).html(``);
                        }
                    });
                    $(row).addClass('bg-beige');
                } else {
                    $(`td:eq(${fkeys.indexOf('purchaseddate')})`, row).html(item.purchaseddate ? vi_moment(item.purchaseddate, 'DD/MM/YYYY') : '');
                    $('td:last', row).addClass('text-nowrap text-center').html(action);
                    $(`td:eq(${fkeys.indexOf('barcode')})`, row).addClass('text-center').html(`<div class="detailBarcode mr-auto ml-auto">${item.barcode}</div>`);
                }

                if (typeForm == 'lock' || !item.private['d']) {
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
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search checkindetail", `${webAdminUrl}/checkin/update${textGet}`);
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
            dt.ajax.url(`${webAdminUrl}/checkin/getdatadetail/${checkInId}${textGetSearch}`).load();
            window.history.pushState({}, "Search checkindetail", `${webAdminUrl}/checkin/update${textGetSearch}`);
        });

        // Show modal CheckInDetail Add
        showModalForm('#addCheckInDetail', '#modalCheckInDetail', 'GET', () => {
            $('#modalCheckInDetail .modal-title').html('Thêm mới tài sản');
            $('#btnCheckInDetail span').html('Thêm mới');
            let form = $("#frmCheckInDetail");
            form.find('select, input:not(#code)').prop('disabled', false)
            form.find(`#amount`).prop('required', true).prop('disabled', false).parents('.form-group').removeClass('hidden');
            form.find(`#typeid`).prop('disabled', false);
            $('#btnCheckInDetail').parents('.modal-footer').removeClass('hidden');
            form.find('#barcodeTarget').html("");
            form.find('#specificForm').html("");

            // let typeIdOld = form.find(`#typeid`).val();
            form.find('#typeid').unbind('change').change(function (e) {
                e.preventDefault();
                let typeId = $(this).val();
                if (typeId) {
                    apiGetAssetCode(typeId).then((data) => {
                        $('#singleCore').find(`#modalCheckInDetail #code`).val(data.code);
                    });
                    updateCheckInDetail(typeId, form).then(() => {
                        showViewGallery('#detail-img',"","");
                        checkUploadFile(form.find(`#image`), (/\.(jpg|jpeg|png)$/i),(data)=>{
                            if(!data.s){
                                $(data.this).val('');
                            }else{
                                showViewGalleryChange('#detail-img',data.this)
                            }
                        })
                    })
                }
            });
        }, (data, row) => {
            dt.draw();
            showSweetAlertOk(`Thêm mới tài sản chi tiết thành công`);
        });

        showModalNotMapForm(`.editCheckInDetail,.viewCheckInDetail`, '#modalCheckInDetail', 'GET', (data) => {
            $('#btnCheckInDetail span').html('Cập nhật');
            $('#modalCheckInDetail .modal-title').html('Cập nhật tài sản');
            let form = $("#frmCheckInDetail");
            form.find(`#amount`).prop('required', false).prop('disabled', true).parents('.form-group').addClass('hidden');
            form.find(`#typeid`).prop('disabled', true);
            form.find('#typeid').off('change');
            if (data.typeid) {
                updateCheckInDetail(data.typeid, form, data).then(() => {
                    showViewGallery('#detail-img','checkindetail', isJson(data.image) ? JSON.parse(data.image) : data.image);
                    form.find(`#barcode`).trigger('input');
                    if (typeForm == 'lock' || (data.id && !perEdit)) {
                        form.find('select, input').prop('disabled', true);
                        $('#btnCheckInDetail').parents('.modal-footer').addClass('hidden');
                        form.find(`label[for="image"]`).addClass('hidden');
                        form.find(`.upload-image`).addClass('hidden');
                    } else {
                        checkUploadFile(form.find(`#image`), (/\.(jpg|jpeg|png)$/i),(data)=>{
                            if(!data.s){
                                $(data.this).val('');
                            }else{
                                showViewGalleryChange('#detail-img',data.this)
                            }
                        })
                    }
                })
            }
        }, (data, row) => {
            showSweetAlertOk(`Cập nhật tài sản chi tiết thành công`);
            dt.draw();
        });

        checkboxAll('#checkInDetailCheckboxAll', '.checkInDetailCheckbox');
        deleteAll('#deleteDetail', '.checkInDetailCheckbox', (data) => {
            showSweetAlertOk('Xóa tài sản chi tiết thành công');
            dt.draw();
        });

        $(table).on('click', '.row-details', function (event) {
            event.preventDefault();
            resetCheckInDetail($(this));

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
                rowCheckInDetail(ids, rowCurrent);
            }
        });

        updateSettingCheckInDetail('#frmSettingCheckInDetail');
    }
}

const loadTableCheckInAsset = (table = '#checkinasset') => {
    if ($(table).length) {
        let formSearch = $('#searchCheckInAsset');
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
            "ajax": `${webAdminUrl}/checkin/getdataasset?${paramsUrl}`,
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
                $(`.detailBarcode`).each((index, element) => {
                    generateBarcode($(element), {
                        barHeight: 15
                    });
                })
                $(table).find('[data-toggle="tooltip"]').tooltip()
            },
            'createdRow': function (row, item, dataIndex) {
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="checkInAssetCheckbox[]" class="checkInAssetCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                let codes = item.codes.split(',');
                if (codes.length > 3) {
                    codes.sort();
                    $(`td:eq(${fkeys.indexOf('codes')})`, row).html(`Từ ${codes[0]} đến ${codes[(codes.length -1)]}`);
                }
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center')
                $(`td:eq(${fkeys.indexOf('purchaseddate')})`, row).html(item.purchaseddate ? vi_moment(item.purchaseddate, 'DD/MM/YYYY') : '');
                let action = showViewDetail(item, 'checkin');
                $(`td:eq(${fkeys.indexOf('cstatus')})`, row).addClass('text-center').html(showStatusCheckInAsset(item.cstatus));
                if (item.quantity > 1) {
                    $(row).addClass('bg-beige')
                    fkeys.forEach(element => {
                        if(!['codes','no','name','quantity','typename','deptname','cstatus'].includes(element)){
                            $(`td:eq(${fkeys.indexOf(element)})`, row).html(``);
                        }
                    });
                    $(`td:last`, row).addClass('text-center').html("<button type='button' class='btn btn-hnn btn-sm btn-hnn-info row-details' title='Xem tất cả' data-toggle='tooltip' style='padding: 6px 9px;'><span><i class='fa fa-plus'></i></span></button>");
                } else {
                    $(`td:eq(${fkeys.indexOf('barcode')})`, row).addClass('text-center').html(`<div class="detailBarcode mr-auto ml-auto">${item.barcode}</div>`);
                    $(`td:last`, row).addClass('text-center').html(action);
                }

                $(row).find('td:first').addClass('hidden');
                $(table).find('thead tr th:first').addClass('hidden');

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
            let orderBy = $(this).attr('order');
            let orderDir = $(this).attr('dir');
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            let textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}&order=${orderBy}&dir=${orderDir}`
            });
            window.history.pushState({}, "Search checkin", `${webAdminUrl}/checkin/checkinasset${textGet}&order=${orderBy}&dir=${orderDir}`);
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
            dt.ajax.url(`${webAdminUrl}/checkin/getdataasset${textGet}&order=${orderBy}&dir=${orderDir}`).load();
            $(table).find('thead th a i').removeClass(['fa-sort-up','fa-sort-down']).addClass('fa-sort');
            changeSort(this,orderDir);
            window.history.pushState({}, "Order checkinasset", `${webAdminUrl}/checkin/checkinasset${textGet}&order=${orderBy}&dir=${orderDir}`);
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
            dt.ajax.url(`${webAdminUrl}/checkin/getdataasset${textGetSearch}`).load();
            window.history.pushState({}, "Search checkindetail", `${webAdminUrl}/checkin/checkinasset${textGetSearch}`);
        });
        showModalForm(`.viewDetail`, '#modalViewDetail', 'GET', (data) => {
            let form = $('#modalViewDetail form');
            $('#modalViewDetail .modal-title').html('Thông tin tài sản');
            showViewGallery('#detail-img','checkindetail', isJson(data.image) ? JSON.parse(data.image) : data.image);
            form.find(`#barcode`).trigger('input');
            showS2ByS2Value([{
                    s1: '#cityid',
                    s2: '#districtid',
                    api: apiGetS2DistrictCity,
                    v1: data.cityid,
                    v2: data.districtid
                },
                {
                    s1: '#districtid',
                    s2: '#wardid',
                    api: apiGetS2WardDistrict,
                    v1: data.districtid,
                    v2: data.wardid
                }
            ]);
            mapDataForm(form, data, true);
        });

        checkboxAll('#checkInAssetCheckboxAll', '.checkInAssetCheckbox');

        $(table).on('click', '.row-details', function (event) {
            event.preventDefault();
            resetCheckInAsset($(this));

            let btn = $(this);
            let rowCurrent = btn.parents('tr');
            let openAsset = btn.data('open-detail');
            if (typeof openAsset == 'undefined') {
                openAsset = 0;
            }
            if (openAsset == 0) {
                btn.data('open-detail', 1);
                btn.find('i').removeClass('fa-plus').addClass('fa-minus');
            } else {
                btn.data('open-detail', 0);
                btn.find('i').removeClass('fa-minus').addClass('fa-plus');
            }
            if (openAsset == 0) {
                let ids = rowCurrent.find('td:eq(0) input').val();
                let deptname = rowCurrent.find('td:eq(2)').text();
                rowCheckInAsset(ids, rowCurrent, deptname);
            }
        });

        showGenerateBarcode('#barcode', '#barcodeTarget');

        updateSettingCheckInAsset('#frmSettingCheckInAsset');
    }
}

const updateCheckIn = (form) => {
    if ($(form).length) {
        let typeForm = $('#frmCheckIn').attr('data-type');
        let perEdit = $('#frmCheckIn').attr('peredit');
        if (typeForm == 'edit') {
            $('#checkInDetailCheckboxAll').prop('disabled', false)
            $('#addCheckInDetail').removeClass('disabled').parent('span').attr('title', '');
            $('#deleteDetail').removeClass('disabled').parent('span').attr('title', '');
        } else {
            $('#checkInDetailCheckboxAll').prop('disabled', true);
            $('#addCheckInDetail').addClass('disabled').parent('span').attr('title', 'Vui lòng lưu thông tin');
            $('#deleteDetail').addClass('disabled').parent('span').attr('title', 'Vui lòng lưu thông tin');
        }
        if (typeForm == 'lock' || (typeForm == 'edit' && !perEdit)) {
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }

        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/checkin/view/${data.id}`).then(() => {
                updateCheckIn('#frmCheckIn');
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

        showS2ByS2('#deptid', '#receiver', apiS2EmployeeList)

        loadTableCheckInDetail('#checkindetail');

        showGenerateBarcode('#barcode', '#barcodeTarget');

        showConfrim('#lockCheckIn', () => {
            let checkinId = $('#lockCheckIn').data('id');
            LoadPage(`${webAdminUrl}/checkin/view/${checkinId}`).then(() => {
                updateCheckIn('#frmCheckIn');
            });
            showSweetAlertOk("Khóa thông tin thành công");
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin của phiếu nhập sẽ không được phép thay đổi. Anh/Chị muốn thực hiện thao tác này?')
    }
}

const updateCheckInDetail = (typeId, form, data = false) => {
    form.find('#specificForm').html("");
    return new Promise((resolve) => {
        apiGetFieldSpecific(typeId).then(render => {
            $('#specificForm').html(render);
            select2Loader();
            if (data) {
                showS2ByS2Value([{
                        s1: '#cityid',
                        s2: '#districtid',
                        api: apiGetS2DistrictCity,
                        v1: data.cityid,
                        v2: data.districtid
                    },
                    {
                        s1: '#districtid',
                        s2: '#wardid',
                        api: apiGetS2WardDistrict,
                        v1: data.districtid,
                        v2: data.wardid
                    }
                ]);
                mapDataForm(form, data);
            } else {
                showS2ByS2('#cityid', '#districtid', apiGetS2DistrictCity);
                showS2ByS2('#districtid', '#wardid', apiGetS2WardDistrict);
            }
            dateRangePickerLoader();
            numberLoaderList()

            deAction(form,true,true);
            auAction(form,true,true);
            resolve();
        })
    });
}

const rowCheckInDetail = (ids = '', insertAfterTr = '') => {
    let typeForm = $('#frmCheckIn').attr('data-type');
    if (ids != '' && insertAfterTr != '') {
        let fkeys = [];
        $(`#checkindetail thead th`).each((key, element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
        });
        let checkInId = $('#checkindetail').data('id');
        apiGetDetailInDropdown(ids,checkInId).then((data) => {
            let content = '';
            $.each(data.data, function (index, item) {
                let action = showActionDetailButton(item, 'checkin', 'CheckInDetail', {
                    u: (typeForm != 'lock' ? true : false),
                    v: true
                });
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
                            case 'cstatus':
                                content += `<td class="align-middle text-center">${showStatusCheckInAsset(item.cstatus)}</td>`
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

const resetCheckInDetail = (btn = null) => {
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

const rowCheckInAsset = (ids = '', insertAfterTr = '', deptname = "") => {
    if (ids != '' && insertAfterTr != '') {
        let fkeys = [];
        $(`#checkinasset thead th`).each((key, element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
        });
        apiGetDetailInDropdown(ids).then((data) => {
            let content = '';
            $.each(data.data, function (index, item) {
                let action = showViewDetail(item, 'checkin');
                content += `<tr class="detail-item"><td></td>`
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
                                content += `<td class="align-middle text-center">${showStatusCheckInAsset(item.cstatus)}</td>`
                                break;

                            default:
                                content += `<td class="align-middle">${item[element] ? item[element] : ''}</td>`
                                break;
                        }
                    }
                });
                content += `<td class="text-center align-middle">
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

const resetCheckInAsset = (btn = null) => {
    if (btn != null) {
        btn.parents('table').find('tr.detail-item').remove();
        btn.parents('table').find('button.row-details').not(btn).each(function (index, el) {
            let openAsset = $(this).data('open-detail');
            if (typeof openAsset != 'undefined' && openAsset == 1) {
                $(this).data('open-detail', 0);
                $(this).find('i').removeClass('fa-minus').addClass('fa-plus');
            }
        });
    }
}

const updateSettingCheckIn = (form) => {
    if ($(form).length) {
        let filterField = ['number', 'deptid', 'receiver', 'checkindate'];
        let tableField = ['number', 'deptname', 'checkindate', 'receivername', 'reason', 'description', 'suppliername', 'deliveryperson', 'quantity', 'reportfile'];
        showModalForm('#settingCheckIn', '#modalSettingCheckIn', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/checkin`).then(() => {
                loadTableCheckIn('#checkin');
                updateSettingCheckIn('#frmSettingCheckIn');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingCheckInAsset = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'deptid', 'typeid', 'cstatus'];
        let tableField = ['codes', 'name', 'typename', 'deptname', 'barcode', 'madename', 'producedyear', 'purchaseddate', 'suppliername', 'quantity', 'cstatus'];
        showModalForm('#settingCheckInAsset', '#modalSettingCheckInAsset', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/checkin/checkinasset`).then(() => {
                loadTableCheckInAsset('#checkinasset');
                updateSettingCheckInAsset('#frmSettingCheckInAsset');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingCheckInDetail = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'deptid', 'typeid'];
        let tableField = ['codes', 'name', 'typename', 'deptname', 'barcode', 'madename', 'producedyear', 'purchaseddate', 'suppliername', 'quantity'];
        showModalForm('#settingCheckInDetail', '#modalSettingCheckInDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let checkinId = $('#settingCheckInDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/checkin/view/${checkinId}`).then(() => {
                updateCheckIn('#frmCheckIn');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const deAction = (form, change = true, val = true) => {
    if(change){
        $(form).find('[name="isde"]:not([disabled])').unbind('change').change(function (e) { 
            e.preventDefault();
            if($(this).is(':checked')){
                $(form).find('[name="detype"],[name="typefactor"],[name="dedate"],[name="accumulated"]').prop({"required": true, "disabled": false});
            }else{
                $(form).find('[name="detype"],[name="typefactor"],[name="dedate"]').prop({"required": false, "disabled": true});
                if(!$('#isdis').is(":checked")){
                    $(form).find('[name="accumulated"]').prop({"required": false, "disabled": true});
                }
            }
        });
    
        $(form).find('[name="isdis"]:not([disabled])').unbind('change').change(function (e) { 
            e.preventDefault();
            if($(this).is(':checked')){
                $(form).find('[name="distype"],[name="disfactor"],[name="disdate"],[name="accumulated"]').prop({"required": true, "disabled": false});
            }else{
                $(form).find('[name="distype"],[name="disfactor"],[name="disdate"]',).prop({"required": false, "disabled": true});
                if(!$(form).find('[name="isde"]').is(":checked")){
                    $(form).find('[name="accumulated"]').prop({"required": false, "disabled": true});
                }
            }
        });

        if(val){
            $(form).find('[name="isde"]:not([disabled])').trigger('change');
            $(form).find('[name="isdis"]:not([disabled])').trigger('change');
        }
    }
}

const auAction = (form, change = true, val = true) => {
    if(change){
        $(form).find('[name="isup"]:not([disabled])').change(function (e) { 
            e.preventDefault();
            if($(this).is(':checked')){
                $(form).find('[name="aunumber"],[name="audate"]').prop({"required": true, "disabled": false});
            }else{
                $(form).find('[name="aunumber"],[name="audate"]').prop({"required": false, "disabled": true});
            }
        });

        if(val){
            $(form).find('[name="isup"]:not([disabled])').trigger('change');
        }
    }
}

updateCheckIn('#frmCheckIn');

loadTableCheckIn('#checkin');

loadTableCheckInAsset('#checkinasset');