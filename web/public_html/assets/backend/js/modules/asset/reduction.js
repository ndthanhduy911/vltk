const showStatusReduction = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `<span class="badge badge-warning p-1">Thanh lý</span>`;
        case 2:
            return `<span class="badge badge-warning p-1">Tiêu hủy</span>`;
        case 3:
            return `<span class="badge badge-warning p-1">Bị mất</span>`;
        case 4:
            return `<span class="badge badge-warning p-1">Thanh toán đầu tư</span>`;
        case 5:
            return `<span class="badge badge-warning p-1">Giảm khác</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showActionButtonReduction = (item) => {
    if(parseInt(item.status)){
        return showActionButton(item, 'reduction','Reduction',{v:true},true)
    }else{
        return showActionButton(item, 'reduction','Reduction',{u:true,l:true},true)
    }
}

const loadTableReduction = (table = 'reduction', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchReduction');
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
            "ajax": `${webAdminUrl}/reduction/getdata?${paramsUrl}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle');
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input ${parseInt(item.status) ? 'disabled' : ''} name="reductionCheckbox[]" class="reductionCheckbox" type="checkbox" value="${item.id}">
                `)
                $(`td:eq(${fkeys.indexOf('redate')})`, row).html(vi_moment(item.redate,'DD/MM/YYYY'));
                $(`td:eq(${fkeys.indexOf('reportfile')})`, row).addClass('text-center').html(btnViewRF('reduction',item.reportfile,true));
                $(`td:eq(${fkeys.indexOf('quantity')})`, row).addClass('text-center');
                $(`td:eq(${fkeys.indexOf('retype')})`, row).addClass('text-center').html(showStatusReduction(item.retype));
                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
                let action = showActionButtonReduction(item,'reduction','Reduction');
                if (action) {
                    $(`td:last`, row).addClass('text-nowrap text-center').html(action);
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
        // Show modal Reduction Import
        showModalForm('#importReduction', '#modalReductionImport', 'POST', () => {
            $('#modalReductionImport .modal-title').html('Nhập tài sản');
            $('#btnSummitReductionImport span').html('Tải lên');
            let filename = $('#modalReductionImport form').find('#importreductionfile');
            if($(filename).length){
                $(filename).unbind('change').change(function (e) { 
                    e.preventDefault();
                    let _this = $(this);
                    let importfile = _this[0].files[0];
                    if(importfile.size){                
                        if((/\.(xlsx|xls)$/i).test(importfile.name)){
                            
                        }else{
                            $(filename).val("");
                            Swal.fire({
                                type: 'error',
                                title: 'Biểu mẫu không đúng định dạng',
                                showConfirmButton: false,
                            })
                        }
                    }else{
                        Swal.fire({
                            type: 'error',
                            title: 'Biểu mẫu không tồn tại',
                            showConfirmButton: false,
                        })
                    }
                });
            }
        },(data,row)=>{
            LoadPage(`${webAdminUrl}/reduction`).then(()=>{
                loadTableReduction('#reduction');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });

        singleLoadPage(`#addReduction`).then(() => {
            updateReduction('#frmReduction');
        });

        singleLoadPage(`${table} tbody .editReduction,${table} tbody .viewReduction`).then(()=>{
            updateReduction('#frmReduction');
        });

        $(table).on( 'page.dt', function (e) {
            e.preventDefault();
            clearFlashSession();
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            let textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search reduction", `${webAdminUrl}/reduction${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/reduction/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search reduction", `${webAdminUrl}/reduction${textGetSearch}`);
        });

        checkboxAll('#reductionCheckboxAll','.reductionCheckbox');
        deleteAll('#deleteReduction','.reductionCheckbox',(data)=>{
            showSweetAlertOk('Xóa ghi giảm thành công');
            dt.draw();
        });

        showConfrim('.lockReduction',()=>{
            dt.draw();
            showSweetAlertOk(`Khóa ghi giảm thành công`);
        },'Nếu chọn “Đồng ý”, tất cả thông tin ghi giảm sẽ không được phép thay đổi và làm thay đổi thông tin tài sản sử dụng tương ứng. Anh/Chị muốn thực hiện thao tác này?')
        updateSettingReduction('#frmSettingReduction');
        cb();
    }
}

