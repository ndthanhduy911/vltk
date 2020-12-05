const showDean = (dean = '') => {
    switch (parseInt(dean)) {
        case 1:
            return `<span class="badge badge-primary p-1">Trưởng khoa</span>`;
        case 2:
            return `<span class="badge badge-primary p-1">Phó trưởng khoa</span>`;
        default:
            return `<span class="badge badge-warning p-1">Không</span>`;
    }
}

const showPosition = (pos = '') => {
    switch (parseInt(pos)) {
        case 1:
            return `<span class="badge badge-primary p-1">Trưởng bộ môn</span>`;
        case 2:
            return `<span class="badge badge-primary p-1">Phó bộ môn</span>`;
        case 3:
            return `<span class="badge badge-primary p-1">Giáo vụ</span>`;
        case 4:
            return `<span class="badge badge-primary p-1">Giảng viên</span>`;
        case 5:
            return `<span class="badge badge-primary p-1">Giảng viên thỉnh giảng</span>`;
        case 6:
            return `<span class="badge badge-primary p-1">Nhân viên</span>`;
        default:
            return `<span class="badge badge-warning p-1">Không</span>`;
    }
}

const loadTableItems = (table = '#items', cb = () => {}) => {
    if ($(table).length) {
        let router = {
            co:'staffs',aj:'ajaxgetdata',fo:'#searchItems',cl:'Items',ti:'cán bộ',
            ff:['title','email','status','createdat'],
            tf:['image','title','email','dean','deptposition','createdat','slug','status']
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
            "ajax": `${webAdminUrl}/${router.co}/${router.aj}?${paramsUrl}`,
            "columns":columns,
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle text-center');
                $('td:first', row).addClass('select-box').html(`
                    <input name="${router.co}Checkbox[]" class="${router.co}Checkbox" type="checkbox" value="${item.id}" data-dept=${item.deptid}>
                `)
                let pageInfo = $(table).DataTable().page.info();
                let page = pageInfo.page;
                let pageLength = pageInfo.length;
                $('td:eq(1)', row).html((dataIndex+1)+(page*pageLength));
                let image = `<img src="${getPathImage(item.image, '/assets/frontend/images/defaut_img.png')}" height="30px">`;
                $(`td:eq(${fkeys.indexOf('title')})`, row).html(showTitle(item.title,30));
                $(`td:eq(${fkeys.indexOf('image')})`, row).html(image);
                $(`td:eq(${fkeys.indexOf('slug')})`, row).html(getItemsLink(5,item));
                $(`td:eq(${fkeys.indexOf('dean')})`, row).html(showDean(item.dean));
                $(`td:eq(${fkeys.indexOf('deptposition')})`, row).html(showPosition(item.deptposition));
                $(`td:eq(${fkeys.indexOf('createdat')})`, row).html(vi_moment(item.createdat, 'DD/MM/YYYY HH:mm'));
                $(`td:eq(${fkeys.indexOf('status')})`, row).html(showStatus(item.status));
                $('td:last', row).addClass('text-nowrap').html(showButtonEdit(item,router.co,router.cl));
            }
        }
        dataTableCt(table,options,router).then(()=>{
            cb();
        });
    }
}

loadTableItems();