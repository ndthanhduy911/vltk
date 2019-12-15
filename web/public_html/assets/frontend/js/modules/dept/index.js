const showPosts = (block , cat_id = null) => {
    getPostByCatId(cat_id, deptId).then((data)=>{
        $(block).html('');
        data.forEach(item => {
            let imageUrl = item.featured_image ? fontendUrl + item.featured_image : fontendUrl + '/assets/frontend/images/defaut_img.png';
            $(block).append(`
            <div class="media mb-3">
                <div class="overlay-container rounded">
                    <img class="media-object" src="${imageUrl}"
                        alt="${item.title}">
                    <a href="${getLinkPostBySlug(item.slug)}" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                </div>
                <div class="media-body">
                    <h5 class="media-heading"><a href="${getLinkPostBySlug(item.slug)}">${item.title}</a></h5>
                    <div class="small"><i class="fa fa-calendar pr-10"></i>${getDatePost(item.created_at, item.calendar)}
                </div>
            </div>
            <hr>
            `)
        });
    })
}

let homePost = $('.hone-post');
if(homePost.length){
    homePost.each(function (item) {
        let cat_id = $(this).attr('data-id');
        showPosts(this, cat_id);
    });
    
}