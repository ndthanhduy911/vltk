$('.sp-wrap').smoothproducts();
let form = '.rForm';
// sendAjax(form, "POST").then((result) => {
    // let data = result.data;
    // window.location.reload();
// });
$(form).off('submit').validator().on('submit', function (e) {
    if (e.isDefaultPrevented()) {

    } else {
        e.preventDefault();
        $('#modalPrint').modal('show');
        let link = $(this).attr('action');
        let data = $(this).serializeArray();
        if(link){
            $('#modalPrint .btnDownloadExcel').attr('href',link+'?tf=1&'+$.param( data ));
            $('#modalPrint .btnDownloadPdf').attr('href',link+'?tf=2&'+$.param( data ));
            $('#modalPrint .btnPrintPdf').attr('href',link+'?tf=2&'+$.param( data ));
            $('#modalPrint .pdfDocument').attr('src',link+'?tf=2&'+$.param( data ));
        }
    }
})

$('#modalPrint').on('hidden.bs.modal', function (e) {
    e.preventDefault();
    $('#modalPrint .btnDownloadExcel').attr('href',"");
    $('#modalPrint .btnDownloadPdf').attr('href',"");
    $('#modalPrint .btnPrintPdf').attr('href',"");
    $('#modalPrint .viewEmbed').html(`<embed type="application/pdf" src="" class="pdfDocument" style="min-height: 600px; height: 80vh; width: 100%;" />`);
});

$('#reportTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	// e.relatedTarget
    let typeTab = $(e.target).data('tab');
    let ts = parseInt(getParams('ts'));
    ts =  ts ? 1 : 0;
    window.history.pushState({}, "", `${webAdminUrl}/reports?ts=${ts}&tabn=${typeTab}`);
    $('#btnShowView').attr('href',`${webAdminUrl}/reports?ts=${!ts ? 0 : 1}&tabn=${typeTab}`);
    $('#btnShowView span').attr('class','').addClass(`fas fa-${ !ts ? 'th-large' : 'list'}`);
});

const loadTableReport = (table = '#reports', cb = () => {}) => {
    if ($(table).length) {
        let formSearch = $('#searchReports');
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
            "ajax": `${webAdminUrl}/reports/getdata${textGet}`,
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
                    "data": "no"
                },
                {
                    "data": "no"
                }
            ],
            'createdRow': function (row, item, dataIndex) {
                let icon = item.icon ? `<span class="${item.icon}"></span>` : ``;
                let action = showActionButton(item,'reports','Reports');
                $('td:eq(0)', row).addClass('select-box').html(`
                    <input name="reportsCheckbox[]" class="reportsCheckbox" type="checkbox" value="${item.id}">
                `)
                $('td', row).addClass('align-middle');
                $('td', row).addClass('text-center');
                $('td:eq(3)', row).html(icon);
                $('td:last', row).html(action);
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
            dt.ajax.url( `${webAdminUrl}/reports/getdata${textGetSearch}` ).load();
            window.history.pushState({}, "Search reports", `${webAdminUrl}/reports/list${textGetSearch}`);
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
            window.history.pushState({}, "Search reports", `${webAdminUrl}/reports/list${textGet}`);
        });

        // Show modal Reports Update
        showModalForm('.editReports', '#modalReports', 'GET', (data) => {
            $('#btnSummitReports span').html('Cập nhật');
            $('#modalReports .modal-title').html('Cập nhật');
            $('#modalReports').validator('update');
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

        // Show modal Reports Add
        showModalForm('#addReports', '#modalReports', 'GET', () => {
            $('#modalReports .modal-title').html('Thêm mới');
            $('.btnSummitReports span').html('Thêm mới');
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

        checkboxAll('#reportsCheckboxAll','.reportsCheckbox');

        cb();
    }
}

loadTableReport('#reports');