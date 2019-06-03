<!-- banner start -->
<!-- ================ -->
<div class="banner dept dark-translucent-bg fixed-bg"
    style="background-image:url('<?php echo FRONTEND_URL ?>/assets/frontend/images/page-about-banner-1.jpg'); background-position: 50% 27%;">
    <div class="slideshow">
        <div class="container">
            <div class="row justify-content-lg-center">
                <div class="col-lg-8 text-center pv-20">
                    <h2 class="title object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100"><span
                            class="text-white text-uppercase"><?php echo isset($title) ? $title : 'Mặc định'; ?></span></h2>
                    <div class="separator object-non-visible mt-10" data-animation-effect="fadeIn" data-effect-delay="100">
                    </div>
                    <p class="text-center object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100">
                        <?php echo $page->excerpt ?>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb start -->
<!-- ================ -->
<?= $this->partial('breadcrumb') ?>

<section class="main-container pt-5">
    <div class="container">
        <div class="row">
            <div class="main col-md-9">
                <article>
                    <?php echo $page->content ?>
                </article>
            </div>

            <div class="col-md-3">
                <?= $this->partial('sidebar') ?>
            </div>
        </div>
    </div>
</section>