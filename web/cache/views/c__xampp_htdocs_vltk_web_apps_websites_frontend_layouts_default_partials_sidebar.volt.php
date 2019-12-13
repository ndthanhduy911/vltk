<?php 
    use Models\Categories;
    use Models\Posts;
    
    $npCat = Categories::getNamepace();
    $cats = $this->modelsManager->createBuilder()
    ->columns(array(
        $npCat.'.id',
        $npCat.'.slug',
        'CL.name cat_name',
    ))
    ->from($npCat)
    ->leftJoin('Models\CategoriesLang', "CL.cat_id = $npCat.id AND CL.lang_id = $lang_id",'CL')
    ->where("$npCat.status = 1 AND $npCat.dept_id = $dept_id AND $npCat.id != 1")
    ->getQuery()
    ->execute();

    $npPost = Posts::getNamepace();
    $posts = $this->modelsManager->createBuilder()
    ->columns(array(
        $npPost.'.id',
        $npPost.'.slug',
        $npPost.'.featured_image',
        $npPost.'.calendar',
        'PL.title title',
    ))
    ->from($npPost)
    ->leftJoin('Models\PostsLang', "PL.post_id = $npPost.id AND PL.lang_id = $lang_id",'PL')
    ->where("$npPost.deleted = 0 AND $npPost.status = 1 AND $npPost.dept_id = $dept_id")
    ->orderBy("$npPost.calendar DESC")
    ->limit(5)
    ->getQuery()
    ->execute();
?>

<div class="sidebar">
    <?php if ($cats->count()) { ?>
    <div class="block clearfix">
        <h3 class="title"> <?= $this->ml->_ml_system('categories', 'Danh mục') ?></h3>
        <div class="separator-2"></div>
        <nav>
            <ul class="nav flex-column">
                <?php foreach ($cats as $cat) { ?>
                <li class="nav-item"><a class="nav-link" href="<?= Categories::getUrl($dept, $cat) ?>"><?= $cat->cat_name ?></a></li>
                <?php } ?>
            </ul>
        </nav>
    </div>
    <?php } ?>
    <?php if ($posts->count()) { ?>
    <div class="block clearfix">
        <h3 class="title"><?= $this->ml->_ml_system('latest_news', 'Tin mới nhất') ?></h3>
        <div class="separator-2"></div>
        <?php foreach ($posts as $key => $post) { ?>
        <?= ($key == 0 ? '' : '<hr>') ?>
        <div class="media margin-clear">
            <div class="d-flex pr-2">
                <div class="overlay-container">
                    <img class="media-object" src="<?= $this->helper->getLinkImage($post->featured_image, '/assets/frontend/images/blog-thumb-1.jpg') ?>" alt="<?= $post->title ?>">
                    <a href="<?= Posts::getUrl($dept, $post) ?>" class="overlay-link small"><i class="fa fa-link"></i></a>
                </div>
            </div>

            <div class="media-body">
                <h6 class="media-heading"><a href="<?= Posts::getUrl($dept, $post) ?>"><?= $post->title ?></a></h6>
                <p class="small margin-clear"><i class="fa fa-calendar pr-10"></i><?= $this->helper->datetime_vn($post->calendar) ?></p>
            </div>
        </div>
        <?php } ?>
        <div class="text-right space-top">
            <a href="<?= Categories::getUrl($dept) ?>" class="link-dark"><i class="fa fa-plus-circle pl-1 pr-1"></i><?= $this->ml->_ml_system('more', 'Xem thêm') ?></a>
        </div>
    </div>
    <?php } ?>

    <!-- <div class="block clearfix">
        <h3 class="title">Popular Tags</h3>
        <div class="separator-2"></div>
        <div class="tags-cloud">
            <div class="tag">
                <a href="#">energy</a>
            </div>
            <div class="tag">
                <a href="#">business</a>
            </div>
            <div class="tag">
                <a href="#">food</a>
            </div>
            <div class="tag">
                <a href="#">fashion</a>
            </div>
            <div class="tag">
                <a href="#">finance</a>
            </div>
            <div class="tag">
                <a href="#">culture</a>
            </div>
            <div class="tag">
                <a href="#">health</a>
            </div>
            <div class="tag">
                <a href="#">sports</a>
            </div>
            <div class="tag">
                <a href="#">life style</a>
            </div>
            <div class="tag">
                <a href="#">books</a>
            </div>
            <div class="tag">
                <a href="#">lorem</a>
            </div>
            <div class="tag">
                <a href="#">ipsum</a>
            </div>
            <div class="tag">
                <a href="#">responsive</a>
            </div>
            <div class="tag">
                <a href="#">style</a>
            </div>
            <div class="tag">
                <a href="#">finance</a>
            </div>
            <div class="tag">
                <a href="#">sports</a>
            </div>
            <div class="tag">
                <a href="#">technology</a>
            </div>
            <div class="tag">
                <a href="#">support</a>
            </div>
            <div class="tag">
                <a href="#">life style</a>
            </div>
            <div class="tag">
                <a href="#">books</a>
            </div>
        </div>
    </div> -->
</div>