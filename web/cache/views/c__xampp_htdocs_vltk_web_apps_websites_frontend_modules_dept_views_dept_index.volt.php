<?php if ($banners) { ?>
<!-- ================ -->
<div class="banner clearfix">
    <!-- slideshow start -->
    <!-- ================ -->
    <div class="slideshow">

        <!-- slider revolution start -->
        <!-- ================ -->
        <div class="slider-revolution-5-container">
            <div id="slider-banner-fullwidth" class="slider-banner-fullwidth rev_slider"
                data-version="5.0">
                <ul class="slides">
                    <?php foreach ($banners as $key => $banner) { ?>
                    <li data-transition="random" data-slotamount="default" data-masterspeed="default" data-title="<?= $banner->name ?>">
                        <img src="<?= $this->helper->getLinkImage($banner->image, '/assets/frontend/images/banner1.png') ?>" alt="<?= $banner->name ?>" data-bgposition="center center"
                            data-bgrepeat="no-repeat" data-bgfit="cover" class="rev-slidebg">

                        <!-- Transparent Background -->
                        <div class="tp-caption" data-x="center" data-y="center" data-start="0"
                            data-transform_idle="o:1;" data-transform_in="o:0;s:600;e:Power2.easeInOut;"
                            data-transform_out="o:0;s:600;" data-width="5000" data-height="5000" style="background-color: rgba(0, 0, 0, 0.1);">
                        </div>

                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption sfb fadeout caption-box text-<?= $key % 2 == 0 ? 'left' : 'right' ?> rounded"
                            style="background-color: rgba(0, 0, 0, 0.8);" data-x="<?= $key % 2 == 0 ? 'left' : 'right' ?>" data-y="center"
                            data-start="600" data-whitespace="normal" data-transform_idle="o:1;"
                            data-transform_in="y:[100%];sX:1;sY:1;o:0;s:1150;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;">
                            <h2 class="title slider-title"><?= $banner->name ?></h2>
                            <div class="separator-2 clearfix"></div>
                            <p class="slider-content"><?= $banner->description ?></p>
                            <div class="text-right"><a class="btn btn-small btn-default margin-clear" href="<?= $banner->button_link ?>"><?= $banner->button_text ?></a></div>
                        </div>
                    </li>
                    <?php } ?>
                </ul>
                <div class="tp-bannertimer"></div>
            </div>
        </div>
        <!-- slider revolution end -->

    </div>
    <!-- slideshow end -->
</div>
<?php } ?>

<div id="page-start"></div>
<?php if ($cats) { ?>
<section id="section1" class="section clearfix pt-5">
    <div class="container mt-4">
        <div class="row">
            <?php foreach ($cats as $cat) { ?>
            <div class="col-lg-4">
                <h3><span class="text-default"><?= $cat->cat_name ?></span></h3>
                <div class="separator-2"></div>
                <div class="block">
                    <div class="hone-post" data-id="<?= $cat->id ?>"></div>
                    <footer class="clearfix">
                        <div class="link pull-right small"><i class="fa fa-link pr-1"></i><a href="<?= constant('FRONTEND_URL') . '/category/' . $cat->slug ?>">Xem thêm</a></div>
                    </footer>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</section>
<?php } ?>

<?php if ($staffs) { ?>
<section class="clearfix pt-5 pb-5">
    <div class="container">
        <?php if ($staff_info['name']) { ?>
        <div class="row justify-content-lg-center pv-20">
            <div class="col-lg-8">
                <h2 class="page-title text-center"><strong><?= $staff_info['name'] ?></strong></h2>
                <div class="separator"></div>
                <p class="lead text-center"><?= $staff_info['des'] ?></p>
            </div>
        </div>
        <?php } ?>
        <div class="slick-carousel carousel-autoplay pv-20">
            <?php foreach ($staffs as $staff) { ?>
            <div class="col-md-4">
                <div class="image-box team-member shadow-2 mb-20">
                    <div class="overlay-container rounded overlay-visible">
                        <img src="<?= $this->helper->getLinkImage($staff->featured_image, '/assets/frontend/images/education-4.jpg') ?>" alt="<?= $staff->title ?>">
                        <a href="<?= constant('FRONTEND_URL') . '/staff/' . $staff->slug ?>" class="overlay-link" title="<?= $staff->title ?>"><i class="fa fa-graduation-cap"></i></a>
                        <div class="overlay-bottom">
                            <div class="text p-0">
                                <h4 class="title text-white text-uppercase"><?= $staff->title ?></h4>
                                <div class="separator light"></div>
                                <p class="small margin-clear"><em><?= $this->helper->getDean($staff->dean) ?></em>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
        <div class="col-lg-12 text-center">
            <a href="<?php echo FRONTEND_URL.'/staff' ?>" class="btn btn-default btn-lg btn-animated radius-50">Xem thêm <i class="fa fa-arrow-right"></i></a>
        </div>
    </div>
</section>
<?php } ?>

<?php if ($partners) { ?>
<section class="pt-5 pb-5 section background-img-1 dark-translucent-bg fixed-bg" style="background-position: 50% 42%;">
    <?php if ($partner_info['name']) { ?>
    <div class="container pv-20">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8">
                <h2 class="text-center"> <strong><?= $partner_info['name'] ?></strong></h2>
                <div class="separator"></div>
                <p class="large text-center"><?= $partner_info['des'] ?></p>
            </div>
        </div>
    </div>
    <?php } ?>
    <div class="col-md-12 pv-20">
        <div class="slick-carousel carousel-5">
            <?php foreach ($partners as $partner) { ?>
            <div class="col-lg-3 col-md-6">
                <div class="ph-20 feature-box text-center object-non-visible" data-animation-effect="fadeInDownSmall"
                    data-effect-delay="100">
                    <span class="icon large circle"><img class="rounded-circle" alt="<?= $partner->title ?>" src="<?= $this->helper->getLinkImage($staff->featured_image, '/assets/frontend/images/beauty-1.jpg') ?>"></span>
                    <h3><?= $partner->title ?></h3>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</section>
<?php } ?>

<?php if ($contact_info['name']) { ?>
<section id="section-5" class="section pv-40 stats padding-bottom-clear hovered">
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <?php if ($contact_info['name']) { ?>
                <h2 class="text-center"><?= $contact_info['name'] ?></h2>

                <div class="separator"></div>
                <?php } ?>
                <?php if ($contact_info['des']) { ?>
                <?= $contact_info['des'] ?>
                <?php } ?>
            </div>
        </div>
    </div>
</section>
<?php } ?>