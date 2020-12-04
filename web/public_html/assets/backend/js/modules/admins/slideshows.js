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

const getBannerLink = (item) => {
    if(item.dslug != '/'){
        return `<a target="_blank" href="${webUri}/${item.dslug}/news/${item.slug}">Link</a>`;
    }
    return `<a target="_blank" href="${webUri}/news/${item.slug}">Link</a>`;
}

const loadTableSlideshows = (table = '#slideshows', cb = () => {}) => {
    if ($(table).length) {
        let router = {
            co:'slideshows',aj:'ajaxgetdata',fo:'#searchSlideshows',cl:'Slideshows',ti:'banners',
            ff:['name', 'status', 'createdat'],
            tf:['image','name','description','createdat','status'],
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
                $(`td:eq(${fkeys.indexOf('name')})`, row).html(showTitle(item.name,30));
                $(`td:eq(${fkeys.indexOf('description')})`, row).html(showTitle(item.description,30));
                $(`td:eq(${fkeys.indexOf('image')})`, row).html(image);
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

const updateSlideshows = (form = '#frmSlideshows') => {
    if($(form).length){
        if($(`${form} #content1`).length){
            getCkeditor1();
        }
    
        if($(`${form} #content2`).length){
            getCkeditor2();
        }
    
        sendAjax(form, "POST").then(() => {
            window.location.href=`${webAdminUrl}/slideshows`;
        });
    
        showSelectImage('#uploadImage','#showImg','#image', '#removeImage');
        showSelectImage('#uploadBgImage','#showBgImg','#bgimage', '#removeBgImage');
        changeTitleToSlug('#title', '#slug');
    }
}

loadTableSlideshows('#slideshows');
updateSlideshows();
