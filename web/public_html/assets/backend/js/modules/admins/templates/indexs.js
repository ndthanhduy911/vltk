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

const getItemsLink = (type,item) => {
    switch (parseInt(type)) {
        case 1:{
            if(item.dslug != '/'){
                return `<a target="_blank" href="${webUri}/${item.dslug}/news/${item.slug}">Link</a>`;
            }
            return `<a target="_blank" href="${webUri}/news/${item.slug}">Link</a>`;
        }
        case 2:{
            if(item.dslug != '/'){
                return `<a target="_blank" href="${webUri}/${item.dslug}/${item.slug}.html">Link</a>`;
            }
            return `<a target="_blank" href="${webUri}/${item.slug}.html">Link</a>`;
        }
        case 3:{
            return `<a target="_blank" href="${item.link}">Link</a>`;
        }
        case 4:{
            if(item.dslug != '/'){
                return `<a target="_blank" href="${webUri}/${item.dslug}/${item.slug}">Link</a>`;
            }
            return `<a target="_blank" href="${webUri}/${item.slug}">Link</a>`;
        }
        case 5:{
            if(item.dslug != '/'){
                return `<a target="_blank" href="${webUri}/${item.dslug}/staffs/${item.slug}">Link</a>`;
            }
            return `<a target="_blank" href="${webUri}/staffs/${item.slug}">Link</a>`;
        }
        default:{
            return "";
        }
    }
}
