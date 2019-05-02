

const showPosts = (block , cat_id = null) => {
    getPostByCatId(cat_id).then((data)=>{
        $(block).html('');
        data.forEach(item => {
            let imageUrl = item.featured_image ? fontendUrl + item.featured_image : fontendUrl + '/assets/frontend/images/medical-blog-thumb-1.jpg';
            $(block).append(`
            <div class="media margin-clear">
                <div class="overlay-container rounded">
                    <img class="media-object" src="${imageUrl}"
                        alt="${item.title}">
                    <a href="${getLinkPostBySlug(item.slug)}" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                </div>
                <div class="media-body">
                    <h5 class="media-heading"><a href="${getLinkPostBySlug(item.slug)}">${item.title}</a></h5>
                    <div class="small"><i class="fa fa-calendar pr-10"></i>${getDatePost(item.created_at, item.calendar)} <i
                            class="fa fa-clock-o pl-10 pr-10"></i>${getTimePost(item.created_at, item.calendar)}</div>
                </div>
            </div>
            <hr>
            `)
        });
    })
}

showPosts('#posts2', 2);

showPosts('#posts3', 3);

showPosts('#posts5', 5);