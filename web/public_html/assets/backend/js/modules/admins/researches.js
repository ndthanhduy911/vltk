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

const showTitle = (text,length = 100) => {
    return `<span title="${text}">${text ? trimText(text,length) : ''}</span>`
}

const getPageLink = (item) => {
    if(item.dslug != '/'){
        return `<a target="_blank" href="${webUri}/${item.dslug}/news/${item.slug}">Link</a>`;
    }
    return `<a target="_blank" href="${webUri}/news/${item.slug}">Link</a>`;
}

const loadTableResearches = (table = '#researches', cb = () => {}) => {
    if ($(table).length) {
        let router = {
            co:'researches',aj:'ajaxgetdata',fo:'#searchResearches',cl:'Researches',ti:'hướng nghiên cứu',
            ff:['title', 'status', 'createdat'],
            tf:['image','title','excerpt','createdat','slug','status'],
        };
        let paramsUrl = getParams();
        let columns = [];
        let fkeys = [];
        $(`${table} thead th`).each((key,element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
            // if(['ddcosts'].indexOf(fkey) === -1){
            //     columns.push({data : $(element).data('col')})
            // }else{
            //     columns.push({data : 'no'})
            // }
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
                $(`td:eq(${fkeys.indexOf('excerpt')})`, row).html(showTitle(item.excerpt,30));
                $(`td:eq(${fkeys.indexOf('image')})`, row).html(image);
                $(`td:eq(${fkeys.indexOf('slug')})`, row).html(getPageLink(item));
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

const loadTableTrashResearches = (table = '#trashresearches', cb = () => {}) => {
    if ($(table).length) {
        let router = {
            co:'researches',aj:'ajaxgetdatatrash',fo:'#searchTrashResearches',cl:'TrashResearches',ti:'hướng nghiên cứu',
            ff:['title', 'status', 'createdat'],
            tf:['image','title','excerpt','createdat','slug']
        };
        let paramsUrl = getParams();
        let columns = [];
        let fkeys = [];
        $(`${table} thead th`).each((key,element) => {
            let fkey = $(element).data('col');
            fkeys.push(fkey);
            // if(['ddcosts'].indexOf(fkey) === -1){
            //     columns.push({data : $(element).data('col')})
            // }else{
            //     columns.push({data : 'no'})
            // }
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
                $(`td:eq(${fkeys.indexOf('excerpt')})`, row).html(showTitle(item.excerpt,30));
                $(`td:eq(${fkeys.indexOf('image')})`, row).html(image);
                $(`td:eq(${fkeys.indexOf('slug')})`, row).html(getPageLink(item));
                $(`td:eq(${fkeys.indexOf('createdat')})`, row).html(vi_moment(item.createdat, 'DD/MM/YYYY HH:mm'));
            }
        }

        dataTableCt(table,options,router)
        cb();
    }
}

const updateResearches = (form = '#frmResearches') => {
    if($(form).length){
        if($(`${form} #ckEditor1`).length){
            getCkeditor1();
        }
    
        if($(`${form} #ckEditor2`).length){
            getCkeditor2();
        }
    
        sendAjax(form, "POST").then(() => {
            window.location.href=`${webAdminUrl}/researches`;
        });
    
        showSelectImage('#uploadImage','#showImg','#image', '#removeImage');
        changeTitleToSlug('#title', '#slug');
    }
}

loadTableResearches('#researches');
loadTableTrashResearches('#trashresearches',()=>{
    deleteAll(`#restoreResearches`, `.researchesCheckbox`,(data) => {
        showSweetAlertOk('Khôi phục hướng nghiên cứu thành công');
        $('#trashresearches').DataTable().draw();
    });
});
updateResearches();

showSelectImage('#uploadImage','#showImg','#image', '#removeImage');

showSelectImage('#uploadBgImage','#showBgImg','#bgimage', '#removeBgImage');