const loadTableReductionList = (table = '#reductionlist') => {
    let rId = $(table).attr('data-id');
    rId = rId ? rId : 0;
    let typeForm = $('#frmReductionList').attr('data-type')
    if ($(table).length) {
        let formSearch = $('#searchReductionList');
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
            "ajax": `${webAdminUrl}/reduction/getdatalist?${paramsUrl}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).addClass('text-center');
                $('td', row).addClass('align-middle');
                
                $(`td:eq(${fkeys.indexOf('decosts')})`, row).html(parseFloat(item.decosts) ? numberFormat(item.decosts) : '');

                $(`td:eq(${fkeys.indexOf('restcosts')})`, row).html(parseFloat(item.restcosts) ? numberFormat(item.restcosts) : '');
                
                $(`td:eq(${fkeys.indexOf('expenses')})`, row).html(parseFloat(item.expenses) ? numberFormat(item.expenses) : '');

                $(`td:eq(${fkeys.indexOf('evictioncosts')})`, row).html(parseFloat(item.evictioncosts) ? numberFormat(item.evictioncosts) : '');

                $(`td:eq(${fkeys.indexOf('retype')})`, row).addClass('text-center').html(showStatusReduction(item.retype));

                $('td:last', row).addClass('text-center').html(showViewDetail(item,'reduction'));

                if(typeForm == 'lock' || !item.private['u']){
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }

                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
            },
            "drawCallback": function (settings) {                
                if(settings.json.recordsFiltered){
                    $('#deptid').prop('disabled', true);
                }else{
                    $('#deptid').prop('disabled', false);
                }   
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
            let textGet = "?";
            data.forEach((element, index) => {
                textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search reduction", `${webAdminUrl}/reduction/list${textGet}`);
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
            dt.ajax.url( `${webAdminUrl}/reduction/getdatalist${textGetSearch}` ).load();
            window.history.pushState({}, "Search reduction", `${webAdminUrl}/reduction/list${textGetSearch}`);
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
        updateSettingReductionList('#frmSettingReductionList');
    }
}

const loadTableReductionDetail = (table = '#reductiondetail') => {
    let rId = $(table).attr('data-id');
    rId = rId ? rId : 0;
    let typeForm = $('#frmReduction').attr('data-type')
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
            "ajax": `${webAdminUrl}/reduction/getdatadetail/${rId}?${paramsUrl}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle');
                $('td:eq(0),td:eq(1)', row).addClass('text-center');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="reductionDetailCheckbox[]" class="reductionDetailCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                
                $(`td:eq(${fkeys.indexOf('decosts')})`, row).html(parseFloat(item.decosts) ? numberFormat(item.decosts) : '');

                $(`td:eq(${fkeys.indexOf('restcosts')})`, row).html(parseFloat(item.restcosts) ? numberFormat(item.restcosts) : '');
                
                $(`td:eq(${fkeys.indexOf('expenses')})`, row).html(parseFloat(item.expenses) ? numberFormat(item.expenses) : '');

                $(`td:eq(${fkeys.indexOf('evictioncosts')})`, row).html(parseFloat(item.evictioncosts) ? numberFormat(item.evictioncosts) : '');

                $('td:last', row).addClass('text-center').html(showActionDetailButton(item,'reduction','ReductionDetail',{u:true}));

                if(typeForm == 'lock' || !item.private['u']){
                    $(row).find('td:last').addClass('hidden');
                    $(table).find('thead tr th:last').addClass('hidden');
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }

                if(!item.private['d']){
                    $(row).find('td:first').addClass('hidden');
                    $(table).find('thead tr th:first').addClass('hidden');
                }
            },
            "drawCallback": function (settings) {                
                if(settings.json.recordsFiltered){
                    $('#deptid').prop('disabled', true);
                }else{
                    $('#deptid').prop('disabled', false);
                }   
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
            textGet = "?paged="+info.page;
            window.history.pushState({}, "Search reductiondetail", `${webAdminUrl}/reduction/view${textGet}`);
        });

        // Show modal ReductionDetail Add
        $('#addReductionDetail').unbind('click').click(function (e) { 
            e.preventDefault();
            showModalNotSm('#modalReductionDetailMore','#frmReductionDetailMore',()=>{
                $('#modalReductionDetailMore .modal-title').html('Thêm chi tiết tài sản');
                let deptId = $('#deptid').val();
                if(deptId){
                    loadTableReductionDetailMore('#reductionDetailMore', deptId, rId);
                }else{
                    Swal.fire({
                        position: 'top',
                        type: 'error',
                        title: 'Vui lòng chọn Đơn vị/ bộ phận',
                        showConfirmButton: false,
                    })
                }
            })
        });

        showModalForm(`.editReductionDetail`, '#modalReductionDetail', 'GET', (data) => {
            $('#btnReductionDetail span').html('Cập nhật');
            $('#modalReductionDetail .modal-title').html('Cập nhật tài sản');
            $('.numberPrice').trigger('change');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        showModalForm(`.viewDetail`, '#modalViewDetail', 'GET', (data) => {
            $('#modalViewDetail .modal-title').html('Thông tin tài sản');
            showViewGallery('#detail-img','checkindetail', isJson(data.image) ? JSON.parse(data.image) : data.image);
        });

        checkboxAll('#reductionDetailCheckboxAll','.reductionDetailCheckbox');
        deleteAll('#deleteReductionDetail','.reductionDetailCheckbox',(data)=>{
            showSweetAlertOk('Xóa tài sản chi tiết thành công');
            dt.draw();
        });
        updateSettingReductionDetail('#frmSettingReductionDetail');
    }
}

