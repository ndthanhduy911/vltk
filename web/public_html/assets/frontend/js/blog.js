const showBlog = (blogId,pagingId,cpaged = false) => {
    if($(blogId).length){
        return new Promise((resolve, reject) => {
            let url = $(blogId).data('get');
            if(url){
                let paged = parseInt(getParams('paged'));
                paged = paged ? paged :0;
                if(cpaged !== false){
                    paged = cpaged
                }
                let dsid = parseInt(getParams('dsid'));
                dsid = dsid ? dsid : 0;
                let data = {start : paged*10, length:10, draw: 0,paged:paged};
                if(dsid){
                    data.dsid = dsid;
                }
                let search = getParams('s');
                if(search){
                    data.nameSearch = search.replace(/(<([^>]+)>)/ig,"");
                }
                callApi(url,data).then(data => {
                    createBlog(blogId,data.data)
                    createPaging(pagingId,paged,data.recordsFiltered,10);
                    resolve(data);
                })
            }
        });
    }
}

const createNewsLink = (id) => {
    return id ? `${webUrl}/tin-tuc/${id}` : "#";
}

const createBlog = (blogId,data) => {
    if($(blogId).length && $(data).length){
        let text = `<div class="masonry-grid row">`;
        data.forEach(news => {
            text += `<div class="masonry-grid-item col-md-6">
                        <article class="blogpost shadow-2 light-gray-bg bordered">
                            <div class="overlay-container">
                                <img src="${getUrlImg(news.content) }" alt="${news.name}">
                            </div>
                            <header>
                                <h2><a title="${news.name}" href="${createNewsLink(news.id)}">${news.name}</a></h2>
                                <div class="post-info">
                                    <span class="post-date">
                                        <i class="fa fa-calendar-o pr-1"></i>
                                        ${vi_moment(news.publish_date,'DD/MM/YYYY HH:mm')}
                                    </span>
                                    <span class="submitted"><i class="fa fa-user pr-1 pl-1"></i> bởi <a href="${news.source_link}">${news.sname}</a></span>
                                </div>
                            </header>
                            <div class="blogpost-content">
                                <p>${news.description}</p>
                            </div>
                            <footer class="clearfix">
                                <div class="tags pull-left"><i class="fa fa-list-alt pr-1"></i> <a href="#">tag 1</a>, <a
                                        href="#">tag 2</a>, <a href="#">long tag 3</a></div>
                                <div class="link pull-right"><i class="fa fa-link pr-1"></i><a href="${createNewsLink(news.id)}">Chi tiết</a>
                                </div>
                            </footer>
                        </article>
                    </div>`
        });
        text +=`</div>`;
        $(blogId).find('.newsList').html(text);
    }
}

const createPaging = (pagingId,startPage, total, length = 25) => {

    let text = "";

    if(total <= length){
        return text;
    }

    totalPage = Math.ceil(total / length);
    if (startPage > totalPage){
        startPage = totalPage;
    }else if (startPage < 1){
        startPage = 0;
    }
    if(totalPage){
        text = `<ul class="pagination justify-content-center">`;
        if(totalPage < 10){
            if(startPage > 0){
                text +=  `<li class="page-item">
                            <a class="page-link" data-page="${startPage - 1}" href="?paged=${startPage - 1}" aria-label="Trước">
                                <i aria-hidden="true" class="fa fa-angle-left"></i>
                                <span class="sr-only">Trước</span>
                            </a>
                        </li>`
            }

            for (let i = 0; i < totalPage; i++) {
                text += `<li class="page-item  ${i == startPage ? 'active' : ''}"><a class="page-link" data-page="${i}" href="?paged=${i}">${i+1}</a></li>`            
            }

            if(startPage !== totalPage){
                text +=`<li class="page-item">
                            <a class="page-link" data-page="${startPage+1}" href="?paged=${startPage+1}" aria-label="Sau">
                                <i aria-hidden="true" class="fa fa-angle-right"></i>
                                <span class="sr-only">Sau</span>
                            </a>
                        </li>`
            }
        }else{
            if(startPage > 0){
                text +=  `<li class="page-item">
                            <a class="page-link" data-page="${startPage - 1}" href="?paged=${startPage - 1}" aria-label="Trước">
                                <i aria-hidden="true" class="fa fa-angle-left"></i>
                                <span class="sr-only">Trước</span>
                            </a>
                        </li>`
            }
            text += `<li class="page-item  ${0 == startPage ? 'active' : ''}"><a class="page-link" data-page="0" href="?paged=0">1</a></li>`
            
            if(startPage >  2){
                text += `<li class="page-item"><a class="page-link disabled">...</a></li>`
            }

            let snumber = startPage > 2 ? (startPage - 1) : 1;
            let enumber = (snumber + 3) >= totalPage ? totalPage : (snumber + 3);
            for (let i = snumber; i < enumber; i++) {
                text += `<li class="page-item  ${i == startPage ? 'active' : ''}"><a class="page-link" data-page="${i}" href="?paged=${i}">${i+1}</a></li>`            
            }
            if((totalPage - startPage) > 3){
                text += `<li class="page-item"><a class="page-link disabled">...</a></li>`;
            }

            if((totalPage - startPage) > 2){
                text += `<li class="page-item  ${(totalPage - 1) == startPage ? 'active' : ''}"><a class="page-link" data-page="${totalPage-1}" href="?paged=${totalPage-1}">${totalPage}</a></li>`
            }        
    
            if(startPage < (totalPage-1)){
                text +=`<li class="page-item">
                            <a class="page-link" data-page="${startPage+1}" href="?paged=${startPage+1}" aria-label="Sau">
                                <i aria-hidden="true" class="fa fa-angle-right"></i>
                                <span class="sr-only">Sau</span>
                            </a>
                        </li>`
            }
        }
    }
    text += `</ul>`;
    $(pagingId).html(text)
}

const ajaxPaging = (blogId,pagingId,button) =>{
    $(blogId).off('click',button).on('click', button,function (e) {
        e.preventDefault();
        let cpaged = parseInt($(this).data('page'));
        cpaged = cpaged ? cpaged : 0;
        showBlog(blogId,pagingId,cpaged).then(()=>{
            $("body,html").animate({scrollTop:0},0);
            let paramsUrl = setParam('paged',cpaged);
            window.history.pushState({}, "Search news", `${webUrl}/tin-tuc?${paramsUrl}`);
        });

    })
}

const updateSinglePost = (body) => {
    if($(body).length){
        $(body).find('img[data-src]').each((index,element) => {
            let dataSrc = $(element).attr('data-src');
            $(element).attr('src',dataSrc);
        })
    }
}

$(document).ready(function (e) {
    showBlog('#blogBox','.blogPaging');
    ajaxPaging('#blogBox','.blogPaging','.page-link');
    updateSinglePost(".main .blogpost .blogpost-content");
});