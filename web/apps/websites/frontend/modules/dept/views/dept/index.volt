{% if banners.count() %}
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
                    {% for key, banner in banners %}
                    <li data-transition="random" data-slotamount="default" data-masterspeed="default" data-title="{{ banner.title }}">
                        <img src="{{ helper.getLinkImage(banner.image,'/assets/frontend/images/banner1.png') }}" alt="{{ banner.title }}" data-bgposition="center center"
                            data-bgrepeat="no-repeat" data-bgfit="cover" class="rev-slidebg">

                        <!-- Transparent Background -->
                        <div class="tp-caption" data-x="center" data-y="center" data-start="0"
                            data-transform_idle="o:1;" data-transform_in="o:0;s:600;e:Power2.easeInOut;"
                            data-transform_out="o:0;s:600;" data-width="5000" data-height="5000" style="background-color: rgba(0, 0, 0, 0.1);">
                        </div>

                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption sfb fadeout caption-box text-left rounded mb-5"
                            style="background-color: rgba(0, 0, 0, 0.5);" data-x="<?= $key % 2 == 0 ? 'left' : 'right' ?>" data-y="bottom"
                            data-start="600" data-whitespace="normal" data-transform_idle="o:1;"
                            data-transform_in="y:[100%];sX:1;sY:1;o:0;s:1150;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;">
                            <h2 class="title slider-title">{{ banner.title }}</h2>
                            <div class="separator-2 clearfix"></div>
                            <p class="slider-content">{{ banner.excerpt }}</p>
                            <div class="text-right"><a class="btn btn-small btn-default margin-clear" href="{{ banner.link }}">{{ml._ml('detail',"Chi tiết")}}</a></div>
                        </div>
                    </li>
                    {% endfor %}
                </ul>
                <div class="tp-bannertimer"></div>
            </div>
        </div>
        <!-- slider revolution end -->

    </div>
    <!-- slideshow end -->
</div>
{% endif %}

<div id="page-start"></div>
{% if cats.count() %}
<section id="section1" class="section clearfix pt-5 pb-0">
    <div class="container mt-4">
        <div class="row">
            {% for cat in cats %}
            <div class="col-lg-4">
                <h3><span class="text-default">{{cat.cat_name}}</span></h3>
                <div class="separator-2"></div>
                <div class="block">
                    <div class="home-post">
                        <?php 
                            $posts = $this->modelsManager->createBuilder()
                            ->columns(array(
                                'p.id',
                                'pl.title',
                                'p.slug',
                                'p.catid',
                                'pl.content',
                                'p.status',
                                'pl.excerpt',
                                'p.calendar',
                                'p.image',
                            ))
                            ->from(['p' => 'Posts'])
                            ->where("p.deleted = 0 AND p.catid = $cat->id AND p.status = 1")
                            ->leftJoin('PostsLang', 'pl.postid = p.id AND pl.langid = '.$this->session->get('langid'),'pl')
                            ->orderBy("p.calendar DESC")
                            ->limit(5, 0)
                            ->getQuery()
                            ->execute();
                        ?>
                        {% for post in posts %}
                        <div class="media mb-3">
                            <div class="overlay-container border rounded">
                                <img class="media-object" src="{{ helper.getLinkImage(post.image) }}" alt="{{ post.title }}">
                            </div>
                            <div class="media-body">
                                <h5 class="media-heading"><a href="<?= Posts::getUrl($dept, $post) ?>" title="{{ post.title }}">{{ post.title }}</a></h5>
                                <div class="small"><i class="fa fa-calendar pr-10"></i>{{ helper.datetimeVn(post.calendar, 'd/m/Y') }}</div>
                            </div>
                        </div>
                        {% endfor %}
                    </div>
                    <footer class="clearfix">
                        <div class="link pull-right small"><i class="fa fa-link pr-1"></i><a href="<?= Categories::getUrl($dept, $cat) ?>">{{ ml._ml('more', 'Xem thêm') }}</a></div>
                    </footer>
                </div>
            </div>
            {% endfor %}
        </div>
    </div>
</section>
{% endif %}

{% if researches.count() %}
<section class="pt-5 pb-5 section dark-translucent-bg fixed-bg" style="background-position: 50% 42%; background-image: url({{ helper.getLinkImage(home['szedbg'], './assets/frontend/images/education.jpg') }})">
    {% if home['szedtitle'] %}
    <div class="container mt-4">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center">
                <h2 class="page-title text-center"><strong>{{ home['szedtitle'] }}</strong></h2>
                <div class="separator"></div>
            </div>
        </div>
    </div>
    {% endif %}
    <div class="row mb-4 mr-0 ml-0">
        <div class="col-md-12 pv-20">
            <div class="slick-carousel carousel">
                {% for research in researches %}
                <div class="col-lg-3 col-md-6">
                    <div class="image-box shadow-2 bordered text-center mb-20">
                        <div class="overlay-container rounded overlay-visible">
                            <img class="grow" src="{{ helper.getLinkImage(research.image) }}" alt="{{ research.title }}">
                            <div class="overlay-bottom hidden-xs">
                                <div class="text">
                                    <a href="<?= Researches::getUrl($dept,$research) ?>">{{ research.title }}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {% endfor %}
            </div>
        </div>
    </div>
