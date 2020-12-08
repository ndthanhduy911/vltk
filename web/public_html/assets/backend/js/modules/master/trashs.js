const showTitle = (text,length = 100) => {
    return `<span title="${text}">${text ? trimText(text,length) : ''}</span>`
}

const loadTableTrashs = (table = '#trashs', cb = () => {}) => {
    if ($(table).length) {
        let router = {
            co:'trashs',aj:'ajaxgetdata',fo:false,cl:'Trashs',ti:'dữ liệu',
            ff:false,
            tf:false,
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
            "searching": true,
            "dom": '<"top"lif>rt<"bottom"lip><"clear">',
            'createdRow': function (row, item, dataIndex) {
                $('td', row).addClass('align-middle text-center');
                $('td:first', row).addClass('select-box').html(`
                    <input name="${router.co}Checkbox[]" class="${router.co}Checkbox" type="checkbox" value="${item.id}" data-dept=${item.deptid}>
                `)
                let pageInfo = $(table).DataTable().page.info();
                let page = pageInfo.page;
                let pageLength = pageInfo.length;
                let type = getParams('type');
                $('td:eq(1)', row).html((dataIndex+1)+(page*pageLength));
                $(`td:eq(${fkeys.indexOf('title')})`, row).html(showTitle(item.title,100));
                $(`td:eq(${fkeys.indexOf('des')})`, row).html(showTitle(item.des,100));
                $(`td:eq(${fkeys.indexOf('updatedat')})`, row).html(vi_moment(item.updatedat));
            }
        }
        dataTableCt(table,options,router).then(()=>{
            cb();
        });
    }
}
loadTableTrashs();