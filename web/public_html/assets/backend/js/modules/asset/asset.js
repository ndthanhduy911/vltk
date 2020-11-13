//Datatable cho bảng asset
const showCurrentStatusAsset = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `<span class="badge badge-warning p-1">Không sử dụng</span>`;
        case 2:
            return `<span class="badge badge-info p-1">Đã sử dụng</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const showIsUp = (id = '') => {
    switch (parseInt(id)) {
        case 1:
            return `<span class="badge badge-warning p-1">Chưa ghi tăng</span>`;
        case 2:
            return `<span class="badge badge-info p-1">Đã ghi tăng</span>`;
        default:
            return `<span class="badge badge-warning p-1">Chờ</span>`;
    }
}

const loadTableAsset = (table = '#asset', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchAsset');
        let dataLoadSearch = formSearch.serializeArray();
        let paged = formSearch.find('[name="paged"]').val();
        let textGet = "?";
        dataLoadSearch.forEach((element, index) => {
            textGet += `${index !== 0 ?'&':''}${element.name}=${element.value}`
        });

        let columns = [];
        let fkeys = [];
        $(`${table} thead th`).each((key,element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
            if(['ddcosts'].indexOf(fkey) === -1){
                columns.push({data : $(element).data('col')})
            }else{
                columns.push({data : 'no'})
            }
        });

        let dt = $(table).DataTable({
            "ordering": false,
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": `${webAdminUrl}/asset/getdata${textGet}`,
            "searching": false,            
            "pageLength": 25,
            "dom": '<"top"fpil>rt<"bottom"lip><"clear">',
            "lengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]],
            "displayStart": paged*25,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                $('td:first,td:eq(1)', row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:first', row).addClass('select-box').html(`
                    <input name="assetCheckbox[]" class="assetCheckbox" type="checkbox" value="${item.id}" data-dept=${item.deptid}>
                `)
                
                $(`td:eq(${fkeys.indexOf('startdate')})`, row).html(item.startdate ? vi_moment(item.startdate,'DD/MM/YYYY') : '');    
                $(`td:eq(${fkeys.indexOf('purchaseddate')})`, row).html(item.purchaseddate ? vi_moment(item.purchaseddate,'DD/MM/YYYY') : '');
                $(`td:eq(${fkeys.indexOf('costs')})`, row).addClass('text-center').html(numberFormat(item.costs)); 
                $(`td:eq(${fkeys.indexOf('restcosts')})`, row).addClass('text-center').html(numberFormat(parseFloat(item.restcosts)));
                $(`td:eq(${fkeys.indexOf('ddcosts')})`, row).addClass('text-center').html(numberFormat(parseFloat(item.accumulated)));
                $(`td:eq(${fkeys.indexOf('deenddate')})`, row).html('');
                if(typeof item.isde != 'undefined'){
                    if(parseInt(item.isde) || parseInt(item.isdis)){                    
                        $(`td:eq(${fkeys.indexOf('deenddate')})`, row).html(item.deenddate ? vi_moment(item.deenddate,'DD/MM/YYYY') : ''); 
                    }
                }

                $(`td:eq(${fkeys.indexOf('crstatus')})`, row).addClass('text-center').html(showCurrentStatusAsset(item.crstatus));
                $('td:last', row).addClass('text-center').html(showActionButton(item,'asset','Asset',{u:true,v:true},true));
            },
            "drawCallback": function (settings) {                
                $(table).find('[data-toggle="tooltip"]').tooltip();
                $(table).find('thead th').each((index,item)=>{
                    if($(item).hasClass('hidden')){
                        // console.log(index);
                        $(table+' tbody tr').find(`td:eq(${index})`).addClass('hidden')
                    }
                })
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
        
        $('#exportAsset').attr('href',`${webAdminUrl}/asset/export${textGet}`);
        $('#printAsset').attr('href',`${webAdminUrl}/asset/print${textGet}`);

        // Show modal Asset Import
        showModalForm('#importAsset', '#modalAssetImport', 'POST', () => {
            $('#modalAssetImport .modal-title').html('Nhập tài sản');
            $('#btnSummitAssetImport span').html('Tải lên');
            let filename = $('#modalAssetImport form').find('#importassetfile');
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
            LoadPage(`${webAdminUrl}/asset`).then(()=>{
                loadTableAsset('#asset');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
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
            $('#exportAsset').attr('href',`${webAdminUrl}/asset/export${textGet}`);
            $('#printAsset').attr('href',`${webAdminUrl}/asset/print${textGet}`);
            window.history.pushState({}, "Search asset", `${webAdminUrl}/asset${textGet}`);
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
            $('#exportAsset').attr('href',`${webAdminUrl}/asset/export${textGetSearch}`);
            $('#printAsset').attr('href',`${webAdminUrl}/asset/print${textGetSearch}`);
            dt.ajax.url( `${webAdminUrl}/asset/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search asset", `${webAdminUrl}/asset${textGetSearch}`);
        });

        updateMultipleAsset('#updateMultipleAsset','.assetCheckbox',(data, depts)=>{
            showModal('#modalMultipleAsset',(form)=>{
                $('#modalMultipleAsset .modal-title').html('Cập nhật thông tin sử dụng tài sản');
                form.find('#deptid').val(depts[0]).trigger('change');
                $('#dataAssetIds').val(data);
                $('#depts').val(depts[0]);
            },(data)=>{
                showSweetAlertOk('Cập nhật thành công');
                $('#assetCheckboxAll').prop('checked', false);
                dt.draw();
            });
            showS2ByS2('#deptid','#employeeid',apiS2EmployeeList);
        });

        showModalForm('#printStamp', '#modalPrintStamp', 'GET', () => {
            $('#pdfV').addClass('hidden');
            $('#btnSPrintStamp').unbind('click').click(function (e) { 
                e.preventDefault();
                clearFlashSession();
                let dataSearch = $('#searchPrintStamp').serializeArray();
                let textGetSearch = "";
                dataSearch.forEach((el, index) => {
                    if(index == 0){
                        textGetSearch += `?${el.name}=${el.value}`
                    }else{
                        textGetSearch += `&${el.name}=${el.value}`
                    }
                })            
                $.ajax({
                    type: "GET",
                    url: `${webAdminUrl}/asset/getdatastamp${textGetSearch}`,
                    data: null,
                    dataType: "json",
                    success: function (data) {
                        printStamp(data)
                    }
                });
            });
        });
        
        singleLoadPage(`${table} tbody .editAsset, ${table} tbody .viewAsset`).then(()=>{
            updateAsset('#frmAsset');
        });

        singleLoadPage(`#addAsset`).then(()=>{
            updateAsset('#frmAsset');
        });

        showS2ByS2('#deptidSearch','#employeeSearch',apiS2EmployeeList,{ id:'0',text:'Tất cả'});
        checkboxAll('#assetCheckboxAll', '.assetCheckbox');

        updateSettingAsset('#frmSettingAsset');
        cb();
    }
}

