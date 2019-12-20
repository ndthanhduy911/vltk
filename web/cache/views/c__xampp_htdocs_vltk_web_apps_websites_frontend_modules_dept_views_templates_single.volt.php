<?= $this->partial('breadcrumb') ?>
<section class="main-container">
    <div class="container">
        <div class="row">

            <!-- main start -->
            <!-- ================ -->
            <div class="main col-lg-9">
                <!-- blogpost start -->
                <!-- ================ -->
                <article class="blogpost full">
                    <header>
                        <h3><?= $title ?></h3>
                        <div class="post-info">
                            <span class="post-date">
                                <i class="fa fa-calendar-o pr-1"></i>
                                <span class="day"><?= $this->helper->datetime_vn($post->calendar) ?></span>
                            </span>
                        </div>
                    </header>
                    <div class="blogpost-content">
                        <?php if ($post->featured_image) { ?>
                        <div class="w-100">
                            <div class="overlay-container d-flex justify-content-center">
                                <img src="<?= $this->helper->getLinkImage($post->featured_image) ?>" alt="<?= $post->title ?>">
                            </div>
                        </div>
                        <?php } ?>
                        <hr>
                        <div class="mt-2">
                            <?= $post->content ?>
                        </div>
                    </div>
                </article>
            </div>
            <aside class="col-lg-3 col-xl-3 ml-xl-auto">
                <?= $this->partial('sidebar') ?>
            </aside>
        </div>
    </div>
</section>