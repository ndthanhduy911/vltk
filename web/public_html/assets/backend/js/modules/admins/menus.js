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
        case 6:{
            $('#modalMenus .boxtype').addClass('hidden').find('input,select').prop('disabled',true).prop('required',false);
            $('#modalMenus .boxtype[data-type=6]').removeClass('hidden').find('#gmajorid').prop('disabled',false).prop('required',true);
            break;
        }
        case 7:{
            $('#modalMenus .boxtype').addClass('hidden').find('input,select').prop('disabled',true).prop('required',false);
            $('#modalMenus .boxtype[data-type=7]').removeClass('hidden').find('#majorid').prop('disabled',false).prop('required',true);
            break;
        }
        default:{
            $('#modalMenus .boxtype').addClass('hidden').find('input,select').prop('disabled',true).prop('required',false);
            break;
        }
    }
}

const loadTableMenus = (table = '#headMenus', btnAdd = '',cb = () => {}) => {
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
                $('td:last', row).addClass('text-nowrap').html(`<div class="btn-group btn-group-sm">`+createButton([2, 'update' ,'getsingle'],item,'menus','Menus')+createButton([7, 'delete' ,false],item,'menus','Menus')+`</div>`);
                if(!parseInt(item.parentid)){
                    $(row).addClass('font-weight-bold');
                }
            }
        }
        dataTableCt(table,options,router).then((dt)=>{
            showModalForm(btnAdd, '#modalMenus', 'GET', () => {
                $('#modalMenus .modal-title').html('Thêm mới');
                $('.btnSummitMenus span').html('Thêm mới');
                $('#modalMenus #parentid option:not([value="0"])').remove();
                $('#modalMenus').off('change','#type').on('change','#type', function (e) {
                    e.preventDefault();
                    changeTypeMenu($(this).val());
                });
                apiS2MenusLocation(lId).then((data)=>{
                    $('#modalMenus #parentid').find
                    $('#modalMenus #parentid').select2({data: data});
                });
                $(`#modalMenus #locationid`).val(lId);
            },(data,row)=>{
                dt.draw();
                Swal.fire({
                    type: 'success',
                    title: 'Thêm mới thành công',
                    showConfirmButton: false,
                    timer: 1500
                })
            });
        
            showModalForm(`${table} .editMenus`, '#modalMenus', 'GET', (data) => {
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
                $('#modalMenus #parentid option:not([value="0"])').remove();
                apiS2MenusLocation(lId).then((menus)=>{
                    $('#modalMenus #parentid').select2({data: menus}).val(data.parentid).trigger('change');
                })
            },(data,row)=>{
                dt.draw();
                Swal.fire({
                    type: 'success',
                    title: 'Cập nhật thành công',
                    showConfirmButton: false,
                    timer: 1500
                })
            });

            cb(dt,lId);
        });
    }
}

loadTableMenus('#headMenus','#addHeadMenu');

loadTableMenus('#footMenus','#addFootMenu');
