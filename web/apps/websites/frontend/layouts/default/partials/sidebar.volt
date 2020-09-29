<?php 
    $cats = $this->modelsManager->createBuilder()
    ->columns(array(
        'c.id',
        'c.slug',
        'cl.name cat_name',
    ))
    ->from(['c'=>'Categories'])
    ->where("c.status = 1 AND c.deleted = 0 AND c.dept_id = $dept->id AND c.id != 1")
    ->leftJoin('CategoriesLang', "cl.cat_id = c.id AND cl.lang_id = $lang_id",'cl')
    ->getQuery()
    ->execute();

    $posts = $this->modelsManager->createBuilder()
    ->columns(array(
        'p.id',
        'p.slug',
        'p.featured_image',
        'p.calendar',
        'pl.title title',
    ))
    ->from(['p'=>'Posts'])
    ->where("p.deleted = 0 AND p.status = 1 AND p.dept_id = $dept->id")
    ->leftJoin('PostsLang', "pl.post_id = p.id AND pl.lang_id = $lang_id",'pl')
    ->orderBy("p.calendar DESC")
    ->limit(10)
    ->getQuery()
    ->execute();
?>

<div class="sidebar">
    {% if cats.count() %}
    <div class="block clearfix">
        <h3 class="title"> {{ ml._ml_system('categories', 'Danh mục') }}</h3>
        <div class="separator-2"></div>
        <nav>
            <ul class="nav flex-column">
                {% for cat in cats %}
                <li class="nav-item"><a class="nav-link" href="<?= \Categories::getUrl($dept, $cat) ?>">{{ cat.cat_name }}</a></li>
                {% endfor %}
            </ul>
        </nav>
    </div>
    {% endif %}
    {% if posts.count() %}
    <div class="block clearfix">
        <h3 class="title">{{ ml._ml_system('latest_news', 'Tin mới nhất') }}</h3>
        <div class="separator-2"></div>
        {% for key, post in posts %}
        {{ key == 0 ? '' : "<hr>"  }}
        <div class="media margin-clear">
            <div class="d-flex pr-2">
                <div class="overlay-container">
                    <img class="media-object" src="{{ helper.getLinkImage(post.featured_image, '/assets/frontend/images/defaut_img.png') }}" alt="{{ post.title }}">
                    <a href="<?= \Posts::getUrl($dept, $post) ?>" class="overlay-link small"><i class="fa fa-link"></i></a>
                </div>
            </div>

            <div class="media-body">
                <h5 class="media-heading"><a href="<?= \Posts::getUrl($dept, $post) ?>" title="{{ post.title }}">{{ post.title }}</a></h5>
                <p class="small margin-clear"><i class="fa fa-calendar pr-10"></i>{{ helper.datetime_vn(post.calendar) }}</p>
            </div>
        </div>
        {% endfor %}
        {#
        <div class="text-right space-top">
            <a href="<?= \Categories::getUrl($dept) ?>" class="link-dark"><i class="fa fa-plus-circle pl-1 pr-1"></i>{{ ml._ml_system('more', 'Xem thêm') }}</a>
        </div>
        #}
    </div>
    {% endif %}
</div>