// const calculatedDepreciation = (costs,dStartDate='yyyy-mm-dd',accumulated,typefactor,type) => {
//     costs = parseFloat(costs);
//     accumulated = parseFloat(accumulated);
//     typefactor = parseFloat(typefactor);
//     // console.log(costs);
//     // console.log(startdate);
//     // console.log(accumulated);
//     // console.log(typefactor);
    
//     let costsMore = calculatedDepreciationMore(dStartDate, costs, typefactor, type);
//     // console.log('Giá trị hao mòn: ' + (costsMore + accumulated));
//     return costsMore + accumulated;
// }

// const calculatedDepreciationMore = (dStartDate = 'yyyy-mm-dd', costs, typefactor, type = 1) => {    
//     typefactor = typefactor/100;
//     let currentDate = moment();
//     let startDate = moment(dStartDate, 'YYYY-MM-DD');
//     if(currentDate.format('DD/MM/YYYY') == startDate.format('DD/MM/YYYY')){
//         return 0;
//     }
//     let deMonth = type == 1 ? costs*typefactor/12 : costs*typefactor;
//     if(currentDate.format('MM/YYYY') == startDate.format('MM/YYYY')){
//         return deMonth/startDate.daysInMonth()*currentDate.diff(startDate, 'days');
//     }
//     let nPrevDay = startDate.daysInMonth() - startDate.format('DD');
//     let dePrevDay = deMonth/startDate.daysInMonth()*nPrevDay;

//     let nNextDay = currentDate.format('DD') - 1;
//     let deNextDay = deMonth/currentDate.daysInMonth()*nNextDay;

//     let startModDay = startDate.add(nPrevDay+1, 'days');
//     let endModDay = moment('01-'+currentDate.format('MM-YYYY'), 'DD-MM-YYYY');

//     let nModMonth = endModDay.diff(startModDay, 'months');
//     let deModMonth = nModMonth*deMonth;

//     // console.log(nModMonth);
//     // console.log(deModMonth);
//     // console.log(deNextDay);
//     // console.log(endModDay.format('DD/MM/YYYY'));

//     return dePrevDay +deModMonth + deNextDay;
// }

