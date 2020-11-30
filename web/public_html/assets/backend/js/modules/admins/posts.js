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

const getPostLink = (item) => {
    if(item.dslug != '/'){
        return `<a href="${webUri}/${item.dslug}/news/${item.slug}">Link</a>`;
    }
    return `<a href="${webUri}/news/${item.slug}">Link</a>`;
}

const updatePosts = (form = '#frmPosts') => {
    if($(`${form} #ckEditor1`).length){
        getCkeditor1();
    }

    if($(`${form} #ckEditor2`).length){
        getCkeditor2();
    }

    sendAjax(form, "POST").then(() => {
        LoadPage(`${webAdminUrl}/posts`).then(()=>{
            loadTablePosts('#posts');
        });
    });
    // if(!perEdit){
    //     $(form).find('select, input:not(.tokenCSRF)').prop('disabled', true);
    // }
}

const updateSettingPosts = (form) => {
    if ($(form).length) {
        let filterField = ['title', 'catid', 'status', 'calendar'];
        let tableField = ['image','title','excerpt','catid','authorname','calendar','slug','status'];
        showModalForm('#settingPosts', '#modalSettingPosts', 'GET', (data) => {
            let filters = data.filters.length ? data.filters : filterField;
            filters.forEach(element => {
                $(form).find(`#filters-${element}`).prop('checked', true);
            });
            let tables = data.tables.length ? data.tables : tableField;
            tables.forEach(element => {
                $(form).find(`#tables-${element}`).prop('checked', true);
            });
        }, (data, row) => {
            showSweetAlertOk("Thiết lập thành công");
            LoadPage(`${webAdminUrl}/posts`).then(() => {
                loadTablePosts('#posts');
                updateSettingPosts('#frmSettingPosts');
                $('body.modal-open').removeClass('modal-open');
                $('.modal-backdrop.fade.show').remove();
            });
        });
        checkboxAll('#filterSelectAll', 'input[name="filters[]"]');
        checkboxAll('#tablesSelectAll', 'input[name="tables[]"]');
        settingFiled(form,filterField,tableField)
    }
}

const loadTablePosts = (table = '#posts', cb = () => {}) => {
    if ($(table).length) {
        let router = {co:'posts',aj:'ajaxgetdata',fo:'#searchPosts',cl:'Posts',ti:'bài viết'};
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
                $(`td:eq(${fkeys.indexOf('catid')})`, row).html(item.catname);
                $(`td:eq(${fkeys.indexOf('slug')})`, row).html(getPostLink(item));
                $(`td:eq(${fkeys.indexOf('calendar')})`, row).html(vi_moment(item.calendar, 'DD/MM/YYYY HH:mm'));
                $(`td:eq(${fkeys.indexOf('status')})`, row).html(showStatus(item.status));
                $('td:last', row).addClass('text-nowrap').html(showButtonEdit(item,router.co,router.cl));
            }
        }

        dataTableCt(table,options,router)
        cb();
    }
}

const loadTablePostsTrash = (table = '#posts_trash', cb = () => {}) => {
    if ($(table).length) {

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

        let formSearch = $('#searchPosts');
        let paramsUrl = getParams();
        let options = {
            "serverSide": true,
            "ajax": `${webAdminUrl}/posts/ajaxgetdatatrash?${paramsUrl}`,
            "columns": columns,
            'createdRow': function (row, item, dataIndex) {
                let pageInfo = $(table).DataTable().page.info();
                let page = pageInfo.page;
                let pageLength = pageInfo.length;
                $('td:eq(0)', row).html((dataIndex+1)+(page*pageLength));
                let image = item.image ? `<img src="${item.image}" width="50px">` : '';
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(1)', row).html(image);
                $('td:eq(5)', row).html(vi_moment(item.createdat, 'DD/MM/YYYY HH:mm'));
                $('td:last', row).addClass('text-nowrap').html(`
                    <a href="#" data-href="${backendUrl}/posts/restore/${item.id}" title="Phục hồi" class="btn btn-sm btn-hnn btn-hnn-success restorePost"><span>Phục hồi</span></a>
                    <a href="#" data-href="${backendUrl}/posts/delete/${item.id}" title="Xóa vĩnh viễn" class="btn btn-sm btn-hnn btn-hnn-danger deletePost"><span>Xóa</span></a>
                `)
            },
            "language": {
                "sProcessing": "Đang xử lý...",
                "sLengthMenu": "Xem _MENU_",
                "sZeroRecords": "Không tìm thấy dữ liệu",
                "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ bài viết",
                "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 bài viết",
                "sInfoFiltered": "(được lọc từ _MAX_ bài viết)",
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
        }

        dataTableCt(table,options).then((dt) => {
            $(table).on( 'page.dt', function (e) {
                e.preventDefault();
                let paged = dt.page.info().page;
                let paramsUrl = setParam('paged',paged);
                window.history.pushState({}, "Search parade", `${webAdminUrl}/posts?${paramsUrl}`);
            });

            formSearch.submit(function (e) { 
                e.preventDefault();
                let dataSearch = formSearch.serializeArray();
                let textGetSearch = "?paged=";
                dataSearch.forEach((element, index) => {
                    if(element.name != "paged"){
                        textGetSearch += `&${element.name}=${element.value}`
                    }
                })            
                dt.ajax.url( `${webAdminUrl}/posts/ajaxgetdatatrash${textGetSearch}` ).load();
                window.history.pushState({}, "Search parade", `${webAdminUrl}/posts/trashs${textGetSearch}`);
            });

            showConfrimDelete('.restorePost',()=>{
                dt.draw();
            })
    
            showConfrimDelete('.deletePost',()=>{
                dt.draw();
            })

        })
        cb();
    }
}

loadTablePosts('#posts');
loadTablePostsTrash('#posts_trash');
changeTitleToSlug('#title', '#slug');
showSelectImage('#uploadImage','#showImg','#image', '#removeImage');
updatePosts();