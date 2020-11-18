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
                        <article class="blogpost shadow-2 light-gray-bg bordered object-non-visible"
                            data-animation-effect="fadeInUpSmall" data-effect-delay="100">
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
                                        <span class="day">{{helper.getWVN(post.calendar)}}, {{ ml._ml_system('day', 'ngày') }} {{ helper.datetimeVn(post.calendar) }}</span>
                                        
                                    </span>
                                </div>
                            </header>
                            <div class="blogpost-content">
                                <p>{{post.excerpt}}</p>
                            </div>
                            <footer class="clearfix">
                                <!-- <div class="tags pull-left"><i class="fa fa-tags pr-1"></i> <a href="#">tag 1</a>,
                                    <a href="#">tag 2</a>, <a href="#">long tag 3</a></div> -->
                                <div class="link pull-right"><i class="fa fa-link pr-1"></i><a href="<?= \Posts::getUrl($dept, $post) ?>">{{ ml._ml_system('more', 'Xem thêm') }}</a></div>
                            </footer>
                        </article>
                    </div>
                    {% endfor %}
                </div>

                <?php if($pagination) : ?>
                <nav aria-label="Page navigation">
                    <?= $pagination ?>
                </nav>
                <?php endif ?>
            </div>
            <aside class="col-lg-3 col-xl-3 ml-xl-auto">
            {{ partial('sidebar') }}
            </aside>
        </div>
    </div>
</section>