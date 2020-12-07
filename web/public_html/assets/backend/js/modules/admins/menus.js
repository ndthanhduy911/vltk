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

const changeTypeMenu = (type) => {
    
    switch (parseInt(type)) {
        case 1:{
            $('#modalMenus .boxtype').addClass('hidden').find('input,select').prop('disabled',true).prop('required',false);
            $('#modalMenus .boxtype[data-type=1]').removeClass('hidden').find('#postid').prop('disabled',false).prop('required',true);
            break;
        }
        case 2:{
            $('#modalMenus .boxtype').addClass('hidden').find('input,select').prop('disabled',true).prop('required',false);
            $('#modalMenus .boxtype[data-type=2]').removeClass('hidden').find('#pageid').prop('disabled',false).prop('required',true);
            break;
        }
        case 3:{
            $('#modalMenus .boxtype').addClass('hidden').find('input,select').prop('disabled',true).prop('required',false);
            $('#modalMenus .boxtype[data-type=3]').removeClass('hidden').find('#catid').prop('disabled',false).prop('required',true);
            break;
        }
        case 4:{
            $('#modalMenus .boxtype').addClass('hidden').find('input,select').prop('disabled',true).prop('required',false);
            $('#modalMenus .boxtype[data-type=4]').removeClass('hidden').find('#dept').prop('disabled',false).prop('required',true);
            break;
        }
        case 5:{
            $('#modalMenus .boxtype').addClass('hidden').find('input,select').prop('disabled',true).prop('required',false);
            $('#modalMenus .boxtype[data-type=5]').removeClass('hidden').find('#links').prop('disabled',false).prop('required',true);
            break;
        }
        default:{
            $('#modalMenus .boxtype').addClass('hidden').find('input,select').prop('disabled',true).prop('required',false);
            break;
        }
    }
}

const loadTableMenus = (table = '#headMenus', cb = () => {}) => {
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
            cb(dt,lId);
        });
    }
}

loadTableMenus('#headMenus',(dt,lId)=>{
    showModalForm('#addHeadMenu', '#modalMenus', 'GET', () => {
        $('#modalMenus .modal-title').html('Thêm mới');
        $('.btnSummitMenus span').html('Thêm mới');
        $('#modalMenus').off('change','#type').on('change','#type', function (e) {
            e.preventDefault();
            changeTypeMenu($(this).val());
        });
        apiS2MenusLocation(lId).then((data)=>{
            // console.log(data);
            $('#modalMenus #parentid').select2({data: data});
        })
    },(data,row)=>{
        dt.draw();
        Swal.fire({
            type: 'success',
            title: 'Thêm mới thành công',
            showConfirmButton: false,
            timer: 1500
        })
    });

    showModalForm('#headMenus .editMenus', '#modalMenus', 'GET', (data) => {
        $('#modalMenus .modal-title').html('Cập nhật');
        $('.btnSummitMenus span').html('Cập nhật');
        data.lang.forEach(lang => {
            $(`#modalMenus #title${lang.langid}`).val(lang.title);
        });
        changeTypeMenu(data.type);
        $('#modalMenus').off('change','#type').on('change','#type', function (e) {
            e.preventDefault();
            changeTypeMenu($(this).val());
        });
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

loadTableMenus('#footMenus',(dt)=>{
    showModalForm('#addFootMenu', '#modalMenus', 'GET', () => {
        $('#modalMenus .modal-title').html('Thêm mới');
        $('.btnSummitMenus span').html('Thêm mới');
        $('#modalMenus').off('change','#type').on('change','#type', function (e) {
            e.preventDefault();
            changeTypeMenu($(this).val());
        });
    },(data,row)=>{
        dt.draw();
        Swal.fire({
            type: 'success',
            title: 'Thêm mới thành công',
            showConfirmButton: false,
            timer: 1500
        })
    });

    showModalForm('#footMenus .editMenus', '#modalMenus', 'GET', (data) => {
        $('#modalMenus .modal-title').html('Cập nhật');
        $('.btnSummitMenus span').html('Cập nhật');
        $('#modalMenus .modal-title').html('Cập nhật');
        $('.btnSummitMenus span').html('Cập nhật');
        data.lang.forEach(lang => {
            $(`#modalMenus #title${lang.langid}`).val(lang.title);
        });
        changeTypeMenu(data.type);
        $('#modalMenus').off('change','#type').on('change','#type', function (e) {
            e.preventDefault();
            changeTypeMenu($(this).val());
        });
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