const updateAsset = (form) => {
    if($(form).length){
        let perEdit = $(form).attr('peredit');

        $(form).find('#btnUploadImage').addClass('disabled');
        sendAjax(form, "POST").then(() => {
            LoadPage(`${webAdminUrl}/asset`).then(()=>{
                loadTableAsset('#asset');
            });
        });
        if(!perEdit){
            $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
        }

        deAction(form,true,true);

        $('.sp-wrap').smoothproducts();
    }
}

const updateMultipleAsset = (button, selector, cb = ()=> {}) => {
    $(button).unbind('click').click(function (e) {
        e.preventDefault();
        let data = $(`${selector}:checked`).map(function () {
            let arrayId = this.value.split(',');                
            return arrayId;
        }).get();
        data = data.filter((value, index, self) => {
            return self.indexOf(value) === index;
        });

        let depts = $(`${selector}:checked`).map(function () {
            let arrayId = $(this).attr('data-dept').split(',');              
            return arrayId;
        }).get();
        depts = depts.filter((value, index, self) => {
            return self.indexOf(value) === index;
        });
        
        if (!data.length) {
            Swal.fire({
                position: 'top',
                type: 'error',
                title: 'Vui lòng chọn những tài sản muốn cập nhật',
                showConfirmButton: false,
            })
        } else if(depts.length !== 1) {
            Swal.fire({
                position: 'top',
                type: 'error',
                title: 'Vui lòng chọn những tài sản có cùng đơn vị/bộ phận sử dụng',
                showConfirmButton: false,
            })
        } else {
            cb(data, depts);
        }
    })
}

const updateSettingAsset = (form)=> {
    if($(form).length){
        let filterField = ['name','code','deptid','employeeid'];
        let tableField = ['code','name','specifications','typename','deptname','employeename','startdate','purpose','crstatus'];
        showModalForm('#settingAsset', '#modalSettingAsset', 'GET', (data) => {
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
            LoadPage(`${webAdminUrl}/asset`).then(()=>{
                loadTableAsset('#asset');
                updateSettingAsset('#frmSettingAsset');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll','input[name="filters[]"]');
        checkboxAll('#tablesSelectAll','input[name="tables[]"]');

        settingFiled(form,filterField,tableField)

    }
}

const printStamp = (data) => {
    if(data.length){
        let dd = {
            info: {
                title: 'In thẻ Tài sản',
                author: 'HONEYNET',
                subject: 'In thẻ Tài sản',
                keywords: 'In thẻ Tài sản',
            },
            content: [],
            styles: {
                tableExample: {
                    margin: 2
                },
                thead: {
                    bold: true,
                    fontSize: 11,
                    color: 'black'
                },
                tbody: {
                    fontSize: 11,
                    alignment: 'center'
                    // color: 'black'
                }
            },
            // watermark: 'HONEYNET',
            pageMargins: [ 10, 10, 10, 10 ],
        }
        let stt = 0;
        let count = 0;
        let row = {
            columns : []
        };
        data.forEach((el) => {
            // console.log(row.columns);
            row.columns.push({
                color: '#444',
                width: 'auto',
                style : 'tableExample',
                table: {
                    widths: ['auto', 'auto'],
                    headerRows: 2,
                    body: [
                        [{text: 'HONEYNET\nKIỂM KÊ TÀI SẢN', style: 'thead', colSpan: 2, alignment: 'center'}, {}],
                        [{text: 'Tên TS', style: 'thead'}, {text: el.name,style: 'tbody'}],
                        [{text: 'Mã TS', style: 'thead',margin: [0, 20, 0, 0]}, [{ qr: el.code,fit: '50',alignment: 'center' },{text: el.code,fontSize:9,alignment: 'center'}]],
                        [{text: 'Nơi đặt', style: 'thead'}, {text: el.deptname,style: 'tbody'}],
                    ]
                }
            })
            if(count == 15){
                count = 0;
                row.pageBreak = "before"
            }else{
                count++
            }
            if(stt == 2) {
                dd.content.push(row);
                row = {columns : []};
                stt = 0;
            }else{
                stt++;
            }
        });
        pdfMake.createPdf(dd).getDataUrl(function (outDoc) {
            document.getElementById('pdfV').src = outDoc;
        });
        $('#pdfV').removeClass('hidden');
    }

}

const deAction = (form, change = true, val = true) => {
    if(change){
        $(form).find('[name="isde"]:not([disabled])').change(function (e) { 
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
    
        $(form).find('[name="isdis"]:not([disabled])').change(function (e) { 
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

updateAsset('#frmAsset');

loadTableAsset('#asset');