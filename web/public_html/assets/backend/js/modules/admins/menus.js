const showStatus = (id = '') => {
    switch (parseInt(id)) {
        case 0:
            return `<span class="badge badge-danger p-2">Khóa</span>`;
        case 1:
            return `<span class="badge badge-success p-2">Hoạt động</span>`;
        default:
            return `<span class="badge badge-warning p-2">Chờ</span>`;
    }
}

const loadTableHeadMenus = (table = '#headMenus', cb = () => {}) => {
    if ($(table).length) {
        let lId = $(table).attr('locationid');
        let router = {
            co:'menus',aj:`ajaxgetdata/${lId}`,fo:false,cl:'Menus',ti:'menus',
            ff:false,
            tf:false
        };
        let paramsUrl = getParams();
        let columns = [];
        let fkeys = [];
        $(`${table} thead th`).each((key,element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
            columns.push({data : $(element).data('col')})
        });

        let options = {
            "serverSide": true,
            "paging": false,
            "info" :false,
            "ajax": `${webAdminUrl}/${router.co}/${router.aj}?${paramsUrl}`,
            "columns":columns,
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle');
                $('td:not(:eq(0))', row).addClass('align-middle text-center')
                $(`td:eq(${fkeys.indexOf('status')})`, row).html(showStatus(item.status));
                $('td:last', row).addClass('text-nowrap').html(createButton([2, 'update' ,'getsingle'],item,'menus','Menus'));
                if(!parseInt(item.parentid)){
                    $(row).addClass('font-weight-bold');
                }
            }
        }
        dataTableCt(table,options,router).then((dt)=>{
            cb(dt);
        });
    }
}

loadTableHeadMenus('#headMenus',(dt)=>{
    showModalForm('#addHeadMenu', '#modalMenus', 'GET', () => {
        $('#modalMenus .modal-title').html('Thêm mới');
        $('.btnSummitMenus span').html('Thêm mới');
    },(data,row)=>{
        dt.draw();
        Swal.fire({
            type: 'success',
            title: 'Thêm mới thành công',
            showConfirmButton: false,
            timer: 1500
        })
    });

    showModalForm('#headMenus .editMenus', '#modalMenus', 'GET', () => {
        $('#modalMenus .modal-title').html('Cập nhật');
        $('.btnSummitMenus span').html('Cập nhật');
    },(data,row)=>{
        dt.draw();
        Swal.fire({
            type: 'success',
            title: 'Cập nhật thành công',
            showConfirmButton: false,
            timer: 1500
        })
    });
})

loadTableHeadMenus('#footMenus',(dt)=>{
    showModalForm('#addFootMenu', '#modalMenus', 'GET', () => {
        $('#modalMenus .modal-title').html('Thêm mới');
        $('.btnSummitMenus span').html('Thêm mới');
    },(data,row)=>{
        dt.draw();
        Swal.fire({
            type: 'success',
            title: 'Thêm mới thành công',
            showConfirmButton: false,
            timer: 1500
        })
    });

    showModalForm('#footMenus .editMenus', '#modalMenus', 'GET', () => {
        $('#modalMenus .modal-title').html('Cập nhật');
        $('.btnSummitMenus span').html('Cập nhật');
    },(data,row)=>{
        dt.draw();
        Swal.fire({
            type: 'success',
            title: 'Cập nhật thành công',
            showConfirmButton: false,
            timer: 1500
        })
    });
});