</section>
{% endif %}

{% if staffs.count() %}
<section class="clearfix pt-5 pb-5">
    <div class="container">
        {% if home['stafftitle'] %}
        <div class="row justify-content-lg-center pv-20">
            <div class="col-lg-8">
                <h2 class="page-title text-center"><strong>{{ home['stafftitle'] }}</strong></h2>
                <div class="separator"></div>
                <p class="lead text-center">{{ home['staffdes'] }}</p>
            </div>
        </div>
        {% endif %}
        <div class="row pv-20 d-md-flex justify-content-center">
            {% for staff in staffs %}
            <div class="col-md-4">
                <div class="image-box team-member shadow-2 mb-20">
                    <div class="overlay-container border rounded overlay-visible">
                        <img class="grow" width="100%" src="{{ helper.getLinkImage(staff.image,'/assets/frontend/images/education.jpg') }}" alt="{{staff.title}}">
                        <div class="overlay-bottom">
                            <div class="text p-0">
                                <a href="<?= \Staffs::getUrl($dept,$staff) ?>"><h4 class="title text-white text-uppercase">{{staff.title}}</h4></a>
                                <div class="separator light"></div>
                                <p class="small margin-clear"><em><?= \Staffs::getDean($staff->regency) ?></em></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {% endfor %}
        </div>
        <div class="col-lg-12 text-center">
            <?php $staff_link = $dept->slug != '/' ? WEB_URL.'/'.$dept->slug.'/nhan-su' : WEB_URL.'/nhan-su'; ?>
            <a href="{{ staff_link }}" class="btn btn-default btn-lg btn-animated radius-50">{{ ml._ml('more', 'Xem thêm') }} <i class="fa fa-arrow-right"></i></a>
        </div>
    </div>
</section>
{% endif %}


{% if partners.count() %}
<section class="pt-5 pb-5 section dark-translucent-bg fixed-bg" style="background-position: 50% 42%; background-image: url({{ helper.getLinkImage(home['partnerbg'], './assets/frontend/images/education.jpg') }})">
    {% if home['partnertitle'] %}
    <div class="container pv-20">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8">
                <h2 class="text-center"> <strong>{{ home['partnertitle'] }}</strong></h2>
                <div class="separator"></div>
                <p class="large text-center">{{ home['partnerdes'] }}</p>
            </div>
        </div>
    </div>
    {% endif %}
    <div class="col-md-12 pv-20">
        <div class="slick-carousel carousel-5">
            {% for partner in partners %}
            <div class="col-lg-3 col-md-6">
                <div class="ph-20 feature-box text-center">
                    <span class="icon large circle"><img class="rounded-circle" alt="{{partner.title}}" src="{{ helper.getLinkImage(partner.image,'/assets/frontend/images/beauty.jpg') }}"></span>
                    <h3>{{partner.title}}</h3>
                </div>
            </div>
            {% endfor %}
        </div>
    </div>
</section>
{% endif %}

<section id="section-5" class="section pt-0 pb-5 stats padding-bottom-clear hovered">
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                {% if home['contacttitle'] %}
                <h2 class="text-center">{{ home['contacttitle'] }}</h2>
                <div class="separator"></div>
                <p class="large text-center">{{ home['contactdes'] }}</p>
                {% endif %}

                <ul class="list-inline mb-20 text-center">
                    <li class="list-inline-item"><i class="text-default fa fa-map-marker pr-1"></i>{{ deptlang.address }}</li>
                    <li class="list-inline-item"><a href="tel: {{ dept.phone }}" class="link-dark"><i class="text-default fa fa-phone pl-10 pr-1"></i>{{ dept.phone }}</a></li>
                    <li class="list-inline-item"><a href="mailto: {{ dept.email }}" class="link-dark"><i class="text-default fa fa-envelope-o pl-10 pr-1"></i>{{ dept.email }}</a></li>
                </ul>
                <div class="separator"></div>
                <ul class="social-links circle animated-effect-1 margin-clear text-center space-bottom">
                    {%for social in socials%}
                    <li class="{{ social.name }}"><a href="{{ social.link }}"><i class="fa {{ social.icon }}"></i></a></li>
                    {%endfor%}
                </ul>
            </div>
        </div>
    </div>
</section>