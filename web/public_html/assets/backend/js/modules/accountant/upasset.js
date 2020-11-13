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

const loadTableAssetUp = (table = '#assetUp', cb = () => {}) => {
    if ($(table).length) {
        let modal = '#modalAssetUp';
        let formSearch = $('#searchAssetUp');
        let dataLoadSearch = formSearch.serializeArray();
        let paged = formSearch.find('[name="paged"]').val();
        let textGet = "?up=0";
        dataLoadSearch.forEach((element) => {
            textGet += `&${element.name}=${element.value}`
        });

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
            "ajax": `${webAdminUrl}/upasset/getdata${textGet}`,
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
                    <input name="assetUpCheckbox[]" class="assetUpCheckbox" type="checkbox" value="${item.id}">
                `)
                
                $(`td:eq(${fkeys.indexOf('audate')})`, row).html(item.audate ? vi_moment(item.audate,'DD/MM/YYYY') : '');  
                
                $(`td:eq(${fkeys.indexOf('isup')})`, row).addClass('text-center').html(showIsUp(item.isup));

                $('td:last', row).addClass('text-center').html(`
                    <div class="btn-group btn-group-sm">
                    ${createButton([2, 'updateup' ,'getsingle'],item,'asset','AssetUp')}
                    </div>
                `);
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
        
        $(table).on( 'page.dt', function (e) {
            e.preventDefault();
            clearFlashSession();
            let info = dt.page.info();
            formSearch.find('[name="paged"]').val(info.page);
            let data = formSearch.serializeArray();
            textGet = "?up=0";
            data.forEach((element, index) => {
                textGet += `&${element.name}=${element.value}`
            });
            window.history.pushState({}, "Search asset", `${webAdminUrl}/upasset/upasset${textGet}`);
        });


        showModalForm(`.editAssetUp`, modal, 'GET', (data) => {
            $('#btnSummitAssetUp span').html('Cập nhật');
            $(modal).find('.modal-title').html('Cập nhật');
            $(modal).validator('update');
        },(data,row)=>{
            dt.draw();
            showSweetAlertOk('Cập nhật thành công');
        });

        formSearch.submit(function (e) { 
            e.preventDefault();
            clearFlashSession();
            let dataSearch = formSearch.serializeArray();
            let textGetSearch = "?up=0&paged=";
            dataSearch.forEach((element, index) => {
                if(element.name != "paged"){
                    textGetSearch += `&${element.name}=${element.value}`
                }
            })            
            dt.ajax.url( `${webAdminUrl}/upasset/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search assetup", `${webAdminUrl}/upasset/upasset${textGetSearch}`);
        });

        updateMultipleAssetUp('#updateAssetUp','.assetUpCheckbox',(data)=>{
            showModal(modal,(form)=>{
                $(modal).find('.modal-title').html('Cập nhật thông tin tài sản');
                $('#dataAssetIds').val(data);
            },(data)=>{
                showSweetAlertOk('Cập nhật thành công');
                $('#assetUpCheckboxAll').prop('checked', false);
                dt.draw();
            });
        });

        checkboxAll('#assetUpCheckboxAll', '.assetUpCheckbox');

        cb();
    }
}

const updateMultipleAssetUp = (button, selector, cb = ()=> {}) => {
    $(button).unbind('click').click(function (e) {
        e.preventDefault();
        let data = $(`${selector}:checked`).map(function () {
            let arrayId = this.value.split(',');                
            return arrayId;
        }).get();
        data = data.filter((value, index, self) => {
            return self.indexOf(value) === index;
        });
        
        if (!data.length) {
            Swal.fire({
                position: 'top',
                type: 'error',
                title: 'Vui lòng chọn những tài sản muốn ghi tăng',
                showConfirmButton: false,
            })
        }else {
            cb(data);
        }
    })
}

loadTableAssetUp();