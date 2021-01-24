
<?php
    $current_page = (int)$this->request->get('page',['trim','int']);
    $posts = $this->modelsManager->createBuilder()
    ->columns(array(
        'p.id',
        'pl.title',
        'p.slug',
        'p.catid',
        'pl.content',
        'p.status',
        'pl.excerpt',
        'p.deptid',
        'p.createdat',
        'p.calendar',
        'p.image',
    ))
    ->from(['p'=>'Posts'])
    ->where("p.deleted = 0 AND p.status = 1 AND p.deptid = $dept->id")
    ->leftJoin('PostsLang', "pl.postid = p.id AND pl.langid = $langid",'pl')
    ->orderBy("p.calendar DESC");
    $post_count = $posts->getQuery()
    ->execute()
    ->count();

    $posts = $posts->limit(10)
    ->offset(10 * ($current_page > 0 ? ($current_page - 1) : 0))
    ->getQuery()
    ->execute();
    $paging = $this->helper->getPaging($post_count, $current_page);
?>

{{ partial('breadcrumb') }}

<section class="main-container">
    <div class="container">
        <div class="row">
            <div class="main col-lg-9">
                <h1 class="page-title">{{title}}</h1>
                <div class="separator-2"></div>

                <div class="masonry-grid row">
                    {% for key, post in posts %}
                    <div class="masonry-grid-item col-md-6">
                        <article class="blogpost shadow-2 light-gray-bg bordered">
                            {% if post.image %}
                            <div class="overlay-container">
                                <img class="ml-auto mr-auto grow" src="{{ helper.getLinkImage(post.image) }}" alt="{{ post.title }}">
                            </div>
                            {% endif %}
                            <header>
                                <h2><a href="<?= \Posts::getUrl($dept, $post) ?>">{{post.title}}</a></h2>
                                <div class="post-info">
                                    <span class="post-date">
                                        <i class="fa fa-calendar-o pr-1"></i>
                                        <span class="day">{{ helper.datetimeVn(post.calendar) }}</span>
                                    </span>
                                </div>
                            </header>
                            <div class="blogpost-content">
                                <p>{{post.excerpt}}</p>
                            </div>
                            <footer class="clearfix">
                                <div class="link pull-right"><i class="fa fa-link pr-1"></i><a href="<?= \Posts::getUrl($dept, $post) ?>">{{ ml._ml('more', 'Xem thêm') }}</a></div>
                            </footer>
                        </article>
                    </div>
                    {% endfor %}
                </div>

                <?php if($paging !== false) : ?>
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                    <?php if($paging['total_page'] < 10) { ?>
                        <?php if($paging['current_page'] > 1): ?>
                        <li class="page-item">
                            <a class="page-link" href="?page=<?php echo $paging['current_page'] - 1 ?>" aria-label="Trước">
                                <i aria-hidden="true" class="fa fa-angle-left"></i>
                                <span class="sr-only">Trước</span>
                            </a>
                        </li>
                        <?php endif ?>

                        <?php for ($i = 1; $i <= $paging['total_page']; $i++) { ?>
                        <li class="page-item <?php echo $i == $paging['current_page'] ? 'active' : ''  ?>"><a class="page-link" href="?page={{i}}">{{i}}</a></li>
                        <?php } ?>
                        <?php if((int)$paging['current_page'] !== (int)$paging['total_page']): ?>
                        <li class="page-item">
                            <a class="page-link" href="?page=<?php echo $paging['current_page'] + 1 ?>" aria-label="Sau">
                                <i aria-hidden="true" class="fa fa-angle-right"></i>
                                <span class="sr-only">Sau</span>
                            </a>
                        </li>
                        <?php endif ?>
                    <?php } else{ ?>
                        <?php if($paging['current_page'] > 1): ?>
                        <li class="page-item">
                            <a class="page-link" href="?page=<?php echo $paging['current_page'] - 1 ?>" aria-label="Trước">
                                <i aria-hidden="true" class="fa fa-angle-left"></i>
                                <span class="sr-only">Trước</span>
                            </a>
                        </li>
                        <?php endif ?>

                        <?php for ($i = 1; $i <= 4; $i++) { ?>
                        <li class="page-item <?php echo $i == $paging['current_page'] ? 'active' : ''  ?>"><a class="page-link" href="?page={{i}}">{{i}}</a></li>
                        <?php } ?>
                        <li class="page-item"><a class="page-link disabled">...</a></li>
                        <?php for ($i = ($paging['total_page'] - 3); $i <= $paging['total_page']; $i++) { ?>
                        <li class="page-item <?php echo $i == $paging['current_page'] ? 'active' : ''  ?>"><a class="page-link" href="?page={{(i)}}">{{(i)}}</a></li>
                        <?php } ?>

                        <?php if((int)$paging['current_page'] !== (int)$paging['total_page']): ?>
                        <li class="page-item">
                            <a class="page-link" href="?page=<?php echo $paging['current_page'] + 1 ?>" aria-label="Sau">
                                <i aria-hidden="true" class="fa fa-angle-right"></i>
                                <span class="sr-only">Sau</span>
                            </a>
                        </li>
                        <?php endif ?>
                    <?php } ?>
                    </ul>
                </nav>
                <?php endif ?>
            </div>
            <aside class="col-lg-3 col-xl-3 ml-xl-auto">
            {{ partial('sidebar') }}
            </aside>
        </div>
    </div>
</section>