const loadTableReductionDetailMore = (table = '#reductionDetailMore', deptId = 0, rId = 0) => {
    if ($(table).length && deptId && rId) {
        let formSearch = $('#searchReductionDetailMore');
        $('#typeidSearch option:not([value="0"])').remove();
        apiGetS2AssetTypeDept(deptId, {rId: rId}).then((data)=>{        
            $('#typeidSearch').select2({
                data : data
            });
        });
        if (!$.fn.DataTable.isDataTable(table)) {
            let fkeys = [];
            $(`${table} thead th`).each((key,element) => {
                let fkey = $(element).data('col');
                fkeys.push(fkey);
            });
    
            let dt = $(table).DataTable({
                "ordering": false,
                "processing": true,
                "serverSide": true,
                "autoWidth": false,
                "ajax": `${webAdminUrl}/reduction/getdatadetailsearch/${deptId}`,
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
                    },
                    {
                        "data": "no"
                    },
                    {
                        "data": "no"
                    },
                    {
                        "data": "no"
                    },
                    {
                        "data": "no"
                    },
                    {
                        "data": "no"
                    }
                ],
                'createdRow': function (row, item, dataIndex) {
                    $('td:eq(0)', row).addClass('text-center');
                    $('td', row).addClass('align-middle');

                    $(`td:eq(${fkeys.indexOf('decosts')})`, row).html(renderForm('decosts','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, rq:true,class:'numberPrice'}))
                    $(`td:eq(${fkeys.indexOf('restcosts')})`, row).html(renderForm('restcosts','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, rq:true,class:'numberPrice'}))
                    $(`td:eq(${fkeys.indexOf('expenses')})`, row).html(renderForm('expenses','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, rq:false,class:'numberPrice'}))
                    $(`td:eq(${fkeys.indexOf('evictioncosts')})`, row).html(renderForm('evictioncosts','text','Ví dụ: 1,000,000',dataIndex,'',{max: 20, size: 20, rq:false,class:'numberPrice'}))
                    $(`td:eq(${fkeys.indexOf('note')})`, row).html(renderForm('note','text','Ví dụ: Ghi chú',dataIndex,'',{max: 20, size: 20, rq:false}))
                    
                    $('td:last', row).addClass('text-center').html(`
                        <div class="btn-group btn-group-sm">
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-info editDetailMore" data-toggle="tooltip" title="Cập nhật"><span><i class="fas fa-save"></i></span></a>
                            <a href="#" data-href="#" class="btn btn-hnn btn-hnn-danger rmDetailMore" data-toggle="tooltip" title="Xóa"><span><i class="fas fa-ban"></i></span></a>
                        </div>
                    `);
                    $(row).find('.editDetailMore').click(function (e) { 
                        e.preventDefault();
                        let data = {};
                        let cH = $(`td:eq(${fkeys.indexOf('decosts')})`, row).hasClass('hidden');
                        let decosts = $(row).find('#decosts'+dataIndex).val();
                        if(!cH){
                            data.decosts = decosts;
                        }
                        let cRH = $(`td:eq(${fkeys.indexOf('restcosts')})`, row).hasClass('hidden');
                        let restcosts = $(row).find('#restcosts'+dataIndex).val();
                        if(!cRH){
                            data.restcosts = restcosts;
                        }

                        if((!cH && !data.decosts)){
                            showSweetAlertError("Vui lòng nhập giá trị hao mòn");
                        }else if(!cRH && !data.restcosts){
                            showSweetAlertError("Vui lòng nhập giá trị còn lại");
                        }else{
                            $('body').append(loaderHtml);
                            data.reductionid = rId;
                            data.code = item.code;
                            $.ajax({
                                type: "POST",
                                url: `${webAdminUrl}/reduction/addonedetail`,
                                data: data,
                                dataType: "json",
                                success: function (response) {
                                    $('body .block-loader').remove();
                                    if(typeof response.error == 'undefined'){
                                        $('td:last', row).html(`<span class="fas fa-check text-success" style="font-size: 16px !important"></span>`);
                                        $('#reductiondetail').DataTable().draw();
                                        $('#typeidSearch option:not([value="0"])').remove();
                                        apiGetS2AssetTypeDept(deptId, {rId: rId}).then((data)=>{  
                                            data.unshift({id:'',text : 'Chọn'});     
                                            $('#typeidSearch').select2({
                                                data : data
                                            });
                                        });
                                    }else{
                                        dataError = response.error.join(',');
                                        showSweetAlertError(dataError);
                                    }
                                },
                                error: function (error) {                        
                                    $('body .block-loader').remove();
                                    showSweetAlertError('Thất bại')
                                }
                            });
                        }
                    });
                },
                "drawCallback": function (settings) {                
                    $('#frmReductionDetailMore').validator('update');
                    $('#frmReductionDetailMore').off('submit').validator().on('submit', function (e) {
                        if (e.isDefaultPrevented()) {
                        } else {
                            e.preventDefault();
                            $(table).find('.editDetailMore').trigger('click');
                        }
                    });
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
            formSearch.unbind('submit').submit(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                dt.ajax.url(`${webAdminUrl}/reduction/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
            $(table).off('.rmDetailMore').on( 'click', '.rmDetailMore', function (e) {
                e.preventDefault();
                $(this).parents('tr').remove();
                $('#frmReductionDetailMore').validator('update');
            });
        }else{
            $(table).DataTable().ajax.url(`${webAdminUrl}/reduction/getdatadetailsearch/${deptId}`).load()
            formSearch.unbind('submit').submit(function (e) {
                e.preventDefault();
                clearFlashSession();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?";
                dataSearch.forEach((element, index) => {
                    textGetSearch += `${index !== 0 ?'&':''}${element.name}=${element.value}`
                })
                $(table).DataTable().ajax.url(`${webAdminUrl}/reduction/getdatadetailsearch/${deptId}${textGetSearch}`).load();
            });
        }
    }
}

const updateReduction = (form) => {
    if ($(form).length) {
        let typeForm = $(form).attr('data-type');
        let perEdit = $(form).attr('peredit');
        if (typeForm == 'edit') {
            $('#reductionDetailCheckboxAll').prop('disabled',false);
            $('#addReductionDetail').removeClass('disabled').parent('span').attr('title','');
            $('#deleteReductionDetail').removeClass('disabled').parent('span').attr('title','');
        } else {
            $('#reductionDetailCheckboxAll').prop('disabled',true);
            $('#addReductionDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
            $('#deleteReductionDetail').addClass('disabled').parent('span').attr('title','Vui lòng lưu thông tin');
        }

        if(typeForm == 'lock' || (typeForm == 'edit' && !perEdit)){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
            $(form).find('label.custom-file-label').addClass('disabled');
        }

        sendAjax(form, "POST").then((result) => {
            let data = result.data;
            LoadPage(`${webAdminUrl}/reduction/view/${data.id}`).then(() => {
                updateReduction('#frmReduction');
            });
            if (typeForm == 'edit') {
                addFlashSession('success', "Cập nhật thành công");
            } else {
                addFlashSession('success', "Thêm mới thành công");
            }
        });

        checkUploadFile($(form).find('#reportfile'), (/\.(jpg|jpeg|png|pdf)$/i),(data)=>{
            if(!data.s){
                $(data.this).val('');
            }
        })
        loadTableReductionDetail('#reductiondetail');

        showConfrim('#lockReduction', () => {
            let reductionId = $('#lockReduction').data('id');
            LoadPage(`${webAdminUrl}/reduction/view/${reductionId}`).then(() => {
                updateReduction('#frmReduction');
            });
            showSweetAlertOk("Khóa thông tin thành công");
        }, 'Nếu chọn “Đồng ý”, tất cả thông tin ghi giảm sẽ không được phép thay đổi. Anh/Chị muốn thực hiện thao tác này?')
    }
}

const updateSettingReduction = (form) => {
    if ($(form).length) {
        let filterField = ['number', 'deptid', 'redate'];
        let tableField = ['number','deptname','redate','reason','note','reportfile'];
        showModalForm('#settingReduction', '#modalSettingReduction', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/reduction`).then(() => {
                loadTableReduction('#reduction');
                updateSettingReduction('#frmSettingReduction');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingReductionDetail = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'typeid'];
        let tableField = ['code','name','typename','costs','restcosts','costsreal','restcostsreal','note'];
        showModalForm('#settingReductionDetail', '#modalSettingReductionDetail', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            let reductionId = $('#settingReductionDetail').data('id');
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/reduction/view/${reductionId}`).then(() => {
                updateReduction('#frmReduction');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

const updateSettingReductionList = (form) => {
    if ($(form).length) {
        let filterField = ['code', 'name', 'typeid','retype'];
        let tableField = ['code','name','typename','decosts','restcosts','expenses','evictioncosts','note','retype'];
        showModalForm('#settingReductionList', '#modalSettingReductionList', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/reduction/list`).then(() => {
                loadTableReductionList('#reductionlist');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');

        settingFiled(form,filterField,tableField)
    }
}

updateReduction('#frmReduction');

loadTableReduction('#reduction');

loadTableReductionList('#reductionlist');